Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5113ED092
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 10:51:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp7Dg2TyMz3bXX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 18:51:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp7DD4dbWz300Q
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 18:50:52 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Gp7DB0llYz9sVj;
 Mon, 16 Aug 2021 10:50:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ETMT7ZC2k5_j; Mon, 16 Aug 2021 10:50:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Gp7D96wqhz9sVg;
 Mon, 16 Aug 2021 10:50:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CDA928B793;
 Mon, 16 Aug 2021 10:50:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id MxOXr_yE26Tw; Mon, 16 Aug 2021 10:50:49 +0200 (CEST)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A07C88B788;
 Mon, 16 Aug 2021 10:50:49 +0200 (CEST)
Subject: Re: [PATCH 0/2] powerpc: mpc855_ads defconfig fixes
To: Joel Stanley <joel@jms.id.au>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org
References: <20210816083126.2294522-1-joel@jms.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <802216ff-cec5-f887-1eed-e1377586607d@csgroup.eu>
Date: Mon, 16 Aug 2021 10:50:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210816083126.2294522-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 16/08/2021 à 10:31, Joel Stanley a écrit :
> The first was a build warning I noticed when testing something
> unrelated.
> 
> I took a moment to look into it, and came up with the second patch which
> updates the defconfig to make it easier to maintain in the future
> 
> It also fixes a regression where the MTD partition support dropped out
> of the config. Given noone noticed the regression since v4.20 was
> released, perhaps it could be left disabled?

Most likely nobody is using this board anymore. But that's a good to have it to perform CI builds. 
So we should leave that kind of config.


> 
> Joel Stanley (2):
>    powerpc/config: Fix IPV6 warning in mpc855_ads
>    powerpc/configs: Regenerate mpc885_ads_defconfig
> 
>   arch/powerpc/configs/mpc885_ads_defconfig | 49 +++++++++++------------
>   1 file changed, 23 insertions(+), 26 deletions(-)
> 
