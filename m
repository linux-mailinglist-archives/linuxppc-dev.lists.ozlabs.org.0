Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD955BBF2F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Sep 2022 19:46:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MVwGY5HFVz3bc8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 03:46:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=fJayOkkL;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=WBMamGk6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.26; helo=wnew1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=fJayOkkL;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=WBMamGk6;
	dkim-atps=neutral
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com [64.147.123.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MVwFq4bM0z2xbC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 03:45:49 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.west.internal (Postfix) with ESMTP id 2FCEC2B05982;
	Sun, 18 Sep 2022 13:45:45 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Sun, 18 Sep 2022 13:45:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663523144; x=1663526744; bh=Z6z5LUUiVa
	yFtla1/T0uZRhg7c09opoNxzG7VvRud8A=; b=fJayOkkLVWOmCgUMOZeaV4L4g7
	HNwAPAf1LJo++Qga95JXDJDtdBFnXGVq8TEoPDMpZ8Vkp4QeIDzwMcfAk6F45Bew
	qb8Jglay0OhFcadUG91Y2IsD64oaoUgrt075ZtME+my7INe9zu9RRrInwP7S5LRY
	pmK4eGmNyEyrMh96PwAh88heQklwRK8Ekr5Qhf5BaNyR69aytsAPU1U8nR2JTiuN
	B2KlwzMzfY1ePAi82B6l0ZoHpF8CGlGroYjcQkc7sPVl+JxJwM/WU2ZXuyFO/tqu
	Aszpde+EMmeB4+byV2hW204oZVk42movwRdU4cHStyJZjDLSZZj5DL3Gq5KQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663523144; x=1663526744; bh=Z6z5LUUiVayFtla1/T0uZRhg7c09
	opoNxzG7VvRud8A=; b=WBMamGk6YclSPqHh7mdvaa2YrAcniYNo53+esGaufG5L
	Slt/E00c7xHRfSEqlrolTtXKgt5RJ/RHJwcA4Xmu9oG2xeMx5K/5Z/gfhGITYglH
	x3YyM9TVS+vM0k7HHrRCTis6aCV2S0T4+mJtDr/6JieI8L0SvQedyoYtntTI+rQa
	3xg8VcGcQXB++C3VZv63hZ11DyLnqHlLGRGSdZJqZddXL5dnJht0KRagpF6zhjfj
	EsiGqegGebaI/4fpCFZ7i6Njuuue+ibpbS0y314tk9hjA2SWqdsTib5Okl9DezE8
	FTHxOSKRJUIYgNkHvuKVOuPx9rw23KwgZiFWzIVaBg==
X-ME-Sender: <xms:R1knY68HtqQbIUTZ6xVU-KOqq3n_2SNQtdH2QyQ5jKQm0Qs_6dEvKA>
    <xme:R1knY6ubsst8iI2xvxcpp-ShyDIJUpbvCaB8scKfbjKO5mxx7IcAYXVrpa7KrEYuZ
    6qwcrPe3bkWdk-ClUI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvhedguddvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:R1knYwBC7PWVYgHtXKAOHMG9kqrTh1CsPPoS7pvbLWPSAK6pZJUEVA>
    <xmx:R1knYyeGxxVzjqJTRLV7FPVWi7AsucvTASn84iBBNdIKCEakDh-UVA>
    <xmx:R1knY_PsskKH95SVmXIDAOcaeP_cyo0Xy87EAKSftjRYLP6BjKbVig>
    <xmx:SFknY4aFJaMZWycAWaluP450Y-a9wTykZfg0NyHXtZv58BTpjP_flPFp5WA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CFD54B60086; Sun, 18 Sep 2022 13:45:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <763da949-5eac-4387-aed2-223ced4f9e60@www.fastmail.com>
In-Reply-To: <20220918155043.210309-1-xu.panda@zte.com.cn>
References: <20220918155043.210309-1-xu.panda@zte.com.cn>
Date: Sun, 18 Sep 2022 19:45:22 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: cgel.zte@gmail.com, benh@kernel.crashing.org
Subject: Re: [PATCH linux-next] macintosh/windfarm: fix comparing pointer to 0
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
Cc: Xu Panda <xu.panda@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Sep 18, 2022, at 5:50 PM, cgel.zte@gmail.com wrote:
> @@ -970,7 +970,7 @@ static int pm121_init_pm(void)
>         const struct smu_sdbp_header *hdr;
>
>         hdr = smu_get_sdb_partition(SMU_SDB_SENSORTREE_ID, NULL);
> -       if (hdr != 0) {
> +       if (hdr != NULL) {
>                 struct smu_sdbp_sensortree *st =
>                         (struct smu_sdbp_sensortree *)&hdr[1];

The more common way of writing this in the kernel is 
"if (hdr)".

     Arnd
