Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F2F473C6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jun 2019 10:22:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45RS5T0Br5zDqM7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jun 2019 18:22:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="JAcmLDvt"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45RS3b4z4jzDqgG
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jun 2019 18:21:13 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45RS3P5Wz2z9v19q;
 Sun, 16 Jun 2019 10:21:05 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=JAcmLDvt; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id OfUt7G1n3Fr2; Sun, 16 Jun 2019 10:21:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45RS3P4GXPz9v19n;
 Sun, 16 Jun 2019 10:21:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560673265; bh=1SrBWoXlclcq/cUIT3RSqtbhC9U/JqjMj1hkhPdAGfc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=JAcmLDvtikWnCc0qk3wwmvIx5s+X1XIF3kGGVFj05NirrMOD5XA/MYyYSbNlfoGkr
 6setvLyqHSqLbKLJdMkmifsiBDAQYBwqJtD8swRfT5kOQecmmbVNmbytPdUREIeK6q
 e7IQHnpQGcOtYO4QD28PAut5cm1wUmo38t6SuhZE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 72E808B7D1;
 Sun, 16 Jun 2019 10:21:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QnD6C3CT-bfe; Sun, 16 Jun 2019 10:21:08 +0200 (CEST)
Received: from [192.168.232.53] (unknown [192.168.232.53])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E9A958B7CD;
 Sun, 16 Jun 2019 10:21:07 +0200 (CEST)
Subject: Re: [PATCH] powerpc/mm/32s: only use MMU to mark initmem NX if
 STRICT_KERNEL_RWX
To: Andreas Schwab <schwab@linux-m68k.org>
References: <cover.1550775950.git.christophe.leroy@c-s.fr>
 <1e412310cc18ea654fb2ce4c935654d8d1069f27.1550775950.git.christophe.leroy@c-s.fr>
 <8736kb9fry.fsf_-_@igel.home>
 <20190615152559.Horde.0lTFIZALxZ-RI75z94G3jA8@messagerie.si.c-s.fr>
 <87pnne9aqo.fsf@igel.home>
From: christophe leroy <christophe.leroy@c-s.fr>
Message-ID: <7dd94b1c-08cb-c6ac-83c1-5b67a3dad2d8@c-s.fr>
Date: Sun, 16 Jun 2019 10:06:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <87pnne9aqo.fsf@igel.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Antivirus: Avast (VPS 190616-0, 16/06/2019), Outbound message
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
Cc: linux-kernel@vger.kernel.org, j.neuschaefer@gmx.net,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/06/2019 à 16:36, Andreas Schwab a écrit :
> On Jun 15 2019, Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> 
>> Andreas Schwab <schwab@linux-m68k.org> a écrit :
>>
>>> If STRICT_KERNEL_RWX is disabled, never use the MMU to mark initmen
>>> nonexecutable.
>>
>> I dont understand, can you elaborate ?
> 
> It breaks suspend.

Ok, but we need to explain why it breaks suspend, and again your patch 
is wrong anyway because that area of memory is mapped with BATs so you 
can't use change_page_attr()

> 
>> This area is mapped with BATs so using change_page_attr() is pointless.
> 
> There must be a reason STRICT_KERNEL_RWX is not available with
> HIBERNATE.

Yes but HIBERNATE and suspend are not the same thing. I guess HIBERNATE 
is not available with STRICT_KERNEL_RWX because HIBERNATE have to write 
back saved state into read-only memory as well.

Christophe

---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

