Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9376A6743
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 06:12:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRMmw4nfJz3cBq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 16:12:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=wUFjowPZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=wUFjowPZ;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRMlx6d5Lz3bTc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 16:11:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hXZNqqCBlKtrYnD75V9Zin6CQQ9GsiuAV2QuBhHw8t0=; b=wUFjowPZM9tYICB9b/77CU7dnJ
	MB0PIZrQVl9kpzkq8wVJ8MDNqTaW5iKCDxi0d/81sVAJDK/nbnq2NpcDJqEjSxvXNEwtVYlDIVxTm
	JPhFQg/0QP1WqufLtvipNbhtqOiLicjoai9AM8IsH48uTtuQq3CYRP1cYkqCoz6aFIxvcKIgh6zN+
	sn2C13Gm04x1hlaqlOvOh+Ak2RQgeSLS9twVbIpDqrooOQtVzw1nU5OPp0UPLkEA0Jq1tySPE5InC
	cHLKIZHwVvOncey3ttM5gKAz2E3afoUboGUK6OA1ZQuFwAy0a12zBWi+yEscxN1wmGdRMhdPHXOLk
	uLtJ857w==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXEkD-001OZz-LR; Wed, 01 Mar 2023 05:11:13 +0000
Date: Wed, 1 Mar 2023 05:11:13 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Edward Cree <ecree.xilinx@gmail.com>
Subject: Re: [PATCH v5 01/17] asm-generic/iomap.h: remove ARCH_HAS_IOREMAP_xx
 macros
Message-ID: <Y/7eceqZ+89iPm1C@casper.infradead.org>
References: <20230301034247.136007-1-bhe@redhat.com>
 <20230301034247.136007-2-bhe@redhat.com>
 <7bd6db48-ffb1-7eb1-decf-afa8be032970@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bd6db48-ffb1-7eb1-decf-afa8be032970@gmail.com>
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
Cc: linux-arch@vger.kernel.org, wangkefeng.wang@huawei.com, Baoquan He <bhe@redhat.com>, arnd@arndb.de, schnelle@linux.ibm.com, netdev@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, hch@infradead.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, David.Laight@aculab.com, loongarch@lists.linux.dev, Martin Habets <habetsm.xilinx@gmail.com>, agordeev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, shorne@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 01, 2023 at 04:38:10AM +0000, Edward Cree wrote:
> On 01/03/2023 03:42, Baoquan He wrote:
> > diff --git a/drivers/net/ethernet/sfc/io.h b/drivers/net/ethernet/sfc/io.h
> > index 30439cc83a89..07f99ad14bf3 100644
> > --- a/drivers/net/ethernet/sfc/io.h
> > +++ b/drivers/net/ethernet/sfc/io.h
> > @@ -70,7 +70,7 @@
> >   */
> >  #ifdef CONFIG_X86_64
> >  /* PIO is a win only if write-combining is possible */
> > -#ifdef ARCH_HAS_IOREMAP_WC
> > +#ifdef ioremap_wc
> >  #define EFX_USE_PIO 1
> >  #endif
> >  #endif
> 
> So I don't know how valid what we're doing here is...

Well, x86 defines ARCH_HAS_IOREMAP_WC unconditionally, so it doesn't
affect you ... but you raise a good question about how a driver can
determine if it's actually getting WC memory.

