Return-Path: <linuxppc-dev+bounces-8477-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E8EAB1AE2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 18:50:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZvFPF0r9cz2yQJ;
	Sat, 10 May 2025 02:50:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746809439;
	cv=none; b=VB3g73JzXjFd5t9avLmxt36TjIQa3YrP6+1ZCiTwjzTkUqyDBj7Tr/H+HF+IEKit7kmf6EuA39jXCoyvCqfg83fs6VaBmFyXzjAIhQX7lJzEpxpdnQW2DZ3o7IEMocBCQuvhDImWJchwMo38GgWHrSUI8qwR1K++Hn6KkSlxCCANGMK/7CMX3fiS/+1h/XjrjSFLAkc88UyrXfeiALLEo/oSOM/2LOK3UpX8FPauZS5Qq05BBX4ZyysOXRF2MyvM6/ndEQPXualjqdfYnTswXyL4XUSu1S/rvty9YWrSJ7c+Mp91zF94oSNPYtxa6aZbcnD6/pMk/oykPRJpC2YYJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746809439; c=relaxed/relaxed;
	bh=7BT6JiNU7zVUtcWGo06dyNCKR86/Yl4O7QIBKqYCIBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ax9uxf+VN5bsqVe8Ymvh0NVMW5xjDzyUylfQ3Hexy/TDKDAtVg7DQ/62gQylKV81YNW7JuDZYMGU4a+czEQYWav03OSlq2lwA5C4hicNzr4lyLQ+bNWKnm7nUxCRHQySQSkqYreSzQZJCSXpa+clcdR6ojikfMRzmh1Y72KwJ30p8ywBLr/0tZJBYiJklORIuszcByho0x3+y9Jm7QTRNp141Dk5P6uuuPYmAvVGmJVvOHiIE0yJdSkBS2cxdotBq+ebE0ZkGqzuCG9i4oePHUGViuHy356aeS2PWONhDcpRCrIorD92Yu0olm3zFIWv64RCDZflZOrZm6+8P6ZHiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZvFPB2T5gz2xgX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 May 2025 02:50:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZvDfC6QXQz9s36;
	Fri,  9 May 2025 18:16:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bmZ_rCyi93iu; Fri,  9 May 2025 18:16:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZvDfC5bgPz9s2l;
	Fri,  9 May 2025 18:16:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B57FD8B776;
	Fri,  9 May 2025 18:16:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id tsIaKHYPXzrZ; Fri,  9 May 2025 18:16:51 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 353888B768;
	Fri,  9 May 2025 18:16:51 +0200 (CEST)
Message-ID: <40ccd7fb-a1c8-4fb0-8813-0575c4afe505@csgroup.eu>
Date: Fri, 9 May 2025 18:16:50 +0200
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
Subject: Re: [PATCH v2] soc: fsl: qe: remove unused qe_ic_from_irq function
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, qiang.zhao@nxp.com,
 leoyang.li@nxp.com, nathan@kernel.org,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Tom Rix <trix@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230320125202.1721775-1-trix@redhat.com>
 <174680087395.258053.1870729490363422870.b4-ty@linaro.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <174680087395.258053.1870729490363422870.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 09/05/2025 à 16:28, Krzysztof Kozlowski a écrit :
> 
> On Mon, 20 Mar 2023 08:52:02 -0400, Tom Rix wrote:
>> clang with W=1 reports
>> drivers/soc/fsl/qe/qe_ic.c:235:29: error: unused function
>>    'qe_ic_from_irq' [-Werror,-Wunused-function]
>> static inline struct qe_ic *qe_ic_from_irq(unsigned int virq)
>>                              ^
>> The use of this function was removed with
>> commit d7c2878cfcfa ("soc: fsl: qe: remove unused qe_ic_set_* functions")
>>
>> [...]
> 
> 
> Commit from 2021:
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F1619002613-18216-1-git-send-email-jiapeng.chong%40linux.alibaba.com%2F&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7Cd5ee085f1ff64e69aec608dd8f05d608%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638823977413929827%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=kaeZGwikWMhIhz9iC6ZEVs%2Ffbd9UsZHJz7vBbODUHgg%3D&reserved=0
> 
> did not apply, but this applies.
> 
> I am annoying hitting this warning on every W=1 build, so:


Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>



> 
> Applied, thanks!
> 
> [1/1] soc: fsl: qe: remove unused qe_ic_from_irq function
>        https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fkrzk%2Flinux-dt%2Fc%2Fd47f1233374597c348696c3da2142cc92a36fc90&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7Cd5ee085f1ff64e69aec608dd8f05d608%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638823977413952218%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=HzwgkKFqffwtkmoskS9Y1OhlXShSW%2B%2BZLKxc3k3fCpA%3D&reserved=0
> 
> Best regards,


