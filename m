Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C75B77462A0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 20:40:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=UYuVx8uN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvvqS52lyz3bwp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 04:40:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=UYuVx8uN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.23; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr [80.12.242.23])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvvpZ2jWPz30hM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jul 2023 04:39:15 +1000 (AEST)
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id GMvbqaLPIL1SxGMvcqewci; Mon, 03 Jul 2023 19:01:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1688403696;
	bh=vHaTg43ZN4pIqH0XjXUyIHPFQb3nQdBrMYDjetNLFHM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UYuVx8uN3j2zQ1Mj6NoQNPv2Vn3M3UmX2kUAmwh91xHCBmSln+5lvS0Xkskkuw8kg
	 KKootEW+nAqL5ZxwXoLZAai/2L1plig0O9M/qQZjdmRNUNziTh5t8qZF7frgly9HlH
	 9fCQV1+wNvF0JqWAWyiz/WfMQf1SIQemHnDTejaK+LiFDKuia2kw7GtOpgZNd7eyQq
	 nXc84LC9poLQwvAbwB5yDUbS5nzK2cMqsvfaFSjTvyUUBSSxwu0G7kgRG9SCjiAyA7
	 ZKZMKkd/WHajeNDRsc09Xl6oUxOLrmUdvQc8k2ayx82AubPdhuOPZgyF5ZbKaUmrBq
	 XNGv8ZIj0ny/Q==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 03 Jul 2023 19:01:36 +0200
X-ME-IP: 86.243.2.178
Message-ID: <f97e8c26-1379-dabc-21af-ebf4b06b31e7@wanadoo.fr>
Date: Mon, 3 Jul 2023 19:01:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] powerpc: powermac: Use of_get_cpu_hwid() to read CPU node
 'reg'
To: Michael Ellerman <patch-notifications@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Rob Herring <robh@kernel.org>
References: <20230319145931.65499-1-robh@kernel.org>
 <168836201902.50010.13066091729121047041.b4-ty@ellerman.id.au>
Content-Language: fr, en-US
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <168836201902.50010.13066091729121047041.b4-ty@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 03/07/2023 à 07:26, Michael Ellerman a écrit :
> On Sun, 19 Mar 2023 09:59:31 -0500, Rob Herring wrote:
>> Replace open coded reading of CPU nodes' "reg" properties with
>> of_get_cpu_hwid() dedicated for this purpose.
>>
>>
> 
> Applied to powerpc/next.
> 
> [1/1] powerpc: powermac: Use of_get_cpu_hwid() to read CPU node 'reg'
>        https://git.kernel.org/powerpc/c/bc1cf75027585f8d87f94e464ee5909acf885a8c
> 
> cheers
> 

Hi,

I guess, that it does not really matter, but shouldn't the 
of_node_put() be *after* the "reset_io = *rst;" statements to be 
absolutely safe?


(This change is in my backlog and I have apparently never proposed it)

CJ
