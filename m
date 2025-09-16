Return-Path: <linuxppc-dev+bounces-12287-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAB3B591D6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 11:13:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQx5x0dJFz30T9;
	Tue, 16 Sep 2025 19:13:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.155
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758014020;
	cv=none; b=JeR/1j0srv6lQXHpsZUEObbh8o9ReETFEytSuC+ZIPPYMKzzyYNTEnJKaPtTXvLPJn422KltKRe9iJ9MSMaP2Ll+J+5XtD4j+5W+rXktKX92hdOqGeU5AZORGN9GX0HjiWwMCJPFdygLW5ISawCd0lvX0200fw9c1iXeSco1wkiE2xGk/mihR79EelxfTJBahSCTswc3uN2tryKbR9MMTmvjOdXCzHeYbNUPt5PvYkoQBj+PtiGltKZdIt2qobzUwr0Oj0wTp3BkXSeDkztRzpRcYbCnoD89gatcLv8mvEoc/2+AKTBpJXb91H7I/l9foMShSp+gaT/hTr8DARPz9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758014020; c=relaxed/relaxed;
	bh=1OgYWMorWlEx85Gl8eJPGx4bP2k6bqHXQlySjRgSPhg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=WJqLZTE8dWvuEBw4owE/Gbga2yAzsoAt3YefshkafU5CujBitV2FOVvUkH726PblYF9HxlJ8qGMSp+Yo7tOgR4B8hdHjD6TmTzXr50MLkr+MS7FqK0hbCYyvicZ+Qn/6SF3AM5shXj0q0JjL/KRtEL2ojoqAvlULl2IbmBLDeRilARwGnBVACYE26dCdi6PjpzS9i+F9dUD0J37C1yiUWFbYut7gfMin6ZQ/UjJ3tu94N/0NmwER3Phr/mQ4AEYmpl8TnQy09Sc9smGPlawckkK0L60NkghNnQu3QI36gYPV4X3a2/pS/zfvuMx98+HN+um+G725CCEAU5wziLXhlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=RZI+e8Jm; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=GdMynQOk; dkim-atps=neutral; spf=pass (client-ip=202.12.124.155; helo=fhigh-b4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=RZI+e8Jm;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=GdMynQOk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.155; helo=fhigh-b4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQx5t1Tgtz304h
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 19:13:37 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A7D6C7A020A;
	Tue, 16 Sep 2025 05:13:33 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Tue, 16 Sep 2025 05:13:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1758014013;
	 x=1758100413; bh=1OgYWMorWlEx85Gl8eJPGx4bP2k6bqHXQlySjRgSPhg=; b=
	RZI+e8JmSUmd+MgaXuqoWuj7f3IfGtutChgIepT1Be15uX8DwcQO9s8WQ3koYW81
	oX2RsRVu1V94Y431wW470lVFZ9yLrjSqGXPbuXJDeRzeYeLQmy70hDLoaToVTtqb
	eBfzaBOvJ8F6+OGh5bbWJLODABYTu5S+wGs3JFCVBqMMPkpIaPi2/JDGi5AnCara
	tG5wOn6J9FVyjQXAFvxJ10CQqBKiamyGOajv2icre7R5FH8mTYtvYvkUTK2H4b1w
	G+rWMUnZmQQ2tYsjYWp8FvpsI8WA0E8ogORRb94PZx+2FPmklYzFH7gO+OGIyaja
	WpnW228Qg/Xs2DG2a/y75A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758014013; x=
	1758100413; bh=1OgYWMorWlEx85Gl8eJPGx4bP2k6bqHXQlySjRgSPhg=; b=G
	dMynQOky3jd/4AvDeL1equvO2MMFmqe85lh8q1e69UY+ApCz9I8RJ0FQqOzGld3Y
	NfVVbtsq9FLkbkNMxFoJjvdjqU6H/+O6M9YTOX4hnYoHOMW50Ef6i2NY7IwaVlKi
	oTRA+Xt7DIYkgaeCqtPFZh67aA8nfdw6cYgKj91xr6dmOU6xkyx4NM1uy7UIHCHJ
	lCmtWYLaxrA8caW5vHYG8k+ZtR1O4y/UWS3BLrebLzUuUlYafmy5/vvG7a34sh/C
	TCN6Ck8S8ymR9ig6KuG+FfyVG8qP1kJlzmumIY5qFxyfTXEcB7IGYf5Lru/Ht4L7
	vyq1R9AWpY0DfmnREtK8A==
X-ME-Sender: <xms:PCrJaBp0JrOpVG_PG4r13VFj5rKw3cYPTg62p9PsK7586MwMvsKUVA>
    <xme:PCrJaDrnnK9PRxsZWcJhvWyZMkW5lGohGWBgN5D9phHraokEDAk-weMTJtACBRi_X
    elVCG4-E5tScS1k5b0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegtddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopeifsedufihtrdgvuhdprhgtphhtthhopegthhhrihhsthhophhhvgdrlh
    gvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghn
    rdhiugdrrghupdhrtghpthhtohepohhffhhitghirghlthgvtghhfhhlrghshhihthesgh
    hmrghilhdrtghomhdprhgtphhtthhopegrshhhsehhvgihqhhurghrkhdrtghomhdprhgt
    phhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheprgifihhltghogiesfihilhgtohigqdhtvggthhdrtghomh
X-ME-Proxy: <xmx:PCrJaDKnVJ8NJ5VM4UwsMgrD457HryZ6M2dmkk4XT7k5RMbl4bZk_w>
    <xmx:PCrJaEDxd-q54vhPgMcuQLPdLq_GvdcTEialDf-h55aiSdeaIU5oKg>
    <xmx:PCrJaLftXYywb8MkAPAiv2wltbIGFHiSWxUiIrH92lSfvAeJRzU7qQ>
    <xmx:PCrJaL3QxH_oUveVZbLNJhaAMFig-4sj2kFN3bICj1T92uVM1SnHQQ>
    <xmx:PSrJaJx2HGsR6ai8Z5NQI7Hde7Bk50Z_tk5_8n4bq6b4FM8XvRA438ed>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 71FFC70006A; Tue, 16 Sep 2025 05:13:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: ADclxERWIs8s
Date: Tue, 16 Sep 2025 11:13:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Willy Tarreau" <w@1wt.eu>
Cc: "Ash Logan" <ash@heyquark.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 officialTechflashYT@gmail.com, "A. Wilcox" <AWilcox@wilcox-tech.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>
Message-Id: <afb4527e-3958-4b04-9bbf-d48e80616aa0@app.fastmail.com>
In-Reply-To: <20250916070052.GA3616@1wt.eu>
References: <3e8cb683-a084-4847-8f69-e1f4d9125c45@heyquark.com>
 <432e049f-886d-4734-ad59-52569a796046@app.fastmail.com>
 <11e667d6-2210-47f0-a9ec-a134a60e138c@heyquark.com>
 <39164c56-78f8-4bac-acd2-a996149c1c57@app.fastmail.com>
 <20250916070052.GA3616@1wt.eu>
Subject: Re: 32-bit HIGHMEM and game console downstreams
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 16, 2025, at 09:00, Willy Tarreau wrote:
> On Tue, Sep 16, 2025 at 08:20:35AM +0200, Arnd Bergmann wrote:
>> > The maintainer of that downstream claims to be able to boot modern 
>> > text-mode distros on the GameCube' 24MB, which I find really impressive!
>> 
>> On a simpler musl+busybox userland and even more feature reduced
>> kernel (no network, initramfs-only) I could get to ~10MB, but then it
>> doesn't really do anything besides showing a shell.
>
> When you build your systems from source and install only the necessary
> *files* (not packages) you can get much lower. Here's my reverse-proxy
> for example (aarch64):
>
>   $ df /
>   Filesystem     1K-blocks  Used Available Use% Mounted on
>   /dev/ram0          11520 11520         0 100% /

Yes, that was what I did in my busybox example, which used a tiny
initramfs in the end. Your ramdisk itself is already bigger than
my total 10MB RAM here, but then it also does one thing instead
of nothing.

    Arnd

