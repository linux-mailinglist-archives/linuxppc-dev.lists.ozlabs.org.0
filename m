Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F0085B180
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 04:34:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cd6QO36K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tf4ls4CP0z3cZM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 14:34:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cd6QO36K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tf4l450rkz3bYc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 14:34:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1676ACE1720;
	Tue, 20 Feb 2024 03:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D91C433F1;
	Tue, 20 Feb 2024 03:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708400045;
	bh=QTizz13ocUNCbUJS+bH8ogvkXd3AY/hRCYf1inxvxLg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cd6QO36KOPleyqZk7LlnDGFB3pHTDha34Md4nD3q+khCtUNV0TSzvNmWbfmODDUnF
	 OuaCdEE/whvUsSsYdM9883uPJkgKNY3BiU5GtUpSBcY0JjFX9ZNOu1Wt6XmF7vKGx8
	 QrBCjEQNislU2mszCZTQv1j6pMwI0dp6YKhwoO4xpTfvLzFEAGOYAztPam8t9k/2rr
	 U/VP5tCmnzKDOqJrlwCpSc4AcT2f/c1H3MdhCV1qYZs2HWe52+UIh1JKCjjccGe7z8
	 VLWlAEWMpxn6X788BQl+YnLaaoRqSs/twiMeXTQ4+QZQXDlv/u3LhBJydFXm7Y5vRz
	 F/4FPXJqjKm+Q==
Message-ID: <1579f759-8106-4f2b-ba8f-93c10fdf36ad@kernel.org>
Date: Tue, 20 Feb 2024 09:03:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/debug_vm_pgtable: Fix BUG_ON with pud advanced test
To: Andrew Morton <akpm@linux-foundation.org>
References: <20240129060022.68044-1-aneesh.kumar@kernel.org>
 <1b3c1513-826d-4908-93c3-212a6f1b2d74@arm.com>
 <504f70be-deca-4f7f-b28c-d1ec2cf5a348@kernel.org>
 <cfb64ca7-e754-4671-b1d5-e9c3bee5f091@arm.com>
 <105963ed-b489-4b82-973a-9024d74c6e87@kernel.org>
 <20240219184647.66ca5f8a1a38156b61e43b9c@linux-foundation.org>
Content-Language: en-US
From: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
In-Reply-To: <20240219184647.66ca5f8a1a38156b61e43b9c@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
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

On 2/20/24 8:16 AM, Andrew Morton wrote:
> On Mon, 29 Jan 2024 13:43:39 +0530 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org> wrote:
> 
>>>         return (pud_val(pud) & (_PAGE_PSE|_PAGE_DEVMAP)) == _PAGE_PSE;
>>> }
>>> #endif
>>>
>>> #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
>>> static inline int pud_devmap(pud_t pud)
>>> {
>>>         return !!(pud_val(pud) & _PAGE_DEVMAP);
>>> }
>>> #else
>>> static inline int pud_devmap(pud_t pud)
>>> {
>>>         return 0;
>>> }
>>> #endif
>>>
>>> We might need some more clarity on this regarding x86 platform's pud huge
>>> page implementation.
>>>
>>
>> static vm_fault_t create_huge_pud(struct vm_fault *vmf)
>> {
>> #if defined(CONFIG_TRANSPARENT_HUGEPAGE) &&			\
>> 	defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
>> 	struct vm_area_struct *vma = vmf->vma;
>> 	/* No support for anonymous transparent PUD pages yet */
>> 	if (vma_is_anonymous(vma))
>> 		return VM_FAULT_FALLBACK;
>> 	if (vma->vm_ops->huge_fault)
>> 		return vma->vm_ops->huge_fault(vmf, PUD_ORDER);
>> #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>> 	return VM_FAULT_FALLBACK;
>> }
> 
> cryptic reply, unreplied to.
> 
> What's the thinking here?  Should we proceed with the patch as-is, or
> are changes needed?
> 

Sorry for the confusion. What i wanted to update with the code was to reiterate
that no architectures currently does anonymous pud hugepage. So restricting
debug_vm_pgtable pud hugepage test to devmap pte entries should be ok w.r.t
these tests.

-aneesh
