Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0774E77F69E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 14:44:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=QuHCOO/R;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Rg06Aqrg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRPp55w4yz3cGq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 22:44:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=QuHCOO/R;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Rg06Aqrg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRPn84DC4z2y1c
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 22:43:23 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 53543580133;
	Thu, 17 Aug 2023 08:43:19 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 17 Aug 2023 08:43:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1692276199; x=1692283399; bh=O8
	D64D9ZxKe4zy+hw81tbMNCuqtgmzaesO9ivpE3ArQ=; b=QuHCOO/RSMr4Llucts
	aU3c+Kh5kz4Q0nwoCipRk+57PILjNRGQ0JAtMUsJxsf9dlqvaN86fR5I7WTsNQcX
	hgqcUy2ZjEIpOi0SnRjpRP+p4rzMn0xoOYYq2UW4COacobEn/UrdTX0O4KRHVzWa
	92zKUtEVjEy4LVXc6x4qCVErnyT50LV6ECLaXT/Wu7A8Q5m+Uk9qcGLRmwjazflR
	PfzqBqIKNWYUENxHXBJggddQOaLSAC74WGZ6E/RiijfDtVyC/pgE/MkrTcaNaVhx
	8rexWMMrFhwOeEoOL3eGdSzcqWFSgMdxU9v6pYEsn3HDZHCnOwJDZQ+RGO7GghnJ
	AJzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1692276199; x=1692283399; bh=O8D64D9ZxKe4z
	y+hw81tbMNCuqtgmzaesO9ivpE3ArQ=; b=Rg06AqrgPniLcSm/FBOZ4hWiMmhAd
	po1B1mXcBR7XHQ9gJxtNggS2hzlhUqFYvNYVm7SJFxt7Ev+mwquznS6a2A0Yn0XE
	0Q1mjQB7xhiaWQLphZL/SGmWcVgYBH2Q1kCVoCzmMPxOvBQ9bEcTIl4S2y4DOxOg
	dRY2fUdELsplLfRTjaurLwNxvowVVQnetxcYxNhxtEp+nTPf0D3sghnDJnUL9hcC
	u/SQmluPKRZQDElJf/VyTVmodV7aLpzgL1urwLhFhSH+QqZOLVZdtz+SnK4od6sm
	hKpC6ATl5ciGq/jWsFG2LLq6D1iHh4D1116rd2AhMfkax1SXZWRtMFU4g==
X-ME-Sender: <xms:5xXeZKe111p5ZzkrkgiEBwKLJ6PSYTAeRO8Kuj9Lv60oo9l_Xi74Ww>
    <xme:5xXeZEN-9gp5qo33rE6o6v4Zc1MIThazt3Y2GU1fM-ttcS-uAZWExXY63K4Tf96gm
    xIp1DXolB6PjhpVOZI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudduuddgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:5xXeZLhMiJc1txFTs4wuJbUwjYOBDpT0CW7WD7aPlLKFUZ0IdbphLA>
    <xmx:5xXeZH9meYiroX8E-NQFRY3SW1ydrmk-5we-b2vwW9EOGUqspvEZvA>
    <xmx:5xXeZGuCHgnhsj8cED8n7BQ8vvt2az3wLrjXJf2HQgUX7eIDe_7Q-g>
    <xmx:5xXeZP5RMSuNIrkwVl-5dPWbDsVToKGnK2VEzlW4dse-DNq180iAlQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 10EE8B60089; Thu, 17 Aug 2023 08:43:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <6db95796-385e-48ef-a32f-a5fba63b4678@app.fastmail.com>
In-Reply-To:  <38fe1078eb403eef74dc8f29387636fd7ecdf43c.1692276041.git.christophe.leroy@csgroup.eu>
References:  <38fe1078eb403eef74dc8f29387636fd7ecdf43c.1692276041.git.christophe.leroy@csgroup.eu>
Date: Thu, 17 Aug 2023 14:42:57 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/4xx: Remove WatchdogHandler() to fix no previous prototype
 error
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 17, 2023, at 14:40, Christophe Leroy wrote:
> Building ppc40x_defconfig throws the following error:
>
>   CC      arch/powerpc/kernel/traps.o
> arch/powerpc/kernel/traps.c:2232:29: warning: no previous prototype for 
> 'WatchdogHandler' [-Wmissing-prototypes]
>  2232 | void __attribute__ ((weak)) WatchdogHandler(struct pt_regs 
> *regs)
>       |                             ^~~~~~~~~~~~~~~
>
> This function was imported by commit 14cf11af6cf6 ("powerpc: Merge
> enough to start building in arch/powerpc.") as a weak function but
> never defined and/or called outside traps.c
>
> As it has only one caller fold it inside its caller and remove it.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
