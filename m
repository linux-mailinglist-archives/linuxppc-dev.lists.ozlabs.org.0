Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE09C3AEAD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 07:43:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45MhrJ0kGDzDqNy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 15:43:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 45Mhpk1f81zDq72
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 15:42:03 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3F48344;
 Sun,  9 Jun 2019 22:42:00 -0700 (PDT)
Received: from [10.162.42.131] (p8cg001049571a15.blr.arm.com [10.162.42.131])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 2D6913F557; Sun,  9 Jun 2019 22:41:58 -0700 (PDT)
Subject: Re: [PATCH 1/4] mm: Move ioremap page table mapping function to mm/
To: Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org
References: <20190610043838.27916-1-npiggin@gmail.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <03de53e9-f1f9-1632-567e-b88aabc56764@arm.com>
Date: Mon, 10 Jun 2019 11:12:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190610043838.27916-1-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/10/2019 10:08 AM, Nicholas Piggin wrote:
> ioremap_page_range is a generic function to create a kernel virtual
> mapping, move it to mm/vmalloc.c and rename it vmap_range.

Absolutely. It belongs in mm/vmalloc.c as its a kernel virtual range.
But what is the rationale of changing the name to vmap_range ?
 
> 
> For clarity with this move, also:
> - Rename vunmap_page_range (vmap_range's inverse) to vunmap_range.

Will be inverse for both vmap_range() and vmap_page[s]_range() ?

> - Rename vmap_page_range (which takes a page array) to vmap_pages.

s/vmap_pages/vmap_pages_range instead here ................^^^^^^

This deviates from the subject of this patch that it is related to
ioremap only. I believe what this patch intends is to create

- vunmap_range() takes [VA range]

	This will be the common kernel virtual range tear down
	function for ranges created either with vmap_range() or
	vmap_pages_range(). Is that correct ?

- vmap_range() takes [VA range, PA range, prot]
- vmap_pages_range() takes [VA range, struct pages, prot] 

Can we re-order the arguments (pages <--> prot) for vmap_pages_range()
just to make it sync with vmap_range() ?

static int vmap_pages_range(unsigned long start, unsigned long end,
 			   pgprot_t prot, struct page **pages)
