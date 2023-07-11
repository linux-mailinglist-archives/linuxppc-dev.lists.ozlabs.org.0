Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C24274ED79
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 14:00:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=HzF5Lj64;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=W1/NvmTR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0fZg5p3xz3c7g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 22:00:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=HzF5Lj64;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=W1/NvmTR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.229; helo=new3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0dy650R9z2xFl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 21:32:13 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 9A8CA580178;
	Tue, 11 Jul 2023 07:32:08 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Tue, 11 Jul 2023 07:32:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1689075128; x=1689082328; bh=/C
	vj5KuDdmHIGd859qaJsBs/f1fpWATGo78ystxolZ8=; b=HzF5Lj64iIpTlqtt/U
	sveabShinBsVWN7ZS+DWgyJMPU2GSeQFuSUCaVEID6zbvpBcUok2BlUF+h0n+Jsi
	B+RLu5FWxwKLB8yYD47pAPBs2bab9DlxHcB6VwJMrbK3p9CDt7lAEtwhLFrqHyEX
	7fV6jp/WUlNvYhzIeZmZ8ELheVWsz4lvwJI2VXV5H/zoLAgGGMs1cuBZ6wy6//Wo
	lTcLFfuSlHypwPx3xDRLR/oHSmnqF/XLXxzMPsVIUzb0SlCzCAuF5XqLetfBfak0
	atTp6UW4suxvLr2dJBHShODfomx0zMwaugwqmwH78MNM1MRfNA0cez5yZNpOlgRv
	//UQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1689075128; x=1689082328; bh=/Cvj5KuDdmHIG
	d859qaJsBs/f1fpWATGo78ystxolZ8=; b=W1/NvmTRCGX/QlW5oKWHfVETVTfbK
	iiaOMfD5xZsr1wjerC+3qL19Z8aSprXPBEYBfWKdxhdG7CPF8CfT1WR3AD/U//Un
	zxx8P3k3a+CRFx0FyzD8zVDjk8KMv1IFossSMGyzZMiE+N5ykkDG7SGHyOk1LSbz
	Bz6m9f+D31N5JQ3EkKQlKNOB/I6NsYPUx+f0YLoOGoGzq72rYerylgYc3CtBcy/n
	AZoZV8e4voliHZSlImIxGtDEa1Ir51MPftiA+USesbUwJs5AoAISF5B7ko8jQ9TV
	ypO52hjhNBQOPxHsSQTj42667JQZjYerNOkA0APolagyhbQRUAfakKLNg==
X-ME-Sender: <xms:tT2tZA4hH3o4izne3FbRuXG2qMPlVHT74IrMecBxjvaUy8gh3b_w0A>
    <xme:tT2tZB7D0dtivUf9jNL7_gVkezoswV2Kx6PyxJ02Dc5k8dQp62kPCknJo5opBw8es
    xJHdRKFCVHHYX0BEkU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrfedtgdegudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:tT2tZPdfpeh0H17Fj0xsMjjhRasXPz9RbEKCmDysDhuciVYRZAKqCQ>
    <xmx:tT2tZFIyOZGu1rzltUq4P8BJSV6SxBs1g2wKFNcnL702pktE2075YA>
    <xmx:tT2tZELda_T17jFWEHVJ_J6NJ6sYUjYLJpVzAfstvwJMmjZg5aOreQ>
    <xmx:uD2tZKRIbzNeXyzIyAKNVN2Y2wBmljLCQoSWEDw5YnJyybhC98VOWQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id ECECE1700090; Tue, 11 Jul 2023 07:32:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <55fee4b7-41f0-4f24-ad0e-a4527486bad1@app.fastmail.com>
In-Reply-To:  <e48c4d4046de97205fd52a73f77e9b203c3b871e.1689074739.git.legion@kernel.org>
References: <87o8pscpny.fsf@oldenburg2.str.redhat.com>
 <cover.1689074739.git.legion@kernel.org>
 <e48c4d4046de97205fd52a73f77e9b203c3b871e.1689074739.git.legion@kernel.org>
Date: Tue, 11 Jul 2023 13:31:44 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexey Gladkov" <legion@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 "Alexander Viro" <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v3 3/5] arch: Register fchmodat4, usually as syscall 451
Content-Type: text/plain
X-Mailman-Approved-At: Tue, 11 Jul 2023 21:56:57 +1000
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, fenghua.yu@intel.com, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Palmer Dabbelt <palmer@sifive.com>, heiko.carstens@de.ibm.com, x86@kernel.org, stefan@agner.ch, ldv@altlinux.org, David Howells <dhowells@redhat.com>, Kim Phillips <kim.phillips@arm.com>, Paul Mackerras <paulus@samba.org>, Deepa Dinamani <deepa.kernel@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org, hare@suse.com, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>, jhogan@kernel.org, firoz.khan@linaro.org, Matt Turner <mattst88@gmail.co
 m>, Florian Weimer <fweimer@redhat.com>, gor@linux.ibm.com, Peter Zijlstra <peterz@infradead.org>, glebfm@altlinux.org, tycho@tycho.ws, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, christian@brauner.io, rth@twiddle.net, Jens Axboe <axboe@kernel.dk>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, ralf@linux-mips.org, paul.burton@mips.com, linux-alpha@vger.kernel.org, schwidefsky@de.ibm.com, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 11, 2023, at 13:25, Alexey Gladkov wrote:
> From: Palmer Dabbelt <palmer@sifive.com>
>
> This registers the new fchmodat4 syscall in most places as nuber 451,
> with alpha being the exception where it's 561.  I found all these sites
> by grepping for fspick, which I assume has found me everything.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Alexey Gladkov <legion@kernel.org>

In linux-6.5-rc1, number 451 is used for __NR_cachestat, the
next free one at the moment is 452.

>  arch/arm/tools/syscall.tbl                  | 1 +
>  arch/arm64/include/asm/unistd32.h           | 2 ++

Unfortunately, you still also need to change __NR_compat_syscalls
in arch/arm64/include/asm/unistd.h. Aside from these two issues,
your patch is the correct way to hook up a new syscall.

   Arnd
