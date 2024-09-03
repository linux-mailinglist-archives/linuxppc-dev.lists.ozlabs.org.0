Return-Path: <linuxppc-dev+bounces-907-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E3B969679
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 10:06:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WydVW6R2vz2xf2;
	Tue,  3 Sep 2024 18:06:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725350771;
	cv=none; b=cFwf5K2vC+c7awKb2URk490PpwuNAvJfyQbPxDecyeG9JlMVkhnaSA3Jjjmi1KGhv+2JVpyPsDW5jTrrt9JnpTsaJf3ucwSr/5mM+mjuL64S6Qz44rtJfiI7By43ZVx7wBCunTRC6FKNj48Q/NU1f2ieNLp1gMVNVsVavUHcdRA8LpBEjdv+Wsja2O6UFkcY4bJpPGMQslXI3Z/xpjjd/uhHO4yTA8OBz4F5rfWLQ82RO/W8oNfJA8JoGrq6bieaMKcCGrg5wO4RUqAAOOsPvsQ7DSWX9IYGMXdty7r+yLcHdOiQ+hOsVOsCnw+fBordxxdcD1/yDaKXGb9GV6vlNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725350771; c=relaxed/relaxed;
	bh=5r93MWaJJQSMO5oail0RmsFtM4vGFRa2fu0nxIJMlgg=;
	h=DKIM-Signature:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Message-Id:In-Reply-To:References:Subject:Content-Type; b=CzccUs3gdPoovcDt1AoRITE8AwgTnI2OMSHCK/aiB6osnp78dhrFlaPVRjxTgpyjApfkvryAyx3duutiCnEWWB/IJX4RbGdanOk7xF7GEHSGsRmu1O6oMnls9rz1in+I/ngaxrHTeVtH3/JgBUzWMwOz/Bl1yPI4cUyB7A3s5mQ7FDj1jCyv+4j+V8UOtMIHfyIMELBCzK4tqIoqW2tzsTRLbfR0B6HROqMlYLLRNesGGI5woTLHrZg0B0TZkqBSfbLav8JsBFz5Lawl9leKTPqwioS/WV6y1dxpqJ3WRpS3wDalrijoJwJNGqtNRmiqR0/MoSJ25BA+bmRfg9m8OA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=CcASwc66; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=iUjAj74E; dkim-atps=neutral; spf=pass (client-ip=103.168.172.157; helo=pfhigh6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=CcASwc66;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=iUjAj74E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.157; helo=pfhigh6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from pfhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WydVT1PDKz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 18:06:08 +1000 (AEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 868D811401E9;
	Tue,  3 Sep 2024 04:06:05 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-01.internal (MEProxy); Tue, 03 Sep 2024 04:06:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725350765;
	 x=1725437165; bh=5r93MWaJJQSMO5oail0RmsFtM4vGFRa2fu0nxIJMlgg=; b=
	CcASwc66w65rrfPDWz2b3SruDBIOppw36WzPT4bwEJWBmXJ9lUjqLWeXQohgpVjN
	mhvsW130XSbCClvYXUm3dWcetDwUNNog+NTQala830a69hIGUUX5ZaJVtsZQs/8R
	q+zUU2wJWewMpdAK2r6Vr/a47NQjWZ+tPEYVRpWroLHEEXP9dx/UAWh/jYEAYBWj
	7jBFSu6N1MvdaEnO2ilDoK42pAwhjjn18ZxlJVFDB3jLOE2O4qyoTCoCPZ2uU/hZ
	otEQcqTRZGguPWu76HOmdFvhRONHxg2x0QyNkxuySrEgH/8KpC9RWCAFe2EvoJTM
	RtIxR5JM2qDiDEJ+eEk6BQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725350765; x=
	1725437165; bh=5r93MWaJJQSMO5oail0RmsFtM4vGFRa2fu0nxIJMlgg=; b=i
	UjAj74EOU5tFHf7eGIe93aS8YDUNUs0oSiQcT6bciu6tkxieWOBXaAEVBFqJBsIf
	6ZHs6MjQ4qdGLYwP5f67sXj7iuCImHAM5efVtjWzSS6jFF9U0WijlLhwBCszv/l1
	spu5VJYA/kXcGTfNEbEOOGW7l2le5Cb5q7zkL2X+UQbeltj5kxmzz/2tQz+RxFPB
	q/WikrTPArQSNeVMyuLuw6OHZOSiG5inUtjkTzDlelzDB1r3G1RYdp6p0WAgrO9d
	Kvinb55pUND8G/7lwkzeSSCsRclWnK3JK6yNrUZwPpYtI/otP7K2H/koYf8V6Fs6
	77+/i7V+4SQqSd6kJmyag==
X-ME-Sender: <xms:bcPWZuVXhOzOuucmpaBTj9L9RNbsTiavjNvovY5IZ9BYELKoAAL-8w>
    <xme:bcPWZoY4jRHKEB8JE2uTnsHcfV0vEFf8iBkaS7zJCRSqC6qkMtLtYnNo4LuGttDMW
    PDqUnWijeTqPwgEcP0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehgedgudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessg
    hoohhtlhhinhdrtghomhdprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohies
    tghsghhrohhuphdrvghupdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepsggrohhluhdrlhhusehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthht
    oheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggs
    shdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopeigihgrohhlvghirdifrghnghesfihinhgurhhivhgv
    rhdrtghomh
X-ME-Proxy: <xmx:bcPWZs2qslYJ2EH4QUzntUrsIdITPsIqFaMX7ZhO5I45bYUABOvHqA>
    <xmx:bcPWZig1GfkWF5gTEJ5fA2Ejcz8FAwVhP6Jze7Gygsw_Ae-uWx2MQw>
    <xmx:bcPWZoalSO7pT5yfbFhlI6lkqFfFgjhTe_JjdZMUaPcpzynxoE97Uw>
    <xmx:bcPWZqTEWaByDSNVPeMTFfSZBk0XmEt3xmboOudgPOfzB9wfhDUULQ>
    <xmx:bcPWZoDfF_ktGnKJ-0CKQia_rjw0bQeHcOaMTG8yrZZKUfHztqFDzY5G>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7C4A022202A0; Tue,  3 Sep 2024 03:04:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Date: Tue, 03 Sep 2024 07:04:13 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, soc@kernel.org
Cc: "Herve Codina" <herve.codina@bootlin.com>,
 "Xiaolei Wang" <xiaolei.wang@windriver.com>,
 "Baolu Lu" <baolu.lu@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "Linux ARM" <linux-arm-kernel@lists.infradead.org>
Message-Id: <3c8bd8bb-36d0-4265-a6d9-95b4767c911d@app.fastmail.com>
In-Reply-To: <326d9a7d-7674-4c28-aa40-dd2c190244dd@csgroup.eu>
References: <326d9a7d-7674-4c28-aa40-dd2c190244dd@csgroup.eu>
Subject: Re: [GIT PULL] SOC FSL for 6.12 (retry)
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Sep 3, 2024, at 06:36, Christophe Leroy wrote:
> Hi Arnd,
>
> Please pull the following Freescale Soc Drivers changes for 6.12
>
> There are no conflicts with latest linux-next tree.

Thanks, pulled now.

     Arnd

