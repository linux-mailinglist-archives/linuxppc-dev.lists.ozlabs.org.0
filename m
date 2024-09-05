Return-Path: <linuxppc-dev+bounces-1040-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C52D896D308
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 11:23:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzv6z55Lgz2y92;
	Thu,  5 Sep 2024 19:23:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725528219;
	cv=none; b=O0Y/KYalN6bqnJ8f9FU7OOL8A9SCu5dTo7eTjUwpXkF3xohmsFZ3Azq3hccl3e+ouB93XAgHaW4DxYRe2N6DtRPObghh6JM+tpjqC+xU9HF5/iLe8jX8EASWOosVnTxQcBBB7C92BidX1xgTIPjSQr/N9kOh8EWm3WpjSbIQ2fMmXhGqaLayr1YxMl7ycZsj9xhC9q5s+y8TyD4kUHdlY+hVUkn6O4u5WE6eYcaDkDAEGO/EZU+FfW0NUkxiNOVJ9wZuH7A2Q3HdbIF6LFGZPk9FIJujHOwy1Dk4tdeNZpgGfyNWL2Y4tds6FNa68wXDHSs+fE61jyMWo1UKzrO3bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725528219; c=relaxed/relaxed;
	bh=/kd72puemH7HG5k90wuxIWlVONqVTbIySxjDZBLyORg=;
	h=DKIM-Signature:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Message-Id:In-Reply-To:References:Subject:Content-Type; b=TuhMMI6GvBHiNiHqy+RWCWSW14LAIIc3NHKoHGTgLFxgQlM7gh9ZA0cG66teHU0eD2eEsoVgcJY39I2PgGruGd4qt9LvZ/HdNwv70Jon7adlUdyHDcffwv4HEW/cq8vLr1JCPnkfvpzKmQMHtsI//TLeMUW7ZiUbOMbPw9BOPNshBmGikBVngYymY8AUZxpoOWMOuPzFIb1qiiOI9iQTiWk1EabdH1a0/pvfzMJmvpHwkA81Fd4khdllFxq/B4UL2PQlYB+5SYBfPNEAjAKujn7mp014WikYQ5uM6m1rWymjEwAMX17TXHZIla9ey7DwARNSxtlh3K/4qY2TwDPSjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=BkwxLa2W; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=mc/5r8qk; dkim-atps=neutral; spf=pass (client-ip=103.168.172.156; helo=fhigh5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=BkwxLa2W;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=mc/5r8qk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.156; helo=fhigh5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wzv6w3DVDz2xpn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 19:23:35 +1000 (AEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 75D99114012C;
	Thu,  5 Sep 2024 05:23:32 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Thu, 05 Sep 2024 05:23:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725528212;
	 x=1725614612; bh=/kd72puemH7HG5k90wuxIWlVONqVTbIySxjDZBLyORg=; b=
	BkwxLa2WEoy8SOhL4ZQfEBGnMx9iUu4JMtVeQtWn8xwCPMDarpkqPPLbGHlxCuId
	v0Sh0g3opi/cbrUcFgD8lentdBESbNyTZjLAEsoj7qJ6JVaHKikyuOo0f7ceOpca
	XvwOqM/C1iNrdz5b0w58Jwo0jifr6UtKmRuVMpB1AGleMf8eC2MkpCNS0URKTLFQ
	oCaRr+r1egywwKu9crfzlMtE5ki+iW/a4yx9cZdk60A1E+WzOPWuaIDARChrOtgz
	/NZLHcWuAdLnv/IKukNseXfhiVCs52Rk+BYxwuDa0zIirzPW+H4xfMNxxrZzEks1
	+2kYyknF70Tnn/uhAslWBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725528212; x=
	1725614612; bh=/kd72puemH7HG5k90wuxIWlVONqVTbIySxjDZBLyORg=; b=m
	c/5r8qk0GYWh2cw3TsbKB3aNZIXLr8CTLhciWmeQNmT0jvyYD8Wxm8tToAU4OR9H
	06s5dLq3S3826SHP8k53hfasyJLnHdFFZ+akMJ/ngg7bGcpuaNqH7W5HgOGmvoE4
	Z6OvYCoukTgaiDWeA7ZUi1mXMusqXSREpwIwT2h1Pg93KKWqPWOhyUj9i05Ps3s2
	tHGEI7ZaaWI0ccJnILAEW18kPSSkHsMOksWMnp5C3lfE+Y/1RUbTGAAD3NmdkgYP
	T08qFnPDq7lJmwlplrRmkpcMe8xj1e1ob0OLwpq5KPwtythqcxOtRzylsx5p5U4K
	u1ivnMlQgNWYvgnCixvXA==
X-ME-Sender: <xms:lHjZZlQQ2Qw3yVmlRqsbAFDjpai9VPp69EbjE71ej2RDlSQapf0pGg>
    <xme:lHjZZuyHfapqOLfVsJkivhV8EB6ik-GlVcrqSeoSaowd6IEB6oAKO7xzqe3L2ycz6
    Z9-QT78PIbG8aS9c3E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehledgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepkedvuefhiedtueeijeevtdeiieejfeelvefffeel
    keeiteejffdvkefgteeuhffgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghr
    nhgusgdruggvpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdprhgtphhtthho
    pehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtth
    hopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthht
    oheplhhkphesihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvg
    hrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhn
    uhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtohepqh
    hirghnghdriihhrghosehngihprdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
    vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:lHjZZq0_gUxdYs52_lYFfs3Gcxe_laL-EPCwRgcl5860KAfu4aUH8g>
    <xmx:lHjZZtD2nLCV2YRN4VsCWKoFP28K-xSwNB1y5UG9WINURKSJo5OySA>
    <xmx:lHjZZui6l1yvfHJMIJpoeezgW0M48_GP4OGXTmsByBywf97izulwBw>
    <xmx:lHjZZhqhTb3ztlLlAaU5MQciyiTve5aBAPO2hIR1dDi8M7J60cY-nQ>
    <xmx:lHjZZijlSE6Ptrs17NVCvIjDgdPUK0t3wyiXfewthpeyB9d73kfRJNpq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2A2312220071; Thu,  5 Sep 2024 05:23:32 -0400 (EDT)
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
Date: Thu, 05 Sep 2024 09:23:10 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Herve Codina" <herve.codina@bootlin.com>, "Qiang Zhao" <qiang.zhao@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "kernel test robot" <lkp@intel.com>
Message-Id: <24dd3479-6fef-43ec-bcec-e70474128e53@app.fastmail.com>
In-Reply-To: <7091c023-c7e6-4b3a-b306-12d73b8f6698@csgroup.eu>
References: <20240905072215.337010-1-herve.codina@bootlin.com>
 <7091c023-c7e6-4b3a-b306-12d73b8f6698@csgroup.eu>
Subject: Re: [PATCH] soc: fsl: qe: ucc: Export ucc_mux_set_grant_tsa_bkpt
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024, at 07:31, Christophe Leroy wrote:
> Le 05/09/2024 =C3=A0 09:22, Herve Codina a =C3=A9crit=C2=A0:
>> When TSA is compiled as module the following error is reported:
>>    "ucc_mux_set_grant_tsa_bkpt" [drivers/soc/fsl/qe/tsa.ko] undefined!
>>=20
>> Indeed, the ucc_mux_set_grant_tsa_bkpt symbol is not exported.
>>=20
>> Simply export ucc_mux_set_grant_tsa_bkpt.
>>=20
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202409051409.fszn8rEo-l=
kp@intel.com/
>> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>
> Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>
> Arnd, it is ok for you to take this patch directly ?

I've applied this one directly, but I'm not always paying attention
to patches flying by, so if you have more fixes like this in the future,
I recommend that you forward those to soc@kernel.org, either as a patch
or a pull request.

That way, I see them in patchwork and will apply them from there.

      Arnd

