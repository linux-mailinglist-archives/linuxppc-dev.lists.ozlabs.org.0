Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DBC5346D3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 00:51:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7mXY5Prqz3c5C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 08:51:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pKt+abZA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pKt+abZA;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L7mWv5Tfsz2ynx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 08:51:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2LbSngeeObuFPL7ErF2AoPAHTv4dJXye4aEdBeQeQNc=; b=pKt+abZAcRwTjLPiIuUJ63udl/
	LnZRnektXGIrQifOO2P7wqD5PIlFZuz1FEsn7dG3uIrD0Zcm9nJmRg6jzQ00L28dKnVvU64/SnM0V
	WgngpftvIhbvNa1nF/R2cpMNn3GHQsnpskfqcbowHfbfnCnG1RrjqLx3YEKODPnz/gZccpnduZ+6k
	cHd90+71zdAoZiw3qkosD0UdzDJHfo8IRph+0ZBS+nlISrFAZFqB3LRXClk3O3Qm5udZsMgkKdDCD
	1Y1R04KKoSlNcDEDVZAsI/f126QGimL6tkIM7vsK6kH7EaZ5DS6vQWIFBmABtfvqfKaQQ/st2szcq
	5SRd4ZOA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntzqR-00CuyK-CE; Wed, 25 May 2022 22:51:11 +0000
Date: Wed, 25 May 2022 15:51:11 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] Modules fixes for v5.19-rc1
Message-ID: <Yo6y37M4oyv5z4+D@bombadil.infradead.org>
References: <Yo6kboq8M8nUwy45@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yo6kboq8M8nUwy45@bombadil.infradead.org>
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
Cc: Davidlohr Bueso <dave@stgolabs.net>, Lecopzer Chen <lecopzer.chen@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Masahiro Yamada <masahiroy@kernel.org>, patches@lists.linux.dev, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>, Song Liu <song@kernel.org>, Matthew Wilcox <willy@infradead.org>, Aaron Tomlin <atomlin@redhat.com>, Keith Busch <kbusch@kernel.org>, live-patching@vger.kernel.org, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, Alexey Dobriyan <adobriyan@gmail.com>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sorry the subject should say "Modules changes".

I also forgot to itemize possible merge conflicts and resolutions
which linux-next reported:

powerpc:
https://lkml.kernel.org/r/20220520154055.7f964b76@canb.auug.org.au

kbuild:
https://lkml.kernel.org/r/20220523120859.570f7367@canb.auug.org.au

  Luis
