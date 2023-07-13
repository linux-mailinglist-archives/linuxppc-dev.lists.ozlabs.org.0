Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE26752827
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 18:17:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Axf2mJyT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R20Bk3qQ6z3cC9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 02:17:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Axf2mJyT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R209q6B7zz2xH6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 02:17:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qWs5+UJLbSYIWkNYobDTB5epXB0C966aqZhqz7qxkuE=; b=Axf2mJyTVJ//LDU0s3MzUQeSgC
	XqBjZjmbF84lFbXZZnGPW2qs+rJCJ/RslMrc56Sjf+PZF4ohJANI2uSTXKC6LKrgacZjJ/DMaE/i5
	VDHiNVenE5V8ISge/X+1BwBIVxL91IgDendNMP14IiQVBr6e2xOjBeJzMVjVuzr28vyD2X+0fK173
	K1g33tS4S+reH260B9ZJTfHuzSMgSZOno0KJf1T10yUimbYrRGKAAC5T4/oFYb9QSb2LGJfTaOEC4
	lrFENt2Js4jJuKx4hlBI6+0wtcrh1VuxzU08aWo5SqHtyJMNU6/qo0d2Llcncsjg09QE13F3f8xiW
	oh83lHJA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qJyyL-000HxX-Pp; Thu, 13 Jul 2023 16:15:17 +0000
Date: Thu, 13 Jul 2023 17:15:17 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH rfc -next 01/10] mm: add a generic VMA lock-based page
 fault handler
Message-ID: <ZLAjFQGgcjt4ykS7@casper.infradead.org>
References: <20230713095339.189715-1-wangkefeng.wang@huawei.com>
 <20230713095339.189715-2-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230713095339.189715-2-wangkefeng.wang@huawei.com>
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, WANG Xuerui <kernel@xen0n.name>, linux-s390@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, surenb@google.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <s
 vens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> +int try_vma_locked_page_fault(struct vm_locked_fault *vmlf, vm_fault_t *ret)
> +{
> +	struct vm_area_struct *vma;
> +	vm_fault_t fault;


On Thu, Jul 13, 2023 at 05:53:29PM +0800, Kefeng Wang wrote:
> +#define VM_LOCKED_FAULT_INIT(_name, _mm, _address, _fault_flags, _vm_flags, _regs, _fault_code) \
> +	_name.mm		= _mm;			\
> +	_name.address		= _address;		\
> +	_name.fault_flags	= _fault_flags;		\
> +	_name.vm_flags		= _vm_flags;		\
> +	_name.regs		= _regs;		\
> +	_name.fault_code	= _fault_code

More consolidated code is a good idea; no question.  But I don't think
this is the right way to do it.

> +int __weak arch_vma_check_access(struct vm_area_struct *vma,
> +				 struct vm_locked_fault *vmlf);

This should be:

#ifndef vma_check_access
bool vma_check_access(struct vm_area_struct *vma, )
{
	return (vma->vm_flags & vm_flags) == 0;
}
#endif

and then arches which want to do something different can just define
vma_check_access.

> +int try_vma_locked_page_fault(struct vm_locked_fault *vmlf, vm_fault_t *ret)
> +{
> +	struct vm_area_struct *vma;
> +	vm_fault_t fault;

Declaring the vmf in this function and then copying it back is just wrong.
We need to declare vm_fault_t earlier (in the arch fault handler) and
pass it in.  I don't think that creating struct vm_locked_fault is the
right idea either.

> +	if (!(vmlf->fault_flags & FAULT_FLAG_USER))
> +		return -EINVAL;
> +
> +	vma = lock_vma_under_rcu(vmlf->mm, vmlf->address);
> +	if (!vma)
> +		return -EINVAL;
> +
> +	if (arch_vma_check_access(vma, vmlf)) {
> +		vma_end_read(vma);
> +		return -EINVAL;
> +	}
> +
> +	fault = handle_mm_fault(vma, vmlf->address,
> +				vmlf->fault_flags | FAULT_FLAG_VMA_LOCK,
> +				vmlf->regs);
> +	*ret = fault;
> +
> +	if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
> +		vma_end_read(vma);
> +
> +	if ((fault & VM_FAULT_RETRY))
> +		count_vm_vma_lock_event(VMA_LOCK_RETRY);
> +	else
> +		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
> +
> +	return 0;
> +}
> +
>  #endif /* CONFIG_PER_VMA_LOCK */
>  
>  #ifndef __PAGETABLE_P4D_FOLDED
> -- 
> 2.27.0
> 
> 
