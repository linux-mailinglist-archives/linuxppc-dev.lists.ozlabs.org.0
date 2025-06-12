Return-Path: <linuxppc-dev+bounces-9309-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFCBAD70C4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 14:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJ2SY4RJsz2xQ6;
	Thu, 12 Jun 2025 22:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749732637;
	cv=none; b=WmZjD8pc8j7fe/ZM3iZ2klDOFcQyX0JMRrjRhQcHk+InxewxZhVZ3FxZw0mof1iKGavmwknQwsbAd6SmHwf4tj+6ua7QtqjAk3DjSOzKgjo6QAC5KZHNJEXw3AlMW3olEangwmo0GjVf77rLL3KdiAxo71iOmyq9lDWvPP3hS2P5tPMjOe3q5cJW8OfrgKvPMUD0W5UGht20dza0Skxzn02a4J8Kerjaszqidq8W5JdV1XDyh9K9WJ/8iiTmgGWnlegBXlq2wDV/1TJIGK5eDSHqGOUAEcG+7Qj12v616FB1nIRlXV7N7Qq7ifEXJn2E03nkpkFtR3LdYlwMVAdRlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749732637; c=relaxed/relaxed;
	bh=KgVR19zxLh0tvc6y1S3xgdWsNzcny/WA+Xqvr4yA/74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lfj8fTcl4NT4xi4iUorct781mGjHQ9zpGDjb+Qrbr53aDCH4bolIZgAztGIDG0yhCBeEYlT6WSfLD+P/xUzEDyumyCqylAgektbB6SzAZISDUFRbie8LtOnHoBtZxgbGNf5R7gwsxjyLwDiZqHtKVUkFu+XJwYyUW8HOa5XmwELjmOQX7YUNHT6vD1t28nEu/+wIAXeDPYkf0xdCThkwG/b55qSdiyF/9qPWnmfrmBI0XkqILsI96APMXDJUqPqCmQ5UDeJjDCbcUva2gotqgE4bvZXxTHn4nXJ1/XsUfMAiSU407ZGepXtR5VayZmbHXgdjmLvapk5syavrdvNogw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJ2SX3zFQz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 22:50:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bJ1zW1ZZcz9tNC;
	Thu, 12 Jun 2025 14:28:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zr2vrxnsQQ38; Thu, 12 Jun 2025 14:28:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bJ1zD0n2Kz9t2s;
	Thu, 12 Jun 2025 14:28:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 155E18B77B;
	Thu, 12 Jun 2025 14:28:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id oyxrjpKtRtzW; Thu, 12 Jun 2025 14:28:40 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 94E438B769;
	Thu, 12 Jun 2025 14:28:39 +0200 (CEST)
Message-ID: <af4e9c8f-edd6-4baf-bb24-caddf731da29@csgroup.eu>
Date: Thu, 12 Jun 2025 14:28:39 +0200
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
Subject: Re: [PATCH] soc: Use dev_fwnode()
To: Krzysztof Kozlowski <krzk@kernel.org>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, Qiang Zhao <qiang.zhao@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-tegra@vger.kernel.org
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-19-jirislaby@kernel.org>
 <22deb36a-ca61-4793-99b4-87f520445490@kernel.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <22deb36a-ca61-4793-99b4-87f520445490@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 12/06/2025 à 13:31, Krzysztof Kozlowski a écrit :
> On 11/06/2025 12:43, Jiri Slaby (SUSE) wrote:
>> irq_domain_create_simple() takes fwnode as the first argument. It can be
>> extracted from the struct device using dev_fwnode() helper instead of
>> using of_node with of_fwnode_handle().
>>
>> So use the dev_fwnode() helper.
>>
>> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
>> Cc: Qiang Zhao <qiang.zhao@nxp.com>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Thierry Reding <thierry.reding@gmail.com>
>> Cc: Jonathan Hunter <jonathanh@nvidia.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linuxppc-dev@lists.ozlabs.org
>>
>> ---
>> Cc: linux-tegra@vger.kernel.org
>> ---
>>   drivers/soc/fsl/qe/qe_ic.c | 3 +--
>>   drivers/soc/tegra/pmc.c    | 3 +--
> These are separate subsystems. You need to split the patch per each
> actual SoC vendor.
> 


It has already been Acked by Thierry Reding who maintains tegra so I can 
take this patch as is via soc/fsl tree.

Christophe

