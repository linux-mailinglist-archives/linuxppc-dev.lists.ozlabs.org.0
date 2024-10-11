Return-Path: <linuxppc-dev+bounces-2125-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0627C99A8DA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 18:25:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQBnb2X6Pz3c1C;
	Sat, 12 Oct 2024 03:25:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728663955;
	cv=none; b=UluUEtH1HBJDXxOZzMIaskb3/rBv4rjWtbP8Pg/aMp8DiPFW85iVQoRK9gIWScZGeLXA2SboJ1vdhjHr+BxLLgcke+IrffVR9oszH3j2feFNgo6drVwMXYlTzMwaeIQd4+MPhc9LRD+1+TPMQEcfaxNx7UeAHWcCt8m149cNxq/saAlMhBtkQ3tZygPhZ5UenNscpHewbw7RcKe2nyTAwawsJCYhA45Q3O9/8LvJGz7WEeQFYE0KakIXBWtE2ne5xT9qfdVUSP6M48LwDvZ9pFu+P1RQgC1PZ1JOKp/WzL2OCNPOZxRpa5i2WbU6lNd9sjrtZ6eClHI4jzBhQDRPKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728663955; c=relaxed/relaxed;
	bh=uvNHlyvm6bjP/Vu1zDxAwEzFmHStf4uYbjgPFzdt4vI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WXn/f0GekGfZ0w+5iqRnXbT0llriM5rYlV0wLuIgB4xgCHy+qy4roes36yY/2WOQYVA0wxxy1gFOr/Acos+855UD2geFXCJDL7J/P4Bezi2vBItUhlol1KqOqzj2+jJPMQdxmtGNFYpLB7PSMBiSOypUB3prfdYm4iJ17co17gtw4tnA+kScNnqC6k2OsfusLJvT9uw6qoIhJfE0qJUn6WOQsMVaqkC0QlExgK/b61tzNXdhatH5NqZy8NV615uxHeCqil4uIcYuigBIDv8ywFjY7vNqnQ21b6P1cGK7J0r9JTr/Ekvw5dNtpENxU0UaAfPzTwCf00Wx3LsxhigOHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQBnZ28pYz3bsQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 03:25:53 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XQBnR6xkJz9sRy;
	Fri, 11 Oct 2024 18:25:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5JmGQAo84Yjs; Fri, 11 Oct 2024 18:25:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XQBnR5cGSz9sPd;
	Fri, 11 Oct 2024 18:25:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AFC408B7AD;
	Fri, 11 Oct 2024 18:25:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id nlZi6cgF6vzi; Fri, 11 Oct 2024 18:25:47 +0200 (CEST)
Received: from [192.168.232.203] (unknown [192.168.232.203])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1311F8B79E;
	Fri, 11 Oct 2024 18:25:47 +0200 (CEST)
Message-ID: <c629e544-f768-4063-bd2c-f72382bdf69b@csgroup.eu>
Date: Fri, 11 Oct 2024 18:25:45 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powermac: Use of_property_match_string() in
 pmac_has_backlight_type()
To: Markus Elfring <Markus.Elfring@web.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, Jani Nikula <jani.nikula@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Naveen N Rao <naveen@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <b7e69e04-e15c-41ec-b62b-37253debc654@web.de>
 <d9bdc1b6-ea7e-47aa-80aa-02ae649abf72@csgroup.eu>
 <ede25e03-7a14-4787-ae1b-4fc9290add5a@web.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <ede25e03-7a14-4787-ae1b-4fc9290add5a@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 11/10/2024 à 18:18, Markus Elfring a écrit :
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 11 Oct 2024 18:10:06 +0200
> 
> Replace an of_get_property() call by of_property_match_string()
> so that this function implementation can be simplified.
> 
> Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Link: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flinuxppc-dev%2Fd9bdc1b6-ea7e-47aa-80aa-02ae649abf72%40csgroup.eu%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cf278e44683c04b931b9c08dcea106447%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638642603333398766%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=6byvgvuGiBSVu8F6kLA2OozUuHZunJRH%2BU%2Bq9q7osmM%3D&reserved=0
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Link: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flinuxppc-dev%2F87cyk97ufp.fsf%40mail.lhotse%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cf278e44683c04b931b9c08dcea106447%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638642603333422636%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=IDuYfe3UoaIEmedJ07H67zvzrPnzbQ2g8EeTtbJ%2BbZ8%3D&reserved=0
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   arch/powerpc/platforms/powermac/backlight.c | 14 +++-----------
>   1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powermac/backlight.c b/arch/powerpc/platforms/powermac/backlight.c
> index 12bc01353bd3..79741370c40c 100644
> --- a/arch/powerpc/platforms/powermac/backlight.c
> +++ b/arch/powerpc/platforms/powermac/backlight.c
> @@ -57,18 +57,10 @@ struct backlight_device *pmac_backlight;
>   int pmac_has_backlight_type(const char *type)
>   {
>   	struct device_node* bk_node = of_find_node_by_name(NULL, "backlight");
> +	int i = of_property_match_string(bk_node, "backlight-control", type);
> 
> -	if (bk_node) {
> -		const char *prop = of_get_property(bk_node,
> -				"backlight-control", NULL);
> -		if (prop && strncmp(prop, type, strlen(type)) == 0) {
> -			of_node_put(bk_node);
> -			return 1;
> -		}
> -		of_node_put(bk_node);
> -	}
> -
> -	return 0;
> +	of_node_put(bk_node);
> +	return i >= 0;

Could have been:

	return !IS_ERR_VALUE(i);


Never mind,

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

>   }
> 
>   static void pmac_backlight_key_worker(struct work_struct *work)
> --
> 2.46.1
> 

