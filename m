Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A40897CD4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 02:07:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Ly6fWjob;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V923l52GCz3dW4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 11:06:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Ly6fWjob;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=64.147.123.159; helo=wfhigh8-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 510 seconds by postgrey-1.37 at boromir; Thu, 04 Apr 2024 11:06:18 AEDT
Received: from wfhigh8-smtp.messagingengine.com (wfhigh8-smtp.messagingengine.com [64.147.123.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V922y457kz3cSd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 11:06:17 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id 3336D18000E6;
	Wed,  3 Apr 2024 19:57:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 03 Apr 2024 19:57:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712188659; x=1712275059; bh=OELAIjno4nfQgKNkfoFeM6509nD9
	yu+wU/USbZIq3mQ=; b=Ly6fWjobE6ZPUlqXWFEtFH/gQIHpoid9rDB98jlyaTJh
	kk0v1oqGGpUj+C/hZS0ulZ4QUvTqgqCDpFBgENNtyGoua/PvmNqc1nnqdZ9KNmS5
	hPjpM12T7AolRLgwAARWy4jdMc516acWWWOPveTAIqDnqhXPi1CKQtMOjEvyo+jH
	6/umDSd4MU77Diw6lBfYdVdQjr+XK6mD5w52xsNsVXildfxRfnhdDbfeJyC9L201
	JlBcfAj/JxeiEWyZ7LgduHl7/NaA8JGPex6jK17kfIXNnOr1ntkwEXtfJln3nEQL
	WUgUxhNP9UT1myLjFjZDCNEeMMM2F3/qFRT3jcqbrA==
X-ME-Sender: <xms:8ewNZkTXh0nV2ISUSLnuW7Oj8hQdO11sxYdWG0mRQ8-FBm_xIkf6GQ>
    <xme:8ewNZhzc4wwfGHlOkW75fPnJs1LIPB2Wue-SlE1gtpqWXC5LafnTfeT9JaF0T9yHY
    iz0DV7ci4SojJduBOg>
X-ME-Received: <xmr:8ewNZh049l3BJr1P2mIyKD-vFwLBO8ufPIjoOWylYTIGkqSBmDfYX99TtWiRG7ZPP5tTcsaIF6OUcVSdTlvnP3H0CoMr0reU4Mg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudefjedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeeiudegheevveduffduudehtdevhefhjefffeeuudejueehffekieeguddu
    hfefveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghi
    nheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:8ewNZoBe310LAF2hGNBzgtRoR-M25vJsOSzH0y-laVkFeRDt3lNfeA>
    <xmx:8ewNZtgARgFk-67Wou6YN8MmamJ2gYZ-5b_MekAWFpvczgjV0a5Evw>
    <xmx:8ewNZkoIlwcvaHAAuaJjCGd3BGugl3zWonp5KX6y5pcGJOX8rExKBQ>
    <xmx:8ewNZgiVli_ELxeApB-oKXO5WTac5Xt-SWt80PQeh3OWSIEtntNTNA>
    <xmx:8-wNZgSmDgLSavzmSj0cOTWXTC7LPZbgA32wZfSC3-xp9OwvbKmLW_LT>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Apr 2024 19:57:35 -0400 (EDT)
Date: Thu, 4 Apr 2024 10:59:21 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] serial/pmac_zilog: Remove flawed mitigation for rx irq
 flood
In-Reply-To: <Zg3YZN-QupyVaTPm@surfacebook.localdomain>
Message-ID: <8f234f26-d5e3-66ed-ab0c-86d3c9852b4a@linux-m68k.org>
References: <dda2187e128bfaaf092351812e4538e2e41c17f6.1711599093.git.fthain@linux-m68k.org> <Zg3YZN-QupyVaTPm@surfacebook.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-m68k@lists.linux-m68k.org, Nicholas Piggin <npiggin@gmail.com>, linux-serial@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 4 Apr 2024, Andy Shevchenko wrote:

> ...
> 
> First of all, please read this
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#backtraces-in-commit-messages
> and amend the commit message accordingly.
> 

Right -- the call chain is described in the commit log message so the 
backtrace does not add value. And the timestamps, stack dump etc. are 
irrelevant.

> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Nicholas Piggin <npiggin@gmail.com>
> > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> > Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
> > Cc: linux-m68k@lists.linux-m68k.org
> 
> Second, please move these Cc to be after the '---' line
> 

I thought they were placed above the line for audit (and signing) 
purposes. There are thousands of Cc lines in the mainline commit messages 
since v6.8.

> > Link: https://github.com/vivier/qemu-m68k/issues/44
> > Link: https://lore.kernel.org/all/1078874617.9746.36.camel@gaston/
> 
> Missed Fixes tag?
> 

Would this be ok: Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
I have to ask because some reviewers do not like to see a Fixes tag cite 
that commit.

> > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> > ---
> (here is a good location for Cc:)
> 

Documentation/process/submitting-patches.rst indicats that it should be 
above the "---" separator together with Acked-by etc. Has this convention 
changed recently?

Thanks for your review.
