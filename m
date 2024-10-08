Return-Path: <linuxppc-dev+bounces-1839-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5EF99479B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 13:47:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNDlh5s9Pz2y64;
	Tue,  8 Oct 2024 22:47:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728388048;
	cv=none; b=U9247hzJvgz8nf6jwuKIILHmIdLZmq2I6YzH3AM4KqQfJ5vfa35ZLYBE7corNoLQYoRoLadCiPJTUQe/EeW425mvEIPWmdm/ydAa7RgBcPLGaCeAfJyBfFuL7Lh7pPIvGBHDsNiVRblewXKE24ebZZ6azgIbvUJg7Ws848l+8VxWxpCkLby3RpOJvH4fba+nsAOfQMBLADqf1NpqJaYpH+I9jSnJH/NzsZAj+o1JZmaigojAs7HRk5PU/S/8MA6IHIeAXXso/ZqSIwcPAU2CBNAxaheqL+7UAZSPeBB4f1Mx9IkjFv3KvBybbOkyoJsP4DNnfnTCKXUKCSFWbV99Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728388048; c=relaxed/relaxed;
	bh=bHJknnUwvn2irDVg9N3GrQUk2xrtJqkLpnVNrWGUTUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=feAFzuLgZoupLOeK1ACjkgp9kaZuViUpFjQ5oNTTD2bTOC/VKlxea6pt+er/9g/M1uJwBCMONaLJ6IFa6OIxKdEdd6JO/+lGDWvBPmgsbT7E4uOtmHmcJCSchBakur52KcFbI5sFr6rKP6XgtPLintjRxFj7s3+OQTFHCBjS+z86iYZMcgEbTC6pUwHQWnZ9FE68wx3pLAX6YI944RgSqhPVO8ASZI4riQQwSmtAF4j1NMwpjWTeRxEEgD8xxWkAtB7PG/4JjvMJBCK8Ox1gXkbuW1nOLLG+bXgjBBmZz+9KO4No2KgRJUcqMOdPHmW4LXTjqeDHc1iKYsgM2IV6lA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OBm/oqIp; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+25c59db37f98b80c3af3+7716+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OBm/oqIp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+25c59db37f98b80c3af3+7716+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNDld0p0Gz2xyB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 22:47:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bHJknnUwvn2irDVg9N3GrQUk2xrtJqkLpnVNrWGUTUg=; b=OBm/oqIpDPEwYJzGEEYmGHodos
	4nb5iEN+li/o1811E+zuz4e13n8B5l0kVy64gH+itqqJ+6MMgIxz67I3vuppMSv/TLQkvUhtXu8f8
	JdDJr2TK5JBVfDowKunhgzPeLGiIVyCzIqqfPnqCiw13Muj5k4NIF8el6/OETD8nLFgKJAWYJ1z9k
	PlCw8baNajsnF9wvz2Fn32B4W5cgoJXG/oohqQuCvct/gqH2VMmy4CKIrwazuFtuIqNGB+ofJmlvv
	ORv3ADQUSxQI9VmtfeU+LYQvN1FunfJN1Wc0TfQSv3lVbOzp0ObKeesgHdcQHjZvaWCNfrmcLir7P
	d6g0NIig==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1sy8g6-00000005ggR-3zEE;
	Tue, 08 Oct 2024 11:46:58 +0000
Date: Tue, 8 Oct 2024 04:46:58 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Julian Vetter <jvetter@kalrayinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-sound@vger.kernel.org,
	Yann Sionneau <ysionneau@kalrayinc.com>
Subject: Re: [PATCH v8 01/14] Consolidate IO memcpy/memset into iomap_copy.c
Message-ID: <ZwUbsviaqFUtjKEQ@infradead.org>
References: <20241008075023.3052370-1-jvetter@kalrayinc.com>
 <20241008075023.3052370-2-jvetter@kalrayinc.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008075023.3052370-2-jvetter@kalrayinc.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 08, 2024 at 09:50:09AM +0200, Julian Vetter wrote:
>  lib/iomap_copy.c         | 127 +++++++++++++++++++++++++++++++++++++++

On top of the previous comments:  this really should be iomem_copy.c
instead.


