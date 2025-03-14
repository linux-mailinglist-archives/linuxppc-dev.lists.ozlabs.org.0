Return-Path: <linuxppc-dev+bounces-7045-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF67A60B4A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 09:25:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDcrF352Qz3cY6;
	Fri, 14 Mar 2025 19:25:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741940733;
	cv=none; b=aSnKmf1DfmqkcnHfxKsIcI+NeF+5cBFwuWEc9GhlxDtbPVF0ZwIJD5PlIl6n5KsYRM1lu7k6rrmb+gmNZr74OFQkiADQQ8S5AVegfjvVeEDFMOaqWhrlfSWuak2EgbcXDO7buGMAo7JAV0x9IRsiecB8R2roCkjrVI1BEi3QQHhgfvqZWB/keTMFqJ1dvAvsk56MFkAjMvIL80qMVWMB1M54s6qwdyPmeq+1IL0aMqXdDzPTprEzLiweAxHA3pIQacjNiNYpUCFKCNgpZNmx61cM1Wo1kmvu+ibkCulrNf1CKBXuvIY1/V9/ejMTEaJw3HipZMHOJlPhYMbtRX0Uzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741940733; c=relaxed/relaxed;
	bh=Z7pgffBCJ64s8SUSy2F4lOeJncQvjpMHvfcMDHpHISU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmPUP5mQexyDORgMWpsx1sjVTtwfmzeJaAdimYf3wYW/ppqoYnvH6UlDpiN/1OmwBE5Vgx8CaTke9LMdjrNEQhK6ZW+NxUoH5pbt3YHnC+fGibQ2BU5Jx6xAWob2el0LE0Tx6tSL4ncw0AEeAr3EbH8hr4ed3sOjPw23k9nQdLE0ZeUSGRTq81/StKmVDoaRf9SR8k1Lx59vD3f3kBt4LEfXpnkLwlswQrDLwoQEZiOIrRM/ut7M6r+hZl69QP75HJKvEVvwt0d8j5ktW6Y7XQFpsnvm8z/+EpIpYOxiaAgmGUj+CrkuTngwXnN6oaPAdcaEftuNVg0pArhHML/+Sg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=chq/MjDm; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=chq/MjDm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDcrC6nDSz3cXB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 19:25:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Z7pgffBCJ64s8SUSy2F4lOeJncQvjpMHvfcMDHpHISU=; b=chq/MjDmPZbcwvng7KEQEyltYs
	0B/7QZ/AuEbZazc6aejMs4WhONAtLYkvgXCXuH5ALxsMlWtynUkdr2HaJB9aUrNeSUoYFPeIdbhlr
	uzkt+wPPkAw1rq5490pS1vaEkbUaciXRmH07/+pUUmrB29kNWL6j5289WSiZhOtMobAe3m7NRCL47
	/TE2fkspHx0ucgkwpu3frb0PkLvSEiy/7UzUP/093VjRlnJKsRBksFii7xWrxy1XkReF25xHYfyx7
	rkb75+XNocsjpXyjidaxpsddigYobR4rKD8a385m+9wZ21BfHvtG0tY+qr/KQ+PuZ6HqiTghpTqAo
	XzA3fcvg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0MC-00000002rQb-1DsY;
	Fri, 14 Mar 2025 08:25:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id DFAFE300599; Fri, 14 Mar 2025 09:25:27 +0100 (CET)
Date: Fri, 14 Mar 2025 09:25:27 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, mpe@ellerman.id.au,
	fbarrat@linux.ibm.com, ajd@linux.ibm.com, mahesh@linux.ibm.com,
	oohall@gmail.com, hbathini@linux.ibm.com, dhowells@redhat.com,
	haren@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] powerpc: book3s: vas: use lock guard for mutex
Message-ID: <20250314082527.GU5880@noisy.programming.kicks-ass.net>
References: <20250314054544.1998928-1-sshegde@linux.ibm.com>
 <20250314054544.1998928-5-sshegde@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314054544.1998928-5-sshegde@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Mar 14, 2025 at 11:15:42AM +0530, Shrikanth Hegde wrote:
> use guard(mutex) for scope based resource management of mutex.
> This would make the code simpler and easier to maintain.
> 
> More details on lock guards can be found at
> https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u
> 
> There is also an example of using scoped_guard. 
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  arch/powerpc/platforms/book3s/vas-api.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
> index 0b6365d85d11..eb1a97271afb 100644
> --- a/arch/powerpc/platforms/book3s/vas-api.c
> +++ b/arch/powerpc/platforms/book3s/vas-api.c
> @@ -425,7 +425,7 @@ static vm_fault_t vas_mmap_fault(struct vm_fault *vmf)
>  		return VM_FAULT_SIGBUS;
>  	}
>  
> -	mutex_lock(&txwin->task_ref.mmap_mutex);
> +	guard(mutex)(&txwin->task_ref.mmap_mutex);
>  	/*
>  	 * The window may be inactive due to lost credit (Ex: core
>  	 * removal with DLPAR). If the window is active again when
> @@ -437,11 +437,9 @@ static vm_fault_t vas_mmap_fault(struct vm_fault *vmf)
>  		if (paste_addr) {
>  			fault = vmf_insert_pfn(vma, vma->vm_start,
>  					(paste_addr >> PAGE_SHIFT));
> -			mutex_unlock(&txwin->task_ref.mmap_mutex);
>  			return fault;
>  		}
>  	}
> -	mutex_unlock(&txwin->task_ref.mmap_mutex);

I had to open up this file to check, but this seems incorrect since you
now also run do_fail_paste() with the lock held, where previously you
did not.


>  	/*
>  	 * Received this fault due to closing the actual window.

