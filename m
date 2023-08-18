Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE81E780BE7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 14:37:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=C5e9rXhJ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=WvErnSoc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RS1cP6Jvcz3cTN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 22:37:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=C5e9rXhJ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=WvErnSoc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.17; helo=wnew3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RS1bQ558Yz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 22:37:05 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 5BAC22B00191;
	Fri, 18 Aug 2023 08:37:01 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 18 Aug 2023 08:37:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1692362220; x=1692369420; bh=SQ
	lAgMLU3HRev+9d1VH4auJeedGv3m900FTY4V8KdiA=; b=C5e9rXhJtnNi2TCu7l
	8CCMb2Ohju/uda/ovu0B779p56tmqTdZJwmdZSRTzSlLiAluVrCX00jjepJOWOtq
	nc6Nfrz5GAEuqfx2nHVe1+1LxMQ8Ff9bPSH4coUTygXiy/GEpljsZOSJieZDBX2H
	MR/5CwY5tst2SGTcCOGgtsscMCUB7fJGWfuFdoRmtaZ8hwUrrBjw+hBq4OXgc3JJ
	t63hN93j/ZO9GzWTLnuFjL6wp1kevlnmtjV4RoNULTL1ktJxhRyVrIHYspZ+KC7d
	CndBxbjKo2B/y8JKAf7JNOoyhlSmcgWZ8GE0f4CJIsxD0Vw1NRUuN0I+CFYN8HdL
	BSNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1692362220; x=1692369420; bh=SQlAgMLU3HRev
	+9d1VH4auJeedGv3m900FTY4V8KdiA=; b=WvErnSocl35e2ZAgGXaYZxdlUOhel
	didA48DngANn67Y80fNR7gIHLTM/hmDRikHFS+SOLFVhEz7QbJgutwEx0nOwYyAB
	IBqYC8+zsl6vSaPyJ2nq8UfzfiGZnQ+Chzzp4LT/V6Yg3ld6uFuYKum6rIVv3LwT
	3reQ09/6CEgIbLcKfVl15G6tUEc9tXbWAutJgRk59IuVv0HR0bHZ/41wbaur1qKx
	4MwLYzh6wGMOOV1/l5Qe51l31aqU4p8QztXQ+8KAXWrhcXRljDr/QQ2wM+fSbk63
	6sxQcDDX6I01WGw26r/+va5RIc1pj31c3jGNeSNeXJe0wNYoONNZcVRlg==
X-ME-Sender: <xms:62XfZLuNPPlnBU9-wMKjSVV05BSyeD7j_oTBNp2vVWlUSgz6Wvp62w>
    <xme:62XfZMd2eKCF3oI9OC-fobB6jU1XP1_Tuop21eLFFatnrXP7euNsvxRSlBWtlkHo_
    ak4NY8gC6O5Dc_wMCo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddufedgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvvefutgesth
    dtredtreertdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnuges
    rghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpeevhfffledtgeehfeffhfdtgedvhe
    ejtdfgkeeuvefgudffteettdekkeeufeehudenucffohhmrghinhepkhgvrhhnvghlrdho
    rhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:7GXfZOy01ZaCBBVLKc-kqw_muk8j3uSg3CC_cWJEkOKv3FtHC2N26g>
    <xmx:7GXfZKN8_e_dRw3GisVLk0WnUjC1IsJMxUQso0UcslY7FxvFRp9V5Q>
    <xmx:7GXfZL9HcGmJR3P0-FEwiuR0boDwGPjvqjwKOAW5VbM1LP6Awmq8DA>
    <xmx:7GXfZNLtbhDzc6MLwtZgmu-NXVNH9ymB5SqsVBjkbgMnkEl1d1S6Rcxnlto>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D8428B6008F; Fri, 18 Aug 2023 08:36:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <6173828b-183c-490d-abca-bdc72221bafc@app.fastmail.com>
In-Reply-To: <202308181501.AR5HMDWC-lkp@intel.com>
References: <202308181501.AR5HMDWC-lkp@intel.com>
Date: Fri, 18 Aug 2023 14:36:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>
Subject: Re: [powerpc:next-test 21/79]
 arch/powerpc/platforms/powermac/feature.c:137:19: error: unused function
 'simple_feature_tweak'
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
Cc: llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 18, 2023, at 09:59, kernel test robot wrote:
> tree:   
> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git 
> next-test
> head:   c56963d48343b50998bacc6df949217c950163e3
> commit: 54f30b83fe627453082f15d83d7820b28b2d24bb [21/79] powerpc: 
> address missing-prototypes warnings

>
> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: 
> https://lore.kernel.org/oe-kbuild-all/202308181501.AR5HMDWC-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> arch/powerpc/platforms/powermac/feature.c:137:19: error: unused function 'simple_feature_tweak' [-Werror,-Wunused-function]
>    static inline int simple_feature_tweak(struct device_node *node, int type,
>                      ^

This looks unrelated to my patch, but is easily addressed by marking
the function __maybe_unused. The warning is triggered by clang specific
behavior that treats inline functions in .c files differently, see
6863f5643dd7 ("kbuild: allow Clang to find unused static inline functions
for W=1 build")

     Arnd
