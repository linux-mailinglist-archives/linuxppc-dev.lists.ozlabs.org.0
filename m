Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D613A228F77
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 06:59:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBNXn1CqWzDqXZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 14:59:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBN4Z5Xm1zDqMg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 14:38:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=pQVgS2a0; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BBN4Z1SHPz9sSt;
 Wed, 22 Jul 2020 14:38:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595392686;
 bh=+UMHJPVwgl4Xx+nAF4LfZpg+F8EXxX6RQrkl8G38zfw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pQVgS2a0qHdVxcPxWA4+DD/AphAftqF5lssILA3yqNkS9xVQXbI4NI4hMZa4tpcKW
 A8T8fqUFsKnT2O3HO319G37Wk40+vqxL2V7PWhsD8adtt/fK3NpR9Y9gQhceTQszzK
 fHqF4pKjW8wQLiAR5v0gT5Ij7cYdoCrdCxhckY7JUrwijW9JJIj7IltySyx0eIi748
 gP5HUAqp1sPSmIplUDpuzVwezK7xv3uY9Orcsz/MFLfMxFgLPBJPbL67jRzjtQOtZU
 +mZsGK8PtywLli6g0qAy62utOfY/zK3MzM7uFlUEFdVv6cKFA6+fX0nXk9e9ek/sKk
 pQrOzfB+tACqg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Paul Mackerras <paulus@ozlabs.org>,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [v3 02/15] KVM: PPC: Book3S HV: Cleanup updates for kvm vcpu MMCR
In-Reply-To: <20200721035420.GA3819606@thinks.paulus.ozlabs.org>
References: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1594996707-3727-3-git-send-email-atrajeev@linux.vnet.ibm.com>
 <20200721035420.GA3819606@thinks.paulus.ozlabs.org>
Date: Wed, 22 Jul 2020 14:38:05 +1000
Message-ID: <87v9igqi4y.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Paul Mackerras <paulus@ozlabs.org> writes:
> On Fri, Jul 17, 2020 at 10:38:14AM -0400, Athira Rajeev wrote:
>> Currently `kvm_vcpu_arch` stores all Monitor Mode Control registers
>> in a flat array in order: mmcr0, mmcr1, mmcra, mmcr2, mmcrs
>> Split this to give mmcra and mmcrs its own entries in vcpu and
>> use a flat array for mmcr0 to mmcr2. This patch implements this
>> cleanup to make code easier to read.
>
> Changing the way KVM stores these values internally is fine, but
> changing the user ABI is not.  This part:
>
>> diff --git a/arch/powerpc/include/uapi/asm/kvm.h b/arch/powerpc/include/uapi/asm/kvm.h
>> index 264e266..e55d847 100644
>> --- a/arch/powerpc/include/uapi/asm/kvm.h
>> +++ b/arch/powerpc/include/uapi/asm/kvm.h
>> @@ -510,8 +510,8 @@ struct kvm_ppc_cpu_char {
>>  
>>  #define KVM_REG_PPC_MMCR0	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x10)
>>  #define KVM_REG_PPC_MMCR1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x11)
>> -#define KVM_REG_PPC_MMCRA	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x12)
>> -#define KVM_REG_PPC_MMCR2	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x13)
>> +#define KVM_REG_PPC_MMCR2	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x12)
>> +#define KVM_REG_PPC_MMCRA	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x13)
>
> means that existing userspace programs that used to work would now be
> broken.  That is not acceptable (breaking the user ABI is only ever
> acceptable with a very compelling reason).  So NAK to this part of the
> patch.

I assume we don't have a KVM unit test that would have caught this?

cheers
