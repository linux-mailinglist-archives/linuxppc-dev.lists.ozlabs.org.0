Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A1788AD43
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 19:12:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=fS660U1h;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=H+VPet54;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3Ld16p4bz3vcn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 05:12:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=fS660U1h;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=H+VPet54;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.157; helo=wfhigh6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from wfhigh6-smtp.messagingengine.com (wfhigh6-smtp.messagingengine.com [64.147.123.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3Lc74tb7z30fp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 05:11:50 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 8ED3C18000A9;
	Mon, 25 Mar 2024 14:11:44 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 25 Mar 2024 14:11:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1711390304; x=1711476704; bh=ZOF0LllNEk
	KwlFc4eVFPUYe1z5e6mKp1Z3VJw8CX4q0=; b=fS660U1hG06tBjiG8AmosLeM/q
	hTeorddBxLag/Zrf1xyO/FfWBp+7Twp3Cklk/LKdRm/+lq1rQZz9dGiJIplirevn
	g01k8hHNfbZs67tq8XfM8O8Ir7YUNrjrjvXriGv/0GYfVW2d/UJSEmPaCNtb62IR
	Tya66B9hoJs/aNBwVkJ/6cmfuAYa0MVAzz8Yz5WWKsSvmk5lMo47gCl+b4WZGufs
	FtWbrj3AKA12vOFmE7pO9V/dgQYsntI4tYwE+ZrWjeGTpXO39SUXavwlWoX/eXod
	UE2RObvC29IPd5j7tndSR3+56Jy8ZSQ329r45g4ikN7lIRVEDFKyuWfRVd0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711390304; x=1711476704; bh=ZOF0LllNEkKwlFc4eVFPUYe1z5e6
	mKp1Z3VJw8CX4q0=; b=H+VPet54C3Y7QbMN4Y2/THGlKNi1RQ8lSrCen5xjBCLL
	GvOr72eh4g45YjvUQ/5YtYLW1AOGcmWZ+AuVmPe8BCv415DHKnogCrH0veC1RzUP
	4soLf281avDmAu6o2vVquy7wX/pPOYa/cjz2mU96CdaPk3AO5uGkRgnmO8yHdpv1
	yfhOd+WO9EAZPencMet7UNg86WPUFuzUNsee+X8N2L8zdMT4OB8tVDolLinZT+JR
	ElfnIjfZikTWSHvSEEPs4tpr0q8xAHqBHBJ/6jRuBNHG+IjH5X2s93lMvm/gPm6D
	rc/3lA0lJOYRCfA/QqhioypyWr5YC9LYioXWoow66w==
X-ME-Sender: <xms:X74BZu2tN7xekPZqMjmstbFirCYBYuIE4NS_Aipa0ZYoDcbMTLh0eA>
    <xme:X74BZhEYak51UNjk1N611INqAXz1a3OPovAHBTVgVffZSwrII8BUVewjxfUHbB4mn
    HjlTjcMd9bfrm2r-zE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduuddggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:X74BZm7d15nmTR2ONKJhlv31T8duatevTAgzzxKBYSZ4iRsnImAcOA>
    <xmx:X74BZv2HJTxGR8ksu7SGOKNh-dIO4cSyazLOK8N_zmAYHdnG-lv8Fw>
    <xmx:X74BZhH5p1M2Y_T48GPkgY5vhVfFNwm6T-0M4q0kNJmgZs3uO-mtCA>
    <xmx:X74BZo_u3GJhLGwX2s2jnYhlEIV3pCrVDa0qvj1RFw1lkP0FFAJnqw>
    <xmx:YL4BZkY5RtfvxTBGVyjsSPklDjJbZKwMA_1vxkvxXLhg3P-H24-8kBVlprk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 237E3B6008D; Mon, 25 Mar 2024 14:11:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-332-gdeb4194079-fm-20240319.002-gdeb41940
MIME-Version: 1.0
Message-Id: <64804d62-1946-4cde-aea1-e8bab0860bfc@app.fastmail.com>
In-Reply-To: <20240325064023.2997-1-adrian.hunter@intel.com>
References: <20240325064023.2997-1-adrian.hunter@intel.com>
Date: Mon, 25 Mar 2024 19:11:21 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Adrian Hunter" <adrian.hunter@intel.com>,
 "Thomas Gleixner" <tglx@linutronix.de>
Subject: Re: [PATCH V2 00/19] timekeeping: Handle potential multiplication overflow
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
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, John Stultz <jstultz@google.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-s390@vger.kernel.org, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Anna-Maria Gleixner <anna-maria@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 25, 2024, at 07:40, Adrian Hunter wrote:
>
> Extend the facility also to VDSO, dependent on new config option
> GENERIC_VDSO_OVERFLOW_PROTECT which is selected by x86 only, so other
> architectures are not affected. The result is a calculation that has
> similar performance as before. Most machines showed performance benefit,
> except Skylake-based hardware such as Intel Kaby Lake which was seen <1%
> worse.

I've read through the series, and this pretty much all makes sense,
nice work!

There are a few patches that just rearrange the local variable
declarations to save a few lines, and I don't see those as an
improvement, but they also don't hurt aside from distracting
slightly from the real changes.

     Arnd
