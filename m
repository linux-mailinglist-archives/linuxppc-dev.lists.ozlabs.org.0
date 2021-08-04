Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 704213DF8B7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 02:03:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfX4v71Kfz3cM5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 10:03:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=h481Eqo3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=out5-smtp.messagingengine.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=h481Eqo3; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfX4Q3PMlz2yLg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 10:02:44 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 9D7FF5C0136;
 Tue,  3 Aug 2021 20:02:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 03 Aug 2021 20:02:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Q2bbrQ
 EQnW/CCXMgoh33J6LXnHBILfp18k4dMcUv8Ro=; b=h481Eqo3Cf0LiWnYIBGqFt
 wGMlWNWenDzK3bhLi45YzA2KPq3DTdDP6Up1wgAf2sg5LvHrPfsbHmb/d64I6vKL
 G8NX85Dfi6ouRLvXbuB26q8S0jZmIRcjuQrd/fyw1rDfX7tQHK7+xbHnvoHiNw2U
 jZrsti0ON0a+E7/+SQAFf9q9ggG1Pwcoxe0+LIiO5sITJpJRSx/jxRnKFntcPTLX
 8Zcdctw2KAV1FaLIJlshXFgw/W68brd9HGU+Psw4+bqj/8wqCwfmO4147AqyLwi6
 twTMg/TryEqLrL68uEaF9ukKLfsOLraWTwnd8H4DqeZsR+w07WUIF6x8WXo1StZg
 ==
X-ME-Sender: <xms:H9kJYZyFx4NyfiIAUfyjzzk8MM3-knkAP-3489zF3uayQPPvRXTccQ>
 <xme:H9kJYZQnxBlDTcNxC_6pbjyBgGjPTVz4wDc3qhfhNbw5M4zyac48P9YFvqJyf80g9
 VFjXNFmsUrusg8Yio8>
X-ME-Received: <xmr:H9kJYTUq5P9pa7UuOIAsHp3d6AJnIhVUq-kpNy8luUohMew1HMTNC2B7zBtqYCG-3rmcKzi0qQ0AkCEyXMXFnRLoi9z8If3KrCE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieehgddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
 rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
 gvrhhnpeffudfhgeefvdeitedugfelueegheekkeefveffhfeiveetledvhfdtveffteeu
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfth
 hhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:H9kJYbgC0RWDD0JEGaejWumzVw6EsVG9XkuzBPYozst5SIL0zgC4vQ>
 <xmx:H9kJYbA8U2DKxU2X99YCzNnWTaAsbzl0fFOsh_SMgkG9PBts9tpRYw>
 <xmx:H9kJYUKTHd9cnz9RyZ057_rPAcqXxJkByfAAuqGRER80Z-tmhTWNew>
 <xmx:INkJYQ6tkGgsOf7L6njuMrlS57w60KyrZXoDdSHQZzwtoxEz8VbQmw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Aug 2021 20:02:37 -0400 (EDT)
Date: Wed, 4 Aug 2021 10:02:33 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Stan Johnson <userm57@yahoo.com>
Subject: Re: Debian SID kernel doesn't boot on PowerBook 3400c
In-Reply-To: <757cf732-d572-26c5-9a3f-6b63e3d2d0bd@yahoo.com>
Message-ID: <a6e27c1-3a89-b3d8-d651-3a97cbb12ce3@linux-m68k.org>
References: <60841a75-ed7c-8789-15db-272bf43055f5.ref@yahoo.com>
 <60841a75-ed7c-8789-15db-272bf43055f5@yahoo.com>
 <20210731175842.Horde.UunWM8rZMP0dRCaeWUo-og1@messagerie.c-s.fr>
 <cd7c931c-a578-a2ff-0632-7767a0e90bb9@yahoo.com>
 <fbd08736-9738-35cf-3b47-b5c9c455c552@csgroup.eu>
 <b84bb7ff-2dfb-0ae6-6eee-dd3c40661982@yahoo.com>
 <fac98e72-14a1-802e-8343-9bed9a6eaedc@csgroup.eu>
 <757cf732-d572-26c5-9a3f-6b63e3d2d0bd@yahoo.com>
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
Cc: Debian PowerPC <debian-powerpc@lists.debian.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 3 Aug 2021, Stan Johnson wrote:

> 
> I'm not sure of the issue you are referencing. If it's the Wallstreet 
> issue, I believe we were waiting to hear back from you regarding the 
> memory errors that crop up with CONFIG_VMAP_STACK=y and mem >464M. 
> Finn, if that is not correct, please let me know.
> 

No, it's not correct. I sent a message dated 3 Aug 2021 with a patch from 
Christophe. I also sent (privately) a message with instructions for 
testing that patch. I will resend these now.
