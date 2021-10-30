Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA8C44077E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 06:46:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hh6G85MH9z3cPr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 15:46:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hh6Fk3jbfz2yKK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Oct 2021 15:46:31 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Hh6Fc6J51z9sST;
 Sat, 30 Oct 2021 06:46:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n86lCrBIDXgC; Sat, 30 Oct 2021 06:46:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Hh6Fc5JQhz9sSM;
 Sat, 30 Oct 2021 06:46:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D2628B768;
 Sat, 30 Oct 2021 06:46:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id S1NDqDmCduDo; Sat, 30 Oct 2021 06:46:28 +0200 (CEST)
Received: from [192.168.233.13] (unknown [192.168.233.13])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 427A28B763;
 Sat, 30 Oct 2021 06:46:28 +0200 (CEST)
Message-ID: <064efc28-eb86-b729-0bb0-b1f5ed5bbf60@csgroup.eu>
Date: Sat, 30 Oct 2021 06:46:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 1/1] soc: fsl: Replace kernel.h with the necessary
 inclusions
Content-Language: fr-FR
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20211027153354.81129-1-andriy.shevchenko@linux.intel.com>
 <YXwZihLk1njsBNT4@smile.fi.intel.com>
 <c0524c86-fc7e-632a-8b2a-862695529115@csgroup.eu>
 <CAHp75VeB8Dmr6Hrupb1Hj=D=oG1zPyJrhCXu37QtXHNNKdNvZg@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <CAHp75VeB8Dmr6Hrupb1Hj=D=oG1zPyJrhCXu37QtXHNNKdNvZg@mail.gmail.com>
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Le 29/10/2021 à 22:31, Andy Shevchenko a écrit :
> On Fri, Oct 29, 2021 at 10:04 PM LEROY Christophe
> <christophe.leroy@csgroup.eu> wrote:
>>
>>
>>
>> Le 29/10/2021 à 17:55, Andy Shevchenko a écrit :
>>> On Wed, Oct 27, 2021 at 06:33:54PM +0300, Andy Shevchenko wrote:
>>>> When kernel.h is used in the headers it adds a lot into dependency hell,
>>>> especially when there are circular dependencies are involved.
>>>>
>>>> Replace kernel.h inclusion with the list of what is really being used.
>>>
>>> Seems nobody from PPC took this patch.
>>> Any idea who can take it?
>>>
>>
>> You have to check in MAINTAINERS file in the root directory of kernel
>> sources: https://github.com/linuxppc/linux/blob/master/MAINTAINERS
> 
> Actually for these files get_maintainer.pl showed nothing.
> I have chosen PPC maintainers manually.
> 
>> That's Michael who takes them. But you have to allow him enough time for it.
> 
> Thanks!
> 
> I wrote that message because I have got a notification from checkpatch
> that it should go somewhere else.
> 

That means that Michael considered it is not for him.

And I think the reason is that in MAINTAINERS you have:

FREESCALE QUICC ENGINE LIBRARY
M:	Qiang Zhao <qiang.zhao@nxp.com>
L:	linuxppc-dev@lists.ozlabs.org
S:	Maintained
F:	drivers/soc/fsl/qe/
F:	include/soc/fsl/*qe*.h
F:	include/soc/fsl/*ucc*.h


FREESCALE SOC DRIVERS
M:	Li Yang <leoyang.li@nxp.com>
L:	linuxppc-dev@lists.ozlabs.org
L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
S:	Maintained
F:	Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml
F:	Documentation/devicetree/bindings/soc/fsl/
F:	drivers/soc/fsl/
F:	include/linux/fsl/

Sorry I overlooked your patch.

Christophe
