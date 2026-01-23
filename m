Return-Path: <linuxppc-dev+bounces-16224-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IYRMMc7c2kztgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16224-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 10:13:43 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C87CC730FE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 10:13:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyC0N2gknz2yFQ;
	Fri, 23 Jan 2026 20:13:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769159620;
	cv=none; b=B/XOfw3iGacOni0k97sgxLEVo46RNDYkgpRlqQz4d4AOSCgElpjjEF0USADzqtjxFZgcsZTZgmKsQUcy6+xSY9NwLH71q0+oxLrsNjctKdDrttOdOVfMGKjKboDWqiDuu/UhOu5o97MwVIHnC9SgUohSOZV2Ig0+Kb9Hfb2IM1cZs4anagyO5UNgmEYJyjHXwkyw6AvGqPVUglamDeimBDleziVX2iwL46MwUIAvz4vzdiNI4Cc4zWeLof26SsUpyJGcNHPVnDv6kg6RMa7ZtC6+bv7GX5YAHZmw5q93zdo3D2lnd+L6Qdb//fcHd1G26cfQsXbiAVV0B4+3BSvUBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769159620; c=relaxed/relaxed;
	bh=1AAqZUE8UCsF/OsB/0z9B5xJa/2dPxfmfUAGYA9HV+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q96yRDUftmH8HCN4/3qVlXf+/CGK0QFgDqSBwEwhZcwVGOx/HYpj6DAkZa7xQbtmV1tDDJfiiN8h6kj8F6EW+/eu0yoQcwdpWkD/T6cL0KYlSSeajJ6CYeAQKCu0Mnex9SED1vEWRY97ZAgTqTS7Re532OShrPooHqC31IQ9hoSQEhAmfyMQL6tC8wiBzSiBGm5niMBXI2OequijmsMFpDstWbmgiUfKJjsXJRwWa9zsRWbHbG5iEXYknstWdlSRzFpViUyKM8AaUdgMcCZmNZdRvh7PfxwROFKut24+eJnFt4PRWpHt8fYinFL10Vf1h9AUF1NsPiPTzZ1rB2veWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g0uQ3LrA; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g0uQ3LrA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyC0M3trYz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 20:13:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A2F440783;
	Fri, 23 Jan 2026 09:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB410C116D0;
	Fri, 23 Jan 2026 09:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769159617;
	bh=ZTFn7/3bQ1CDS7p7FdtM0pUddS89mKvroiYGmOhj6mY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g0uQ3LrA/M8t/j0b4GoB12m6Fx/Rwos5JlyQVmA9mjT9h5So0qyVP/8Si+VV5ESUQ
	 JxTBOOyTWXyVPDQuHBJ80zuzKVPHqw3jjkIWCTqNG5ZrO8IEEpxdcGm16dw6CqDj+u
	 JE3QsOZx30CfHxhOyajE9WduRo7Wwcy1otrfHtboAM1mYsjrzeX8T8AQvQw0iDCjMB
	 FUW2d53GlvTnqo+c2ru7ddd1yh0LuDtgJTPYTtCj9lgWY26eYtHjO4zdt1hR0FBebP
	 bfFTYIzvZE8TT9rLvhkKYwvDdkfni+oDabqgiOC6FiBYMeWhyXFWCyZqyJGrJ8mxAr
	 d9tdjT8aKKZgA==
Message-ID: <7c2ce068-feb1-462a-bd22-742ee6005833@kernel.org>
Date: Fri, 23 Jan 2026 10:13:32 +0100
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
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, broonie@kernel.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <43ea0202-891d-4582-980b-5cb557b41114@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <43ea0202-891d-4582-980b-5cb557b41114@linux.ibm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:venkat88@linux.ibm.com,m:maddy@linux.ibm.com,m:broonie@kernel.org,m:linux-next@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-16224-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.889];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:url,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: C87CC730FE
X-Rspamd-Action: no action



Le 23/01/2026 à 05:15, Venkat Rao Bagalkote a écrit :
> Greetings!!
> 
> IBM CI has reported build failure of 20260122 on IBM Power server.
> 
> 
> Error:
> 
> 
> ERROR: modpost: "phy_get_rx_polarity" [drivers/net/phy/air_en8811h.ko] 
> undefined!
> ERROR: modpost: "phy_get_tx_polarity" [drivers/net/phy/air_en8811h.ko] 
> undefined!
> make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
> make[1]: *** [/home/upstreamci/linux/Makefile:2040: modpost] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> 
> IBM CI has bisected this issue and below is the bisection log.

There is not much we can do without knowing the defconfig or .config you 
are using.

By the way the bisect makes no sense, the only bad one is the top commit 
"Add linux-next specific files for 20260122", which is unlikely because 
that commit does no modification to the code. Maybe your build was 
performed in an unclean tree ?

Christophe

> 
> 
> git bisect log
> git bisect log
> git bisect start
> # status: waiting for both good and bad commits
> # good: [24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7] Linux 6.19-rc6
> git bisect good 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
> # status: waiting for bad commit, 1 good commit known
> # bad: [a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d] Add linux-next 
> specific files for 20260122
> git bisect bad a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> # good: [2574bcf1765ec13bf3ef469aa5b15cce293aebb6] Merge branch 'master' 
> of https://eur01.safelinks.protection.outlook.com/? 
> url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fbluetooth%2Fbluetooth-next.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C5ee35d831e514e1bff1a08de5a362b5f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639047385864396440%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=A7TfQXbzy6JyL5CcrU2s3PPMHrV1eRXfbMcVN81a11o%3D&reserved=0
> git bisect good 2574bcf1765ec13bf3ef469aa5b15cce293aebb6
> # good: [2ad38467d20c16f38d0cffad711ef4f4acdb8b29] Merge branch 'for- 
> next' of https://eur01.safelinks.protection.outlook.com/? 
> url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Faxboe%2Flinux.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C5ee35d831e514e1bff1a08de5a362b5f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639047385864427942%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=zKGNjggnDwajcRrfBK6HD2eJi0hZdL3WYOKmoqqSPjE%3D&reserved=0
> git bisect good 2ad38467d20c16f38d0cffad711ef4f4acdb8b29
> # good: [a954370fea56ee1bf995524255a34da7a1ddb524] Merge branch 'for- 
> next' of https://eur01.safelinks.protection.outlook.com/? 
> url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fpdx86%2Fplatform-drivers-x86.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C5ee35d831e514e1bff1a08de5a362b5f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639047385864448127%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=oVyIGcLz%2FIZNbeCwkgyqzMqpXNkOY88tHmnEKFWS%2BEw%3D&reserved=0
> git bisect good a954370fea56ee1bf995524255a34da7a1ddb524
> # good: [c7ec480f05dd0185a26f190471905ddf1215bc52] Merge branch 
> 'staging-next' of https://eur01.safelinks.protection.outlook.com/? 
> url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fgregkh%2Fstaging.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C5ee35d831e514e1bff1a08de5a362b5f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639047385864466664%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=ebaGERLVHmNnviJwLTrtN7PB6InDeMOn5Lml7Evqr1c%3D&reserved=0
> git bisect good c7ec480f05dd0185a26f190471905ddf1215bc52
> # good: [4427398fed2b8e07a62fd4f3f6fcf9ffcf56829a] Merge branch 'for- 
> next' of https://eur01.safelinks.protection.outlook.com/? 
> url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Flinusw%2Flinux-pinctrl.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C5ee35d831e514e1bff1a08de5a362b5f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639047385864484024%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=WA03NVQrTOiVlskqsTyfqn%2BVY6Tm1H5%2BBukCvh1IAq8%3D&reserved=0
> git bisect good 4427398fed2b8e07a62fd4f3f6fcf9ffcf56829a
> # good: [852ccea1ca3144beb7003976d4fa04dbf81b307b] Merge branch 'next' 
> of https://eur01.safelinks.protection.outlook.com/? 
> url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fmic%2Flinux.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C5ee35d831e514e1bff1a08de5a362b5f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639047385864499934%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=Q612cIWS%2B6ND5DsEJv3AZPHnAmj1Lmb2HWqcTa6PH1k%3D&reserved=0
> git bisect good 852ccea1ca3144beb7003976d4fa04dbf81b307b
> # good: [f174dabd307dfd92edacb34e8bee0384daa1bd2e] Merge branch 'next' 
> of https://eur01.safelinks.protection.outlook.com/? 
> url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Flenb%2Flinux.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C5ee35d831e514e1bff1a08de5a362b5f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639047385864517803%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=qbf%2BWs7jFnkMKAMFp0cnA7FIzF2HSaV5mrCJlZIPT3M%3D&reserved=0
> git bisect good f174dabd307dfd92edacb34e8bee0384daa1bd2e
> # good: [e31f3c967c66cf03eecdf50fe138d05f635e3698] doc: Add housekeeping 
> documentation
> git bisect good e31f3c967c66cf03eecdf50fe138d05f635e3698
> # good: [0cc83fc23debf3e2df19c4510a77fe2d60ab2693] gpu: nova-core: don't 
> print raw PMU table entries
> git bisect good 0cc83fc23debf3e2df19c4510a77fe2d60ab2693
> # good: [75df6953fed6b7274f9c5080925ae4c8d3e424e6] Merge branch 'for- 
> next' of https://eur01.safelinks.protection.outlook.com/? 
> url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ffrederic%2Flinux-dynticks.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C5ee35d831e514e1bff1a08de5a362b5f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639047385864534131%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=fIZTPhnVHkR%2FwwscqpHeph8UcC1xH4v23vwGVIDlV8E%3D&reserved=0
> git bisect good 75df6953fed6b7274f9c5080925ae4c8d3e424e6
> # good: [086714bbb96f63785da251e1f8d1ce3e716a6e42] Merge tag 'v6.19-rc5' 
> into drm-rust-next
> git bisect good 086714bbb96f63785da251e1f8d1ce3e716a6e42
> # good: [6ea52b6d8f33ae627f4dcf43b12b6e713a8b9331] drm/tyr: use 
> read_poll_timeout
> git bisect good 6ea52b6d8f33ae627f4dcf43b12b6e713a8b9331
> # good: [b956937ce78fae5fa785f6a95f291e2137502c5e] drm: tyr: Mark BROKEN
> git bisect good b956937ce78fae5fa785f6a95f291e2137502c5e
> # first bad commit: [a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d] Add 
> linux-next specific files for 20260122
> 
> 
> If you happen to fix, this please add below tag.
> 
> 
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> 
> 
> Regards,
> 
> Venkat.
> 
> 
> 


