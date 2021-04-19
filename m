Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F25943644D7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 15:38:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP7Dy2CjLz30J0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 23:38:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FP7Dd1w1Zz2xYx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 23:38:05 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FP7DQ0MNQz9txvF;
 Mon, 19 Apr 2021 15:37:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id tq4_mdvpTVt5; Mon, 19 Apr 2021 15:37:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FP7DP5hbsz9txvC;
 Mon, 19 Apr 2021 15:37:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DD5338B7BD;
 Mon, 19 Apr 2021 15:38:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id BdXw8b78KlDs; Mon, 19 Apr 2021 15:38:02 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 48A138B7B4;
 Mon, 19 Apr 2021 15:38:02 +0200 (CEST)
Subject: Re: [PATCH 2/2] powerpc: add ALTIVEC support to lib/ when PPC_FPU not
 set
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20210418201726.32130-1-rdunlap@infradead.org>
 <20210418201726.32130-2-rdunlap@infradead.org>
 <20210419133209.GR26583@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <4f5aea37-f638-3fde-0680-ec456ad91141@csgroup.eu>
Date: Mon, 19 Apr 2021 15:38:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210419133209.GR26583@gate.crashing.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/04/2021 à 15:32, Segher Boessenkool a écrit :
> Hi!
> 
> On Sun, Apr 18, 2021 at 01:17:26PM -0700, Randy Dunlap wrote:
>> Add ldstfp.o to the Makefile for CONFIG_ALTIVEC and add
>> externs for get_vr() and put_vr() in lib/sstep.c to fix the
>> build errors.
> 
>>   obj-$(CONFIG_PPC_FPU)	+= ldstfp.o
>> +obj-$(CONFIG_ALTIVEC)	+= ldstfp.o
> 
> It is probably a good idea to split ldstfp.S into two, one for each of
> the two configuration options?
> 

Or we can build it all the time and #ifdef the FPU part.

Because it contains FPU, ALTIVEC and VSX stuff.

Christophe
