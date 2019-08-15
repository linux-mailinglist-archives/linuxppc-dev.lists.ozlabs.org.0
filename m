Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F49F8F296
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 19:52:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468Yv16mymzDqBN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 03:52:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="qf+XIDP8"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468Ys71xdhzDr6D
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 03:50:49 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 468Ys20ZtFz9tx4D;
 Thu, 15 Aug 2019 19:50:46 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=qf+XIDP8; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id V1pGUzF89EIS; Thu, 15 Aug 2019 19:50:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 468Ys16dVvz9twsp;
 Thu, 15 Aug 2019 19:50:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565891445; bh=mYcmYNZx8fLW8KDgWVfKY3NJrmxmFtyFpJdrqaTo1hI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qf+XIDP8KeBuBZwRr4VkQRx/EJq8bRtvSjDuWDOr2EbsrfBzxrEJyh0tKdV9sRuA3
 IXdqu9ME+DvF7eg6cPLGFIcVkjG2ipeFQBRs3mPnt3zYSEZCEzyeU+ls2zHVxldBFZ
 95M819ISkkahisRsPY22/Yilx5RN7vLAuO2NCvy4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DFD5F8B788;
 Thu, 15 Aug 2019 19:50:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mOcbrdItlKao; Thu, 15 Aug 2019 19:50:45 +0200 (CEST)
Received: from [192.168.232.53] (unknown [192.168.232.53])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8BAB98B755;
 Thu, 15 Aug 2019 19:50:45 +0200 (CEST)
Subject: Re: 5.2.7 kernel doesn't boot on G5
To: Christian Marillat <marillat@debian.org>
References: <87mugdtf08.fsf@christian.marillat.net>
 <CA+7wUsw5eTdwJG3UytWr9CajVhpUkyOGufmvUvqQJoEWq4nWhQ@mail.gmail.com>
 <a84c86b3-4c6c-f7a2-ad3f-6e075e6ebe25@c-s.fr>
 <87a7cal3pd.fsf@christian.marillat.net>
From: christophe leroy <christophe.leroy@c-s.fr>
Message-ID: <e582fcf0-a311-07f7-5445-c3471ec5c783@c-s.fr>
Date: Thu, 15 Aug 2019 19:50:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <87a7cal3pd.fsf@christian.marillat.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Antivirus: Avast (VPS 190815-2, 15/08/2019), Outbound message
X-Antivirus-Status: Clean
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
Cc: Mathieu Malaterre <malat@debian.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/08/2019 à 19:48, Christian Marillat a écrit :
> On 15 août 2019 19:29, christophe leroy <christophe.leroy@c-s.fr> wrote:
> 
>> Le 15/08/2019 à 19:05, Mathieu Malaterre a écrit :
>>> Does that ring a bell to anyone here ? Thanks
>>
>> Apparently that's 5.2.0, not 5.2.7
> 
> Yes, 5.2.7 is the Debian package version. Sorry for the mistake.
> 

Can you test with latest stable version, ie 5.2.8 ?

Christophe

---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

