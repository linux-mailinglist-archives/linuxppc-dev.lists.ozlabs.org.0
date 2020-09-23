Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A78862752B9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 10:03:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bx9f62YWbzDqcy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 18:03:10 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bx9c46qspzDqXZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 18:01:18 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bx9bq4QPjz9v09g;
 Wed, 23 Sep 2020 10:01:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id o-mWIuJAAecS; Wed, 23 Sep 2020 10:01:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bx9bq29Pnz9tx4Q;
 Wed, 23 Sep 2020 10:01:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F1A5C8B7F4;
 Wed, 23 Sep 2020 10:01:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yJFG8sUqnTVC; Wed, 23 Sep 2020 10:01:11 +0200 (CEST)
Received: from [10.25.210.27] (unknown [10.25.210.27])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8777A8B7F1;
 Wed, 23 Sep 2020 10:01:11 +0200 (CEST)
Subject: Re: [PATCH] i2c: cpm: Fix i2c_ram structure
To: Vincent Nicolas <Nicolas.Vincent@vossloh.com>,
 "jochen@scram.de" <jochen@scram.de>
References: <20200922090400.6282-1-nicolas.vincent@vossloh.com>
 <956c4b63-f859-df0c-2836-80a988ee6aa9@csgroup.eu>
 <PR3P193MB0731945473A9F251C7F37608F1380@PR3P193MB0731.EURP193.PROD.OUTLOOK.COM>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <2ecfe18a-61f6-bb0e-22c5-b7ab79a77d03@csgroup.eu>
Date: Wed, 23 Sep 2020 10:01:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <PR3P193MB0731945473A9F251C7F37608F1380@PR3P193MB0731.EURP193.PROD.OUTLOOK.COM>
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
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/09/2020 à 09:18, Vincent Nicolas a écrit :
> 
> 
> 
> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> Sent: Tuesday, 22 September 2020 14:38
> To: Vincent Nicolas <Nicolas.Vincent@vossloh.com>; jochen@scram.de <jochen@scram.de>
> Cc: linuxppc-dev@lists.ozlabs.org <linuxppc-dev@lists.ozlabs.org>; linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>
> Subject: Re: [PATCH] i2c: cpm: Fix i2c_ram structure
>   
> 
> 
> Le 22/09/2020 à 11:04, nico.vince@gmail.com a écrit :
>> From: Nicolas VINCENT <nicolas.vincent@vossloh.com>
>>
>> the i2c_ram structure is missing the sdmatmp field mentionned in
>> datasheet for MPC8272 at paragraph 36.5. With this field missing, the
>> hardware would write past the allocated memory done through
>> cpm_muram_alloc for the i2c_ram structure and land in memory allocated
>> for the buffers descriptors corrupting the cbd_bufaddr field. Since this
>> field is only set during setup(), the first i2c transaction would work
>> and the following would send data read from an arbitrary memory
>> location.
>>
>> Signed-off-by: Nicolas VINCENT <nicolas.vincent@vossloh.com>
>> ---
>>     drivers/i2c/busses/i2c-cpm.c | 3 ++-
>>     1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
>> index 1213e1932ccb..c5700addbf65 100644
>> --- a/drivers/i2c/busses/i2c-cpm.c
>> +++ b/drivers/i2c/busses/i2c-cpm.c
>> @@ -64,7 +64,8 @@ struct i2c_ram {
>>          uint    txtmp;          /* Internal */
>>          char    res1[4];        /* Reserved */
>>          ushort  rpbase;         /* Relocation pointer */
>> -     char    res2[2];        /* Reserved */
>> +     char    res2[6];        /* Reserved */
>> +     uint    sdmatmp;        /* Internal */
> 
> On CPM1, I2C param RAM has size 0x30 (offset 0x1c80-0x1caf)
> 
> Your change overlaps the miscellaneous area that contains CP Microcode
> Revision Number, ref MPC885 Reference Manual §18.7.3
> 
> As far as I understand the mpc885 contains in the dts the compatible=fsl,cpm1-i2c which is used in cpm-i2c.c to either determine the address of the i2c_ram structure (cpm1), or dynamically allocate it with cpm_muram_alloc (cpm2).
> In the first case the structure will indeed overlaps with the miscellaneous section but since the sdmatmp is only used by cpm2 hardware it shall not be an issue.
> 
> Please, let me know if I am mistaken. If the patch cannot be accepted as is, I would gladly accept pointers on how to address this kind of issue.


Please use a mail client that properly sets the > in front of 
original/answered text. Here your mailer has mixed you text and mine, 
that's unusable on the long term.


I think you are right on the fact that it doesn't seem to be an issue. 
Nevertheless, that's confusing.

What I would suggest is to leave res2[2] as is, and add something like:

	/* The following elements are only for CPM2 */
	char res3[4];	/* Reserved */
	uint sdmatmp;	/* Internal */


Other solution (not sure that's the best solution thought) would be to 
do as in spi-fsl-cpm: use iic_t structure from asm/cpm1.h when 
CONFIG_CPM1 is selected and use iic_t from asm/cpm2.h when CONFIG_CPM2 
is selected, taking into account that CONFIG_CPM1 and CONFIG_CPM2 are 
mutually exclusive at the time being.

Christophe
