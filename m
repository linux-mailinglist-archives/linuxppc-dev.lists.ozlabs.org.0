Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AD454F4A6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 11:52:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPZ8N1C8rz3bxt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 19:52:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VsQuETL6;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wQtx51dj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VsQuETL6;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wQtx51dj;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPZ7l4d6Pz307C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 19:51:47 +1000 (AEST)
Date: Fri, 17 Jun 2022 11:51:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1655459500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bibq7Q6QM7w+swDPtmlvZ3luRS+p/L2t/kOLJ5BkOk4=;
	b=VsQuETL6Zs1I7YQO+CiAH4cbNMsgnzIQrW06+38+snWb8jfBz2YBeJtXUHT6AEGEhswftS
	wPCXv4xNcLlzWgoGB0o5n3z9z72l0ez4ICsJwsWQunt7SDFsFEddJkcJfVLNv+qlcQY9BS
	yLhmPyn0z/5Hev6M3UCnxv2Mvub/3U+wljyX41d8tACULcjyDp47osWVJhNm2nV57vgswx
	xjf4FZ+0q4/kh991jULqc+UGbsJ5SHjX9Msk8lNZd4GhuSV/ZXjlAktU0ZxmiAA8VmTTZd
	akAlE6539ghv041rCCcLFe7sRuK9aE7yiAfjCeo3+L7uIqbojUfjVz/7PLPAbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1655459500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bibq7Q6QM7w+swDPtmlvZ3luRS+p/L2t/kOLJ5BkOk4=;
	b=wQtx51djjoHimkvi3J2kc2u/aAGBNRk/jz74DKLWGZni8doppvPCweO8zYHH/+0sc2vlY4
	JbRtDWdHqqokFBCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] arch/*: Disable softirq stacks on PREEMPT_RT.
Message-ID: <YqxOqsgCFgGuzvnr@linutronix.de>
References: <YqjQ5kso7czrmYPW@linutronix.de>
 <YqmC1aAm+O7RD2IH@infradead.org>
 <CAK8P3a1QmeAscV-Ory-Dae4RoLvDSPEjEgFGQHR9U8jUervGuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a1QmeAscV-Ory-Dae4RoLvDSPEjEgFGQHR9U8jUervGuA@mail.gmail.com>
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
Cc: Rich Felker <dalias@libc.org>, Linux-sh list <linux-sh@vger.kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Paul Mackerras <paulus@samba.org>, sparclinux <sparclinux@vger.kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-arch <linux-arch@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Christoph Hellwig <hch@infradead.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Parisc List <linux-parisc@vger.kernel.org>, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022-06-15 17:41:45 [+0200], Arnd Bergmann wrote:
> Applied to the asm-generic tree with the above fixup, thanks!

Thank you Arnd.

>       Arnd

Sebastian
