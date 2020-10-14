Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 433AC28E7EF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 22:37:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBPP03qGZzDqrn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 07:37:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=YOSWf8zU; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBPMJ3yjfzDqlY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 07:36:11 +1100 (AEDT)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A69022249;
 Wed, 14 Oct 2020 20:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602707768;
 bh=nDZMRzWG7gYP7mjsXiRsPfXA6cL+zIi6JULaouk468E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YOSWf8zUI42En+qWKtnoLC0kblv7jVr5ZG+fS4a+WgjNqRiQx6xikSMctmczqBPsN
 IxEgFLKKRV9H4kRX+chwy6Wa+tahUFGLMgW/jtSHjaVT59wTsP+SnnsEXsYdxk4cTC
 5FS3TQIJGUlEfMHk+/PnVmZAjbnqlcpaaiFXj3g4=
Date: Wed, 14 Oct 2020 13:36:07 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v4 00/13] mm/debug_vm_pgtable fixes
Message-Id: <20201014133607.fbf63d060e331fcd6007b624@linux-foundation.org>
In-Reply-To: <034db663-a5bd-fd5e-b7f6-3ec31310e8e5@linux.ibm.com>
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <20201013135858.f4a7f0c5f3b0a69a2a304cfe@linux-foundation.org>
 <034db663-a5bd-fd5e-b7f6-3ec31310e8e5@linux.ibm.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
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
Cc: linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 14 Oct 2020 08:45:16 +0530 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:

> > Against mm-debug_vm_pgtable-avoid-none-pte-in-pte_clear_test.patch:
> > 
> > https://lkml.kernel.org/r/87zh5wx51b.fsf@linux.ibm.com
> 
> 
> yes this one we should get fixed. I was hoping someone familiar with 
> Riscv pte updates rules would pitch in. IIUC we need to update 
> RANDON_ORVALUE similar to how we updated it for s390 and ppc64.
> 
> 
>   Alternatively we can do this
> 
> modified   mm/debug_vm_pgtable.c
> @@ -548,7 +548,7 @@ static void __init pte_clear_tests(struct mm_struct 
> *mm, pte_t *ptep,
>   	pte_t pte = pfn_pte(pfn, prot);
> 
>   	pr_debug("Validating PTE clear\n");
> -	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
> +//	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
>   	set_pte_at(mm, vaddr, ptep, pte);
>   	barrier();
>   	pte_clear(mm, vaddr, ptep);
> 
> till we get that feedback from RiscV team?

Would it be better to do

#ifdef CONFIG_S390
	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
#endif

?

