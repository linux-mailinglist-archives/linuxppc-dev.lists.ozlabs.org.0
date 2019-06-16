Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 427FC473C8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jun 2019 10:26:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45RS9C0J0tzDqsQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jun 2019 18:26:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="LpkytxuO"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45RS3b44ctzDqVj
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jun 2019 18:21:13 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45RS3N3ySYz9v19p;
 Sun, 16 Jun 2019 10:21:04 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=LpkytxuO; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id oOyNzZ6g3_Ow; Sun, 16 Jun 2019 10:21:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45RS3N2lq6z9v19n;
 Sun, 16 Jun 2019 10:21:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560673264; bh=MJqSgQzXgPmNRPH0n1stQKb77v16xTqSmd2hmNpUr2w=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LpkytxuOtptABTtek2rOH7LeGpz8Or6fj84OACjTSEJDJQIvNnHE5/j8krvqEwpxE
 vO+F+wOkd3yWlb1uvraSVvekL98iyLv/W8MwKn/7jafLNGynKgTIkt4T7+UpY7mlqY
 QJkYO7mPH8RA9QDnRZYWr/QtKRwyr5gNtEOJhE+I=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 37F1C8B7D1;
 Sun, 16 Jun 2019 10:21:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id KGIqsT9_FfFn; Sun, 16 Jun 2019 10:21:07 +0200 (CEST)
Received: from [192.168.232.53] (unknown [192.168.232.53])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 949188B7CD;
 Sun, 16 Jun 2019 10:21:06 +0200 (CEST)
Subject: Re: [PATCH v5 13/16] powerpc/mm/32s: Use BATs for STRICT_KERNEL_RWX
To: Andreas Schwab <schwab@linux-m68k.org>
References: <cover.1550775950.git.christophe.leroy@c-s.fr>
 <1e412310cc18ea654fb2ce4c935654d8d1069f27.1550775950.git.christophe.leroy@c-s.fr>
 <877e9n9gng.fsf@igel.home>
From: christophe leroy <christophe.leroy@c-s.fr>
Message-ID: <1c271e47-6917-2f29-97b6-f3160ddf5117@c-s.fr>
Date: Sun, 16 Jun 2019 10:01:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <877e9n9gng.fsf@igel.home>
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
Cc: j.neuschaefer@gmx.net, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/06/2019 à 14:28, Andreas Schwab a écrit :
> On Feb 21 2019, Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> 
>> diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
>> index a000768a5cc9..6e56a6240bfa 100644
>> --- a/arch/powerpc/mm/pgtable_32.c
>> +++ b/arch/powerpc/mm/pgtable_32.c
>> @@ -353,7 +353,10 @@ void mark_initmem_nx(void)
>>   	unsigned long numpages = PFN_UP((unsigned long)_einittext) -
>>   				 PFN_DOWN((unsigned long)_sinittext);
>>   
>> -	change_page_attr(page, numpages, PAGE_KERNEL);
>> +	if (v_block_mapped((unsigned long)_stext) + 1)
> 
> That is always true.
> 

Did you boot with 'nobats' kernel parameter ?

If not, that's normal to be true, it means that memory is mapped with BATs.

When you boot with 'nobats' parameter, this should return false.

Christophe

---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

