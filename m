Return-Path: <linuxppc-dev+bounces-12759-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC199BCAFB0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 23:50:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cjNpn3p2Rz3cZH;
	Fri, 10 Oct 2025 08:50:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760046641;
	cv=none; b=T8XfnzZkyEWg+yN80hcTRpE7jKBLoNGfbtvwGgs2yaDzHfNfcyUSBxGA4aF5HVGbxU7xGXT1U8JnZ2A/4O6KUaIdPkGY5uFHDLiEKGVyJP0Th/sVmoTCeVJCrPIPDgz06VjS/Z2Ui/oCNZeKeW6ML3az38IAK46CJKajpvyW/tSr7riOdn3p3hWwWY77LLToQ0qH+3V6epowCJ5azpORSwMAZBqzO43HXvXFKaOsSGpHhge3U6oMy/yyFJcqPy2ruAeGNlcws3ndr0QwoANBKnjoiPEq6sRbv3H+CfsChtpKUgd8r5g/hrt3EqgtNRpTZOJBUuHBBAsrsrNmqRsDKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760046641; c=relaxed/relaxed;
	bh=c12d5W0PhL+mxLdkoTXOHPXUrijaCx5rhZLNRgACiSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kiV1N4xBZgubzJb22GUq5UjKoOhrgg1qtBgFQe7tlN3AL/e/lVHKEicHXc6rgG1fu3dRl7rVKfw8cjX0oJBgpQh8woX4gRctLXKSJ0ADmj3nMdgooXdBU1BrJO5bEcooUYxQX00LuVFJR0OYHobT5fgIMdrlloeu2latac5uh3YIfGfOelFcWBhOLrjEkGkUvbCQ6Lq6/3/4ycLB4XDDnobsd/tzvxykqcqr5Km0mytvuNu91+JzhSFlfQyPxWlkp6i/DKtZgQnLdMXsnJ6OZB9SID31Ro1YhbhoWghN2QvMdKawtli/gzMWwEPzBm1JZt+iDCh6U8y1wejMxjzxDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cjNpn00cBz3cZ2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Oct 2025 08:50:40 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cjBYt4pblz9sVS;
	Thu,  9 Oct 2025 16:08:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ADpqTBaSwlR; Thu,  9 Oct 2025 16:08:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cjBYd4WL4z9sVW;
	Thu,  9 Oct 2025 16:08:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 880008B774;
	Thu,  9 Oct 2025 16:08:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id NG8yT-cNEd_j; Thu,  9 Oct 2025 16:08:37 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DF97B8B76D;
	Thu,  9 Oct 2025 16:08:36 +0200 (CEST)
Message-ID: <93737f68-4714-40ba-8920-48a996534126@csgroup.eu>
Date: Thu, 9 Oct 2025 16:08:36 +0200
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
Subject: Re: [PATCH 2/4] powerpc: 83xx: Rename wdt@ nodes to watchdog@
To: j.ne@posteo.net, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250418-watchdog-v1-0-987ff2046272@posteo.net>
 <20250418-watchdog-v1-2-987ff2046272@posteo.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250418-watchdog-v1-2-987ff2046272@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 18/04/2025 à 21:28, J. Neuschäfer via B4 Relay a écrit :
> From: "J. Neuschäfer" <j.ne@posteo.net>
> 
> The watchdog.yaml schema prescribes a node name of "timer" or "watchdog"
> rather than the abbreviation "wdt".
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/boot/dts/asp834x-redboot.dts | 2 +-
>   arch/powerpc/boot/dts/mpc8313erdb.dts     | 2 +-
>   arch/powerpc/boot/dts/mpc8315erdb.dts     | 2 +-
>   arch/powerpc/boot/dts/mpc832x_rdb.dts     | 2 +-
>   arch/powerpc/boot/dts/mpc8349emitx.dts    | 2 +-
>   arch/powerpc/boot/dts/mpc8349emitxgp.dts  | 2 +-
>   arch/powerpc/boot/dts/mpc836x_rdk.dts     | 2 +-
>   arch/powerpc/boot/dts/mpc8377_rdb.dts     | 2 +-
>   arch/powerpc/boot/dts/mpc8377_wlan.dts    | 2 +-
>   arch/powerpc/boot/dts/mpc8378_rdb.dts     | 2 +-
>   arch/powerpc/boot/dts/mpc8379_rdb.dts     | 2 +-
>   11 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/boot/dts/asp834x-redboot.dts b/arch/powerpc/boot/dts/asp834x-redboot.dts
> index 52a84561c4f076ac0c4fc7af3db12f2fda06521c..33ddb17d18760df24ac8f068dce38ac60c353f32 100644
> --- a/arch/powerpc/boot/dts/asp834x-redboot.dts
> +++ b/arch/powerpc/boot/dts/asp834x-redboot.dts
> @@ -72,7 +72,7 @@ soc8349@ff000000 {
>   		reg = <0xff000000 0x00000200>;
>   		bus-frequency = <0>;
>   
> -		wdt@200 {
> +		watchdog@200 {
>   			device_type = "watchdog";
>   			compatible = "mpc83xx_wdt";
>   			reg = <0x200 0x100>;
> diff --git a/arch/powerpc/boot/dts/mpc8313erdb.dts b/arch/powerpc/boot/dts/mpc8313erdb.dts
> index a8315795b2c951c5914953be0b4a5162dd471505..09508b4c8c73095bf4699e383e7841100d6d7c8f 100644
> --- a/arch/powerpc/boot/dts/mpc8313erdb.dts
> +++ b/arch/powerpc/boot/dts/mpc8313erdb.dts
> @@ -99,7 +99,7 @@ soc8313@e0000000 {
>   		reg = <0xe0000000 0x00000200>;
>   		bus-frequency = <0>;
>   
> -		wdt@200 {
> +		watchdog@200 {
>   			device_type = "watchdog";
>   			compatible = "mpc83xx_wdt";
>   			reg = <0x200 0x100>;
> diff --git a/arch/powerpc/boot/dts/mpc8315erdb.dts b/arch/powerpc/boot/dts/mpc8315erdb.dts
> index e09b37d7489d01bfd16a26e9786868f630fa0262..56cf6d12c730de52d85623dc34c5987bee635f0f 100644
> --- a/arch/powerpc/boot/dts/mpc8315erdb.dts
> +++ b/arch/powerpc/boot/dts/mpc8315erdb.dts
> @@ -99,7 +99,7 @@ immr@e0000000 {
>   		reg = <0xe0000000 0x00000200>;
>   		bus-frequency = <0>;
>   
> -		wdt@200 {
> +		watchdog@200 {
>   			device_type = "watchdog";
>   			compatible = "mpc83xx_wdt";
>   			reg = <0x200 0x100>;
> diff --git a/arch/powerpc/boot/dts/mpc832x_rdb.dts b/arch/powerpc/boot/dts/mpc832x_rdb.dts
> index ecebc27a289871a896121fbaf6bc878422d25101..ba7caaf98fd58f9a2b56c0aa566673c70eff2013 100644
> --- a/arch/powerpc/boot/dts/mpc832x_rdb.dts
> +++ b/arch/powerpc/boot/dts/mpc832x_rdb.dts
> @@ -52,7 +52,7 @@ soc8323@e0000000 {
>   		reg = <0xe0000000 0x00000200>;
>   		bus-frequency = <0>;
>   
> -		wdt@200 {
> +		watchdog@200 {
>   			device_type = "watchdog";
>   			compatible = "mpc83xx_wdt";
>   			reg = <0x200 0x100>;
> diff --git a/arch/powerpc/boot/dts/mpc8349emitx.dts b/arch/powerpc/boot/dts/mpc8349emitx.dts
> index d4ebbb93de0b325a3bb0f5d17464f516a0e12133..13f17232ba83d50498f19e6758063cf905fbc326 100644
> --- a/arch/powerpc/boot/dts/mpc8349emitx.dts
> +++ b/arch/powerpc/boot/dts/mpc8349emitx.dts
> @@ -53,7 +53,7 @@ soc8349@e0000000 {
>   		reg = <0xe0000000 0x00000200>;
>   		bus-frequency = <0>;                    // from bootloader
>   
> -		wdt@200 {
> +		watchdog@200 {
>   			device_type = "watchdog";
>   			compatible = "mpc83xx_wdt";
>   			reg = <0x200 0x100>;
> diff --git a/arch/powerpc/boot/dts/mpc8349emitxgp.dts b/arch/powerpc/boot/dts/mpc8349emitxgp.dts
> index bcf68a0a7b557e49b48563f586b1fe8441ab3c6d..eae0afd5abbc39852b8e34b2247223168ab863ca 100644
> --- a/arch/powerpc/boot/dts/mpc8349emitxgp.dts
> +++ b/arch/powerpc/boot/dts/mpc8349emitxgp.dts
> @@ -51,7 +51,7 @@ soc8349@e0000000 {
>   		reg = <0xe0000000 0x00000200>;
>   		bus-frequency = <0>;                    // from bootloader
>   
> -		wdt@200 {
> +		watchdog@200 {
>   			device_type = "watchdog";
>   			compatible = "mpc83xx_wdt";
>   			reg = <0x200 0x100>;
> diff --git a/arch/powerpc/boot/dts/mpc836x_rdk.dts b/arch/powerpc/boot/dts/mpc836x_rdk.dts
> index a0cc1953484d70410f9592bdb84ffaf779ee08b4..4ff38e1a2185f85618b603e703e54c973cb97cc0 100644
> --- a/arch/powerpc/boot/dts/mpc836x_rdk.dts
> +++ b/arch/powerpc/boot/dts/mpc836x_rdk.dts
> @@ -62,7 +62,7 @@ soc@e0000000 {
>   		/* filled by u-boot */
>   		bus-frequency = <0>;
>   
> -		wdt@200 {
> +		watchdog@200 {
>   			compatible = "mpc83xx_wdt";
>   			reg = <0x200 0x100>;
>   		};
> diff --git a/arch/powerpc/boot/dts/mpc8377_rdb.dts b/arch/powerpc/boot/dts/mpc8377_rdb.dts
> index 7df452efa9579a649195d2266d42bbc4b6b8de1c..f137ccb8cfdedfed98a3cf6899f5508f069834dc 100644
> --- a/arch/powerpc/boot/dts/mpc8377_rdb.dts
> +++ b/arch/powerpc/boot/dts/mpc8377_rdb.dts
> @@ -99,7 +99,7 @@ immr@e0000000 {
>   		reg = <0xe0000000 0x00000200>;
>   		bus-frequency = <0>;
>   
> -		wdt@200 {
> +		watchdog@200 {
>   			device_type = "watchdog";
>   			compatible = "mpc83xx_wdt";
>   			reg = <0x200 0x100>;
> diff --git a/arch/powerpc/boot/dts/mpc8377_wlan.dts b/arch/powerpc/boot/dts/mpc8377_wlan.dts
> index d8e7d40aeae449e33ea1640a53ee4dfec7d746a4..ce254dd74dd06b19bc8e15e13f2fa9e959dd25f2 100644
> --- a/arch/powerpc/boot/dts/mpc8377_wlan.dts
> +++ b/arch/powerpc/boot/dts/mpc8377_wlan.dts
> @@ -89,7 +89,7 @@ immr@e0000000 {
>   		reg = <0xe0000000 0x00000200>;
>   		bus-frequency = <0>;
>   
> -		wdt@200 {
> +		watchdog@200 {
>   			device_type = "watchdog";
>   			compatible = "mpc83xx_wdt";
>   			reg = <0x200 0x100>;
> diff --git a/arch/powerpc/boot/dts/mpc8378_rdb.dts b/arch/powerpc/boot/dts/mpc8378_rdb.dts
> index bdcfe83a561e121ed82972406e0302d84d8d0ef6..19e5473d4161b5d6be6ab84ae0ba78875fc377f8 100644
> --- a/arch/powerpc/boot/dts/mpc8378_rdb.dts
> +++ b/arch/powerpc/boot/dts/mpc8378_rdb.dts
> @@ -99,7 +99,7 @@ immr@e0000000 {
>   		reg = <0xe0000000 0x00000200>;
>   		bus-frequency = <0>;
>   
> -		wdt@200 {
> +		watchdog@200 {
>   			device_type = "watchdog";
>   			compatible = "mpc83xx_wdt";
>   			reg = <0x200 0x100>;
> diff --git a/arch/powerpc/boot/dts/mpc8379_rdb.dts b/arch/powerpc/boot/dts/mpc8379_rdb.dts
> index a5f702304a353c61d6ab804765b817ec34a9582e..61519acca2280427d7237d8d9bbb8485f0c65369 100644
> --- a/arch/powerpc/boot/dts/mpc8379_rdb.dts
> +++ b/arch/powerpc/boot/dts/mpc8379_rdb.dts
> @@ -97,7 +97,7 @@ immr@e0000000 {
>   		reg = <0xe0000000 0x00000200>;
>   		bus-frequency = <0>;
>   
> -		wdt@200 {
> +		watchdog@200 {
>   			device_type = "watchdog";
>   			compatible = "mpc83xx_wdt";
>   			reg = <0x200 0x100>;
> 


