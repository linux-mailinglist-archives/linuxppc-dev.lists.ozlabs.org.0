Return-Path: <linuxppc-dev+bounces-14177-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D76C5C2E0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Nov 2025 10:11:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7BG82YJTz301N;
	Fri, 14 Nov 2025 20:11:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763111488;
	cv=none; b=CsHXKbia4Bm8r2RNIf2ndBUxLpuMSug5KTMoy6xlGgdVupzGuhhtCLOk7Xp5nUz4XaVSdcm42etACbPnwS0xzcMNbPS98s/mdyrGtoPB3sRsUob0+A/09kIU54vWkCYT5KpGvKFgH24VJTHghAuwgf48RUUH2sy7P3SJa8yX/aBMc+gmu1E5+vWxW72Ghzi+enLwkKptUn/6Eso+XV580hkV6+i8m5pWPcvXuXGcnaV3eyXf11BBqsYGGxt2i1VMSdOfyOR4bT+u1AKMsN8OUS4146xX8Y2gYQPKN4w0WHaV101iFVreC+9z5vs9OjXm1Sl9ioW7A5CEQhnZVUOuHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763111488; c=relaxed/relaxed;
	bh=JJWaEMTs1hq2LaV6TxhfSa7kYchgm/2IrnGqHTnszFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UuzG76dwSh6kIEEYwFXhiJCXF5ajm7H4PNCtq/bP2GEBB5scfXUw5ndzwa3NVA+TQr9Tq7xOBNIQc6RvExdXMykWQiWg2WXP375nH9uJq+46Tg5lLXUQQUsqR0Xc+jCwYQOghumbyMVBSMCY2Z/eD5ylImtllv4bDFDGgygpBkg2bknOyRGXVKkTfsEatrCFCnxVJaFsHQ3cYo80lrhrSN6lir0XYZYsm2vQDuOkj5YlvaVfuToVkDD893LkzirG+/vI3DzIRkO0oGWOMBVDHZDCzL9BN/MK/MFbCwBVLi6jElrY3B3gXDGxcN2hBmjltQ5JO3aypkvH+y9/ZzuLFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qDL/ZFoo; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qDL/ZFoo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d7BG72X2Sz2yx8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Nov 2025 20:11:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 720B242A16;
	Fri, 14 Nov 2025 09:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12C26C4CEF1;
	Fri, 14 Nov 2025 09:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763111484;
	bh=4bUe5Ax7eP5+O7eH4xwn1ucE348NJIHO1n8FTISL6Wk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qDL/ZFooJb8prJ+A5aXqzeCEsCIeVSCJ9HXcKqM+XON3p75vVtCyUZy7lWYQ4eCz/
	 +z2JSFQAbWBZulQ/jzOAHjxpO9klt8A0ULEOth50qNtoqOojUbiL5be1zN6TglfKyA
	 o9CZIydGR3Ks496J7GqPO58FeUFwpSylZ0Z4PuO/HOV5l5B7OQ4flhLoOzU2jcqVuf
	 NfSKk/mFCSCOl0GbibxdkCZmJD4N4UtW+pfbDzftDFoHcp2Kqdw/KlBmYni2Zw/ZOM
	 FW4Gd9xAoiPLClhPBig3kExl8BZM8d0AD0j85bksdu43agdSm4XeRPmiit/m2klW7E
	 GhaWeyOsr+H6A==
Message-ID: <d1d857ee-60c9-4e38-82c7-062e55e6f4f3@kernel.org>
Date: Fri, 14 Nov 2025 10:11:17 +0100
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/powermac: Fix reference count leak in i2c probe
 functions
To: Miaoqian Lin <linmq006@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@ozlabs.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20251027084556.80287-1-linmq006@gmail.com>
From: Christophe Leroy <chleroy@kernel.org>
Content-Language: fr-FR
In-Reply-To: <20251027084556.80287-1-linmq006@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 27/10/2025 à 09:45, Miaoqian Lin a écrit :
> [Vous ne recevez pas souvent de courriers de linmq006@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> The of_find_node_by_name() function returns a device tree node with its
> reference count incremented. The caller is responsible for calling
> of_node_put() to release this reference when done.
> 
> Fixes: 730745a5c450 ("[PATCH] 1/5 powerpc: Rework PowerMac i2c part 1")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>   arch/powerpc/platforms/powermac/low_i2c.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
> index 02474e27df9b..f04dbb93bbfa 100644
> --- a/arch/powerpc/platforms/powermac/low_i2c.c
> +++ b/arch/powerpc/platforms/powermac/low_i2c.c
> @@ -802,8 +802,10 @@ static void __init pmu_i2c_probe(void)
>          for (channel = 1; channel <= 2; channel++) {
>                  sz = sizeof(struct pmac_i2c_bus) + sizeof(struct adb_request);
>                  bus = kzalloc(sz, GFP_KERNEL);
> -               if (bus == NULL)
> +               if (bus == NULL) {
> +                       of_node_put(busnode);

We are in a loop, what happens when kzalloc() succeded in the first 
iteration but not in a further iteration ? In that case we have already 
registered some bus which references busnode as bus->busnode so it just 
can't but put.

>                          return;
> +               }
> 
>                  bus->controller = busnode;
>                  bus->busnode = busnode;
> @@ -928,6 +930,7 @@ static void __init smu_i2c_probe(void)
>                  bus = kzalloc(sz, GFP_KERNEL);
>                  if (bus == NULL) {
>                          of_node_put(busnode);
> +                       of_node_put(controller);
>                          return;
>                  }
> 
> --
> 2.39.5 (Apple Git-154)
> 
-- 
pw-bot: cr


