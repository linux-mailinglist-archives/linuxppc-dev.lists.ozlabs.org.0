Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C06E2AA42D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 10:14:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSs5T41M9zDqwr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 20:14:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSs3V4jmPzDrQc
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 20:12:37 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CSs3P297Wz9v6vF;
 Sat,  7 Nov 2020 10:12:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id RkBNfoV0imP0; Sat,  7 Nov 2020 10:12:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CSs3N6qNPz9v6vD;
 Sat,  7 Nov 2020 10:12:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0B9B28B776;
 Sat,  7 Nov 2020 10:12:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ulalRhQSzBtJ; Sat,  7 Nov 2020 10:12:33 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9FC888B75B;
 Sat,  7 Nov 2020 10:12:33 +0100 (CET)
Subject: Re: [PATCH] powerpc/32s: Setup the early hash table at all time.
To: Andreas Schwab <schwab@linux-m68k.org>
References: <b8f8101c368b8a6451844a58d7bd7d83c14cf2aa.1601566529.git.christophe.leroy@csgroup.eu>
 <87wnz8vizm.fsf@igel.home>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <30b6696d-b78e-cb95-6700-70b69e3947ba@csgroup.eu>
Date: Sat, 7 Nov 2020 10:12:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87wnz8vizm.fsf@igel.home>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 29/10/2020 à 22:07, Andreas Schwab a écrit :
> On Okt 01 2020, Christophe Leroy wrote:
> 
>> At the time being, an early hash table is set up when
>> CONFIG_KASAN is selected.
>>
>> There is nothing wrong with setting such an early hash table
>> all the time, even if it is not used. This is a statically
>> allocated 256 kB table which lies in the init data section.
>>
>> This makes the code simpler and may in the future allow to
>> setup early IO mappings with fixmap instead of hard coding BATs.
>>
>> Put create_hpte() and flush_hash_pages() in the .ref.text section
>> in order to avoid warning for the reference to early_hash[]. This
>> reference is removed by MMU_init_hw_patch() before init memory is
>> freed.
> 
> This breaks booting on the iBook G4.
> 

Can you test patch 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/9e225a856a8b22e0e77587ee22ab7a2f5bca8753.1604740029.git.christophe.leroy@csgroup.eu/

Thanks
Christophe
