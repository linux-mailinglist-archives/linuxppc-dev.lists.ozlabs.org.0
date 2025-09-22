Return-Path: <linuxppc-dev+bounces-12511-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4307B9225D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 18:12:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVp6V50hVz30Qk;
	Tue, 23 Sep 2025 02:12:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.12.242.26
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758557554;
	cv=none; b=aDgxDZ9iBvZz9caY7HaTRPipGfaXdEmll0qK1P+b/xOoTeHh2yHvYRoaTN6V9cytNgeZi6CttFPs4WUxlAVRYYAP0NODnsfw/WF9cgSeBiDPmosZOCujLATDA2V6rLUsb9q+D0RTgz0Ox9S4rUPieR6/r6ntXIo6JsaqjrCy4qPSsnoao/9kgCJ564yfGjyJ5Kxpk5+xXgNu+tWgjyFZoeP6CgP4PZSPO72tx/N/u6L2Vw8Fm3KJzNPGYUZud5td5Fklv4IwYhB8d/65Y8IL58vp0tNoE5CwltQipNwfBR9HH/IKcGOh6IgyXU+BEKkdiDG5WVITRffXNbQmLPG+ng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758557554; c=relaxed/relaxed;
	bh=V2p0dOk8nY38bVB5z/4E1OBvSqe8R/NqMBDLVbvEpuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HuvTDHbfd2PQLskTLFmQdZZdnAReV0Pk3wHvACVIfvqJ75tsVceby1Ubf7lIte5189djJAoi4CXfqgRNAIFSTndNtoJHmOTSZz4V+xDesFZ916sdRvBb9zxrq1M3j4NeB6K8LQkQOD4N9FCeBeBV0RGc7X471NE486XRZlJmwR5Gd0SOI576QAqlSQPWTSCQJK3evfdRZjKZCR5938JmxV5Atojk01a3KyRRqErN2QtjMikUctTazNu2axfJWRVL6LsrkmqECiapDwhkclozTgDQx/INP4cgsKUPAyWrWt9gDYxq666HcG5fUA0l2mQW590hAKlacJiohoA7m4KuSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=WjH5A3gT; dkim-atps=neutral; spf=pass (client-ip=80.12.242.26; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org) smtp.mailfrom=wanadoo.fr
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=WjH5A3gT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.26; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
X-Greylist: delayed 1950 seconds by postgrey-1.37 at boromir; Tue, 23 Sep 2025 02:12:32 AEST
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVp6S2lddz30HB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 02:12:31 +1000 (AEST)
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id 0ictvBDlTbkOW0ictvpHmD; Mon, 22 Sep 2025 17:38:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1758555533;
	bh=V2p0dOk8nY38bVB5z/4E1OBvSqe8R/NqMBDLVbvEpuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=WjH5A3gTeEuFhNiV/B2GK5o5zo4aJPBHMJZKCSJn88Z3vjHhHunVXfNgG7ne+JHhj
	 dkWTWzVNM1MtalryFtHg8wJ5Bf7KUg9JyG5pBUjZACfRTLNcjhtbxYLmX1dCURrXDW
	 lGJoQGlN15G80bkx/vwTIjR5kr6SREILz+4jJV0++xF+dmFjE+8ynWpd6DQnVRKQAc
	 T0MGwJxpyrtN1MSS6OC1NCIuJLs2ll5vpYgrNBo9uYTk7vAG11n7cQiWiGNCEl2i03
	 gfcmed8rR5wu8eDBzhta+pMOub0lNqEfIPoBINJl8BB2q3HR/5XnVWP8gCW6sHGnwx
	 rHRjAoAIALE9Q==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 22 Sep 2025 17:38:53 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <a7453bdc-16f3-43e6-a06d-bd6144eeae72@wanadoo.fr>
Date: Mon, 22 Sep 2025 17:38:51 +0200
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
Subject: Re: [PATCH v2] powerpc/smp: Add check for kcalloc() failure in
 parse_thread_groups()
To: Guangshuo Li <lgs201920130244@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250922151025.1821411-1-lgs201920130244@gmail.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <20250922151025.1821411-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Le 22/09/2025 à 17:10, Guangshuo Li a écrit :
> As kcalloc() may fail, check its return value to avoid a NULL pointer
> dereference when passing it to of_property_read_u32_array().
> 
> Fixes: 790a1662d3a26 ("powerpc/smp: Parse ibm,thread-groups with multiple properties")
> Cc: stable@vger.kernel.org

Signed-off-by that was part of v1, is missing in v2.

> ---
> changelog:
> v2:
> - Return -ENOMEM directly on allocation failure.

Except for a newline that is removed, v2 is the same as v1, or I miss 
something?

CJ

> 
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>   arch/powerpc/kernel/smp.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 5ac7084eebc0..cfccb9389760 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -822,6 +822,8 @@ static int parse_thread_groups(struct device_node *dn,
>   
>   	count = of_property_count_u32_elems(dn, "ibm,thread-groups");
>   	thread_group_array = kcalloc(count, sizeof(u32), GFP_KERNEL);
> +	if (!thread_group_array)
> +		return -ENOMEM;
>   	ret = of_property_read_u32_array(dn, "ibm,thread-groups",
>   					 thread_group_array, count);
>   	if (ret)


