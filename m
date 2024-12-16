Return-Path: <linuxppc-dev+bounces-4148-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AFB9F2DEC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 11:13:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBbPM0mL7z2yDT;
	Mon, 16 Dec 2024 21:13:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734344007;
	cv=none; b=g5xB+vYOnJLPWD/hZPVpLTI4stfCz1VUjVsMpm8CK8mqpn8knqLNRL43nVQtO4DSPZqRr8kJha88JSO8X1hJUW20ZteUpRCeOvx/4ZJ3A/dbASQ4WNoropxH8QWb7t+vkw+79RYnzy+/0xHg0h1EaRUw7JXZGyu6d9mJeF+y+3NRynYxr5glFOcOHtJDidGFSfInBfKQFMkn4ENCFz9+KwPMwVjmXwx3SZT8+m7HvTTBd7KFsZ3Bc+SdrohTKgMqipBX+h4RpHbCjF7A+8eMhNpzwDdTXt+ZqZIOKFjMW8EYJTDrW9xDXKw71PDs/bI/nqMNQXyfc8e9QsmaH8oIiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734344007; c=relaxed/relaxed;
	bh=wivUGdcXYn6VwelfaLekmpNak5Bcy3xhV06KWiQzClA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=geB7iBreHTzLHsYjU5Up7T+0grXg51cZbjqpZ9BVpVoHMH7c0XVyKYw81HGO8OFprzCr4+H1NmKW7mEH8iOXXJn5UUTAoLOdFKiRrG5kkWD8kDhfsEZNh4Tyz7U6PEZ8qtLWInJHK1/lYOaEDl7XkDPoSGEgSq1Hpfz22Tk8zTlP9SqxgpQUzIbnndJAT115EFxlIkRQouilsnwFSX8Gk1TBw+WQIMr/elxN79OB8sQBusff831Qa4tlXPz2AgCKVUyYLhaowmQBPXblc6bQLaTJjaR0rY7aoE95oPEnG0SAKLkUsZPGIskjC1sTC13k2xM2qQkpDiTRgZR/2t9Imw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=E4Wy5Iut; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=qDCud6QC; dkim-atps=neutral; spf=pass (client-ip=103.168.172.149; helo=fout-a6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=E4Wy5Iut;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=qDCud6QC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.149; helo=fout-a6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBbPF71r4z2xks
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 21:13:21 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 26BA91383AB0;
	Mon, 16 Dec 2024 05:13:18 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 16 Dec 2024 05:13:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734343998;
	 x=1734430398; bh=wivUGdcXYn6VwelfaLekmpNak5Bcy3xhV06KWiQzClA=; b=
	E4Wy5IutbDxBHk8+mFIuN+1AMbV4u7yWjqcjs/ohVZLVVAHXszEUEfWI3EsvKgD4
	uGHO1ky7A2JnKY2b5V/o9gedVq3mfvmB0O8n/hZ9Zdp6sjQsjJ0Ss/M3xVECN9Y2
	285OVJ2qtUIguSLeU1h+ZUU/0jzDa2LhbSBGEWhfrYt//H/yqE4YoxhEepgVE6Te
	gNB7/czcXQQcRG1Vxod/itgte84EX/Q50lRxM6pbOhkBoOGrrtMn61f5hcZb2CT/
	pxYTDGtgm6ItwrkMC6ymMSxThAJ8e9LXE6jI2YFP6qlw9dU2yn4dzM10/fS9bSAM
	kdE7SyinUJAW3+lsJ47EdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734343998; x=
	1734430398; bh=wivUGdcXYn6VwelfaLekmpNak5Bcy3xhV06KWiQzClA=; b=q
	DCud6QCp0V1iCaJmCs2gPw/rtFX7/5LQjHdNzXb950CIQJV2tBHWlSTERH+wu5mU
	OcvaV78TQd0hdsZM555o6WkvKoVqP/ThqsQ5QxDAJmiS0GiDXkPrQmva0u9BYBWJ
	hOP9ulZksMG4v43kVrklzDxoEllOTLJFKOdL3SFyLL0UqZBJ4WK/qYX+i9w0oZRf
	Q+cO07omolM2Kd2chyN+Seph2Kh1dWLA1dU+ybfR9BhQjBUEF2I4IQk8ysq+CHQP
	KXMuytkmU+Fs8vuZprFplJNUjlBIZLud0IFNOTjYeMd58fGjiSlvdG3w25P2Wih6
	Ak7fL31c0qlMcGiu8+1LA==
X-ME-Sender: <xms:Pf1fZwQL3IFh4yAdP0IZXTOYWupixVQKRIR2VXACtF0FIwMKs2bbnw>
    <xme:Pf1fZ9xkPOTDIun49Y_r06EpTBwZraZgBdfcPadFOjHKiCOZrw5Mvrr9hLtoeI0-O
    qduH0dY9WYQkb8KUtk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleefgddufecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffg
    vedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduuddp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghroh
    ihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghh
    pdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopeguvg
    hllhgvrhesghhmgidruggvpdhrtghpthhtohepjhgrnhhirdhnihhkuhhlrgeslhhinhhu
    gidrihhnthgvlhdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrd
    hfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheplhhinhhugidqshhtrghgihhn
    gheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigphhptgdqug
    gvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtohepjhgrvhhivghrmhes
    rhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:Pf1fZ93xhCqySX7gHNrptVHxhMGCe3rk4EOLDa7frWmCUGYK_WrnNQ>
    <xmx:Pf1fZ0D1hm5-bVL5XAY4NjKbP6tXldx00oItEU-lMwIamAYLcIOwQw>
    <xmx:Pf1fZ5iwESOtKK7P3N9JqntnJqIadOwfNE_dBBE1NGPtU5ub9ty3eA>
    <xmx:Pf1fZwpdN_CUM20AQx7drnZuBhUmFQoV_uy_M_QXfCL0YxMag_ob-g>
    <xmx:Pv1fZ-aYJaDSAZC-h4tgh1CAopr3btq1o-_2Lt81K2X-t6HIex-fugaU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 52B3A2220072; Mon, 16 Dec 2024 05:13:17 -0500 (EST)
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
Date: Mon, 16 Dec 2024 11:12:32 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Helge Deller" <deller@gmx.de>, "Jani Nikula" <jani.nikula@linux.intel.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Simona Vetter" <simona@ffwll.ch>, "Dave Airlie" <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Message-Id: <1dcda6ee-dc0f-4d2e-b234-6f03b5637d01@app.fastmail.com>
In-Reply-To: <20241216074450.8590-1-tzimmermann@suse.de>
References: <20241216074450.8590-1-tzimmermann@suse.de>
Subject: Re: [PATCH v3 0/3] drm,fbdev: Fix module dependencies
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Dec 16, 2024, at 08:42, Thomas Zimmermann wrote:
> Fix the dependencies among the various graphics modules.
>
> Before addressing the FB_CORE issue, patch 1 first resolves a problem
> with BACKLIGHT_CLASS_DEVICE. A number of fbdev drivers select it, which
> results in a recursive-dependency error after patch has been applied.
> Making these drivers (or parts of them) depend on BACKLIGHT_CLASS_DEVICE
> fixes this.
>
> Patch 2 selects FB_CORE for DRM_GEM_DMA_HELPER and DRM_TTM_HELPER.
> This is necessary with the recently added DRM client library.
>
> Patch 3 is the second half of the patch provided by Arnd at [1]. It
> could not yet be merged because of the issues fixed by patch 1.
>
> Side note: For the majority of graphics drivers, backlight functionality
> depends on BACKLIGHT_CLASS_DEVICE. In a few cases drivers select the
> Kconfig token automatically. These drivers should be updated to depend
> on the token as well, such that backlight functionality is fully user-
> controlled.
>
> v3:
> - Fix PMAC_BACKLIGHT case (Christophe)
> v2:

The patches look good to me. I've had a slightly different version
in my randconfig test tree and have replaced it with yours now
to do some more regression testing, but I expect this to be fine.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

