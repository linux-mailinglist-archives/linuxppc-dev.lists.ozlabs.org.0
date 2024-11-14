Return-Path: <linuxppc-dev+bounces-3236-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6544F9C8E96
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 16:45:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq4HP10zbz306d;
	Fri, 15 Nov 2024 02:45:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731599137;
	cv=none; b=AmPhmwG5rxnaRl8oCwAo8Nz2gBio+ClWFQAG6AK6claQj+2SOPAXcgtfW5d2DFj4byHePrztzdkGd98BbSnBoFwwDXkCUojR67M3vKL3d7/y6w8Bw4hLXb/+6l0+IuctL8GhxuYj8EFNvfA5Ib7snfGmYv+WgC9cpRnAzZXNiq8i2nnuEwAsy3cRRjZreU1cR2kxq87A298lyYXhEIk37y3/6a6Yaijx7sAqvmFyV28kdshuvNSGtWhyljCzMaBbq/peI0pQfsmTkDTZCwax9IbYkReaNKuYzH9JWdc/EfQxbBQTOK+wvESCaYkMuiWUtL4zpznmPFMjaZ3cfklbdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731599137; c=relaxed/relaxed;
	bh=dZZpctvg4cXmi7QP+x1Z7D9U2+hXXw/04WokTnCvB+4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=QQlvPHrWsmjvBF2VPdWaYjERZSS7qNOtumTJB8b7VBkYmw3fZKCRP4+8dcWfbofhKcy8Hij32OvbmVHcPEYzrti56RTIK9zktbZ8qZIP8TbsGxZR949pavDcvh1cn/T2xW7SCqEb46FstMS+cxlJ2Kt68gN6kfkSzbBcdesp379VM6Vw7g2aEsIMlfve0tCSZbJFtRaljhfAd1Kt6SoNdspwh2AKAw4VhBrII7z4U7uUPSgql+E4sTUDmfqpBZIGiCUu7aLTo6py0OVmibQUUHMn2wh7mr77czv0gcTrfi5zDoIWIic9Bh7FcbJs8dRcPfxvYXJdMyDT07E9kn1JWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=NYdB1QUf; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=T8N/2fmM; dkim-atps=neutral; spf=pass (client-ip=103.168.172.150; helo=fout-a7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=NYdB1QUf;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=T8N/2fmM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.150; helo=fout-a7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq4HN1dl0z306S
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 02:45:36 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 40C28138052E;
	Thu, 14 Nov 2024 10:45:34 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 14 Nov 2024 10:45:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1731599134;
	 x=1731685534; bh=dZZpctvg4cXmi7QP+x1Z7D9U2+hXXw/04WokTnCvB+4=; b=
	NYdB1QUftjiu8yfKZSVsZA7OM6nGKB5Mled5FHNvEo98Ou6uwaHmqDn5nveL0sk6
	ApXUvEZRvwoSPyEerdMQJvLvAD/GHx5hpT1j9BP0AGELp32NlpPElBXwUJT4Rob6
	Myvsy8+4gKw2LPbYMqT6aUrLAO/Jq/t59+SNUN5HXS92wpSvc5WFDVaT/LUgaoJD
	yolnzy1Vlg5G1qNEOW7cF9djA5cfOmv0t+oYEBaB11S8uSXV0pP9jYJdqJeBluRu
	KJ0dodE6njkX22gLtGsL0OGchkKd4ARDtLc8/EbvX4wxh8SNFw9uxQ0fuAljt2Fr
	1YWKNrMpxpaRByBAEeaugA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1731599134; x=
	1731685534; bh=dZZpctvg4cXmi7QP+x1Z7D9U2+hXXw/04WokTnCvB+4=; b=T
	8N/2fmMfngFGh2rrTJ2h3Zmc6TZ4rIFZprR54GDAjjo1OHgnmTA+I0C+kw5OkD2T
	5nxgTeohz5bhPQ9OfGCdsVKzXoaTDl3g3PX1z08KSR7+l75rNP1pkDNOn8EPX630
	NpCZe8sK9P4mJjfLcJJKj0RYg3ohLEAWG0r6w9dhDZh48PrMdzi5CtLLL0Jp97y2
	Vib+5Nm5EByCWZuzg1nrQuwu94/FUMF0sNNVxT7OxAnV4vbAMUiP47PchQKHpuQR
	n+s/yNGVmdzIEjDiUwfJtqnTta5+R8I9qv+VRcSxyezMffE4dJRRkXKzEfsbNEYo
	C3B9kR1yv+URO3uQtJA1A==
X-ME-Sender: <xms:Hhs2Z8rSh6Q8mt9z6de7FBXWRuzEsG8qnnhAX4DDJ9d8lvihUiaGdA>
    <xme:Hhs2ZypYZNvP9hZ9G_DShkyxiQVgihEG0yn0NxGHm77q4nbdncOkMaPIxBqie1uGq
    y7cvwHbh_EZTCNUn2M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrvddvgdejlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeen
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeej
    vdefhedtgeegveehfeeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurd
    gruhdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphht
    thhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Hhs2ZxOeBzumBig847DmLOftFZN_o2HFA-13jIpyznx2XYe3V9aOdA>
    <xmx:Hhs2Zz7MqnJUWCq5xP5HVv6gjlTjWoczs4e2a6lm_2LTM3eN_9FAGA>
    <xmx:Hhs2Z75upI_PvdXUQ2VeKvL-i_C6zaMEaUhdCw8hmHWN-3THoHl0hw>
    <xmx:Hhs2Zzh3kECjJhxfTRbPt_5jBhw0hdAHHhBN_DIJRLbFhJzen93n8Q>
    <xmx:Hhs2Z9mLa_WxExSrbcQYpZ4-eSAjyIDa2GEYP_BeTJfAjB8O0AoM9pUb>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EDFEA2220071; Thu, 14 Nov 2024 10:45:33 -0500 (EST)
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
Date: Thu, 14 Nov 2024 16:43:28 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michael Ellerman" <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Message-Id: <acec6edb-59a0-4c9e-91ca-b152381a6542@app.fastmail.com>
In-Reply-To: 
 <CAMuHMdWBZJvVaKiWk_VaHY0ZQiaezn9Kqa0XpTXKzf0gh_rG+g@mail.gmail.com>
References: <20241114131114.602234-1-mpe@ellerman.id.au>
 <CAMuHMdWBZJvVaKiWk_VaHY0ZQiaezn9Kqa0XpTXKzf0gh_rG+g@mail.gmail.com>
Subject: Re: [RFC PATCH 01/10] powerpc/chrp: Remove CHRP support
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 14, 2024, at 15:31, Geert Uytterhoeven wrote:
> On Thu, Nov 14, 2024 at 2:11=E2=80=AFPM Michael Ellerman <mpe@ellerman=
.id.au> wrote:
>> CHRP (Common Hardware Reference Platform) was a standard developed by
>> IBM & Apple for PowerPC-based systems.
>>
>> The standard was used in the development of some machines but never
>> gained wide spread adoption.
>>
>> The Linux CHRP code only supports a handful of machines, all 32-bit, =
eg.
>> IBM B50, bplan/Genesi Pegasos/Pegasos2, Total Impact briQ, and possib=
ly
>> some from Motorola? No Apple machines should be affected.
>>
>> All of those mentioned above are over or nearing 20 years old, and se=
em
>> to have no active users.
>>
>> So remove the CHRP support. If there's interest in still supporting s=
ome
>> of the machines that can be brought back from the git history.
>>
>> Note there are still some references to CHRP/chrp in various comments
>> and some in the code, because later standards (eg. RPA, PAPR) used so=
me
>> elements of CHRP or copied the CHRP behaviour. These will need to be
>> cleaned up on a case-by-case basis to either refer to newer standards=
 or
>> left as-is when that's correct.
>>
>> The CHRP code was copied from arch/ppc, and before that it mostly
>> predates git, so the original authorship is largely lost. If anyone
>> wrote any of this code and would like a CREDITS entry just let me kno=
w.
>>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
>

Whole series

Acked-by: Arnd Bergmann <arnd@arndb.de>

