Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCE367C4D6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 08:23:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2XHp2fRNz3fDf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 18:23:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=GiLb/skM;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=i56wP0aR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=GiLb/skM;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=i56wP0aR;
	dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2XGm64KRz3cdw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 18:22:40 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 84E2258287B;
	Thu, 26 Jan 2023 02:22:36 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 26 Jan 2023 02:22:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674717756; x=1674724956; bh=E33V4yTgr/
	ebT73Eum3QUd1t2W82YQcLJ50MWaQWWA8=; b=GiLb/skMhyZcQ01dO+WmZTL0hL
	fZ2ikfEbw6M+0GfWoi9BCHFyTrzd/xw84UaBaAMBNbekfpfzAvn0+3OyIl7DpZIk
	AscfaN2jhi+H4+HQPHW6kdeYv0wuJbvXO+Nmf3robmrH9p5Eaz+pTFIh+gw7OUdr
	GHaCtnvyFflXRN840zxE0TueOxb7X1UKgvjA9BbNkN54rpLAR1FBHefwPtJLfO63
	HU5voKjovLZNYSTASSTneRk9lhMeYYIxU5ah7ERIB1I+Tlqz6Sh6cL1quV9LIBsu
	LJGaa2P7uDg6V7dGWcg5+AdhatDXLV001yKTEzZw6AETD2Ctpr5noVgk6LyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674717756; x=1674724956; bh=E33V4yTgr/ebT73Eum3QUd1t2W82
	YQcLJ50MWaQWWA8=; b=i56wP0aRGUynM8c34e7C84YjtNs5ESnKIS4Qk9sa0afa
	hZ6EA3tyzNwBZXGsbGt4dL3J7JuIzcSWHi3zNRP0iTUuzQE6/UwhR5FhRpLn/ouY
	xt6qq+vPBvkzpCHoSxo03igHd1P6lM5xa5cKrF0kUrwg7q2T50CTjxmrDjS0magc
	ZxGVHrCofyRHgqO1ckZj1XRFm2MlqCsUcWY5ZDdbx7SuYVnKPtd0L9F879LdS+aK
	Dn7zgQYu29nT9qh2c89O8Dw8mgobJhwQ28spFTbeCvY5iq0cHOI93ldlBxi2zZYx
	hCfhfAJXQq9sSPCh3KQtBHwxvY8+uaUayqJxJdu1iQ==
X-ME-Sender: <xms:OirSY0UrLGgYH3i-5TBnXx5kCGsN2YicrY23OHL1XQjg0oxapCF8GQ>
    <xme:OirSY4mGQAtxHP9bCv1xlHPGN64L04ZTpqbp3Zo_GJISeoNzutpf4eILgOt_wG15N
    1B3TnHPfXPQ5aq8ZzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvfedguddtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:OirSY4a2BI8A8n6QHmfRNwvlyjZb0oHPUIh8AqkYJFN6HEjTyNF3mg>
    <xmx:OirSYzWHad1gVQ1pUnGhOP8BKq_-7XwGF62Qeq8f9YbfS8PPn3iaCw>
    <xmx:OirSY-nzh-yZLlxChEUc50uhXtONqG_p56LYIjKU8LygqILAOsLvJw>
    <xmx:PCrSY4uHnBHnmZDNTb4kWTrj5YTK-XYwojaMEFC5m6krF7i9k40zBQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7FEEBB60089; Thu, 26 Jan 2023 02:22:34 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <03605ec4-3e31-475e-8acf-2c342436aa24@app.fastmail.com>
In-Reply-To: <20230125190757.22555-4-rppt@kernel.org>
References: <20230125190757.22555-1-rppt@kernel.org>
 <20230125190757.22555-4-rppt@kernel.org>
Date: Thu, 26 Jan 2023 08:22:15 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mike Rapoport" <rppt@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>
Subject: Re: [PATCH 3/3] mm, arch: add generic implementation of pfn_valid() for
 FLATMEM
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, guoren <guoren@kernel.org>, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Greg Ungerer <gerg@linux-m68k.org>, Linux-Arch <linux-arch@vger.kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux--csky@vger.kernel.org, linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org, Richard Weinberger <richard@nod.at>, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, Stafford Horne <shorne@gmail.com>, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <ts
 bogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 25, 2023, at 20:07, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> Every architecture that supports FLATMEM memory model defines its own
> version of pfn_valid() that essentially compares a pfn to max_mapnr.
>
> Use mips/powerpc version implemented as static inline as a generic
> implementation of pfn_valid() and drop its per-architecture definitions
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>

I assume this can best go through the mm tree, let me know if I should
pick it up in the asm-generic tree instead.

     Arnd
