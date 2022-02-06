Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7984AAF48
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Feb 2022 13:52:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Js8LD6Wkgz3cGW
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Feb 2022 23:52:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm3 header.b=I92EMCIj;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=V59r16Dg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=svenpeter.dev (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev
 header.a=rsa-sha256 header.s=fm3 header.b=I92EMCIj; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=V59r16Dg; 
 dkim-atps=neutral
X-Greylist: delayed 286 seconds by postgrey-1.36 at boromir;
 Sun, 06 Feb 2022 23:51:24 AEDT
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Js8KS1mnTz2xWd
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Feb 2022 23:51:23 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3F17D5C0097;
 Sun,  6 Feb 2022 07:46:33 -0500 (EST)
Received: from imap47 ([10.202.2.97])
 by compute2.internal (MEProxy); Sun, 06 Feb 2022 07:46:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=iB7sQB+HR0zZzq
 fqF6V/y4fSMD6WHmU40dKjddl6GWE=; b=I92EMCIjV/ulOM0Ysw2hT9bxeM9C+P
 whZNjdbpwDr0ubWQdPxXmEcci/B9zaRTfWQ7URdNgDMFqCWFf6VUsXAgnmKArCil
 S3X3326BFnC5zztGrbdSVZKKGPXjVW69A+OzySTi5CA1Uin5bMwrABb9YiXR5OuN
 hNG8cTe4/x9uD8kddmNmG6oq7c8JztS89SQa1ZDdYas9guXH5HF9MUaYhMB0Dmi9
 hagd9muQ9IET4pCO9rqPCe/L+T7Q5U6+kL63C5OZLCJFYnzS9jQvs82EIAPvO1hk
 S4qVf447/wEPpHHvtXT+qJKb7wK+lxNPqd8BnTX5rn6aPtYv3DfkJGtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=iB7sQB+HR0zZzqfqF6V/y4fSMD6WHmU40dKjddl6G
 WE=; b=V59r16DgpWDZ44/2A7kbi4VnOsPkt7HUDaS39bgRubVLEbEYkdYi6XYGS
 Fajq0bPHwbJx2514fmASN9PtrYLhuo/NEQGfdUGyEAr9tXKStg0J+/eGcx0DbyF9
 SssZFjfyYNDqQjagKNDRQDR577UyDKzw8t2VvKnU2M2efzeHz5e3voRGTDp814sz
 vGMwpdpPbxzyHHvBgnx/hWPCPYkbBN+hjeHEFn5u4hGZ7xLeKVh6dM6b5ca2EIKt
 0cG4FVmuGnz9L38glCTe3RdSlp5JTPuZwnEExTVRWqGD4YKypGGr/o37tvi5jILz
 EpUxv1ECsYme7G/fs7Eqh86/S6mNA==
X-ME-Sender: <xms:J8P_YVFsbJ-8QGmGDFK8DTbKZnjhbPsTwsCYNnc4YjpI_KXOK31B5g>
 <xme:J8P_YaUAHauvKZxtrMzemzuR50PO9Kbza9l2hVH0aJCuFl_fUp2SIXhr55WUvMoyE
 zVWS6CMVg1YZphpMXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheefgdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdfuvhgv
 nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
 htthgvrhhnpeetueduleetfeeuledvleehheeivedvhfekheejjeduhfeileffffduhfek
 ieelgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:J8P_YXLcaY8FaUrBmdHMu8YmFjmf0yX6dbYBXWHA6Yfgm-EkEXUMPw>
 <xmx:J8P_YbG0HIbcj0W06pdJ4yUpMx1pNqijn03AfzxgCQfRRGv_4hmzvg>
 <xmx:J8P_YbW5_zFtSvppx5JAuExh8gtEbG-gqUBXzzV0Or63Aky1VoGcqg>
 <xmx:KcP_YdKHgXP_rVLQsIsbcD9QtjuQyDGJqJ3YmEA_H2P9aMzhNjOzlA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C147827402BF; Sun,  6 Feb 2022 07:46:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4586-g104bd556f9-fm-20220203.002-g104bd556
Mime-Version: 1.0
Message-Id: <6b3ece8e-bba8-425c-91e6-e8b35abbf715@www.fastmail.com>
In-Reply-To: <20220204095914.5678-1-povik+lin@cutebit.org>
References: <20220204095914.5678-1-povik+lin@cutebit.org>
Date: Sun, 06 Feb 2022 13:46:11 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [PATCH v2] i2c: pasemi: Drop I2C classes from platform driver
 variant
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
Cc: Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 4, 2022, at 10:59, Martin Povi=C5=A1er wrote:
> Drop I2C device-probing classes from platform variant of the PASemi
> controller as it is only used on platforms where I2C devices should
> be instantiated in devicetree. (The I2C_CLASS_DEPRECATED flag is not
> raised as up to this point no devices relied on the old behavior.)
>
> Fixes: d88ae2932df0 ("i2c: pasemi: Add Apple platform driver")
> Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>

Reviewed-by: Sven Peter <sven@svenpeter.dev>

