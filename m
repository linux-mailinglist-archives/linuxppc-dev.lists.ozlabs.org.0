Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F145C6FEC49
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 09:06:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QH2x85WVMz3fWd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 17:06:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=VWXFys/0;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WQV9C5RA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=VWXFys/0;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WQV9C5RA;
	dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QH2w208L7z3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 17:05:05 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id BAB925802DF;
	Thu, 11 May 2023 03:04:59 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 11 May 2023 03:04:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1683788699; x=1683795899; bh=jq
	n9+i6S4uqktD4A+W4DhCnytpnr+GsOBOt4qhEN0dg=; b=VWXFys/0BV6m5RpZl2
	THPKXeF4YwHBhmXGHtHdIdnvjgDSIkVaQiJODFgiAPc6l5ALQz6E1fsfw32O/PsQ
	Bjk+gtazbYhFvNTmKslA+aFPzOW+HvaQwWgGV7Na81W2yU1L9NnA2fg3WeMXz5GE
	seZASc3hhKXbYSxv6BT00t4r5/jFufhxtUqnoyoM5fYQyu+iVj8XHbFVJX64byjq
	X8M78d5TZi4FoEjvjWM2+Yjxc5p1KvKkvnFT5I+nby5e/OvMn0j3dy5hHF6jwP1B
	WL9/ZS/4j9Evjonx35W4rZQP3CZS0VRTQE9LK5pSVKPmpajZqYawAxnBGYZJcaow
	rlyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683788699; x=1683795899; bh=jqn9+i6S4uqkt
	D4A+W4DhCnytpnr+GsOBOt4qhEN0dg=; b=WQV9C5RAcekZyjyo8xQuUDMSKPBcY
	lnbfOsB99ZwjDrX/avO6/64hJ07wRRy8asTMoAKht5Urd8CwUSv01sBXRoYk1YkO
	hJ9L5X9LWOshcTwUqt1dAKQGXHQ/VIUZaBvXt4uYksyjKQhGEL1UnmoQYxwNZTXE
	AcpPd+6kgB+AsxEpB3TMneh9RB90w1AwzVNkf4uNd+/sn/PKZus8T8lb55Cba6iX
	v0pISulFuCDCHfbzIbQAd7FrOIOh2QwFWiSbA6qGO84EVcbXRHj5m3P5yvClkjOw
	jsNeUuXoCisohtsWIuNct7oH+Ek6wgaiB9J4sCYoLQH1FK2GhWVigTe6g==
X-ME-Sender: <xms:mZNcZMUVOPS4KvcrRFNAUSa7IhpzQkn3-W3hyAEcPGpjW6pJ8ZQctQ>
    <xme:mZNcZAlfAo8XRJjQBaLVMGz0HL8UQpYnJl5dNRBxac6llOmbhPzHdgXWj6mjLJvW4
    KxSpT7vo52hd1yTgto>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegjedgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:mZNcZAblEGdGOum33TRaQz934Sm_cmG_AI3VZKduIfaYNrprT_rPsw>
    <xmx:mZNcZLVTYKpBRbcCBg5nj9ItxXjR4zYy3HG8RCbl6-xzXtwc279zkw>
    <xmx:mZNcZGkGWHPsPEaCdU8I9oPufVmlwrerXOSIA-mLSRWqjLYl3av57Q>
    <xmx:m5NcZAtSj8fgu7jGjAdf6t_duFJ2eK_SSZv24q6pAyzIgRcskr8CYQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9F8D1B60086; Thu, 11 May 2023 03:04:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-415-gf2b17fe6c3-fm-20230503.001-gf2b17fe6
Mime-Version: 1.0
Message-Id: <0d8e2503-5d4f-4b60-84ff-01a23bcf557f@app.fastmail.com>
In-Reply-To: <20230510195806.2902878-1-nphamcs@gmail.com>
References: <20230510195806.2902878-1-nphamcs@gmail.com>
Date: Thu, 11 May 2023 09:04:36 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nhat Pham" <nphamcs@gmail.com>,
 "Andrew Morton" <akpm@linux-foundation.org>
Subject: Re: [PATCH] cachestat: wire up cachestat for other architectures
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>, borntraeger@linux.ibm.com, linux-alpha@vger.kernel.org, gor@linux.ibm.com, Heiko Carstens <hca@linux.ibm.com>, kernel-team@meta.com, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, chris@zankel.net, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer
  <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, Johannes Weiner <hannes@cmpxchg.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 10, 2023, at 21:58, Nhat Pham wrote:
> cachestat is previously only wired in for x86 (and architectures using
> the generic unistd.h table):
>
> https://lore.kernel.org/lkml/20230503013608.2431726-1-nphamcs@gmail.com/
>
> This patch wires cachestat in for all the other architectures.
>
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>

The changes you did here look good, but you missed one
file that has never been converted to the syscall.tbl format:
arch/arm64/include/asm/unistd32.h along with the __NR_compat_syscalls
definition in arch/arm64/include/asm/unistd.h, please add those
as well, and then

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
