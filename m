Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CC78C2AAD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 21:30:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EwD+cG+x;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EwD+cG+x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vbf9s0rlyz3cZ6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 May 2024 05:30:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EwD+cG+x;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EwD+cG+x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vbf9363gCz3cV9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 May 2024 05:29:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715369394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K1Y7XGM25zdRhrGQHlay/wNkBCPx7i8n6CbuOrrGqnw=;
	b=EwD+cG+x7+RqfQ779rp8c76CPDJHqRcYA5MrU+YqIMaPHlu6/qYydcv+O6EZf9GD4FkNZ5
	6ho+3GxlO2bJSz02VA6/nV97x94ddXN0dB2RDEKJPSqZ8WPl8lEwigr1pm+cUEyW4k0gGE
	Wbr01IET3siS7CJSr3wIqQ+XrRMp3No=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715369394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K1Y7XGM25zdRhrGQHlay/wNkBCPx7i8n6CbuOrrGqnw=;
	b=EwD+cG+x7+RqfQ779rp8c76CPDJHqRcYA5MrU+YqIMaPHlu6/qYydcv+O6EZf9GD4FkNZ5
	6ho+3GxlO2bJSz02VA6/nV97x94ddXN0dB2RDEKJPSqZ8WPl8lEwigr1pm+cUEyW4k0gGE
	Wbr01IET3siS7CJSr3wIqQ+XrRMp3No=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-cHvwUXsDNiS_oARYsY5z1A-1; Fri, 10 May 2024 15:29:53 -0400
X-MC-Unique: cHvwUXsDNiS_oARYsY5z1A-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6a0e9eddad0so7510676d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 12:29:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715369392; x=1715974192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1Y7XGM25zdRhrGQHlay/wNkBCPx7i8n6CbuOrrGqnw=;
        b=t9xyKioF72GTSYh1+fQwEcxayn2D1L1h62TRkw4kwtFmNNKd91IJ67hG+kB6p35ZU+
         arPj4P2BzcvWiPOT+Cx8pDmUiFT9gMaDiCCQpt2dHsUkHRgF/FUHyMgj2eXzGTO4jV57
         ZQsKQJkSV7aB4yMOQ/7BOq0AL32JOWWQiVG/p6l1OhgeOBhRVSSAeqOMLf6DoXvITR9b
         2MSyThbkXTKSEb9N3p3Vb6BNxhbToanyoXONZPYTLx5P5VHDxgKn5WXqvcEWPL6QxjLQ
         frHTTmRubeskJTu4TgifeJBUvBA5e/JcvYM2xi1zKxvp9sd3eDO5BmjCwX+40nl/OlAp
         t2kg==
X-Forwarded-Encrypted: i=1; AJvYcCURk/1hgxXixj0rVZkjKjQzYA53ujQ4te4mK8G7kD95kxSTgMjSu3nh9BRpT1m20lUy1qGSkeftwTeH3LrvITI4J0I9yTnpu4Qb7Dys3w==
X-Gm-Message-State: AOJu0Yz0QXGrL2flW6djZDz19W8zAn+QMZ0q0M7wIeDokMXvL37IqFrZ
	e5gTkbafTCzhuOi9PNo7aLkwF8KUEEjYzLQRvUmAsrIZsVMwaCaDMKeXnDCY3LrPgEzf5dpEJVi
	L5AoDasPEY4n0oZW41j6vGgNKiq1AchaJw46AhGqqjFViRz/VEzM7U6YFy5B2xxE=
X-Received: by 2002:a05:622a:1a0b:b0:439:7147:8f2a with SMTP id d75a77b69052e-43dfdb8ad04mr38640051cf.4.1715369392129;
        Fri, 10 May 2024 12:29:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTUbwfqwrp3DzsK3KyjU09BXXLjtrIpl48D3/9HEzEcpaK/KhGFtvavCSItvQimNwb6/lTwA==
X-Received: by 2002:a05:622a:1a0b:b0:439:7147:8f2a with SMTP id d75a77b69052e-43dfdb8ad04mr38639661cf.4.1715369391402;
        Fri, 10 May 2024 12:29:51 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43df54b5a3asm24405631cf.11.2024.05.10.12.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 12:29:50 -0700 (PDT)
Date: Fri, 10 May 2024 15:29:48 -0400
From: Peter Xu <peterx@redhat.com>
To: Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH v2 1/1] arch/fault: don't print logs for pte marker
 poison errors
Message-ID: <Zj51rEwZeSK4Vr1G@x1n>
References: <20240510182926.763131-1-axelrasmussen@google.com>
 <20240510182926.763131-2-axelrasmussen@google.com>
MIME-Version: 1.0
In-Reply-To: <20240510182926.763131-2-axelrasmussen@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Suren Baghdasaryan <surenb@google.com>, Oscar Salvador <osalvador@suse.de>, Liu Shixin <liushixin2@huawei.com>, linux-parisc@vger.kernel.org, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 10, 2024 at 11:29:26AM -0700, Axel Rasmussen wrote:
> For real MCEs, various architectures print log messages when poisoned
> memory is accessed (which results in a SIGBUS). These messages can be
> important for users to understand the issue.
> 
> On the other hand, we have two other cases: swapin errors and simulated
> poisons via UFFDIO_POISON. These cases also result in SIGBUS, but they
> aren't "real" hardware memory poisoning events, so we want to avoid
> logging MCE error messages to dmesg for these events. This avoids
> spamming the kernel log, and possibly drowning out real events with
> these other cases.
> 
> To identify this situation, add a new VM_FAULT_HWPOISON_SILENT flag.
> This is expected to be set *in addition to* one of the existing
> VM_FAULT_HWPOISON or VM_FAULT_HWPOISON_LARGE flags (which are mutually
> exclusive).
> 
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>

Acked-by: Peter Xu <peterx@redhat.com>

One nicpick below.

> ---
>  arch/parisc/mm/fault.c   |  7 +++++--
>  arch/powerpc/mm/fault.c  |  6 ++++--
>  arch/x86/mm/fault.c      |  6 ++++--
>  include/linux/mm_types.h | 34 ++++++++++++++++++++--------------
>  mm/hugetlb.c             |  3 ++-
>  mm/memory.c              |  2 +-
>  6 files changed, 36 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
> index c39de84e98b0..6c5e8d6498bf 100644
> --- a/arch/parisc/mm/fault.c
> +++ b/arch/parisc/mm/fault.c
> @@ -400,9 +400,12 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
>  #ifdef CONFIG_MEMORY_FAILURE
>  		if (fault & (VM_FAULT_HWPOISON|VM_FAULT_HWPOISON_LARGE)) {
>  			unsigned int lsb = 0;
> -			printk(KERN_ERR
> +
> +			if (!(fault & VM_FAULT_HWPOISON_SILENT)) {
> +				pr_err(
>  	"MCE: Killing %s:%d due to hardware memory corruption fault at %08lx\n",
> -			tsk->comm, tsk->pid, address);
> +				tsk->comm, tsk->pid, address);
> +			}
>  			/*
>  			 * Either small page or large page may be poisoned.
>  			 * In other words, VM_FAULT_HWPOISON_LARGE and
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 215690452495..c43bb6193a80 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -147,8 +147,10 @@ static int do_sigbus(struct pt_regs *regs, unsigned long address,
>  	if (fault & (VM_FAULT_HWPOISON|VM_FAULT_HWPOISON_LARGE)) {
>  		unsigned int lsb = 0; /* shutup gcc */
>  
> -		pr_err("MCE: Killing %s:%d due to hardware memory corruption fault at %lx\n",
> -			current->comm, current->pid, address);
> +		if (!(fault & VM_FAULT_HWPOISON_SILENT)) {
> +			pr_err("MCE: Killing %s:%d due to hardware memory corruption fault at %lx\n",
> +				current->comm, current->pid, address);
> +		}
>  
>  		if (fault & VM_FAULT_HWPOISON_LARGE)
>  			lsb = hstate_index_to_shift(VM_FAULT_GET_HINDEX(fault));
> diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
> index 67b18adc75dd..9ae5cc6bd933 100644
> --- a/arch/x86/mm/fault.c
> +++ b/arch/x86/mm/fault.c
> @@ -964,9 +964,11 @@ do_sigbus(struct pt_regs *regs, unsigned long error_code, unsigned long address,
>  		struct task_struct *tsk = current;
>  		unsigned lsb = 0;
>  
> -		pr_err(
> +		if (!(fault & VM_FAULT_HWPOISON_SILENT)) {
> +			pr_err(
>  	"MCE: Killing %s:%d due to hardware memory corruption fault at %lx\n",
> -			tsk->comm, tsk->pid, address);
> +				tsk->comm, tsk->pid, address);
> +		}
>  		if (fault & VM_FAULT_HWPOISON_LARGE)
>  			lsb = hstate_index_to_shift(VM_FAULT_GET_HINDEX(fault));
>  		if (fault & VM_FAULT_HWPOISON)
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 24323c7d0bd4..7663a2725341 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -1224,6 +1224,10 @@ typedef __bitwise unsigned int vm_fault_t;
>   * @VM_FAULT_HWPOISON_LARGE:	Hit poisoned large page. Index encoded
>   *				in upper bits
>   * @VM_FAULT_SIGSEGV:		segmentation fault
> + * @VM_FAULT_HWPOISON_SILENT	Hit a poisoned pte marker, which should not be
> + *				logged to dmesg since it's something besides a
> + *				real hardware memory error (swapin error,
> + *				simulated poison via UFFDIO_POISON, etc.).

IMHO we shouldn't mention that detail, but only state the effect which is
to not report the event to syslog.

There's no hard rule that a pte marker can't reflect a real page poison in
the future even MCE.  Actually I still remember most places don't care
about the pfn in the hwpoison swap entry so maybe we can even do it? But
that's another story regardless..

And also not report swapin error is, IMHO, only because arch errors said
"MCE" in the error logs which may not apply here.  Logically speaking
swapin error should also be reported so admin knows better on why a proc is
killed.  Now it can still confuse the admin if it really happens, iiuc.

>   * @VM_FAULT_NOPAGE:		->fault installed the pte, not return page
>   * @VM_FAULT_LOCKED:		->fault locked the returned page
>   * @VM_FAULT_RETRY:		->fault blocked, must retry
> @@ -1237,20 +1241,21 @@ typedef __bitwise unsigned int vm_fault_t;
>   *
>   */
>  enum vm_fault_reason {
> -	VM_FAULT_OOM            = (__force vm_fault_t)0x000001,
> -	VM_FAULT_SIGBUS         = (__force vm_fault_t)0x000002,
> -	VM_FAULT_MAJOR          = (__force vm_fault_t)0x000004,
> -	VM_FAULT_HWPOISON       = (__force vm_fault_t)0x000010,
> -	VM_FAULT_HWPOISON_LARGE = (__force vm_fault_t)0x000020,
> -	VM_FAULT_SIGSEGV        = (__force vm_fault_t)0x000040,
> -	VM_FAULT_NOPAGE         = (__force vm_fault_t)0x000100,
> -	VM_FAULT_LOCKED         = (__force vm_fault_t)0x000200,
> -	VM_FAULT_RETRY          = (__force vm_fault_t)0x000400,
> -	VM_FAULT_FALLBACK       = (__force vm_fault_t)0x000800,
> -	VM_FAULT_DONE_COW       = (__force vm_fault_t)0x001000,
> -	VM_FAULT_NEEDDSYNC      = (__force vm_fault_t)0x002000,
> -	VM_FAULT_COMPLETED      = (__force vm_fault_t)0x004000,
> -	VM_FAULT_HINDEX_MASK    = (__force vm_fault_t)0x0f0000,
> +	VM_FAULT_OOM             = (__force vm_fault_t)0x000001,
> +	VM_FAULT_SIGBUS          = (__force vm_fault_t)0x000002,
> +	VM_FAULT_MAJOR           = (__force vm_fault_t)0x000004,
> +	VM_FAULT_HWPOISON        = (__force vm_fault_t)0x000010,
> +	VM_FAULT_HWPOISON_LARGE  = (__force vm_fault_t)0x000020,
> +	VM_FAULT_SIGSEGV         = (__force vm_fault_t)0x000040,
> +	VM_FAULT_HWPOISON_SILENT = (__force vm_fault_t)0x000080,
> +	VM_FAULT_NOPAGE          = (__force vm_fault_t)0x000100,
> +	VM_FAULT_LOCKED          = (__force vm_fault_t)0x000200,
> +	VM_FAULT_RETRY           = (__force vm_fault_t)0x000400,
> +	VM_FAULT_FALLBACK        = (__force vm_fault_t)0x000800,
> +	VM_FAULT_DONE_COW        = (__force vm_fault_t)0x001000,
> +	VM_FAULT_NEEDDSYNC       = (__force vm_fault_t)0x002000,
> +	VM_FAULT_COMPLETED       = (__force vm_fault_t)0x004000,
> +	VM_FAULT_HINDEX_MASK     = (__force vm_fault_t)0x0f0000,
>  };
>  
>  /* Encode hstate index for a hwpoisoned large page */
> @@ -1268,6 +1273,7 @@ enum vm_fault_reason {
>  	{ VM_FAULT_HWPOISON,            "HWPOISON" },	\
>  	{ VM_FAULT_HWPOISON_LARGE,      "HWPOISON_LARGE" },	\
>  	{ VM_FAULT_SIGSEGV,             "SIGSEGV" },	\
> +	{ VM_FAULT_HWPOISON_SILENT,	"HWPOISON_SILENT" },	\
>  	{ VM_FAULT_NOPAGE,              "NOPAGE" },	\
>  	{ VM_FAULT_LOCKED,              "LOCKED" },	\
>  	{ VM_FAULT_RETRY,               "RETRY" },	\
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 6be78e7d4f6e..91517cd7f44c 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6485,7 +6485,8 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
>  				pte_marker_get(pte_to_swp_entry(vmf.orig_pte));
>  
>  			if (marker & PTE_MARKER_POISONED) {
> -				ret = VM_FAULT_HWPOISON_LARGE |
> +				ret = VM_FAULT_HWPOISON_SILENT |
> +				      VM_FAULT_HWPOISON_LARGE |
>  				      VM_FAULT_SET_HINDEX(hstate_index(h));
>  				goto out_mutex;
>  			}
> diff --git a/mm/memory.c b/mm/memory.c
> index eea6e4984eae..721c0731cef2 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3938,7 +3938,7 @@ static vm_fault_t handle_pte_marker(struct vm_fault *vmf)
>  
>  	/* Higher priority than uffd-wp when data corrupted */
>  	if (marker & PTE_MARKER_POISONED)
> -		return VM_FAULT_HWPOISON;
> +		return VM_FAULT_HWPOISON | VM_FAULT_HWPOISON_SILENT;
>  
>  	if (pte_marker_entry_uffd_wp(entry))
>  		return pte_marker_handle_uffd_wp(vmf);
> -- 
> 2.45.0.118.g7fe29c98d7-goog
> 
> 

-- 
Peter Xu

