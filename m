Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EAAF87A3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 05:59:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BwXT2PN6zF436
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 15:59:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BwTx3XHqzF4wx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 15:57:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="qJqHaXsZ"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47BwTx1MgVz9s7T;
 Tue, 12 Nov 2019 15:57:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1573534661;
 bh=uYip1D+O0qxvSAZmVsjreqWMMiJScHjb7OaWupdHy1g=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qJqHaXsZbg6PKABCFV05/MmyEqiQsPpDwWDt6up2flx2qovaz+CWAnu/S0WsuT98t
 lNAsVa1BF5LiO9kCc26G9W3LXhkf7YVVdWEnnlrIumVzMUa9kgF0Pc/OwC/UTTKt6W
 EqWtowu61h10IHW+e4O1Fgozs/OKNJrMLOic+msejkuQJIXrnwrZhbcZnHIQaL1G/w
 bPmT8x1b3SkfF9/roKwbpCUCPjz02Dsymkwta7pTL3L5xj/XbG4io5fPyq3MFLSpIQ
 tLs5EHbAJv5ZXWZVowZpnHLNh+nrVyHVLS1g6OPoWA3NJj505bSJp8spFardUmlA1q
 Q2h++C5kh7ylg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Leonardo Bras <leonardo@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] powerpc/kvm/book3s: Fixes possible 'use after
 release' of kvm
In-Reply-To: <20191107170258.36379-2-leonardo@linux.ibm.com>
References: <20191107170258.36379-1-leonardo@linux.ibm.com>
 <20191107170258.36379-2-leonardo@linux.ibm.com>
Date: Tue, 12 Nov 2019 15:57:40 +1100
Message-ID: <87mud13d4r.fsf@mpe.ellerman.id.au>
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
Cc: Leonardo Bras <leonardo@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Leonardo,

Leonardo Bras <leonardo@linux.ibm.com> writes:
> Fixes a possible 'use after free' of kvm variable in
> kvm_vm_ioctl_create_spapr_tce, where it does a mutex_unlock(&kvm->lock)
> after a kvm_put_kvm(kvm).

There is no potential for an actual use after free here AFAICS.

> diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
> index 5834db0a54c6..a402ead833b6 100644
> --- a/arch/powerpc/kvm/book3s_64_vio.c
> +++ b/arch/powerpc/kvm/book3s_64_vio.c

The preceeding context is:

	mutex_lock(&kvm->lock);

	/* Check this LIOBN hasn't been previously allocated */
	ret = 0;
	list_for_each_entry(siter, &kvm->arch.spapr_tce_tables, list) {
		if (siter->liobn == args->liobn) {
			ret = -EBUSY;
			break;
		}
	}

	kvm_get_kvm(kvm);
	if (!ret)
		ret = anon_inode_getfd("kvm-spapr-tce", &kvm_spapr_tce_fops,
				       stt, O_RDWR | O_CLOEXEC);

> @@ -316,14 +316,13 @@ long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
>  
>  	if (ret >= 0)
>  		list_add_rcu(&stt->list, &kvm->arch.spapr_tce_tables);
> -	else
> -		kvm_put_kvm(kvm);
>  
>  	mutex_unlock(&kvm->lock);
>  
>  	if (ret >= 0)
>  		return ret;
>  
> +	kvm_put_kvm(kvm);
>  	kfree(stt);
>   fail_acct:
>  	account_locked_vm(current->mm, kvmppc_stt_pages(npages), false);


If the kvm_put_kvm() you've moved actually caused the last reference to
be dropped that would mean that our caller had passed us a kvm struct
without holding a reference to it, and that would be a bug in our
caller.

Or put another way, it would mean the mutex_lock() above could already
be operating on a freed kvm struct.

The kvm_get_kvm() prior to the anon_inode_getfd() is to account for the
reference that's held by the `stt` struct, and dropped in
kvm_spapr_tce_release().

So although this patch isn't wrong, the explanation is not accurate.

cheers
