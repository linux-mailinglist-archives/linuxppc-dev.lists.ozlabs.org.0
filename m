Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C39354C247
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 08:58:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNGN900bGz3bsB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 16:58:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SUzqfrnD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+cd04db8a85bff7cd13dc+6870+infradead.org+hch@bombadil.srs.infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SUzqfrnD;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNGMZ6ssWz2xZB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 16:57:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qNXVqmxSpUOvgxRgQ5LFOcNQ8o56Uupm2hxFNDJ6o4A=; b=SUzqfrnDPOqROLEVY4dilVwjsT
	s9dP7gDfSz1s87ZFKwdNfBnEewrk82sE2kWW7HUPeBdmZD7XbyasqPcpEYzajrJBLt68yaVxCDfBu
	UNem7+Sxy8d99R6ehfS/E6jHiusjLHaURpRKNfXf5kIA//DAh+Gto+PBjdDVl6ji8fn/89/M5NgWl
	3X0Sy1Tj0NYy26foekGpjmpddeZF7GqsS+PMyZW8F1rJbbyhlfI9GfqsfcJaIewJe+VYjImM2MIor
	ytGxwg4TKaKAj9wJIEfIf1F0+q3bG6igtjekGb7zpOkUNgpd53WvF/HcJXKP3H8rfkrCXq8YzeYkW
	T67SvWwg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Mxx-00CxiS-1O; Wed, 15 Jun 2022 06:57:25 +0000
Date: Tue, 14 Jun 2022 23:57:25 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH] arch/*: Disable softirq stacks on PREEMPT_RT.
Message-ID: <YqmC1aAm+O7RD2IH@infradead.org>
References: <YqjQ5kso7czrmYPW@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqjQ5kso7czrmYPW@linutronix.de>
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Christian Borntraeger <borntraeger@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 14, 2022 at 08:18:14PM +0200, Sebastian Andrzej Siewior wrote:
> Disable the unused softirqs stacks on PREEMPT_RT to safe some memory and

s/safe/save/
