Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D44E8275FD9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 20:29:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxRYD06K2zDqbh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 04:29:52 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxRWK5rwHzDqZm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 04:28:04 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BxRW257DJz9ty1f;
 Wed, 23 Sep 2020 20:27:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id A6iDkr2G_cIq; Wed, 23 Sep 2020 20:27:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BxRW22zhmz9ty1d;
 Wed, 23 Sep 2020 20:27:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 49A398B803;
 Wed, 23 Sep 2020 20:27:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Rtm7DRNNz8YX; Wed, 23 Sep 2020 20:27:58 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E0FC18B76B;
 Wed, 23 Sep 2020 20:27:57 +0200 (CEST)
Subject: Re: [PATCH v2] i2c: cpm: Fix i2c_ram structure
To: Wolfram Sang <wsa@kernel.org>, nicolas.vincent@vossloh.com
References: <20200923140840.8700-1-nicolas.vincent@vossloh.com>
 <20200923160829.GB6697@ninjato>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <96cbd909-818e-c10b-9e10-68a39ea269e9@csgroup.eu>
Date: Wed, 23 Sep 2020 20:27:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200923160829.GB6697@ninjato>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/09/2020 à 18:08, Wolfram Sang a écrit :
> On Wed, Sep 23, 2020 at 04:08:40PM +0200, nico.vince@gmail.com wrote:
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
> 
> Thanks!
> 
> Is someone able to identify a Fixes: tag I could add?

I'd suggest

Fixes: 61045dbe9d8d ("i2c: Add support for I2C bus on Freescale 
CPM1/CPM2 controllers")

Christophe

> 
>> ---
>>   drivers/i2c/busses/i2c-cpm.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
>> index 1213e1932ccb..24d584a1c9a7 100644
>> --- a/drivers/i2c/busses/i2c-cpm.c
>> +++ b/drivers/i2c/busses/i2c-cpm.c
>> @@ -65,6 +65,9 @@ struct i2c_ram {
>>   	char    res1[4];	/* Reserved */
>>   	ushort  rpbase;		/* Relocation pointer */
>>   	char    res2[2];	/* Reserved */
>> +	/* The following elements are only for CPM2 */
>> +	char    res3[4];	/* Reserved */
>> +	uint    sdmatmp;	/* Internal */
>>   };
>>   
>>   #define I2COM_START	0x80
>> -- 
>> 2.17.1
>>
