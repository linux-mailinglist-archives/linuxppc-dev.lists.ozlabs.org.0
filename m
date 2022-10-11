Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B855FBBD9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 22:08:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mn6Kp4N6Rz3c6t
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 07:08:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=WQWu3yDN;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=SQJzbtjQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.221; helo=new1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=WQWu3yDN;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=SQJzbtjQ;
	dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com [66.111.4.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mn6Jm5y0zz2yJQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 07:07:36 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id BA2C8580239;
	Tue, 11 Oct 2022 16:07:31 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Tue, 11 Oct 2022 16:07:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1665518851; x=1665522451; bh=um2kBSc4fu
	GBRT434hncIVZ64/uah/pZfbhnafj95ns=; b=WQWu3yDNnUqa2FAN4MYtOukyO+
	dBiPjKEYbx8TFnJREMsUl/udRznKQqGylzpGvkEffAfCF8+/LMcPvkyEVW3GGtPr
	ORb+Zm4Ji3Vp5SQGtgk3eQN7uQHljXXf9ruU1wxonfJ8ZxocKodJKyPuM0D7zpRn
	QldWI8AwJt+konS/mFaDpnu+sjyFHBrbLWUL/8tmLYDsq6ZcTycU6tBG7V3v4VGO
	UzXDsiCSkGtSdsku5VHS1Z8AL2Jb+ROITHA8qzFEtX7Uh9szSkn1dmrgEKgQQDr3
	U8kmUKI6edPV5XMd8KlNUhS6Ah65NWxp+ubtVGl8b6pYEHeXFIIfr7Qu06xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1665518851; x=1665522451; bh=um2kBSc4fuGBRT434hncIVZ64/ua
	h/pZfbhnafj95ns=; b=SQJzbtjQqQwA3PLusDVzHkJbIQWYIRbdWYAE3lHJKg1q
	PmiXLdw8vT0+LOnIRC0n7Urb2apIPZuE7SvWkkdVmaQDPuNLOWcqoi2cNEJmXrkl
	vy8Hx13pSKqTGHnMH1Yepc2dm4GsfKhQX3ngcYJBfmj+WTfJUjrcSjQpnIJAiSO9
	QEo/l59ZoOT4t3GFeaGOdMVJ1UsSJ+H/L+b1h1hA8DsOnreqdaKyeP0RYi+0GgOA
	Td5stvLc08UOswqEo0toBj13EP8w0yI72vVhbY2wnVzO5D37yFUqHgKN5MPH0g4v
	4RzQxRdsFqASqGAzPbCobu0oj/hnH/tBSJo6QATexQ==
X-ME-Sender: <xms:As1FYxjK6I7ewi3QEY9-BBBYve5OISsIRk5i-xZJeBYDzH5YDFCoow>
    <xme:As1FY2C4xWTIcB05N3fLqrcwFMUQNVIJvpmcQ1Ih8ssj6s2ilZ6WsPR_c_KUYKvWL
    sA2TkUHuA4QY-gQzVk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejiedgudegudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:As1FYxEZtrs6Zcz-3koLRwmQEW0MARlW3kFyW_FeMBlJXIh-16os7g>
    <xmx:As1FY2RenaWgiIBf00rj4kQpPTMRLWtGFvFOfS6TVrV0OGkprOLlAA>
    <xmx:As1FY-zMQt8iSY7szrMkkpjbvF9lXC4Ddz67g5ViY42AX5eLI3ertA>
    <xmx:A81FYygRPU-kxIGoskES2SF5tSJ51UaBu7psO9Z7X8Mq4k9TBn4PNA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 97747B60086; Tue, 11 Oct 2022 16:07:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
In-Reply-To: <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
 <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
 <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
Date: Tue, 11 Oct 2022 22:06:59 +0200
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

On Tue, Oct 11, 2022, at 1:30 PM, Thomas Zimmermann wrote:
> Am 11.10.22 um 09:46 schrieb Javier Martinez Canillas:
>>> +static bool display_get_big_endian_of(struct drm_device *dev, struct device_node *of_node)
>>> +{
>>> +	bool big_endian;
>>> +
>>> +#ifdef __BIG_ENDIAN
>>> +	big_endian = true;
>>> +	if (of_get_property(of_node, "little-endian", NULL))
>>> +		big_endian = false;
>>> +#else
>>> +	big_endian = false;
>>> +	if (of_get_property(of_node, "big-endian", NULL))
>>> +		big_endian = true;
>>> +#endif
>>> +
>>> +	return big_endian;
>>> +}
>>> +
>> 
>> Ah, I see. The heuristic then is whether the build is BE or LE or if the Device
>> Tree has an explicit node defining the endianess. The patch looks good to me:
>
> Yes. I took this test from offb.

Has the driver been tested with little-endian kernels though? While
ppc32 kernels are always BE, you can build kernels as either big-endian
or little-endian for most (modern) powerpc64 and arm/arm64 hardware,
and I don't see why that should change the defaults of the driver
when describing the same framebuffer hardware.

I could understand having a default to e.g. big-endian on all powerpc and
a default for little-endian on all arm, but having it tied to the
way the kernel is built seems wrong, and doesn't make sense in a
DT binding either.

      Arnd
