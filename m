Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D46385DC71
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 14:53:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=qncFkFv7;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=AbOLWOz/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfyRS0PGXz3dVR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 00:53:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=qncFkFv7;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=AbOLWOz/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfyQc4h4Vz2xHK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 00:52:55 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id DA7365C006D;
	Wed, 21 Feb 2024 08:52:50 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 21 Feb 2024 08:52:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1708523570;
	 x=1708609970; bh=Fv8kuaoza9YOxN8E6T3xT5ybKEYe2If0/PtQZaqhls0=; b=
	qncFkFv7ETvjKcESrtavSqlH8Tf+3LAaBrjA1uzsklwIASXX/c1esyC31T1IFopl
	qbqZCvKxuDv0tpex9rautEhrSajiNQ1LYzwb425bUZ0uCQ9IkKgAqRcleL7W3Gvb
	J79Y5toy+NfiZ1BPQlzoWpcd8oNA4GiHm7riKMHsPuS8K9BKsEl3Ouw87n3uo3+s
	G/pb6ClCPRbNesxdAuxoooB5QP7VN/MGYATPOsLZgbHwyUzlh6t7cvN1CVB6bOst
	y+TjHH97qwla56bNSgHN9bhUOJQT9WlAin1XXGHlZVCNKjnlUeQFnPMiiT+g4V9J
	JjwNHdDCrlvbq6+oPxGVaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1708523570; x=
	1708609970; bh=Fv8kuaoza9YOxN8E6T3xT5ybKEYe2If0/PtQZaqhls0=; b=A
	bOLWOz/VPER9zHZyg+eUyR4mscAN4boRgccGe0TBxUO8HrP5kwyW74UjHP6G248W
	PFDU7DfdQY3tll5lBCN/4+Dnno5f1RfggzA/6l0Hfo8Hf19nOeqW3Z3wbMSMDyVQ
	9OkYF1fti9Z/PzATKtYtZRtjr3ACGbxfxMjI39TB56N7z3G3CGWP2zUNgXHA8JZ5
	dCXFv8B9gNEuu2Hpev42+ldkmX6MmwjbrQJpHc2AyXpoh86Hvga74ihTS9c4kJCA
	rd0SmvDTvoC3gGT6+d0/D9Xc0UhvTv0OY6KRWDMxTAxof5lZOGgxFveWZ16QqhmF
	ZyFhuV7IhcIKF4s/R4f8A==
X-ME-Sender: <xms:MgDWZQfR5BNm678P3PLqS1SqEstXMQrpRw-jpfDzDcyGHFA0AkQn3Q>
    <xme:MgDWZSNmoxj7K5-Yu-LkOzbXlqngLLoxbkGgaZZuvnT3N55kuwIMaaG5-HiGK2qly
    S02pZeogiN-Vyvwb8Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvgdehjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:MgDWZRhH-sTKPdtaQ6Mc8ClwL8DfOjzDFRGPdW_1dbbA1gX1yzZylg>
    <xmx:MgDWZV9Bc1kwqifJ_TguKAr6DhGpm0-ECx-Xbxc_4Hkud_NV2GuHHA>
    <xmx:MgDWZcvzpYRsIq_i1a9RxvyriULbMmv5ADZZ4I_6lS28GSWobCybOg>
    <xmx:MgDWZdMnxMV2Zg6pTtR-mMX79CjzwddXh0BwJAdvl5BIzDbErqhk9g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7FD5DB6008D; Wed, 21 Feb 2024 08:52:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-153-g7e3bb84806-fm-20240215.007-g7e3bb848
MIME-Version: 1.0
Message-Id: <d6c4ff9e-756a-4604-993a-cf14cfdbc53c@app.fastmail.com>
In-Reply-To: <cover.1708508896.git.u.kleine-koenig@pengutronix.de>
References: <cover.1708508896.git.u.kleine-koenig@pengutronix.de>
Date: Wed, 21 Feb 2024 14:52:29 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 00/11] misc: Convert to platform remove callback returning void
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, "derek.kiernan@amd.com" <derek.kiernan@amd.com>, Kees Cook <keescook@chromium.org>, linux-arm-msm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, John Stultz <jstultz@google.com>, Michal Simek <michal.simek@amd.com>, "dragan.cvetic@amd.com" <dragan.cvetic@amd.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Justin Stitt <justinstitt@google.com>, Frederic Barrat <fbarrat@linux.ibm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Tomas Winkler <tomas.winkler@intel.com>, Amol Maheshwari <amahesh@qti.qualcomm.com>, Jiri Slaby <jirislaby@kernel.org>, Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>, linux-arm-kernel@lists.infradead.org, Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 21, 2024, at 10:53, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>
> this series converts all drivers below drivers/misc to struct
> platform_driver::remove_new(). See commit 5c5a7680e67b ("platform:
> Provide a remove callback that returns no value") for an extended
> explanation and the eventual goal.
>
> All conversations are trivial, because their .remove() callbacks
> returned zero unconditionally.
>
> There are no interdependencies between these patches, so they could be
> picked up individually. But I'd hope that Greg or Arnd picks them up a=
ll
> together.

These all look good to me, whole series

Acked-by: Arnd Bergmann <arnd@arndb.de>
