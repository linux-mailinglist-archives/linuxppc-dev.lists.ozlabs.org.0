Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 883D977F6A2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 14:45:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=XK3ztn4y;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=soYPp0Zh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRPq337n5z3dBj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 22:45:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=XK3ztn4y;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=soYPp0Zh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRPnb3N1nz3cPS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 22:43:47 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 838E2580133;
	Thu, 17 Aug 2023 08:43:45 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 17 Aug 2023 08:43:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1692276225; x=1692283425; bh=yV
	EqWTuuBHvfVKKWuTpdcLKJFe4ZBQt6BukSl2xV4tw=; b=XK3ztn4yhVZU6ek0hh
	s159A2vncJlNdKOwOKv+jfVzoTR0CV6ExX5fyqqiekpE/QUzxwrUZgbIAjQLhSar
	UZ8cSjdce3OJ/ES1FUMLUDeT1ap3WW+giMRlEEYwYyxIIBK8sS2C3r4oFTkVGZK3
	V6rhj1TqMNhgSE/sy6Q8NQXCTG3oXk0SORORIESk5G4g01h38EFThCXY+OtOQYPa
	Q7oYdodW2TJ5BBTRbCpa6SfqXv/NT97XGDcJwclYCNDIxzPgVOdQA+BXOzZjtKSm
	4cpsD4QiMvOV41eKS9lMulxt9gSbVIhghYLwZnC/aH0rWubXp8RHY659fIzzi6Ki
	05+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1692276225; x=1692283425; bh=yVEqWTuuBHvfV
	KKWuTpdcLKJFe4ZBQt6BukSl2xV4tw=; b=soYPp0ZhU98gI/7cUtPtbx5swwFGI
	UgNTPZKr76ecjWJVfkzgT9ldQOiqeANF9lqgl2RmfHaSPcBIOEYLfxGuOjEsg5J6
	i3C7WZs/Q/+2aKyQRoyn0kNCpzeCBl5eJ8iaQzuDRLYMXEVwFVMQ3HTraHM+YsCy
	gAMd2DXUMb8/P4PFRTaatlEXdr0X1GGJbSziguZ9p7eXQcowd+VHey8OgobCmYDS
	eTnxYa4ZKdOPakjPzYviYV4j/s86j2HuINrX+64SoK7xMyF3qnqyU8LW/3MAa09f
	gK5F0c/6yahqo2ipH6cQtS06KMHWUEmYxy907ow8DgG9aq/RATfMCDECw==
X-ME-Sender: <xms:ARbeZGoa_fsWZ_-bW9SlrElBtNP3HArFPD6SdJYWxloZNIov7XhQJQ>
    <xme:ARbeZEqXLT5Eyzj8WmVKVIsumh5F7Mk-qX_CYEIjaax9Hpoz43-jFuakNrE-j1YNO
    CI_3pwW5Qb32mhEZpo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudduuddgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:ARbeZLM-7gpf-pqzncz_Zk3cosZPm9RJkeaPK5CEQO57lHL99C-J_Q>
    <xmx:ARbeZF7wrP__kzgJqma0oVxodSczjF2aoA0Oo4MZcoUaZktq1zT7kw>
    <xmx:ARbeZF6QgpOxy56_RxUa9Xff6x-EPffxiQM7F3hNu3XwkSp2kWo6Ow>
    <xmx:ARbeZFEL4BfbqoapK1a1cC0WnMGh5-g6Hd1Ud5sOcEHf4I4wW4ZvDQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4A488B60089; Thu, 17 Aug 2023 08:43:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <53dc5d0f-8267-480d-a40c-97330e7a290e@app.fastmail.com>
In-Reply-To:  <0aa1141e18a84d926e199093204b37ec993f0c87.1692275185.git.christophe.leroy@csgroup.eu>
References:  <0aa1141e18a84d926e199093204b37ec993f0c87.1692275185.git.christophe.leroy@csgroup.eu>
Date: Thu, 17 Aug 2023 14:43:25 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/8xx: Remove init_internal_rtc() to fix no previous
 prototype error
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

On Thu, Aug 17, 2023, at 14:26, Christophe Leroy wrote:
> A W=1 build of mpc885_ads_defconfig throws the following error:
>
>   CC      arch/powerpc/platforms/8xx/m8xx_setup.o
> arch/powerpc/platforms/8xx/m8xx_setup.c:41:1: error: no previous 
> prototype for 'init_internal_rtc' [-Werror=missing-prototypes]
>    41 | init_internal_rtc(void)
>       | ^~~~~~~~~~~~~~~~~
>
> init_internal_rtc() was introduced by commit df34403dcaac ("[POWERPC]
> 8xx: Add mpc885ads support and common mpc8xx files") as a weak
> function but has never been defined and/or used outside m8xx_setup.c
>
> As it is called only once there, just fold it into its caller and
> remove it.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

