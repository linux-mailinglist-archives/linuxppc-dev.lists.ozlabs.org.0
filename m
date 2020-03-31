Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 912E6199C2C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 18:53:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sFlW03DBzDr0B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 03:53:43 +1100 (AEDT)
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
 header.s=mail header.b=ai2x9csO; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sDzb0W9nzDqQY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 03:19:07 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48sDzT07Jnz9txJr;
 Tue, 31 Mar 2020 18:19:01 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ai2x9csO; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id N22mOPXF1ILt; Tue, 31 Mar 2020 18:19:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48sDzS5xVJz9txJq;
 Tue, 31 Mar 2020 18:19:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585671540; bh=NEXqywkSlgRfByPzbvoDJ/4fd6f+W61o5Ov6z4fNrJw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ai2x9csOQFjKRHxb8FXGuAvOBdasakK0lkMVidCfd/asmB8fqeLaSzey7JqjUkdQ1
 jNceU7gfV+ZdKWtgjiX0jvFTRJPetmVEVGiVRFLYXSym86udCuuqhGOKFjRc7wJ4F0
 Oj2CnxLZkLg4AWIz0ObHYSbZryQLkI2azOm+gn1o=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5C01C8B868;
 Tue, 31 Mar 2020 18:19:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id gnWL4mYvDiAU; Tue, 31 Mar 2020 18:19:02 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B85AC8B752;
 Tue, 31 Mar 2020 18:19:01 +0200 (CEST)
Subject: Re: [PATCH v2 09/11] powerpc/platforms: Move files from 4xx to 44x
To: Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>
References: <698e9a42a06eb856eef4501c3c0a182c034a5d8c.1585640941.git.christophe.leroy@c-s.fr>
 <50d0ce1a96fa978cd0dfabde30cf75d23691622a.1585640942.git.christophe.leroy@c-s.fr>
 <CAK8P3a3u4y7Zm8w43QScqUk6macBL1wO3S0qPisf9+d9FqSHfw@mail.gmail.com>
 <833d63fe-3b94-a3be-1abb-a629386aa0dd@c-s.fr>
 <CAK8P3a244P38c+JCRnf1EscQOSzaQQNZc6b5F=LFE2a_im8AqQ@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <74e76b4e-5e4f-f3de-96a8-f6a451b3243a@c-s.fr>
Date: Tue, 31 Mar 2020 18:19:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a244P38c+JCRnf1EscQOSzaQQNZc6b5F=LFE2a_im8AqQ@mail.gmail.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Paul Mackerras <paulus@samba.org>, Michal Simek <michal.simek@xilinx.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 31/03/2020 à 18:04, Arnd Bergmann a écrit :
> On Tue, Mar 31, 2020 at 5:26 PM Christophe Leroy
> <christophe.leroy@c-s.fr> wrote:
>> Le 31/03/2020 à 17:14, Arnd Bergmann a écrit :
>>> On Tue, Mar 31, 2020 at 9:49 AM Christophe Leroy
>>> <christophe.leroy@c-s.fr> wrote:
>>>>
>>>> Only 44x uses 4xx now, so only keep one directory.
>>>>
>>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>>> ---
>>>>    arch/powerpc/platforms/44x/Makefile           |  9 +++++++-
>>>>    arch/powerpc/platforms/{4xx => 44x}/cpm.c     |  0
>>>
>>> No objections to moving everything into one place, but I wonder if the
>>> combined name should be 4xx instead of 44x, given that 44x currently
>>> include 46x and 47x. OTOH your approach has the advantage of
>>> moving fewer files.
>>>
>>
>> In that case, should we also rename CONFIG_44x to CONFIG_4xx ?
> 
> That has the risk of breaking user's defconfig files, but given the
> small number of users, it may be nicer for consistency. In either
> case, the two symbols should probably hang around as synonyms,
> the question is just which one is user visible.
> 

Not sure it is a good idea to keep two synonyms. In the past we made our 
best to remove synonyms (We had CONFIG_8xx and CONFIG_PPC_8xx being 
synonyms, we had CONFIG_6xx and CONFIG_BOOK3S_32 and 
CONFIG_PPC_STD_MMU_32 being synonyms).
I think it is a lot cleaner when we can avoid synonyms.

By the way I already dropped CONFIG_4xx in previous patch (8/11). It was 
not many 4xx changed to 44x. It would be a lot more in the other way 
round I'm afraid.

But I agree with you it might be more natural to change to 4xx.

Michael, any preference ?

Christophe
