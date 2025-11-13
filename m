Return-Path: <linuxppc-dev+bounces-14161-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7976FC5A2C0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Nov 2025 22:42:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6tyk3dnXz2xqr;
	Fri, 14 Nov 2025 08:42:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763063478;
	cv=none; b=emZh9iIoglzk4Hy3PleKhsZ66I90TNAS0sMYJUgvoLma7URMGdSr5YGs9h8nfTDQTERqB5WYl7C3L5lDcmQxJLgoiV6qADDH6QE6K/8LTYb/e3u/Q5CE0ycbEbu5N6erE6j++fo+rxwK+dxCLkR6nbQkc/penW0G9i5Uaqp6xN+/vmq+MAQ+lPwn4fJ4JzHmrYusa2EsmAch5eLxIEHbuWqNXUkJvNImDfI59B3wN6oGWz3ijmIFXdg0jrKF0dxrpx6TGfUItSZ2UZZYUBIZMOpyBp2oQjmR+WDaFUcvMEPXWT1MVJj86UUsx82ISUJ4LAZ4O9JU73F6fesmpkfs0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763063478; c=relaxed/relaxed;
	bh=bidH1YVB3FU0vIER8TzeT7GVeBt38ZPUPPj/RvF6vfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=kTmN1JPb09ajtBQ4qkg7xqU2Bxs3WEuOmLer77/xFXfJzk5CRkkNblJosn3+zKbFx5j4iWV9nF1Fb9syI8QVWCBEFIIF3rmoLowv8yuEIBVmSHTH95siZq9yebMbRdPY/NOjRkNZeM7tEss8PuOLyi5qR1u0PFq+BX2be5R+9GO4JIKMR+rhGSz5HUavXvWEvfuGQSeGpBUPVFNVM+rdcnI70c5ouhcO16ZIdi/xhuQ8vzptSmNDYJ+avoqtLuP6Xz/ZdHUKT18Ba68/yZ9AfkDc9d7ubVgu+IOM8AJLJlVsu+Q+LPAsBl2e5DiLjiyxa/DKH53iOExe6fZQUK3R1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e0frgItY; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e0frgItY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6rVt098Vz2yvJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Nov 2025 06:51:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6870C405F5;
	Thu, 13 Nov 2025 19:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F780C113D0;
	Thu, 13 Nov 2025 19:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763063476;
	bh=i62EScYWtVQ1Z7R9P0R38h7LgEJm8IOPqaLrXKZ1WCs=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=e0frgItYAI5XtdF0L99OMBM4gdkWJi1LEh5nXpp0qd9+PpQ/5vvIY2gZMvQnA4sGN
	 HIc5gZqiRqySn0sE7ukTXkgtzk0QWzhrzPlqxlhgmMUqQE+rgwa+xHiWlWahJv7KpL
	 zc+6wasnAxQnxpQbTS9xZPSGRh6x8jEYwRTKpnFkG2Xhn80wrU91y1woRPIf4P+ENJ
	 xb0dPTXpUQAwEqXK5XqLb/jwwKjUVx18H8BoquMZIzjexWfZIYcJK1RxhWuaVxpUKI
	 6E8TURg8qb9fdl8Sl7gC0D4+VuA2bgYyZ1cX7SGbepGdYHv1r44s6mcPPhij5VUkeG
	 WlZ6rLHZtCiqA==
Message-ID: <4bbfc2ae-2776-485e-8d6f-8f3dbd3f0591@kernel.org>
Date: Thu, 13 Nov 2025 20:51:11 +0100
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
Subject: Re: PATCH: Fix typo recommand in comment
To: Haoran lee <470658536@qq.com>
References: <tencent_F844A82DB85660D110008F34E54330312A08@qq.com>
From: Christophe Leroy <chleroy@kernel.org>
Content-Language: fr-FR
Cc: maddy@linux.ibm.com, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
In-Reply-To: <tencent_F844A82DB85660D110008F34E54330312A08@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 01/10/2025 à 16:42, Haoran lee a écrit :
> [Vous ne recevez pas souvent de courriers de 470658536@qq.com. D?couvrez pourquoi ceci est important ? https://aka.ms/LearnAboutSenderIdentification ]
> 
>  From e949fa326c98953fda200fe92c108fa71e334715 Mon Sep 17 00:00:00 2001
> From: Haoran Lee <470658536@qq.com>
> Date: Wed, 15 Oct 2025 10:18:52 +0000
> Subject: [PATCH] powerpc/smu: Fix typo "recommand" in comment
> 
> The word "recommand" is incorrect. The correct spelling is "recommend".
> 
> Fix the typo in the comment in arch/powerpc/include/asm/smu.h.

Why is it important to correct that as a standalone change ?

If someone reads the text, do you think he/she won't understand the word 
because of letter 'a' instead of 'e', allthought the prononciation is 
likely the same ?

Do you think it is worst the cost of handling a patch like this ?

Christophe

> 
> Signed-off-by: Haoran Lee <470658536@qq.com>
> ---
>   arch/powerpc/include/asm/smu.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/smu.h b/arch/powerpc/include/asm/smu.h
> index 2ac6ab903023..23b4ed8b4399 100644
> --- a/arch/powerpc/include/asm/smu.h
> +++ b/arch/powerpc/include/asm/smu.h
> @@ -667,7 +667,7 @@ extern struct smu_sdbp_header *smu_sat_get_sdb_partition(unsigned int sat_id,
>    * file is opened. poll() isn't implemented yet. The reply will consist
>    * of a header as well, followed by the reply data if any. You should
>    * always provide a buffer large enough for the maximum reply data, I
> - * recommand one page.
> + * recommend one page.
>    *
>    * It is illegal to send SMU commands through a file descriptor configured
>    * for events reception
> --
> 2.48.1
> 
> 


