Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 082167EB99
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 06:40:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460DxN1pjgzDqhk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 14:40:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="OrECB1Qi"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460Dvd67NpzDqg7
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 14:39:06 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 460DvS6qFmz9vBfl;
 Fri,  2 Aug 2019 06:39:00 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=OrECB1Qi; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id VmsG6ZbgH4qa; Fri,  2 Aug 2019 06:39:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 460DvS5jsZz9vBfh;
 Fri,  2 Aug 2019 06:39:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1564720740; bh=q4ZMvCC9pF+bx4xNGwk+CVz7RuBSg1EdnJ2pgjPeQI8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OrECB1QiT0LZ6vxWcdJhfnUKF4ps7URVPjA44CCjsevXP15OMtx9gDt9OxbJa6e0G
 glOX9ChRVQVt0QfagwdFNriKpYrVMu7PCJBph3/SUepixBj/d75xTeoTwgzqYkDzWu
 103672yojHYi0i9DGUq+onvK/LJGTNefcAYtlff8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A33F28B795;
 Fri,  2 Aug 2019 06:39:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rZwoK36GmEMj; Fri,  2 Aug 2019 06:39:01 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 20BA28B74C;
 Fri,  2 Aug 2019 06:39:01 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc: Support CMDLINE_EXTEND
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "paulus@samba.org" <paulus@samba.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "malat@debian.org" <malat@debian.org>
References: <20190801021206.26799-1-chris.packham@alliedtelesis.co.nz>
 <0a47ab71-d968-5aaa-6b5f-bd255d2565dd@c-s.fr>
 <1564698745.4914.14.camel@alliedtelesis.co.nz>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <51bbac81-e252-ee27-3b9c-d315f69951ad@c-s.fr>
Date: Fri, 2 Aug 2019 06:39:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564698745.4914.14.camel@alliedtelesis.co.nz>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/08/2019 à 00:32, Chris Packham a écrit :
> On Thu, 2019-08-01 at 08:14 +0200, Christophe Leroy wrote:
>>
>> Le 01/08/2019 à 04:12, Chris Packham a écrit :
>>>
>>> Bring powerpc in line with other architectures that support
>>> extending or
>>> overriding the bootloader provided command line.
>>>
>>> The current behaviour is most like CMDLINE_FROM_BOOTLOADER where
>>> the
>>> bootloader command line is preferred but the kernel config can
>>> provide a
>>> fallback so CMDLINE_FROM_BOOTLOADER is the default. CMDLINE_EXTEND
>>> can
>>> be used to append the CMDLINE from the kernel config to the one
>>> provided
>>> by the bootloader.
>>>
>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>> ---
>>> While I'm at it does anyone think it's worth getting rid of the
>>> default CMDLINE
>>> value if CMDLINE_BOOL and maybe CMDLINE_BOOL? Every defconfig in
>>> the kernel
>>> that sets CMDLINE_BOOL=y also sets CMDLINE to something other than
>>> "console=ttyS0,9600 console=tty0 root=/dev/sda2". Removing
>>> CMDLINE_BOOL and
>>> unconditionally setting the default value of CMDLINE to "" would
>>> clean up the
>>> Kconfig even more.
>> Note
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co
>> mmit/?id=cbe46bd4f5104552b612505b73d366f66efc2341
>> which is already a step forward.
>>
>> I guess that default is for users selecting this option manually to
>> get
>> a first sensitive CMDLINE. But is it really worth it ?
>>
> 
> I'm not even sure if it is working as intended right now. Even without
> my changes if I use menuconfig and select CMDLINE_BOOL I end up with
> CONFIG_CMDLINE="" in the resulting .config.

I guess if the CONFIG_CMDLINE doesn't exist yet, it will get the default 
value. But if it is already there allthough empty, it will remain empty.
So yes I guess you could just drop it for this reason and the other 
reasons you said.

Christophe

