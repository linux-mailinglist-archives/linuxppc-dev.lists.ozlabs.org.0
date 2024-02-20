Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C2C85B0F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 03:47:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=2YszLqSS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tf3jL0lFmz3cCb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 13:47:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=2YszLqSS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tf3hZ1Knvz2yQL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 13:46:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC5E361005;
	Tue, 20 Feb 2024 02:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325A5C433F1;
	Tue, 20 Feb 2024 02:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1708397208;
	bh=iek5/8kTmCnhRGZeyDjzDDsk+p7rU/waTEOkV9+w7nI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=2YszLqSSaIYpuA1jCb8SV+LRKpggnXCg2V2ILyAMQnSs/x9+GKVpNss7g3s7wcRgd
	 qxYoWFtVwkU6MUeHADM1kuacM2Un/3gJX8sLC8OUkf5IpnegmkGNwUSKH7K9DZ+ExA
	 HSpthOY7/5UsaQr1POU3+DOyekYPlCgkOiHCeA2w=
Date: Mon, 19 Feb 2024 18:46:47 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Subject: Re: [PATCH] mm/debug_vm_pgtable: Fix BUG_ON with pud advanced test
Message-Id: <20240219184647.66ca5f8a1a38156b61e43b9c@linux-foundation.org>
In-Reply-To: <105963ed-b489-4b82-973a-9024d74c6e87@kernel.org>
References: <20240129060022.68044-1-aneesh.kumar@kernel.org>
	<1b3c1513-826d-4908-93c3-212a6f1b2d74@arm.com>
	<504f70be-deca-4f7f-b28c-d1ec2cf5a348@kernel.org>
	<cfb64ca7-e754-4671-b1d5-e9c3bee5f091@arm.com>
	<105963ed-b489-4b82-973a-9024d74c6e87@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Anshuman Khandual <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 29 Jan 2024 13:43:39 +0530 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org> wrote:

> >         return (pud_val(pud) & (_PAGE_PSE|_PAGE_DEVMAP)) == _PAGE_PSE;
> > }
> > #endif
> > 
> > #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> > static inline int pud_devmap(pud_t pud)
> > {
> >         return !!(pud_val(pud) & _PAGE_DEVMAP);
> > }
> > #else
> > static inline int pud_devmap(pud_t pud)
> > {
> >         return 0;
> > }
> > #endif
> > 
> > We might need some more clarity on this regarding x86 platform's pud huge
> > page implementation.
> > 
> 
> static vm_fault_t create_huge_pud(struct vm_fault *vmf)
> {
> #if defined(CONFIG_TRANSPARENT_HUGEPAGE) &&			\
> 	defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
> 	struct vm_area_struct *vma = vmf->vma;
> 	/* No support for anonymous transparent PUD pages yet */
> 	if (vma_is_anonymous(vma))
> 		return VM_FAULT_FALLBACK;
> 	if (vma->vm_ops->huge_fault)
> 		return vma->vm_ops->huge_fault(vmf, PUD_ORDER);
> #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> 	return VM_FAULT_FALLBACK;
> }

cryptic reply, unreplied to.

What's the thinking here?  Should we proceed with the patch as-is, or
are changes needed?

