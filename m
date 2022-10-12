Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FECA5FC0AC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 08:31:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnN8G423Dz3bjk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 17:31:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=q2bFs2qh;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=o+fiUITg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=q2bFs2qh;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=o+fiUITg;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnN726tThz2xf4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 17:30:05 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 8F20832008FA
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 02:30:01 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 12 Oct 2022 02:30:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1665556201; x=
	1665642601; bh=QPRhzHT6CpkW+mTz/HRAhL6Bosjy1+aav22p09t2HHE=; b=q
	2bFs2qhZQhK3geDOmmK9ePVe2kfWpKfOieD4SAOfME0teyMEZC9Exbys5S3fARA1
	TM5hog8VrrGu10j+wPFM7SNYLYYE+jA8ngGBuhRZYJQtK97ZU05OPTmpPSYKl3Kx
	xDvgU78gvnwbZoEuP6t/gtBtUEwcvR5Umih7O62fefAKLhAB3oVt6sgQvuhNOSUH
	fks0f57FQicQyfabZm2NNROCASb0Uw+4JaiFLPpTWRaxSxQ16dA4NqlXks2SuDJm
	2NrdPdazFjTwUrHuhI2/2m+lRJUQMuhTfNBB1liTwKAw8mJAgo1x2IXi/p/N0hBg
	rf4XtLof4pQW5HizdxcxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1665556201; x=1665642601; bh=Q
	PRhzHT6CpkW+mTz/HRAhL6Bosjy1+aav22p09t2HHE=; b=o+fiUITgZZKYNrywa
	Nh8tNxu05R9YK/j466yRW3a8/ywJcqed6CpzYWM/OA4OktoLcb7/Vwy/xo3uG/hl
	LGdCTZs4XBaPgo7YufjKtkDSONip3sU8DhYOoO5lMAMS63DnLJ0GLz0/wS6u+/RD
	LumqB39Mkb/ZJKwsdRd5+fZqIIGLO0bvD1urnRpvRffdAnfNPtO+ahqszziemZ6G
	223KMHvweoXrBqID4lQ5rADdpvzYQAZ3UOqlctRxIZkmDcC5vzruC8++5fYHUEgo
	oroa9UEjiFd7Bfehp+TBo12GGFSznj5WpxU8bCtoKpy2MVXamhaxae1XFeHCjujA
	conew==
X-ME-Sender: <xms:6F5GY3niDG4mmTZaccseu1j3E4z79ObU0Ncc3OQ7k8LVvnhTaF7iqg>
    <xme:6F5GY60_d2zWshc4dcavN7MrVs8ayBvfKGI4fyWbFBxDWRfpqUL6Xf1Uvrxe6vbfY
    1fmErHiWxSJ7wxKd3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejjedguddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgfgse
    htqhertderreejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgu
    segrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnheptedtjeehtdelheeileejveetle
    dvhffgueffffegkedutedvgfevffegvddvgfeinecuffhomhgrihhnpeguvghvihgtvght
    rhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:6V5GY9ri1wKKusRis2CZxwUzOTYJ2mLMdMqWvYvtBgChJk2irOs2og>
    <xmx:6V5GY_nelp1YWuehvUse2H-LH-01tvIDmdykdAfr5SNCnmYVDbP4FQ>
    <xmx:6V5GY11qYF3rCT2rUsOM5Cn8ULA7LK8VoOZt-JJPfr9qdaFsxvEqyw>
    <xmx:6V5GY2DDH5-UJ_5F7JgsJTUlg0D7yWyVrjfYulLCt5s2k3eFYOFofA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id EC6BEB60086; Wed, 12 Oct 2022 02:30:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <87fbe7bd-1160-420e-984b-5afccd5d523c@app.fastmail.com>
In-Reply-To: <20221011213841.GA28810@kitsune.suse.cz>
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
 <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
 <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
 <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
 <20221011213841.GA28810@kitsune.suse.cz>
Date: Wed, 12 Oct 2022 08:29:39 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 11, 2022, at 11:38 PM, Michal Such=C3=A1nek wrote:
> On Tue, Oct 11, 2022 at 10:06:59PM +0200, Arnd Bergmann wrote:
>> On Tue, Oct 11, 2022, at 1:30 PM, Thomas Zimmermann wrote:
>> > Am 11.10.22 um 09:46 schrieb Javier Martinez Canillas:
>> >>> +static bool display_get_big_endian_of(struct drm_device *dev, st=
ruct device_node *of_node)
>> >>> +{
>> >>> +	bool big_endian;
>> >>> +
>> >>> +#ifdef __BIG_ENDIAN
>> >>> +	big_endian =3D true;
>> >>> +	if (of_get_property(of_node, "little-endian", NULL))
>> >>> +		big_endian =3D false;
>> >>> +#else
>> >>> +	big_endian =3D false;
>> >>> +	if (of_get_property(of_node, "big-endian", NULL))
>> >>> +		big_endian =3D true;
>> >>> +#endif
>> >>> +
>> >>> +	return big_endian;
>> >>> +}
>> >>> +
>> >>=20
>> >> Ah, I see. The heuristic then is whether the build is BE or LE or =
if the Device
>> >> Tree has an explicit node defining the endianess. The patch looks =
good to me:
>> >
>> > Yes. I took this test from offb.
>>=20
>> Has the driver been tested with little-endian kernels though? While
>> ppc32 kernels are always BE, you can build kernels as either big-endi=
an
>> or little-endian for most (modern) powerpc64 and arm/arm64 hardware,
>> and I don't see why that should change the defaults of the driver
>> when describing the same framebuffer hardware.
>
> The original code was added with
> commit 7f29b87a7779 ("powerpc: offb: add support for foreign endiannes=
s")
>
> The hardware is either big-endian or runtime-switchable-endian.

Are you referring to CPU hardware or framebuffer hardware here?

> It makes
> sense to assume big-endian when runnig big-endian and the DT does not
> specify endian which is likely on a historical system.

Agreed, assuming big-endian here clearly makes sense.

> It also makes sense to assume that on system with
> runtime-switchable-endian the DT specifies the framebuffer endian.
>
> If systems that only do little-endian exist or emerge later then it al=
so
> makes sense to assume that the framebuffer matches the host if not
> specified.
>
> I don't really see a problem here.
>
> BTW is this used on arm and on what platform?

I'm not aware of any users on Arm, most likely they all use
simplefb/simpledrm or a gpu specific binding. There might be
users on sparc, but they would obviously be big-endian
as well.

> I do not see any bindings in dts.

Right, that is the real problem I see as well. I found the original
CHRP binding document at
https://www.devicetree.org/open-firmware/bindings/devices/html/lfb-1_0d.=
html

Unfortunately, this only specifies an 8-bit-per-pixel mode, and the
multi-byte pixel support that was added in linux-2.1.125 was
probably powermac specific without a public specification.

I think ideally we should add a binding document that describes what
the driver actually expects, but in this case I would just drop the
#ifdef check and always assume the framebuffer is big-endian unless
the "little-endian" property is set, in order to have a sensible
definition that does not depend on what OS (i.e. Linux
CONFIG_CPU_BIG_ENDIAN) you are running.

       Arnd
