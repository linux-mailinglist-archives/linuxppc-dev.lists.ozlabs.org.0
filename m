Return-Path: <linuxppc-dev+bounces-659-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC7B9620FF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 09:27:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtwwc4vnSz2ykc;
	Wed, 28 Aug 2024 17:27:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724830048;
	cv=none; b=f1vn17fvZb1LM7y5k7TXoz7RGAujXlMXAC9gmmdoNBAgtP/8Y5jDsOhl/w3UTNZK6NiGjGVGTkPDdSMH/cnieu42d5KkdLT8hZFD04iObyeJjNkc8UZo9JdyUFHZtV9NFWjg5a/UfcpesN24VvM04SVe8PXBWdXcLMSnEwPmZ2kMVEC0TXtiBI/4gJXTZUxxdmANff4TOqx+3saY6W+vAwMrIi8SEZ2UuGpyWW5+94mOvoccGOzoGkfsTw+363d6QLI4RAswYLJAlshH5gODsfCswC/42sHgPed+8PVNbsg/8suNQK5D0Mw9c7z9VdTOu5O80HIwygXBu7N/oetl7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724830048; c=relaxed/relaxed;
	bh=12p07206Nuk8cKKLrj9om9in1MZoVP/eSbXLTVcGPkE=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=R6rcb9sAwdF42BdJw4L3tjr2zdIK03biif+MScXihMx6bbI5SwVM/2nrbt/AXajqpTx8y61w+UD0E7qE241E52WRrTaqXcnA8JJVmgevmKLXIeU6o7XW67RH9oqopzdXLX/axEGVHCdwhIZu+WOLabOFt9TVX04Bgldb0zWkG+Sk8ruryT9LncLPOkWwYlHb4k770eimjOR67s3X8umkgWAy0pkhUUQlXfM1bRYDLZDSDk1sK4jb7BWPf975cNq8SaEUjCRcbKZD7kWvtkcrIH7Ye0g4ZqwiRFaSPgvLsv4qtf65BwZNgoj2vrc47UsLBLXTEm2Njfc9aK01wEaLlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wtwwc2V79z2yk6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 17:27:27 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WtwwX2MSgz9sRy;
	Wed, 28 Aug 2024 09:27:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id osLUnOEKVhtf; Wed, 28 Aug 2024 09:27:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WtwwX1S0jz9sRs;
	Wed, 28 Aug 2024 09:27:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 213588B77D;
	Wed, 28 Aug 2024 09:27:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id zSyAyn1xnuEH; Wed, 28 Aug 2024 09:27:24 +0200 (CEST)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id ECE9D8B764;
	Wed, 28 Aug 2024 09:27:23 +0200 (CEST)
Message-ID: <3fbdc957-2db4-4148-b325-263384f9a196@csgroup.eu>
Date: Wed, 28 Aug 2024 09:27:23 +0200
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
Subject: Re: [PATCH v1 2/2] powerpc/debug: hook to user return notifier
 infrastructure
To: Luming Yu <luming.yu@shingroup.cn>
Cc: "shenghui.qu@shingroup.cn" <shenghui.qu@shingroup.cn>,
 npiggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 mpe <mpe@ellerman.id.au>, "luming.yu" <luming.yu@gmail.com>,
 =?UTF-8?B?5p2o5L2z6b6Z?= <jialong.yang@shingroup.cn>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <B375A36C9C4D73FF+20231218031338.2084-1-luming.yu@shingroup.cn>
 <8734vzsw0q.fsf@kernel.org> <8734vyn1ky.fsf@mail.lhotse>
 <2acd6623-952b-4659-bc26-c632e94560a8@csgroup.eu>
 <0638f0a2-782b-411f-9937-c62d99e9562b@csgroup.eu>
 <tencent_4F2B3C0025D5A1722470D582@qq.com>
 <bd4908d2-cea9-406b-902f-618626e74c88@csgroup.eu>
 <B6A4506E3DD1F93F+Zs7Iq_EF799NyWHK@HX09040029.powercore.com.cn>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <B6A4506E3DD1F93F+Zs7Iq_EF799NyWHK@HX09040029.powercore.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 28/08/2024 à 08:50, Luming Yu a écrit :
> On Wed, Aug 28, 2024 at 07:46:52AM +0200, Christophe Leroy wrote:
>> Hi,
>>
>> Le 28/08/2024 à 05:17, 虞陆铭 a écrit :
>>> Hi,
>>>
>>> it appears the little feature might require a little bit more work to find its value of the patch.
>>>
>>> Using the following debug module ,  some debugging shows the TIF_USER_RETURN_NOTIFY
>>> bit is propagated in __switch_to among tasks , but USER_RETURN_NOTIFY call back seems to
>>> be dropped somewhere on somone who carries the bit return to user space.
>>> side notes:
>>> there is an issue that the module symbols is not appended to /sys/kernel/debug/tracing/available_filter_functions
>>> which should be sovled first to make it easier for further debuggig.
>>
>> As far as I can see, user return notifier infrastructure was implemented in
>> 2009 for KVM on x86, see
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F1253105134-8862-1-git-send-email-avi%40redhat.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C260e5ecf10764312459c08dcc72dc2f5%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638604246584044745%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3hjAzcVu3xOq0QNK5WINQ8trLd9Xp7XCiQjw2htabpQ%3D&reserved=0
>>
>> Can you explain what is your usage of that infrastructure with your patch ?
>> You are talking about debug, what's the added value, what is it used for ?
> one example: I was thinking to live patch kernel at the moment that all cpus are
> either returning to user space or going into idle. But I'm not sure if it is truly
> valuable. secondly, it can help us get more accurate user/system time
> accounting via tracing rather than through sampling technique.
> The third: it could have similar usages in kvm for ppc as x86 for tsc_aux.
> etc :-)

Thanks.

Don't we already have a very accurate user/system time accounting with 
CONFIG_VIRT_CPU_ACCOUNTING_NATIVE ?

Christophe


