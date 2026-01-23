Return-Path: <linuxppc-dev+bounces-16227-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPzEIgpTc2kDuwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16227-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 11:52:58 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E7D749A0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 11:52:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyFBv0ZdXz2xKh;
	Fri, 23 Jan 2026 21:52:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769165574;
	cv=none; b=DIZ+C7N8MkP0t21UHwSzGlcKtEYqSuikEV48L9ODA/YPLBoujD2Uxw90h9lbgWx3qd12PPzKj1aLhLxzHK1pd/XDMYs16BhyHrwKGbx2AeUwR7ObZndbWoDfQVf9MswgOjdCgXKyvsrl+C+qZP4TggxQvPm+qkmjtEAkvthCIBOriOZZ9xSfWldR9brQJ18s2zKXYXfZQ2X8ubGHCdS4b7pHm3sC+q3MleIShLhs2l5hhuyVTGw79XNT+emOl0bhQmy7UL38tvHE23Lc7qKLsIk4Ulc+Rr8WnKnT5+Vx7Mk4PJWqkTMkKIhnBdgb8plh6xDf4HAGqeF4P+8QLa582w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769165574; c=relaxed/relaxed;
	bh=ve2HFoQhOJ70zqicwb3PD9Zceekow7O+1d/25yLR6eI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jM/9x4A4t/GbS4tlSDg7q9cNELEEU9cgVvQmgC3CF65N+ROYGkrbrH0Zc4WQHppb3zAILQLA0vOd9YCCdJEAwwueQalHW7UMEhOUbwGFFiIrMhsHjCfL+aO1b1BwduRKvIHHb6bn8eX5AsCnIwagsGhlDCk3bntBqRSs9FDVA2XC8amIi1d97ekviw2jO0auuc2EKzbpHtn2rBCbqfqHZVx0eTt6C69LGkfgN2UyBl7FtyIsYt7DvySbmTagtQZS+tfutOee5FGzBjocIGt69JRZqtPAPnN435fTK/gCJ12hMDi9MPO/QRiMI3QFkQP3VgZ2oJPfFmRVmrrF/n7ZEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s2f2wPSB; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s2f2wPSB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyFBs4Swsz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 21:52:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4684660010;
	Fri, 23 Jan 2026 10:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADCEC4CEF1;
	Fri, 23 Jan 2026 10:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769165571;
	bh=ojbfcl6dIvtY+adr7dmxP1SqcnShBLlbESAfM2YXYq0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s2f2wPSB1By77YZx78G4NYjIc1Edaa8r0GoGZCJpeFJEJOlz2sZP7AuN4jkl7Xic3
	 qzgHcL9a8Kk7TnPbjdNRkGWjb17KQLah8KGDRttLmr4QOcMphSqa3wW9mkZSakxsLC
	 1zBUFXPrgGhlFq5RACJOOn3IMf+ZnxPL36kJ2Y/EtX474wyXYeUhXBa5tXuzFa9OlR
	 ZJc7ZZ56dFOidTDw5mWU+ja41m4km8GQGRxsveK00M3ay8XTyFr2A7RHYHmCU7KpSs
	 Evn9ImxYCjfFCff2GCXxSQ6UX5uVwGuvlIvU1u9P+OmRg04bdfSrkZZxgFtm3F30dG
	 uCjff4WMVBJeQ==
Message-ID: <2b41debd-9a05-4707-b270-a8fa3dd7768c@kernel.org>
Date: Fri, 23 Jan 2026 11:52:45 +0100
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
Subject: Re: [next-20260122] Build failure on IBM Power Server
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, broonie@kernel.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Jakub Kicinski <kuba@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org
References: <43ea0202-891d-4582-980b-5cb557b41114@linux.ibm.com>
 <f07d721f-ac80-4421-86a3-1f7f76ea8e6c@infradead.org>
 <136ae3bf-b1a3-4ee8-a7ea-dfc90e7b4baf@linux.ibm.com>
 <fa330d98-653c-4643-aee9-9697068e734a@kernel.org>
 <20260123103922.sr7m7py7d4afvc2f@skbuf>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260123103922.sr7m7py7d4afvc2f@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16227-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:vladimir.oltean@nxp.com,m:venkat88@linux.ibm.com,m:rdunlap@infradead.org,m:maddy@linux.ibm.com,m:broonie@kernel.org,m:linux-next@vger.kernel.org,m:maxime.chevallier@bootlin.com,m:kuba@kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:netdev@vger.kernel.org,m:vkoul@kernel.org,m:linux-phy@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.868];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 93E7D749A0
X-Rspamd-Action: no action



Le 23/01/2026 à 11:39, Vladimir Oltean a écrit :
> On Fri, Jan 23, 2026 at 10:52:49AM +0100, Christophe Leroy (CS GROUP) wrote:
>> +Vladimir, Maxime, Jakub and netdev
>>
>> Le 23/01/2026 à 10:11, Venkat Rao Bagalkote a écrit :
>>>
>>> On 23/01/26 1:17 pm, Randy Dunlap wrote:
>>>>
>>>> On 1/22/26 8:15 PM, Venkat Rao Bagalkote wrote:
>>>>> Greetings!!
>>>>>
>>>>> IBM CI has reported build failure of 20260122 on IBM Power server.
>>>>>
>>>>>
>>>>> Error:
>>>>>
>>>>>
>>>>> ERROR: modpost: "phy_get_rx_polarity" [drivers/net/phy/
>>>>> air_en8811h.ko] undefined!
>>>>> ERROR: modpost: "phy_get_tx_polarity" [drivers/net/phy/
>>>>> air_en8811h.ko] undefined!
>>>>> make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
>>>>> make[1]: *** [/home/upstreamci/linux/Makefile:2040: modpost] Error 2
>>>>> make: *** [Makefile:248: __sub-make] Error 2
>>
>> Thanks for the config file.
>>
>> The probleme is because allthough CONFIG_PHY_COMMON_PROPS is selected,
>> drivers/phy/phy-common-props.o is not built because CONFIG_GENERIC_PHY
>> is not selected.
>>
>> Likely comes from commit 66d8a334b57e ("net: phy: air_en8811h: deprecate
>> "airoha,pnswap-rx" and "airoha,pnswap-tx"")
>>
>> Christophe
> 
> The intention was for drivers/phy/phy-common-props.o to be
> buildable/usable without CONFIG_GENERIC_PHY.
> 
> Does this help?

Yes it fixes the build for me.

Christophe

> 
> diff --git a/drivers/Makefile b/drivers/Makefile
> index ccc05f1eae3e..53fbd2e0acdd 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -10,7 +10,7 @@ obj-y				+= cache/
>   obj-y				+= irqchip/
>   obj-y				+= bus/
>   
> -obj-$(CONFIG_GENERIC_PHY)	+= phy/
> +obj-y				+= phy/
>   
>   # GPIO must come after pinctrl as gpios may need to mux pins etc
>   obj-$(CONFIG_PINCTRL)		+= pinctrl/
> 
>>
>>
>>>>>
>>>>>
>>>>> IBM CI has bisected this issue and below is the bisection log.
>>>>>
>>>>>
>>>>> git bisect log
>>>>> git bisect log
>>>>> git bisect start
>>>>> # status: waiting for both good and bad commits
>>>>> # good: [24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7] Linux 6.19-rc6
>>>>> git bisect good 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
>>>>> # status: waiting for bad commit, 1 good commit known
>>>>> # bad: [a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d] Add linux-next
>>>>> specific files for 20260122
>>>>> git bisect bad a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
>>>>> # good: [2574bcf1765ec13bf3ef469aa5b15cce293aebb6] Merge branch
>>>>> 'master' of  Warning: Removed corrupted safelink.
>>>>> url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fbluetooth%2Fbluetooth-next.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C441b227c282845cf2a3308de5a5f8110%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639047563441808471%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=FlVDfg3VVHplFxnQpG4oQNlr5Mm3ZzaCve19hnomYNo%3D&reserved=0
>>>>> git bisect good 2574bcf1765ec13bf3ef469aa5b15cce293aebb6
>>>>> # good: [2ad38467d20c16f38d0cffad711ef4f4acdb8b29] Merge branch 'for-
>>>>> next' of  Warning: Removed corrupted safelink.
>>>>> url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Faxboe%2Flinux.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C441b227c282845cf2a3308de5a5f8110%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639047563441834557%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=ez4lgXXDn95PjgZNSAjwp%2BWbvJvQYLeHApGrODqs%2Fmc%3D&reserved=0
>>>>> git bisect good 2ad38467d20c16f38d0cffad711ef4f4acdb8b29
>>>>> # good: [a954370fea56ee1bf995524255a34da7a1ddb524] Merge branch 'for-
>>>>> next' of  Warning: Removed corrupted safelink.
>>>>> url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fpdx86%2Fplatform-drivers-x86.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C441b227c282845cf2a3308de5a5f8110%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639047563441853661%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=c4Fim5nuBV9O%2BfFTUltpoLTV19%2Fdy394PvzzGBxh8I4%3D&reserved=0
>>>>> git bisect good a954370fea56ee1bf995524255a34da7a1ddb524
>>>>> # good: [c7ec480f05dd0185a26f190471905ddf1215bc52] Merge branch
>>>>> 'staging-next' of  Warning: Removed corrupted safelink.
>>>>> url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fgregkh%2Fstaging.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C441b227c282845cf2a3308de5a5f8110%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639047563441870081%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=xgtRCeDKj7BL1EXx%2BSEtCzR5gaN6wKfihyiwh0AFsRM%3D&reserved=0
>>>>> git bisect good c7ec480f05dd0185a26f190471905ddf1215bc52
>>>>> # good: [4427398fed2b8e07a62fd4f3f6fcf9ffcf56829a] Merge branch 'for-
>>>>> next' of  Warning: Removed corrupted safelink.
>>>>> url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Flinusw%2Flinux-pinctrl.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C441b227c282845cf2a3308de5a5f8110%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639047563441887814%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=AzoGH2fuDhFyYqK9JxlVZEsx3V7P5x8Yc8%2BuVE%2BBHJ4%3D&reserved=0
>>>>> git bisect good 4427398fed2b8e07a62fd4f3f6fcf9ffcf56829a
>>>>> # good: [852ccea1ca3144beb7003976d4fa04dbf81b307b] Merge branch
>>>>> 'next' of  Warning: Removed corrupted safelink.
>>>>> url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fmic%2Flinux.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C441b227c282845cf2a3308de5a5f8110%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639047563441903764%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=%2BTtdFgkDy9QevJOIHlzjk7Jjd1390L6g0Nr5RpSTYp8%3D&reserved=0
>>>>> git bisect good 852ccea1ca3144beb7003976d4fa04dbf81b307b
>>>>> # good: [f174dabd307dfd92edacb34e8bee0384daa1bd2e] Merge branch
>>>>> 'next' of  Warning: Removed corrupted safelink.
>>>>> url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Flenb%2Flinux.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C441b227c282845cf2a3308de5a5f8110%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639047563441919983%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=%2BaVHILI%2FJcj%2BedPEPrJ1zFeSRGwuXUKb0VHFpZ%2Bp95s%3D&reserved=0
>>>>> git bisect good f174dabd307dfd92edacb34e8bee0384daa1bd2e
>>>>> # good: [e31f3c967c66cf03eecdf50fe138d05f635e3698] doc: Add
>>>>> housekeeping documentation
>>>>> git bisect good e31f3c967c66cf03eecdf50fe138d05f635e3698
>>>>> # good: [0cc83fc23debf3e2df19c4510a77fe2d60ab2693] gpu: nova-core:
>>>>> don't print raw PMU table entries
>>>>> git bisect good 0cc83fc23debf3e2df19c4510a77fe2d60ab2693
>>>>> # good: [75df6953fed6b7274f9c5080925ae4c8d3e424e6] Merge branch 'for-
>>>>> next' of  Warning: Removed corrupted safelink.
>>>>> url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ffrederic%2Flinux-dynticks.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C441b227c282845cf2a3308de5a5f8110%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639047563441936107%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=beNKxNQCA6SYkfbETF9eJYQ7mBFWwCKUFce6cwNbHUA%3D&reserved=0
>>>>> git bisect good 75df6953fed6b7274f9c5080925ae4c8d3e424e6
>>>>> # good: [086714bbb96f63785da251e1f8d1ce3e716a6e42] Merge tag 'v6.19-
>>>>> rc5' into drm-rust-next
>>>>> git bisect good 086714bbb96f63785da251e1f8d1ce3e716a6e42
>>>>> # good: [6ea52b6d8f33ae627f4dcf43b12b6e713a8b9331] drm/tyr: use
>>>>> read_poll_timeout
>>>>> git bisect good 6ea52b6d8f33ae627f4dcf43b12b6e713a8b9331
>>>>> # good: [b956937ce78fae5fa785f6a95f291e2137502c5e] drm: tyr: Mark BROKEN
>>>>> git bisect good b956937ce78fae5fa785f6a95f291e2137502c5e
>>>>> # first bad commit: [a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d] Add
>>>>> linux-next specific files for 20260122
>>>>>
>>>>>
>>>>> If you happen to fix, this please add below tag.
>>>>>
>>>>>
>>>>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>>>> I don't think that bisection helps very much.
>>>>
>>>> Can you post the kernel config file?
>>>>
>>>
>>> Attached is the .config file.
>>>
>>>
>>> GCC: gcc version 11.5.0 20240719 (Red Hat 11.5.0-2) (GCC)
>>>
>>> ld: GNU ld version 2.35.2-54.el9
>>>
>>>
>>> Regards,
>>>
>>> Venkat.
>>


