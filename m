Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 772BE3A57BB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jun 2021 12:51:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G2rwY738cz30CT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jun 2021 20:51:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=nOox4sTP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=nOox4sTP; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G2rw36mNtz2yXh
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 20:50:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ht7UkFQTId64jmEDxIRXNFLs7JwLP2CL1sHUhegGjNA=; b=nOox4sTP5ai7M0T+fRF6UG2p8I
 fSIv9r6N0IsEnVs43YRqRZSZiXQd1IJmiRSS+tGRsRXnirrC0/X8U1dCOyUqOpCGJlK8qkaE2Sui5
 moq5sbsVE65ULB1MuaVHHQ6v2CVCCxsOebwxdSBZOL+G2HhlV8th3JdK/MJZ/nmF8CqJsjLqNljDY
 SG5a7Ayj7HP/76BS6PURkLJXYBkMUdT4rrFCTlEzaByrVKZKLKSv3QfFCVhwNKJYwiDSEq2be7A69
 m7uTX3JOJUhf4xfsgKrCU3rbxcakdfQgTehvrhoCo/S3qkj6uHyrmUS5xELFXxyaKWEwGJs+s6jCL
 PAWDCQMQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lsNh2-004T8m-H4; Sun, 13 Jun 2021 10:50:17 +0000
Date: Sun, 13 Jun 2021 11:50:16 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH 5/6] mm/mremap: Use pmd/pud_poplulate to update page
 table entries
Message-ID: <YMXi6AZm4fPpPKrH@casper.infradead.org>
References: <20210610083549.386085-1-aneesh.kumar@linux.ibm.com>
 <20210610083549.386085-6-aneesh.kumar@linux.ibm.com>
 <CAHk-=wi+J+iodze9FtjM3Zi4j4OeS+qqbKxME9QN4roxPEXH9Q@mail.gmail.com>
 <87wnqy9lru.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wnqy9lru.fsf@linux.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nick Piggin <npiggin@gmail.com>, Linux-MM <linux-mm@kvack.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jun 13, 2021 at 02:36:13PM +0530, Aneesh Kumar K.V wrote:
> IIUC the reason why we do have pmd_pgtable() is that pgtable_t type
> is arch dependent. On some architecture it is pte_t * and on the other
> struct page *. The reason being highmem and level 4 page table can
> be located in highmem. 

That is ahistorical.  See 2f569afd9ced9ebec9a6eb3dbf6f83429be0a7b4 --
we have pgtable_t for the benefit of s390's crazy sub-page page table
sizes.

Also, please stop numbering page tables upside down.  PTEs are first
level, not fourth.

