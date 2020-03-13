Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60919184F43
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 20:26:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48fFzj4LDWzDqZN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Mar 2020 06:26:09 +1100 (AEDT)
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
 header.s=mail header.b=jPJ5U7XU; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48fFxs4klrzDqWP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Mar 2020 06:24:31 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48fFxm37jMz9vBSq;
 Fri, 13 Mar 2020 20:24:28 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=jPJ5U7XU; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sCJ1qMKipF5m; Fri, 13 Mar 2020 20:24:28 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48fFxm0bJGz9vBSn;
 Fri, 13 Mar 2020 20:24:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584127468; bh=oGg/6CLsP2vrCX0e3mcJfJmLT7XtQfwgp1ayZajashg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jPJ5U7XUrUkIOsgNWrVah/vvDWsI/iScNnGEWDpajpQzDQRAAje+IkPbeWn9gudEr
 y3IukLpqbN22allFMj8Faqt9/8lT0e45T7nOvaYtRwaQjFMzm9X661bMWCEk81T7H5
 1eGp3SxT6nNRK7DajxdHffUR4+BL1Ekzp8i14rH4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C81328B8D1;
 Fri, 13 Mar 2020 20:24:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id cH60zKUXPUZZ; Fri, 13 Mar 2020 20:24:27 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 51D528B8CE;
 Fri, 13 Mar 2020 20:24:26 +0100 (CET)
Subject: Re: [PATCH v2] powerpc/fsl-85xx: fix compile error
To: =?UTF-8?B?546L5paH6JmO?= <wenhu.wang@vivo.com>
References: <AIkAvQC8CBiKb1HKth-6ZqrH.3.1584123458318.Hmail.wenhu.wang@vivo.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <6eba5d46-bb3a-03bb-376d-2a6e684d018e@c-s.fr>
Date: Fri, 13 Mar 2020 20:24:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <AIkAvQC8CBiKb1HKth-6ZqrH.3.1584123458318.Hmail.wenhu.wang@vivo.com>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, trivial@kernel.org,
 kernel@vivo.com, linux-kernel@vger.kernel.org,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/03/2020 à 19:17, 王文虎 a écrit :
> 发件人：Christophe Leroy <christophe.leroy@c-s.fr>
> 发送日期：2020-03-14 01:45:11
> 收件人：WANG Wenhu <wenhu.wang@vivo.com>,Benjamin Herrenschmidt <benh@kernel.crashing.org>,Paul Mackerras <paulus@samba.org>,Michael Ellerman <mpe@ellerman.id.au>,Richard Fontana <rfontana@redhat.com>,Kate Stewart <kstewart@linuxfoundation.org>,Allison Randal <allison@lohutok.net>,Thomas Gleixner <tglx@linutronix.de>,linuxppc-dev@lists.ozlabs.org,linux-kernel@vger.kernel.org
> 抄送人：kernel@vivo.com,trivial@kernel.org
> 主题：Re: [PATCH v2] powerpc/fsl-85xx: fix compile error>
>>
>> Le 13/03/2020 à 18:19, WANG Wenhu a écrit :
>>> Include "linux/of_address.h" to fix the compile error for
>>> mpc85xx_l2ctlr_of_probe() when compiling fsl_85xx_cache_sram.c.
>>>
>>>     CC      arch/powerpc/sysdev/fsl_85xx_l2ctlr.o
>>> arch/powerpc/sysdev/fsl_85xx_l2ctlr.c: In function ‘mpc85xx_l2ctlr_of_probe’:
>>> arch/powerpc/sysdev/fsl_85xx_l2ctlr.c:90:11: error: implicit declaration of function ‘of_iomap’; did you mean ‘pci_iomap’? [-Werror=implicit-function-declaration]
>>>     l2ctlr = of_iomap(dev->dev.of_node, 0);
>>>              ^~~~~~~~
>>>              pci_iomap
>>> arch/powerpc/sysdev/fsl_85xx_l2ctlr.c:90:9: error: assignment makes pointer from integer without a cast [-Werror=int-conversion]
>>>     l2ctlr = of_iomap(dev->dev.of_node, 0);
>>>            ^
>>> cc1: all warnings being treated as errors
>>> scripts/Makefile.build:267: recipe for target 'arch/powerpc/sysdev/fsl_85xx_l2ctlr.o' failed
>>> make[2]: *** [arch/powerpc/sysdev/fsl_85xx_l2ctlr.o] Error 1
>>>
>>> Fixes: commit 6db92cc9d07d ("powerpc/85xx: add cache-sram support")
>>
>> Shouldn't you Cc stable as well ?
> Pretty sure if it makes a difference(that I did not recognize).
> Does the inconsistency of Cc lead to a failure on classification
> or something else which may confuse you?

See 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/process/submitting-patches.rst?h=v5.1.9#n299

>>
>>> Signed-off-by: WANG Wenhu <wenhu.wang@vivo.com>
>>> ---
>>
>> What's the difference between v1 and v2 ?
> The label field modification: "Fixed" -> "Fixes", which now is
> identified successfully. Really sorry for the fault on v1.

Ok. Usually people tell here (just below the ---) what is the difference 
between the different versions. It helps people understand what the 
changes are.

Christophe
