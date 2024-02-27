Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FF0869ADB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 16:44:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=ETPl5htV;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=NT3iQKQh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tkhcc653hz3vZT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 02:44:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=ETPl5htV;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=NT3iQKQh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkhbY3QCSz3vXJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 02:43:37 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 634E9580A1F;
	Tue, 27 Feb 2024 10:43:35 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 27 Feb 2024 10:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1709048615; x=1709055815; bh=RvthbOEWI5
	7px7uX0Cq/SvB/Jiq4PKWj3XWiDYpTS5o=; b=ETPl5htV7hPJGyIFVjM2VDJlRJ
	JywnITINm7820fBfb3Xdg0RotosUKEfkEmxGh1k+JS9kphahurayiI13hznGLeIm
	MbYBqWKV+tP4RurXvAd1ZtPNforvZyb9z/g7ceDiz+h78r4tigeMSbrfwFNXmumH
	fOb9S6gVv3c+KVSaRDBSJ5Jy9abQDxTJL1hwwol+0A5h7wV+HeuevRDckJsJG7I8
	WqU9yoRi3mWoRn0p1BLR+fCwXX1WcoFnCDhz0jcdI7ggVlB3OHffV/iGZaVYIAOA
	1HUD8wJIFUuwEacMn4br7UHdx8Z+dBuKSQk8ZatJtUJOz78cHxKs+MMrHJlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709048615; x=1709055815; bh=RvthbOEWI57px7uX0Cq/SvB/Jiq4
	PKWj3XWiDYpTS5o=; b=NT3iQKQhAWJtF8LpyAbu0f/NJkTT77zJv2vTIHAh557R
	s3yetq/9tlfhtbar0DclfTfRaeq7xkQ+ik4aXUEpTfXPxyCk6oBk8rf1+WzXO13w
	sbMmXJ7/z07mKQO+WWMYLvW+qj5Av6FRqV2SNaMJYCCuMqH1Y3ouHuo+Q1W4NY58
	o7RAS16zuI0wC5ecItjLV8splKg9jzheGY+Sk6ZsWoLLEt5Z6E6UFZo78D2+ULGC
	hUfm1nfzW+s+47M1DgWxSCrGezaUXnqzM70yM0DxsG+XPQAxBiqVUix3/13lyu72
	eVy63lHdCcF9TuLQO0QH+42d2xafCtvmGh0EZCRNOw==
X-ME-Sender: <xms:JwPeZWatQztnTOrjeTLXYpxnKqyIPALPJ3sPFo2X8oTnM0HHrVLd7Q>
    <xme:JwPeZZaUmJ-HHYf3CWZXh-2YOFlWdays-LpGDgdwmnmSO9YP-kFoUL6jkFSiosCH3
    FxGzUCOIOmG0PddvN0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrgeehgdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:JwPeZQ9gHg_e9TU2rmqVDT7C89NGVhl0jLj5gA86W34yTgnP27lyGQ>
    <xmx:JwPeZYrM844Y1piwZ1hoXvq4kob8AwbwFPpB3Tl0qH7ukJsUwZK_gQ>
    <xmx:JwPeZRrXDV8P06sK5xVATdSl45qkxwQgZgJRFS1QUcTyZDudKEvKpQ>
    <xmx:JwPeZR2vDyPGNuT2sbDOqkmm6IqOH7RitzSfnlNxpl1amFz_HmH3Fw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 22FFFB6008D; Tue, 27 Feb 2024 10:43:35 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-153-g7e3bb84806-fm-20240215.007-g7e3bb848
MIME-Version: 1.0
Message-Id: <e1263cfd-bb21-495a-a849-f0ea795a6d9e@app.fastmail.com>
In-Reply-To:  <CAMuHMdVCWF50SO1TK5F5Q8sN08THKJ+F6gt9u5pD05gJUZ+E9w@mail.gmail.com>
References: <20240226161414.2316610-1-arnd@kernel.org>
 <20240226161414.2316610-2-arnd@kernel.org>
 <CAMuHMdVCWF50SO1TK5F5Q8sN08THKJ+F6gt9u5pD05gJUZ+E9w@mail.gmail.com>
Date: Tue, 27 Feb 2024 16:43:14 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH 1/4] arch: consolidate existing CONFIG_PAGE_SIZE_*KB definitions
Content-Type: text/plain
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, guoren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, Vincenzo Frascino <vincenzo.frascino@arm.com>, Jan Kiszka <jan.kiszka@siemens.com>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-alpha@vger.kernel.org, Kees Cook <keescook@chromium.org>, Kieran Bingham <kbingham@kernel.org>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.
 fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Gleixner <anna-maria@linutronix.de>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 27, 2024, at 09:45, Geert Uytterhoeven wrote:
>
>> +config PAGE_SIZE_4KB
>> +       bool "4KB pages"
>
> Now you got rid of the 4000-byte ("4kB") pages and friends, please
> do not replace these by Kelvin-bytes, and use the official binary
> prefixes => "4 KiB".
>

Done, thanks.

    Arnd
