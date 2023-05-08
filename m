Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3456F9FF6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 08:31:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFBJc05G7z3chX
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 16:31:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=T8BZl25J;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=bNVGt5iE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=T8BZl25J;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=bNVGt5iE;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFBHd0qLqz3bW0
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 16:30:35 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id D8988320092A;
	Mon,  8 May 2023 02:30:30 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 08 May 2023 02:30:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1683527430; x=1683613830; bh=le
	0GHkpM/DK67L0rnYvvQ4eFOFqUP7IGApoRg16DbEY=; b=T8BZl25JjOInIW7w8p
	co3lRT4mul0oKuidLvvUU5v/DTjIcWPZ1YBhI31PGCjDFmFSExTn3a16p/VeaYFP
	kdp0h6z3m6qHvqhvJ19mxjZYDdMCWAyhs8weseE0XHqsUtIJ3zgBFjPUVBJl2bXb
	1Z7+NdIx8ks6Rz0ddSqNLv+qEDNZ8yMurhZgNUPZPRVUiR1sjGkf7zF4OjEAEDdW
	HhY3Jr8PBWdgI13/VXkg+qNsqz2PxYWFzlyXTvJTxG+GzBxpymZ9RsPPsIP2SF1d
	6lFFB3pGFwNhcZbr7vkKMAtRzUDAWugX9tr4keDO9V/g8q7dKDwqYkGvwLE9eOZ0
	NeCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683527430; x=1683613830; bh=le0GHkpM/DK67
	L0rnYvvQ4eFOFqUP7IGApoRg16DbEY=; b=bNVGt5iEZQNTLItzdfRJXXVU7037y
	O7udR4UPETkUGtnokH+k7HMm6g9qvBGUUmk83t5S6DYyAzO+Mz4NfB5+i0laWuUp
	//tpJus8xLX2uImRDXsMGizuzTDbUltByEvTUQgHpOp0zwRtya+901z5MqLmbwHj
	oZR50/UnkP0ZQ7CmlMXdaYKDfBGPcpWqSjI/oZBAZqKsQrVzHGyWUUwFgymIr7Vs
	IAhMkmkRgr5IBNkY+KtQlULSwZcw4ueO1xCL5ltp/3dPS5uwngfowpIgkxN6n4o6
	U6Uz9Ki2YmXIRiHJjxBJe/E35t5hbL+C4Ua/QnSI79DgyL9ARKrhQwHdw==
X-ME-Sender: <xms:BZdYZJReiWGOByiMasg_R5axJf-Y9cT-uMzufmqV6TUiuhbJWqaKqw>
    <xme:BZdYZCxZ3MLK5LfuKO9FjFOkxW318sA7-OMzh1lb7vvH9yeG8aMcQwG-QYNvM7esp
    BYoDWcehFIJ5qbU9_c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefjedguddutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:BZdYZO3X30Nh_TeM9yw0A5uJi2niw7eEJk7lwbX9M7VBJlCrTBnT4g>
    <xmx:BZdYZBBKrdt_pAeCwWnIIP3B47lz7zu5xHAEcsOJUqyKxSc5vVqcfQ>
    <xmx:BZdYZCitVpyqTLu-Flj_UE4ahTewttlOgs5RTPu4rF_DM92i1OVRew>
    <xmx:BpdYZDtdpWzxkpUDEH6SOWqyrAyKQC2ALieYT5q4Y7lnSpxqk1QsCw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 211E2B60086; Mon,  8 May 2023 02:30:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-386-g2404815117-fm-20230425.001-g24048151
Mime-Version: 1.0
Message-Id: <f876418c-e137-4aa3-86c2-e257999ed230@app.fastmail.com>
In-Reply-To: <20230508020120.218494-5-rmclure@linux.ibm.com>
References: <20230508020120.218494-1-rmclure@linux.ibm.com>
 <20230508020120.218494-5-rmclure@linux.ibm.com>
Date: Mon, 08 May 2023 08:30:08 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rohan McLure" <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 04/12] asm-generic/mmiowb: Mark accesses to fix KCSAN warnings
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Gautam Menghani <gautammenghani201@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 8, 2023, at 04:01, Rohan McLure wrote:
> Prior to this patch, data races are detectable by KCSAN of the following
> forms:
>
> [1] Asynchronous calls to mmiowb_set_pending() from an interrupt context
>     or otherwise outside of a critical section
> [2] Interrupted critical sections, where the interrupt will itself
>     acquire a lock
>
> In case [1], calling context does not need an mmiowb() call to be
> issued, otherwise it would do so itself. Such calls to
> mmiowb_set_pending() are either idempotent or no-ops.
>
> In case [2], irrespective of when the interrupt occurs, the interrupt
> will acquire and release its locks prior to its return, nesting_count
> will continue balanced. In the worst case, the interrupted critical
> section during a mmiowb_spin_unlock() call observes an mmiowb to be
> pending and afterward is interrupted, leading to an extraneous call to
> mmiowb(). This data race is clearly innocuous.
>
> Mark all potentially asynchronous memory accesses with READ_ONCE or
> WRITE_ONCE, including increments and decrements to nesting_count. This
> has the effect of removing KCSAN warnings at consumer's callsites.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> Reported-by: Michael Ellerman <mpe@ellerman.id.au>
> Reported-by: Gautam Menghani <gautammenghani201@gmail.com>
> ---
>  include/asm-generic/mmiowb.h | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)

For asm-generic:

Acked-by: Arnd Bergmann <arnd@arndb.de>
