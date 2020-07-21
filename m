Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0A82277CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 06:55:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9mWc5RJzzDqg9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 14:55:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9mTv1PfpzDqdf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 14:54:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=Udf9255C; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4B9mTt2d5Zz9sSJ; Tue, 21 Jul 2020 14:54:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1595307266; bh=RQE08isQf+lBELg3C8LRhn+T91bIrsMyhyCDly9itjg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Udf9255C4Pb0JsIeovrxWm1+Cgw67ckgCelFZEEI5ONfcB529BVnIiUek2+i2mUcA
 cN/1kMZosYyV4sEMOztqQwRWGSS/bhlMtc0tqLWRfHeFmRK8Ql+/I2O7IKYfyzFt+3
 AKRJwhhYdJGxiV7DAi7kE2G41vSv9nto5+xc8i2/meTd3R0EFXIj75Ubt8fp7JCtMw
 JKJGLs1+StWjkodJ88zF4QQbQCkt8z5uswJz16Zvmwh1mdDkVJmkDQ8vBpX2S3Fclf
 OdniE7bhslmcJyWXrig9cq2prnoqonFLNnOFzrN5cAkRgYO3eKkAN0IhS0WSgNwDgu
 657tg8jJG7ynQ==
Date: Tue, 21 Jul 2020 13:54:20 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [v3 02/15] KVM: PPC: Book3S HV: Cleanup updates for kvm vcpu MMCR
Message-ID: <20200721035420.GA3819606@thinks.paulus.ozlabs.org>
References: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1594996707-3727-3-git-send-email-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594996707-3727-3-git-send-email-atrajeev@linux.vnet.ibm.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, maddy@linux.vnet.ibm.com,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, svaidyan@in.ibm.com,
 acme@kernel.org, jolsa@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 17, 2020 at 10:38:14AM -0400, Athira Rajeev wrote:
> Currently `kvm_vcpu_arch` stores all Monitor Mode Control registers
> in a flat array in order: mmcr0, mmcr1, mmcra, mmcr2, mmcrs
> Split this to give mmcra and mmcrs its own entries in vcpu and
> use a flat array for mmcr0 to mmcr2. This patch implements this
> cleanup to make code easier to read.

Changing the way KVM stores these values internally is fine, but
changing the user ABI is not.  This part:

> diff --git a/arch/powerpc/include/uapi/asm/kvm.h b/arch/powerpc/include/uapi/asm/kvm.h
> index 264e266..e55d847 100644
> --- a/arch/powerpc/include/uapi/asm/kvm.h
> +++ b/arch/powerpc/include/uapi/asm/kvm.h
> @@ -510,8 +510,8 @@ struct kvm_ppc_cpu_char {
>  
>  #define KVM_REG_PPC_MMCR0	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x10)
>  #define KVM_REG_PPC_MMCR1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x11)
> -#define KVM_REG_PPC_MMCRA	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x12)
> -#define KVM_REG_PPC_MMCR2	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x13)
> +#define KVM_REG_PPC_MMCR2	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x12)
> +#define KVM_REG_PPC_MMCRA	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x13)

means that existing userspace programs that used to work would now be
broken.  That is not acceptable (breaking the user ABI is only ever
acceptable with a very compelling reason).  So NAK to this part of the
patch.

Regards,
Paul.
