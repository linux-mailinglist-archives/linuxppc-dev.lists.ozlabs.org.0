Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D406F9EC3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 06:44:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QF7wk365tz3cdt
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 14:44:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=bSxxwkgd;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DfJeDKyG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=bSxxwkgd;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DfJeDKyG;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QF7vr11sXz30QS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 14:43:20 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id EAC0D32008FF;
	Mon,  8 May 2023 00:43:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 08 May 2023 00:43:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1683520997; x=1683607397; bh=pTwiCz0L7N8vBkhze0ydkXnjXvcRcy/h42B
	GrR7pLBQ=; b=bSxxwkgd2xK8UK3Acdiwv3ruTbfEIRneKOrmhztnoPG1cKMa4WX
	0cERtbPETYnfJqgLg48YXn22obgmHH/WRT7r5KfGAOWnaHvaw3V7TtN/TJlZ+E4y
	0HuT1VWBphckJThSaWr55t1M2fxrXDcv3P1x3P8CBLvbU6Kee7Hy7oNnarml4mkR
	+3FAyw3yp084HioPrljIb0upgA5LFQO4Pd0ViWu8Q3iEvO0ZqwbpsrzwL8ZraDhF
	124ZnmCGIAf6Lp0+U2Il14rI2I+7KoIyxmXi1b8+mZ6F7PO1VHNqx5CYxCWloPAt
	jQtB+le33lgabUVIav11rwNytCSUstmkCCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1683520997; x=1683607397; bh=pTwiCz0L7N8vBkhze0ydkXnjXvcRcy/h42B
	GrR7pLBQ=; b=DfJeDKyGj4GuL9z6Wdjn944kgcyFfgEUJiK4vxYJpYiqyl2GKeK
	Y7PbwcV+uQu8o0qUYcJw3N3IYtmfFY38yHSG7/pOiFqGShdmMmqWhgRD859oVAob
	hpM3bAiWoSl6Pcv+WMAGLiNgwErAqO64Hjp3PODVnFMTzZdhc2LoqeSGbSSmu9VD
	F52df8COAES7Q253JflqGKAqrsJhdFhlOL0MvDJfG8frEAsMs1H33OkPI9nuktmV
	G97vCWk/QXXG9z8hIwKkJBRZlm2ywqVTgUixrU+c2eB8ws2PT35ozlb4Eie2QSg7
	EjoKvLbjPETcOC9a/9RU1YrX78iP34g3gCw==
X-ME-Sender: <xms:5X1YZOMGtAvg3dnBRiKFhxTPFRain2veZU8adu2nSzfl6RN3OVgEWw>
    <xme:5X1YZM_8EDXlYqy1Vx1I76M34dFQi_SsXhmaGfHQzptl2OhTA6nMxzhvvLryuiAS-
    xIGseaD97vE4DPNqA>
X-ME-Received: <xmr:5X1YZFT2kWMq4P2_bHTnZ7rHWKKW0v0nzGVdwe-3UyN9hO4uoeV-fht4hVUeZQNKnwF6XyC1Hk0LB9CkJuXGKq7DjG6ILrHXWAJISSL-WGaJPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefjedgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredt
    tderjeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
    hsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnheptefgieelhfeufeevvdekheeifeej
    gfefgeehtedukeeigfduuddtueekteevleelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:5X1YZOvFyLp7NHgJRjcrHxqhYiIJCvBLkEuXLJZ5dn3kL2OgJ_49eQ>
    <xmx:5X1YZGcrNWRNvgl_Z5SiG-gnCdfhBQxCp51rAOEDGm-JtDWFEvHTvg>
    <xmx:5X1YZC2hfEVBvelvmR8uHvq2XhEcV_buc6VB73gK_CymAkcCsNWtqg>
    <xmx:5X1YZKGDHHISEjCDCPPEejjBrPCwchb_3LV5T2baI62X-LUUnFWfkg>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 May 2023 00:43:15 -0400 (EDT)
Message-ID: <3e0792f3c7d30cdfec36466a013af6ced8f6d33b.camel@russell.cc>
Subject: Re: [PATCH v2 10/12] selftests/powerpc: Add more utility macros
From: Russell Currey <ruscur@russell.cc>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 08 May 2023 14:43:14 +1000
In-Reply-To: <20230330055040.434133-11-bgray@linux.ibm.com>
References: <20230330055040.434133-1-bgray@linux.ibm.com>
	 <20230330055040.434133-11-bgray@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2023-03-30 at 16:50 +1100, Benjamin Gray wrote:
> * Include unistd.h for _exit()
> * Include stdio.h for fprintf()
> * Adds _MSG assertion variants to provide more context behind why a
> =C2=A0 failure occurred.
> * Move ARRAY_SIZE macro to utils.h
>=20
> The _MSG variants and ARRAY_SIZE will be used by the following
> DEXCR selftests.
>=20
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
>=20

I'd prefer if your commit message led with adding FAIL_IF_MSG etc and
then mentioned the other changes to support it.  It's unintuitive to
read as-is.

Reviewed-by: Russell Currey <ruscur@russell.cc>
