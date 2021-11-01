Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0D7441650
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Nov 2021 10:21:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HjSGS4lQKz2ypc
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Nov 2021 20:21:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=UnGUCf4Q;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=diFBXxPT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm3 header.b=UnGUCf4Q; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=diFBXxPT; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HjSFg2Krhz2xDl
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Nov 2021 20:21:10 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4C1585C0124;
 Mon,  1 Nov 2021 05:21:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 01 Nov 2021 05:21:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:in-reply-to:references
 :content-type:date:mime-version:content-transfer-encoding; s=
 fm3; bh=84501gjsOD2kbsVp9NnfQgdde8rmPHYM3ZksjI35kNo=; b=UnGUCf4Q
 4gRYUaXleBq6CWSqlYH/z0TAQ0Ulh358rVWElFqY1aC78Fki6dIZ/bQjEBlF22+u
 pSapZ7tZ+GzsLYqhZAMdho3aysAXr/08pnj7r5z57sVWlH95XP5c1n49ccKnjo5i
 nI7WzlyANhEydIe2VgTuAioRnxCy8QzgW1skfiZtu+CU+n9SgeusaZtQO8sO8SRK
 3F51KwKSAt257D5KzSnWy5BMy5wocA/xkHfaSt7KdwKM8x0hOeQBa7361Xv5vY7i
 kw6xBME4CIa2HZjvyWkTfRK2sh3Pq3j6AAqaJrSKEZf9SkthuXcZi0r9kkjreZ9d
 mbQmTRTJPcWNiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=84501gjsOD2kbsVp9NnfQgdde8rmPHYM3ZksjI35k
 No=; b=diFBXxPTo25zcpIqem9MXCz3mScmOOBNU1fSAOdDVfYTZGXf+/WgJrusn
 dcDYFswnFzT1zEgKW5GIsSHO4em38P2hd48iNJyIERFBQORuim+bLCaGUSIFVco+
 YkJ6VQMhoRxenAIiHkZ00bYgb6dakeVxZFxqXnWf3aEWCBQ3uEa/Lj0FWHswzdF7
 ibsG2swARnNAZsUds38K3gSSHG4MibR+4mlSUxPKclIKG/ZcUEFW3YzbNpVGzHVy
 jCDTxFv9nvGzlghyR6kGbQvIHSzjogxVYSevTtO3RvPvf6DcwYQDo+7GMbBqUqa6
 E4KEJ9VlHbQJS75eFCQoLbwqTbz0Q==
X-ME-Sender: <xms:grF_YVEx4ow01CQWQJ-CbFfcrqMdNOXHSB834ceGU8Tk_qTDUukZoQ>
 <xme:grF_YaXhPzHBa2aHEmMkKY1nNTGjCmMluzKwy2vISVu_kjgOZd6JtyDiS4SY0Mt7S
 4tfDjhlZ4Gw4uBjdg>
X-ME-Received: <xmr:grF_YXKpaW5-W8vX_u5TONtWtW1amAPKzEbaH3yQwt6OPWloXTglcmmKT_fWeeC7SCx1nhVn9bkntMSmmMu6MKL7llREDBwiZ6HvKUOUQGw6MA12lb5n>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdehvddgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfgjfhgtffggfgfgsehtjeertddt
 reejnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicuoehruhhstghurhesrhhush
 hsvghllhdrtggtqeenucggtffrrghtthgvrhhnpeefteekffefuefgtddtgedvgfdvuedt
 ieduiefhleelveeuueeikeegvddvhedtveenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhhu
 shgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:g7F_YbH9NEdzx70iAc9IPgsCDiRcwuM0Vl7Su6qspyl1SrDo4drGYg>
 <xmx:g7F_YbXO7Ib-DwpBozD3SSapdiDvS7PMG9ddvZqNc8TijmR8bqLvvA>
 <xmx:g7F_YWM9TTqj75FcY3TPeRswJplO_eDXlhVfcZr1D1ylmap0sbWkpA>
 <xmx:g7F_YdKM8u3QVE0Fhklu2hyB4QTsW0QORIv-aeU0xpJIKBKBerZySA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Nov 2021 05:21:04 -0400 (EDT)
Message-ID: <7ee0c84650617e6307b29674dd0a12c7258417cf.camel@russell.cc>
Subject: Re: ppc64le STRICT_MODULE_RWX and livepatch apply_relocate_add()
 crashes
From: Russell Currey <ruscur@russell.cc>
To: Joe Lawrence <joe.lawrence@redhat.com>, live-patching@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <YX9UUBeudSUuJs01@redhat.com>
References: <YX9UUBeudSUuJs01@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 01 Nov 2021 19:20:59 +1000
MIME-Version: 1.0
User-Agent: Evolution 3.40.4 
Content-Transfer-Encoding: 7bit
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
Cc: Peter Zijlstra <peterz@infradead.org>, Jordan Niethe <jniethe5@gmail.com>,
 Jessica Yu <jeyu@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 2021-10-31 at 22:43 -0400, Joe Lawrence wrote:
> Starting with 5.14 kernels, I can reliably reproduce a crash [1] on
> ppc64le when loading livepatches containing late klp-relocations [2].
> These are relocations, specific to livepatching, that are resolved not
> when a livepatch module is loaded, but only when a livepatch-target
> module is loaded.

Hey Joe, thanks for the report.

> I haven't started looking at a fix yet, but in the case of the x86 code
> update, its apply_relocate_add() implementation was modified to use a
> common text_poke() function to allowed us to drop
> module_{en,dis}ble_ro() games by the livepatching code.

It should be a similar fix for Power, our patch_instruction() uses a
text poke area but apply_relocate_add() doesn't use it and does its own
raw patching instead.

> I can take a closer look this week, but thought I'd send out a report
> in case this may be a known todo for STRICT_MODULE_RWX on Power.

I'm looking into this now, will update when there's progress.  I
personally wasn't aware but Jordan flagged this as an issue back in
August [0].  Are the selftests in the klp-convert tree sufficient for
testing?  I'm not especially familiar with livepatching & haven't used
the userspace tools.

- Russell

[0] https://github.com/linuxppc/issues/issues/375

> 
> -- Joe

