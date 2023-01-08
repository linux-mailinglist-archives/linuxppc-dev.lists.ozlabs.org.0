Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A9D661758
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 18:25:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NqkW10qCNz3cHF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 04:25:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qUzNX0tR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+58c3238fb6e66237551a+7077+infradead.org+hch@bombadil.srs.infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qUzNX0tR;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NqkV31n1qz2yZf
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 04:24:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WNyoZTkoExUmXqvGesIlbw00ZoUJyc/GjFEcWcL7Kds=; b=qUzNX0tRX01ErBEc7fP7m/YKw5
	Vl9A2wqkoOPgdtb/ViHgWzLFySziDrbsGPQEciuxYE+eLJ2KJVrCt0s1tsGMEzTjJ5oBN8T6HAt98
	ZueqRxzfQxwffqrB7FC8wOEqeDDr4yI1l9Y+nDUAJDOKnoK38QQ+lNzRMH67/RDrrUV86MVwShjUh
	+od5SncJtBeR3pIMyQS29S8Pj1NK4eSP6VKZSHR1kC1jvx6WKK3F0UPToatlxbaxBYEibfbmLL6sj
	6tNls6oW09X/F17GUl3TAwy3L5sEH2aauE39Vs8oEPzgJXSsd/t5C0rh+dxSXjRUdZAknWbzX/Vet
	FlfKKoww==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEZPZ-00EZ7r-S9; Sun, 08 Jan 2023 17:24:45 +0000
Date: Sun, 8 Jan 2023 09:24:45 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH] mm: remove zap_page_range and create zap_vma_pages
Message-ID: <Y7r8XRLIOHADjdrz@infradead.org>
References: <20230104002732.232573-1-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104002732.232573-1-mike.kravetz@oracle.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Will Deacon <will@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Rik van Riel <riel@surriel.com>, Vlastimil Babka <vbabka@suse.cz>, Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I would have split this into one patch that adds the new
zap_vma_pages helper, and one to remove zap_page_range to split the
separate changes.

But the overall result looks fine, so feel free to add:

Reviewed-by: Christoph Hellwig <hch@lst.de>

to this or the split patches.
