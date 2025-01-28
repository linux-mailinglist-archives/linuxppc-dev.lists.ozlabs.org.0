Return-Path: <linuxppc-dev+bounces-5647-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56071A20F21
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 17:50:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjB9q08Rkz305G;
	Wed, 29 Jan 2025 03:50:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738083038;
	cv=none; b=lG9HmU9CDIfT6OriltpW2eKFl0kCsI1jr+EFlGEp6xLbom0J/4EMGrleLeIMQtkU5e6ym8S/MxZGq+dgMDetMNIyZQA2o73ijhE7xKi6CqkJYo0sxcEBeacSkrhzz/HvXoe8l5zJlDNlP+RvQq0fx1j+HpLRhsIxowAylHjs1iPfA7XA3mPhZftIiSMOIW1eSmw22rqA/QljgSrXeIXFFnMtb6TKRZ864ANQ5VJXVY4vVigqvwj06GFo99eK4jbLACiJ4bYu97IbezEh8NhJ4U4ftNtX83XNTCXq/YCAYFV/M2LLN4WSb4SpOj/doIiwFe7DX/HKiYLQ1qVd1RN7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738083038; c=relaxed/relaxed;
	bh=OzTrdvDmHfPKu0sUzo1rmLrtHAI4LwDlupmzRk1iyUc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=nO3fwtbawsCSPiJe23VA+WSQSYdewsLgvtbLyMvstBjRQjerX1/xPdXtnhDWE2yKqmznTrfE29nIHnloP6CyUaiKazKlUdupprrMT7IuZCLplrlV4mqAblIuiZsdY3NfLHO1aIgqcGV+iyNLFyMsYBEIhf+RYjqr94yeRbA/Y3EmYE7UzWr3GQSZhOTopnr5TqBi87/hEHGtxtkgLcXnJfRRjfdTtMQd4DYxitYal1qaurKW+hGq/d94Rv+BrkA3W9v9bDfYmnJWW6OVjoqZYvsg/qc3kjTGZaAcig5ORwxIuzbrbieO3FKeJIVPHJouak3Jb5QP32KFLiiVN3/xbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Xs1MOD1h; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=blxlI+BI; dkim-atps=neutral; spf=pass (client-ip=103.168.172.150; helo=fout-a7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Xs1MOD1h;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=blxlI+BI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.150; helo=fout-a7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjB9l3ML3z2yDp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 03:50:34 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 264641380B4D;
	Tue, 28 Jan 2025 11:50:31 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 28 Jan 2025 11:50:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1738083031;
	 x=1738169431; bh=OzTrdvDmHfPKu0sUzo1rmLrtHAI4LwDlupmzRk1iyUc=; b=
	Xs1MOD1hAWlkW6H3OB6yyyInUaeIzxm0KnxqbO43608ECInLPAiYJDWeTk2ezJN9
	Wy9fHNMoPHZFHRD5crE6iVUJkqrsfSlV835z8eSQTTOKDWJTVbYI6N6qApQt2Q5j
	EY8SS8E0YMlKa51aEuZQcYOQvj+K+qbDeUDZfFpONS2ZzlX+qJJfeHhHjMOqqTdP
	pvD19SE9F8/zM89KcqNg2uH3EAEe47D7U62y7pYmm5tKVRTpejVP47kBUQfqPfDS
	kqPyKBc4GXZsZzejGEAKOj0jiokRvHEXqOIC+riop8s2SfIyH56OpYPDVV/3WJsb
	m6tQMiMnl74Z8aeqDAjeSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738083031; x=
	1738169431; bh=OzTrdvDmHfPKu0sUzo1rmLrtHAI4LwDlupmzRk1iyUc=; b=b
	lxlI+BIK7OxBOxZOvsIwIdol/v9S4wFeSUAQgVLyQHYqjzPOO5GwoCaVi9XPwgGT
	Wk21iOoNwT/whoBN+tJQ8neEx5lYfF87ddjHyaciJZsvHaz7NNy3rv131qpe8jPu
	Ey82gxskXBHUL8jZ/uvmU6hubxgX5LOHESmwDWhvaLUAy7UF52VG1wxzkaxT7Z9u
	pm4f2xJ6uEZoPf1JGjEtv62ThvCl58kYHXMQQYR4F7r2mk+9dnBAjPhQB1erX+jF
	r7k3A/JuG/kQ9LhyApIOEqPJXvBqyDWB17dDi6UwNFqXgTognmFAn1DjvyoKss7A
	UvG7/4DzV+Cnw5enFS1lA==
X-ME-Sender: <xms:1gqZZ67skRZXgfTOFkizyBuYPymD1DrScfunzzp7XV8KBwGJ3DMHCQ>
    <xme:1gqZZz42JBOgA1G0CKpaSxfr5_HaPKwHFP_k2AmT61yeu4q5PC7YYh_m2RSk8C8QP
    7mRkHIc5aGwNjTRoIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeen
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeej
    vdefhedtgeegveehfeeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeekpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohi
    estghsghhrohhuphdrvghupdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdr
    rghupdhrtghpthhtohepnhhpihhgghhinhesghhmrghilhdrtghomhdprhgtphhtthhope
    hnrghvvggvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrugguhieslhhinhhu
    gidrihgsmhdrtghomhdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtsh
    drohiilhgrsghsrdhorhhgpdhrtghpthhtohepjhhulhhirghnsehouhhtvghrqdhlihhm
    ihhtshdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:1gqZZ5ckr2vTG-vcwvp8-epyz1vIxnkXV7HEbxQZtBnFd-4AYkH6tQ>
    <xmx:1gqZZ3KqiSYizBHBhd8-cxnO_gRLNaHWt8dBrUxdMMYi5PTK-FBFMw>
    <xmx:1gqZZ-LCG1GnbNtCDM3NIy8JlQYpCXz1D0KjHyogYJ-0WkK65y4JSw>
    <xmx:1gqZZ4yiJ58LRHmo2T0mgUEIMk_EnGacToPml1cDrb5VawJ4Cnnvsw>
    <xmx:1wqZZ_rLH-tTfcFc9UjOpH4eQ0cf47tR4xmpQBUDngRTUzU7hEP1oCmW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3C5F62220073; Tue, 28 Jan 2025 11:50:30 -0500 (EST)
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
MIME-Version: 1.0
Date: Tue, 28 Jan 2025 17:50:09 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Julian Vetter" <julian@outer-limits.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>, "Naveen N Rao" <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Message-Id: <9fc9a994-b6cf-4ad9-9cec-6777dedd216d@app.fastmail.com>
In-Reply-To: <b8496571-6c44-40ff-b03b-799fb1764447@csgroup.eu>
References: <20250128135711.1625747-1-julian@outer-limits.org>
 <81ee3098-1e43-4b88-975a-d223bc2338e8@csgroup.eu>
 <b335d035-07a4-457d-99ea-8b7597782fd9@outer-limits.org>
 <e785c98f-4bf9-48ab-a102-dc531623b378@csgroup.eu>
 <b8496571-6c44-40ff-b03b-799fb1764447@csgroup.eu>
Subject: Re: [PATCH] powerpc: Remove eieio in _memcpy_fromio
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 28, 2025, at 16:34, Christophe Leroy wrote:
> Le 28/01/2025 =C3=A0 16:24, Christophe Leroy a =C3=A9crit=C2=A0:
>> Le 28/01/2025 =C3=A0 16:07, Julian Vetter a =C3=A9crit=C2=A0:
>>> With 'ppc' I was refering to 'include/asm-ppc/io.h'. But you're righ=
t,
>>> when going back a bit, in the 'include/asm-powerpc/io.h' there are t=
wo
>>> cases, one (eeh_memcpy_fromio) which does the the 'eieio', and a sec=
ond,
>>> i.e., 'iSeries_memcpy_fromio' which does a byte-wise copy. But in the
>>> ppc code ('include/asm-ppc/io.h') there is a simple memcpy. I was
>>> referring to this one. But my description is not very clear. Sorry f=
or=20
>>> that.
>>=20
>> But then is your change still valid ? Isn't there some corner case th=
at=20
>> still need it ? Is it a valid argument that because memcpy_toio()=20
>> doesn't need it memcpy_fromio() doesn't need it either ?
>
> I see that _insb(), _insw_ns() and _insl_ns() also have eieio() while=20
> _outsb(), _outsw_ns() and _outsl_ns() don't. Why not change those as=20
> well if you think eieio() is not needed ?

I think that makes sense, even if it's beyond the scope of Julian's
work to unify the memcpy/memset I/O helpers across architectures.

I looked into the pre-2.6.12 history of arch/powerpc64 to see how
the eieio got in there originally and found that at the time the
string functions got added, this is what the readl() etc functions
did. readl() itself went through a longer set of changes to end
up with the current sync/twi/isync version, but the string functions
were never updated again during any of the later changes.

The bit that needs to be captured in the changelog here is that
on all other architectures, strcpy_fromio/strcpy_toio are written
to allow prefetching/combining/reordering, while the powerpc
version prevents this in strcpy_fromio for apparently only history
reasons.

     Arnd

