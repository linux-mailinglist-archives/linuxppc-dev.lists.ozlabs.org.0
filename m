Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C13B3B1719
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 11:42:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8ywW1lM5z308j
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 19:42:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8yw85y9tz2yXZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 19:41:57 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G8yw119tfz9xPS;
 Wed, 23 Jun 2021 11:41:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PDR_xenBtm_C; Wed, 23 Jun 2021 11:41:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G8yw02Y0jz9tTS;
 Wed, 23 Jun 2021 11:41:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F146D8B7CC;
 Wed, 23 Jun 2021 11:41:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VRZeKfM3XHFy; Wed, 23 Jun 2021 11:41:51 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 594E58B7CB;
 Wed, 23 Jun 2021 11:41:51 +0200 (CEST)
Subject: Re: nand: WARNING: a0000000.nand: the ECC used on your system
 (1b/256B) is too weak compared to the one required by the NAND chip (4b/512B)
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <817e89d4-790d-41a4-2a8e-9e119597e459@csgroup.eu>
 <20210618084326.0a074fb7@xps13>
 <d37a8a7e-6181-9642-18fb-470d1d8cf006@csgroup.eu>
 <20210618225032.69cdc30c@xps13>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6eb7f394-7e0e-8ecf-e741-f6e6cc322689@csgroup.eu>
Date: Wed, 23 Jun 2021 11:41:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210618225032.69cdc30c@xps13>
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
 linux-mtd <linux-mtd@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/06/2021 à 20:40, Miquel Raynal a écrit :
> Hi Christophe,
> 
>>>> Now and then I'm using one of the latest kernels (Today is 5.13-rc6), and sometime in one of the 5.x releases, I started to get errors like:
>>>>
>>>> [    5.098265] ecc_sw_hamming_correct: uncorrectable ECC error
>>>> [    5.103859] ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 60
>>>>     bytes from PEB 99:59824, read only 60 bytes, retry
>>>> [    5.525843] ecc_sw_hamming_correct: uncorrectable ECC error
>>>> [    5.531571] ecc_sw_hamming_correct: uncorrectable ECC error
>>>> [    5.537490] ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 30
>>>> 73 bytes from PEB 107:108976, read only 3073 bytes, retry
>>>> [    5.691121] ecc_sw_hamming_correct: uncorrectable ECC error
>>>> [    5.696709] ecc_sw_hamming_correct: uncorrectable ECC error
>>>> [    5.702426] ecc_sw_hamming_correct: uncorrectable ECC error
>>>> [    5.708141] ecc_sw_hamming_correct: uncorrectable ECC error
>>>> [    5.714103] ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 30
>>>> 35 bytes from PEB 107:25144, read only 3035 bytes, retry
>>>> [   20.523689] random: crng init done
>>>> [   21.892130] ecc_sw_hamming_correct: uncorrectable ECC error
>>>> [   21.897730] ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 13
>>>> 94 bytes from PEB 116:75776, read only 1394 bytes, retry
>>>>
>>>> Most of the time, when the reading of the file fails, I just have to read it once more and it gets read without that error.
>>>
>>> It really looks like a regular bitflip happening "sometimes". Is this a
>>> board which already had a life? What are the usage counters (UBI should
>>> tell you this) compared to the official endurance of your chip (see the
>>> datasheet)?
>>
>> The board had a peacefull life:
>>
>> UBI reports "ubi0: max/mean erase counter: 49/20, WL threshold: 4096"
> 
> Mmmh. Indeed.
> 
>>
>> I have tried with half a dozen of boards and all have the issue.
>>
>>>    
>>>> What am I supposed to do to avoid the ECC weakness warning at startup and to fix that ECC error issue ?
>>>
>>> I honestly don't think the errors come from the 5.1x kernels given the
>>> above logs. If you flash back your old 4.14 I am pretty sure you'll
>>> have the same errors at some point.
>>
>> I don't have any problem like that with 4.14 with any of the board.
>>
>> When booting a 4.14 kernel I don't get any problem on the same board.
>>
> 
> If you can reliably show that when returning to a 4.14 kernel the ECC
> weakness disappears, then there is certainly something new. What driver
> are you using? Maybe you can do a bisection?

Using the GPIO driver, and the NAND chip is a HYNIX.

I can say that the ECC weakness doesn't exist until v5.5 included. The weakness appears with v5.6.

I have tried bisection between those two versions and I couldn't end up to a reliable result. The 
closer the v5.5 you go, the more difficult it is to reproduce the issue.

So I looked at what was done around the places, and in fact that's mainly optimisation in the 
powerpc code. It seems that the more powerpc is optimised, the more the problem occurs.

Looking at the GPIO nand driver, I saw that no-op gpio_nand_dosync() function. By adding a memory 
barrier in that function, the ECC weakness disappeared completely.

Not sure what the final solution has to be.

Christophe
