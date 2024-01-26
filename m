Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF3883D439
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 07:28:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=cyUYfSAf;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=mb027GcG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLnnt36J5z3cYL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 17:28:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=cyUYfSAf;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=mb027GcG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLnn06hntz3bqB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 17:27:48 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 5CE0B5C00E6;
	Fri, 26 Jan 2024 01:27:44 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 26 Jan 2024 01:27:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1706250464; x=1706336864; bh=7RrmUgGenu
	Qn/HaNj6HFZoaaojIW34eE1x1H/iTMOvE=; b=cyUYfSAfcE+s3rk93DNCSvy3r0
	ngicuukkvqN5cjrIZZcQXUOsxXM2j/KX1jQ/XTFHSnKbhB3ONeiTmgGsLSCfjal3
	1kjVwTVQ+uAAeKnUsKOVYB3hQ43lHg5hphvt+YL7Ym2OD8Odz4e5eN3g3CnTVDL4
	+RJStzgxZgTM2c1QRXkWAFLz3Jmqhtn/zG8cPah6bxHpw88Pqw3JadIwuz4llNae
	av84nC+D+VEiNeyjHtyGqxjJW/T2jvwkdVoj/Hb7WNDmMr/h2ta1mWta2Iyf2qxS
	23on7SqdafRa+52DJ20R7IvT9x6lRb/T+n3E2xP4YMxwi08a9xLIxyzR93gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706250464; x=1706336864; bh=7RrmUgGenuQn/HaNj6HFZoaaojIW
	34eE1x1H/iTMOvE=; b=mb027GcGfOmjbjYfuilqqkpJFkedsZFFwMivRD71Bf1X
	UhQ4AhRNXOBTLJU3ySqEQdSo7c2oP+9EP4j/dYMfsRwFHXizD9/E0Gld442pO+Q7
	9TNCoCUMaKiorN66Hrwueyc7abWyOITPz73pIZ87IuWlLaB4iRrrWTrVfIrrnd3I
	BgBB9rQyGAP7SfQlznwPfGZv1x+TU3HaGw+eJ3xdJBljfE5e13yN8gUfDRpUa+Vj
	rpwrsFVUS91Z6WDByOMNnPbhZiBX+Sdnk9vP5ooS0Scj1IP1H/gzpQFlFoPO1+pq
	ut6eiAVp7F9kOKRGODd4ZpvazB0fvCgInteggLTpQg==
X-ME-Sender: <xms:31CzZadCyA9bjOx7J0bHRtIcq06G171pSxL_kKHi5Y0WikW4bWCZwQ>
    <xme:31CzZUOHEDBO9Nr-i2_7LTOObn7qaqxRs-8pSDrdX_3An964CujcHHjkouIGrTXvC
    MLlWHGSmjyJ7gXqgso>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeliedgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:31CzZbghtBPd7iRpeihXGFnW8pg_KAm-YPY4qivD8ADvkHktdddm7g>
    <xmx:31CzZX8XgSQU09D8Ax7CyVrAYdhr6X5KxVsBoCXY9fIZYa3dS4oyZw>
    <xmx:31CzZWvfao0K_pThCotYkdM-sbqTNEGxxBmO2aUF2Mw8LSNjUAjN8A>
    <xmx:4FCzZaifdxHRQpJOdU_vlPdB9Wd_Neu04B9Thbzv9dWlzrXeKPWbVg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 89F82B6008D; Fri, 26 Jan 2024 01:27:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-119-ga8b98d1bd8-fm-20240108.001-ga8b98d1b
MIME-Version: 1.0
Message-Id: <fbae8c8e-6788-4749-b7e0-b64c9fffe85a@app.fastmail.com>
In-Reply-To: <20240126021258.574916-1-chentao@kylinos.cn>
References: <20240126021258.574916-1-chentao@kylinos.cn>
Date: Fri, 26 Jan 2024 07:27:23 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kunwu Chan" <chentao@kylinos.cn>, "Jeremy Kerr" <jk@ozlabs.org>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>, aneesh.kumar@kernel.org,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/cell: Code cleanup for spufs_mfc_flush
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

On Fri, Jan 26, 2024, at 03:12, Kunwu Chan wrote:
> This part was commented from commit a33a7d7309d7
> ("[PATCH] spufs: implement mfc access for PPE-side DMA")
> in about 18 years before.
>
> If there are no plans to enable this part code in the future,
> we can remove this dead code.
>
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Nobody is actively working on this code, so it clearly won't
be needed in the future.

Acked-by: Arnd Bergmann <arnd@arndb.de>

On the other hand there is probably little use in removing
the dead code either. It looks you sent a lot of these
patches with identical changelog texts to remove blocks
of dead code, which does not seem productive to me as
these were clearly all left in the code to document
something.

      Arnd
