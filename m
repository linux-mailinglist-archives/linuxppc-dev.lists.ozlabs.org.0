Return-Path: <linuxppc-dev+bounces-3702-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7C29E1713
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 10:19:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2ZqX1TwDz301B;
	Tue,  3 Dec 2024 20:19:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733217592;
	cv=none; b=KQ9FbfUNODOv0kJXcRzGug3zXB+GMjDpQW/s8Loeh/COaE09urEXe9w8qdJ438/ndsiTrTtAEtZuuN4VdLCltIKxiEJpDHm/RJbuzfcVz9sxVyJW8Ayy11qlILtGtzMeDwFYF5a5ofMfPzxyBV2wCpowxDRNRx/f3Lv5ggcHS4b6guesMvHoONm5hMUK8AnG8xqfqwQOm8C4eGsOmLxVSCAkhChasP5j0+0PYAONFDjJ+nV2UkBWPq4MaQwhOO79EoihzUikPpIMsZlaqNXRFgEmwVTPDkcl+5kPq+BcoxYVII5hMte34WIkyaJ1E+1IeicBzP8ggHaAiSnKE7Jh9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733217592; c=relaxed/relaxed;
	bh=zQan78UbkQ/alhfrQKkXZgWFId/XH9E7ZyKwQgo7br4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lL/Qgdjlfk3lPxKNEdfA7cdGn//H5Ec/JXt+3oYredNQ0yR4knd4czMhwI/081hoZMYA/A9e0ieW29q6TWokh4d/TVoXgnJsevZKcdG1tS0KxXYNskSKSdwttIbs2uPNRHVroSau+T/+DL/Qtr0AneRClPnwAWHAoZ3VHWu6l4Punkcz0HtiFIRXxSyTy/ZZUW1JjAtCpOufxAufOZ+EWG8Bg06i9KJaehqSJMCw1gjnUmzNZ0R2lpffFVKPckLp0c0BVS/Rpy8qjAyNSb4KVE70FOTP3wkFzGSozdNQk6E7eBRr4PhTappshReSdQS/rj4i4fBz3sEsCTCfsbpapg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2ZqW1DsQz2yvx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 20:19:50 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y2ZqR28TGz9sgW;
	Tue,  3 Dec 2024 10:19:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sw3a-00yiEBN; Tue,  3 Dec 2024 10:19:47 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y2ZqR1M5Yz9sgV;
	Tue,  3 Dec 2024 10:19:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1DFE48B765;
	Tue,  3 Dec 2024 10:19:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 64fMgQM2bso5; Tue,  3 Dec 2024 10:19:47 +0100 (CET)
Received: from [192.168.232.97] (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DDB438B763;
	Tue,  3 Dec 2024 10:19:46 +0100 (CET)
Message-ID: <fecc5d0f-0e84-4a77-bc1e-934e54037724@csgroup.eu>
Date: Tue, 3 Dec 2024 10:19:46 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND] macintosh: Fix spelling mistake "toogle" to "toggle"
To: Zhu Jun <zhujun2@cmss.chinamobile.com>, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
References: <20241203084200.7350-1-zhujun2@cmss.chinamobile.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241203084200.7350-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

Le 03/12/2024 à 09:42, Zhu Jun a écrit :
> There is a spelling mistake, Please fix it.

This text doesn't belong to a commit message, the patch cannot be 
applied with such a message.

By the way, can you explain why it is so urgent to fix a minor typo like 
this on a so old driver that hasn't got more than half a dozen of 
commits in the last 10 years, none of them been functionnal changes ?

Anybody who reads this comment will understand it despite the typo. To 
be honest most people won't even notice the type while reading.

Before sending such patches, have in mind the cost of handling such a 
change compared to its real benefit.


> 
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> ---
>   drivers/macintosh/adbhid.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/macintosh/adbhid.c b/drivers/macintosh/adbhid.c
> index b2fe7a3dc471..943a7123786a 100644
> --- a/drivers/macintosh/adbhid.c
> +++ b/drivers/macintosh/adbhid.c
> @@ -604,7 +604,7 @@ adbhid_buttons_input(unsigned char *data, int nb, int autopoll)
>   
>   			case 0x7f:
>   			case 0xff:
> -				/* keypad overlay toogle */
> +				/* keypad overlay toggle */
>   				break;
>   
>   			default:


