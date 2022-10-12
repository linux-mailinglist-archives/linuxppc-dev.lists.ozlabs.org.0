Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFABE5FC161
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 09:46:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnPpg56qMz3c2s
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 18:46:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=ESKrS8/c;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Jcr3VMp5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=ESKrS8/c;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Jcr3VMp5;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnPnf1nx6z2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 18:45:09 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 808A43200936;
	Wed, 12 Oct 2022 03:45:01 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 12 Oct 2022 03:45:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1665560701; x=1665647101; bh=7YAQuizW1H
	09X/Vy78bUOvfH4cmFBBJBnKdNJKbi+rc=; b=ESKrS8/ccbuz9mwVUC+zMk4GNA
	22fuf8RHLpCplxs5b1w2q36jCntK/WWIwxEBnjHEPHyFvyFGMAilbX/hGJ/qpimU
	/y+fh0scVKseSeC2jsdK9V76JumFLhbezVqaZGXsDbVzRqdVOsI7Q+iQSaFCJBX2
	AykWBgg6mT3MDF8K22vDnprgDyaDaPJDJwBLg/KYELA/uD2K0USXuPqefwctsaww
	sXoPtVs7pMJay71/ylHFhhax7byXOlgHDs+Kur40A87uNzt+blm3va+BB7UCun/k
	tLhTrIkv+w2ij4uoq5LXyYYve4jK3tkJznODx1qJvAraT88atGsy4cDTwXBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1665560701; x=1665647101; bh=7YAQuizW1H09X/Vy78bUOvfH4cmF
	BBJBnKdNJKbi+rc=; b=Jcr3VMp5JzsrkN+epBnjEVUHCDdAKKUgH225CYICaXEA
	6zIuzpIqfv2gzFn9th41YShF4vXBD7EmcMa7uyXj8DbwzOTqaLSC3yiR7WZ8NUS8
	CiERUU+ZaFAjDjGDFDAMWu8kFldBI0uvh053YqX640v/xHW9C90KSGW8GHZbCva3
	yHtzW7LqpwYt7JpFdBAspa4ZwkRoqRfXsKt2kWH3Fe3+LXYfYiTIQgRKx9Abb7k9
	OQJdqmouFmm6l4Bp5+G+JoEs8xhE8ho9uub85O6yyRZ2zhifm3f1Jwt8ZyZvbPas
	74e3bEoVjjNrIA+ssLw/JQuvJikmVrKmoJ8v6YO9kg==
X-ME-Sender: <xms:fHBGY1xcV-qP-BULFIaViUw7ZOmRox1EfSTkTg35kHop6JXNekX6bg>
    <xme:fHBGY1QX83hsR2nGVpNCHsbyeaJK3n6d6QPLG7_Z8yKjRvwhRbA7wylZymskoy2j7
    9HNYbeaURGIMIvDLjY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejjedguddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:fHBGY_W-RjfRpCSNPmrRkYm2o4glaUtE9JGUc2zoZ7TDPWmF0EHtAA>
    <xmx:fHBGY3jYbt3UrphUhoSxas6T2Gqc8p1A7TOUGptVUT4g0n_T70ZvYA>
    <xmx:fHBGY3C_kbkdTelWUeEv7Zcd911XrCTvJ05K9D1jqE3iZ335Brdgvg>
    <xmx:fXBGY3wVpFALp17mMMn9iZAqiJpYE-zmSpSp3bpIKGIkLFk-l-j57w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 90177B60086; Wed, 12 Oct 2022 03:45:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <f26ca6a1-feb1-4822-ac96-bc484b22f8a0@app.fastmail.com>
In-Reply-To: <866c7033-0d4e-7b5d-008c-8eb16f99498b@suse.de>
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
 <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
 <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
 <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
 <fda959d7-1bae-716f-f01b-66d9db9096e0@suse.de>
 <654e3cfe-80d7-46c9-8e5e-461846e4df35@app.fastmail.com>
 <866c7033-0d4e-7b5d-008c-8eb16f99498b@suse.de>
Date: Wed, 12 Oct 2022 09:44:39 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "David Airlie" <airlied@linux.ie>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Helge Deller" <deller@gmx.de>, maxime@cerno.tech, sam@ravnborg.org,
 "Michal Suchanek" <msuchanek@suse.de>,
 "Michael Ellerman" <mpe@ellerman.id.au>, benh@kernel.crashing.org,
 "Paul Mackerras" <paulus@samba.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>, mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 12, 2022, at 9:40 AM, Thomas Zimmermann wrote:
> Am 12.10.22 um 09:17 schrieb Arnd Bergmann:
>> On Wed, Oct 12, 2022, at 8:46 AM, Thomas Zimmermann wrote:
>
>> Does qemu mark the device has having a particular endianess then, or
>> does it switch the layout of the framebuffer to match what the CPU
>> does?
>
> The latter. On neither architecture does qemu expose this flag. The 
> default endianess corresponds to the host.

"host" as in the machine that qemu runs on, or the machine that is
being emulated? I suppose it would be broken either way, but in the
latter case, we could get away with detecting that the machine is
running under qemu.

    Arnd
