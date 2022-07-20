Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5C757BD15
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 19:44:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lp33k0HVjz3dQv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 03:44:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2rSAiUGa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+59bb276a4702f876c99d+6905+infradead.org+hch@bombadil.srs.infradead.org; receiver=<UNKNOWN>)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lp3313xgKz2xKm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 03:43:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=2rSAiUGaxhl5GiQNkevi7FT3Eu
	oFi3t8oDDYv4tYthoJZObu5RAVdChzLc5kXcdS3yRuhYFdjIjcZClXaZYuDc87JZwUu5GiY1aYUWW
	ou1/+WwAtYRLE3WMCGyN9OMmI7korRiRPxqavWTJiXadQoQFXdbyseLF9vnKAeCgNvVwj+f44qDzd
	dSabyG6xdDBthHR+4c2+oSKP458OHShOBXgTmuC/IbjSx4tdZFMqwJdq+81uw1+a8U+y9JOl3gjg0
	IFdeBmLGYrl7Ye5mw/cb1wzyCjDAB6r8sbxY2kFORmOeMz4VzJnHb8ZFgYrsg7NJ/998p0J1R7RgX
	zIiPty1A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEDi7-008mLl-Ev; Wed, 20 Jul 2022 17:42:11 +0000
Date: Wed, 20 Jul 2022 10:42:11 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH v4 2/3] PCI: Move isa_dma_bridge_buggy out of dma.h
Message-ID: <Ytg+c8F4IIVbije9@infradead.org>
References: <20220720131934.373932-1-shorne@gmail.com>
 <20220720131934.373932-3-shorne@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720131934.373932-3-shorne@gmail.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, linux-pci@vger.kernel.org, alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Christoph Hellwig <hch@infradead.org>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linux
 -xtensa@linux-xtensa.org, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, linux-mips@vger.kernel.org, Ian Abbott <abbotti@mev.co.uk>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Takashi Iwai <tiwai@suse.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, H Hartley Sweeten <hsweeten@visionengravers.com>, Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
