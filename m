Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 932031903BC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 03:59:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mbZg5G6NzDqw0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 13:59:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mbVh2wwpzDqSQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 13:56:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=b1S6P/UZ; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 48mbVg1D2nz9sSH; Tue, 24 Mar 2020 13:56:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1585018587; bh=qcqkAGfatCcdaSF4JecPaLJRR36leDyxRC3RwY8oO3U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b1S6P/UZ1s9Q7htiPyHTtAlm1CEfR6MJvQadZpArIv5YrDEMKNc+Zkd73fIwGD3IX
 HS+zH7c5SS13rccwa7v0NYBzLVY/7uELpZMD5FFPUcmUbeTsU+AnsKET43qGKnS2S/
 CKm3NjDvUrwZEG3zvZpY2VIEGBri+iCC2PPkeVctiVSUBdpdbI6EiOkwquLkXzLd7u
 4V9/iAr9M6Z+E5X8kPkYCQrOBNg9Ri6Eszroac4IZGcxoTZ+VKnCj+Ooc3YZtt/MmY
 4COXK9PBfN7EgldeacQ4ySFbgWaarKd2CSEL6OS5ZTSPJ1lISoAv4LO/qbkmEr46ty
 bPHlD35Z1l10g==
Date: Tue, 24 Mar 2020 13:54:29 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH 0/2] Fix SVM hang at startup
Message-ID: <20200324025429.GD5604@blackberry>
References: <20200320102643.15516-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200320102643.15516-1-ldufour@linux.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 20, 2020 at 11:26:41AM +0100, Laurent Dufour wrote:
> This series is fixing a SVM hang occurring when starting a SVM requiring
> more secure memory than available. The hang happens in the SVM when calling
> UV_ESM.
> 
> The following is happening:
> 
> 1. SVM calls UV_ESM
> 2. Ultravisor (UV) calls H_SVM_INIT_START
> 3. Hypervisor (HV) calls UV_REGISTER_MEM_SLOT
> 4. UV returns error because there is not enough free secure memory
> 5. HV enter the error path in kvmppc_h_svm_init_start()
> 6. In the return path, since kvm->arch.secure_guest is not yet set hrfid is
>    called
> 7. As the HV doesn't know the SVM calling context hrfid is jumping to
>    unknown address in the SVM leading to various expections.
> 
> This series fixes the setting of kvm->arch.secure_guest in
> kvmppc_h_svm_init_start() to ensure that UV_RETURN is called on the return
> path to get back to the UV.
> 
> In addition to ensure that a malicious VM will not call UV reserved Hcall,
> a check of the Secure bit in the calling MSR is addded to reject such a
> call.
> 
> It is assumed that the UV will filtered out such Hcalls made by a malicious
> SVM.
> 
> Laurent Dufour (2):
>   KVM: PPC: Book3S HV: check caller of H_SVM_* Hcalls
>   KVM: PPC: Book3S HV: H_SVM_INIT_START must call UV_RETURN
> 
>  arch/powerpc/kvm/book3s_hv.c       | 32 ++++++++++++++++++++----------
>  arch/powerpc/kvm/book3s_hv_uvmem.c |  3 ++-
>  2 files changed, 23 insertions(+), 12 deletions(-)

Thanks, series applied to my kvm-ppc-next branch.

Paul.
