Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D893524CD6B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 07:50:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXrGB1hJHzDqxM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 15:50:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+a718def99972ac67df6e+6207+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=TfwEFqBs; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXr9C4xKnzDqx6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 15:46:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ajUzawCVIQRA44N5aFKVmBYYI1IH9hA0rQus2v7jm1M=; b=TfwEFqBs960BsRA5hvI0O4oCNZ
 dAoIyHAY/Igg+63+8szSobAbssRbiHC5YFIKCWsegv9dVWY0K7Ydgdl96G7DyhjmIOpdziAZXt24P
 SnP4MEK+sNxXbJYhwZ2hTH6ke8Gl+rN5IPxwEmQrm+Yp0GumVOGwNCs+mXaf3k5y2w34NH2v1TEzj
 7j9P578Yh55WK6ukWn0T81tLv8mXcQ8NzPmDTnkhZDHqPKrtzOjoLztcIUWOhS84Vd3NTta36LHsI
 SbgVtdCEdAbFD5jtjm73/9nHsffP1rZLt7uTaHKbupFRxrzmNmsvjCPbAIGn5hdxXBRH9307b0p4N
 1oJ58huA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1k8zsI-0007XR-9F; Fri, 21 Aug 2020 05:46:02 +0000
Date: Fri, 21 Aug 2020 06:46:02 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 5/8] mm: HUGE_VMAP arch support cleanup
Message-ID: <20200821054602.GC28291@infradead.org>
References: <20200821044427.736424-1-npiggin@gmail.com>
 <20200821044427.736424-6-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200821044427.736424-6-npiggin@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Zefan Li <lizefan@huawei.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>  static int vmap_try_huge_pmd(pmd_t *pmd, unsigned long addr, unsigned long end,
> -			phys_addr_t phys_addr, pgprot_t prot)
> +			phys_addr_t phys_addr, pgprot_t prot, unsigned int max_page_shift)
>  {

... and here.
