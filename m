Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E6015AB28
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 15:44:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Hj7x60dszDqRF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 01:43:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=IP/xBWIV; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Hj662bZjzDqQ3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 01:42:20 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48Hj5z3w9sz9txMT;
 Wed, 12 Feb 2020 15:42:15 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=IP/xBWIV; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0Ney07egoNwa; Wed, 12 Feb 2020 15:42:15 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48Hj5z2j1Fz9txMJ;
 Wed, 12 Feb 2020 15:42:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581518535; bh=bAr/TswE2VMMLEod6DbaygLv0bA44xApmo6eiBQt5Jk=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=IP/xBWIVg6C7582meI+344Quc+xiKXsWItN6OAWoIW8toFDgjZ1/WnTo8jE2wN11m
 7bXAxtyVtcj9urCyggEQk5hwZgA4Qy1JsuKqNH6cC/0iL7o+254hArKUUI2i2h5ErG
 mksQxhyyADuNDqTLMJbtTGdGL48y1XiICT34J3aY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CFC528B81A;
 Wed, 12 Feb 2020 15:42:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id huEqZ1_u6whj; Wed, 12 Feb 2020 15:42:16 +0100 (CET)
Received: from [172.25.230.102] (po15451.idsi0.si.c-s.fr [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A92268B80D;
 Wed, 12 Feb 2020 15:42:16 +0100 (CET)
Subject: Re: [Regression 5.6-rc1][Bisected b6231ea2b3c6] Powerpc 8xx doesn't
 boot anymore
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Li Yang
 <leoyang.li@nxp.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <0d45fa64-51ee-0052-cb34-58c770c5b3ce@c-s.fr>
Message-ID: <1dee8082-e98e-c767-a8db-405a4fee7b2e@c-s.fr>
Date: Wed, 12 Feb 2020 15:42:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <0d45fa64-51ee-0052-cb34-58c770c5b3ce@c-s.fr>
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
Cc: Scott Wood <oss@buserror.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 12/02/2020 à 15:24, Christophe Leroy a écrit :
> Hi Rasmus,
> 

[...]

> 
> NB: Next time, can you please copy powerpc mailing list when changing 
> such core parts of powerpc CPUs ?

Apologise for that comment, in fact I was part of the recipients so it 
didn't land in my linuxppc mailbox.

Seems like I missed that series.
