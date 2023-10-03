Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1D77B712D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 20:39:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=AsoLtHlJ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Jau1+o+n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0RSj4Nvpz3vvF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 05:39:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=AsoLtHlJ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Jau1+o+n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.27; helo=wnew2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com [64.147.123.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0QRv6Hd3z3c2L
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 04:54:03 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.west.internal (Postfix) with ESMTP id 296C12B0006B;
	Tue,  3 Oct 2023 13:53:56 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 03 Oct 2023 13:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1696355635; x=1696362835; bh=Em
	ic7Z1y2XZwljvtzupGq8cvsW20UYl18kfH5lRmznc=; b=AsoLtHlJErskTrRJFq
	YWB7LiuJuM5uGYXcM2daXNPnZcZ8WsiKuZn2wpyzlqdqjRHSCBO3d+MAAl4fq3QT
	WcbWxKUmZoSgGhADqlbONnGKGrP0WPYftmyN5SHnl0RznO6QDh70iF4WWdmmdr1o
	aIScf5LEdaaGhZvRXtqauEdQYcVTxfnY5fBDKymQI3GW62WysEdhRtl52Reur2xV
	neOI7u8mmhegCJEg8MG+g/gN2FLhcS8X7pM1jBmSWDhpZHC3NL0k4AnK5u5eQSrj
	2JqicmdimqMmRzc060ENJNbBiQ/6lJJQs7iVAB0KB6SoQ6jf1kentb8lURzCMPxW
	GsLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1696355635; x=1696362835; bh=Emic7Z1y2XZwl
	jvtzupGq8cvsW20UYl18kfH5lRmznc=; b=Jau1+o+nsNlGBB4FdY6b7J4VspbNA
	aPd7cmm28YNYn367OO6LUMEIptuTzH5zBRlumJEK4RLdF7HR3VVDrI/hwj37Zese
	n7JroZhW75x6+9gm+lN413ne/nHgr78NfIAyttCubWuBaxkO0eF98iMT2qUh7oiR
	bnM9qrH8wfLq/b/WGafDJrClpK/9Ky/PNHRd1IYuq05u365NxX8nD1U6KBZLuCpv
	TA+R5Olp6FDTDiDJDVx6+qIB0ESjxd14oLsCjLAmJopC38NMetD2FFVUqx64YCjQ
	EgodgWspZ4ZGKgVj3rxWV/D4ycCjCoG/0ltVeXB3Myk6fP0zzX9/IrxaA==
X-ME-Sender: <xms:MFUcZfSC4nOicsWJVAEEwkPxHVw3IOtLiMUmhmi2_A6LGQKSr8wOJg>
    <xme:MFUcZQwW_3Fl-330qGVbPh4Hq3_93YdNnHRKSjwK5RF_peTaRIvfNogMNwzQggPcH
    bj-JvdySS8ylDIut1U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfeejgddvjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:MFUcZU2D22kzVLiPB8I7PPK9hqXB0jIiyrEVTBJJV7gbFUvmHP7rXg>
    <xmx:MFUcZfCBTWDztQr-WX_3iN9pneFwP2S06aBCQ9hNL6yy7ZThoDvuDw>
    <xmx:MFUcZYi3QcnlGJ6ljx0r1LwaQgk6kVg8ny9_cY5OUXs_1qlaDJpSsw>
    <xmx:M1UcZdKBE_BaqL21RT7ItgK7M7YEJCpJZ6XV5WpeTQIj-mielUA5Km_2a40>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8B48FB60089; Tue,  3 Oct 2023 13:53:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-958-g1b1b911df8-fm-20230927.002-g1b1b911d
MIME-Version: 1.0
Message-Id: <ac03a633-5d74-4735-a7bb-0214f54242c9@app.fastmail.com>
In-Reply-To: <cdada842-2a7e-5f1d-eea3-3d99b637c26b@intel.com>
References: <20230628230935.1196180-1-sohil.mehta@intel.com>
 <20230710185124.3848462-1-sohil.mehta@intel.com>
 <5748f659-4063-0e18-c5d4-941a863d0d93@intel.com>
 <cdada842-2a7e-5f1d-eea3-3d99b637c26b@intel.com>
Date: Tue, 03 Oct 2023 19:53:31 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sohil Mehta" <sohil.mehta@intel.com>, linux-api@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>
Subject: Re: [PATCH v2] syscalls: Cleanup references to sys_lookup_dcookie()
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 04 Oct 2023 05:32:24 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Matt Turner <mattst88@gmail.co
 m>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sergei Trofimovich <slyich@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>, Brian Gerst <brgerst@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org, Rohan McLure <rmclure@linux.ibm.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Arnaldo Carvalho de Melo <acme@kernel.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Randy Dunlap <rdunlap@infradead.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.o
 rg>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 3, 2023, at 19:47, Sohil Mehta wrote:
> Arnd, is this a good candidate for 6.7? Though old, the patch applies
> cleanly on 6.6-rc4. I can re-send this one if you would prefer that.
>

Thanks a lot for the reminder, I've added it to my asm-generic
branch for v6.7 now, it should be in linux-next tomorrow.

     Arnd
