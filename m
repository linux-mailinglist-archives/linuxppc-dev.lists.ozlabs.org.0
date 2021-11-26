Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EE645F28E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 17:58:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J11Cm3kWHz3cVG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 03:58:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J11CL3tR7z2xrP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 03:58:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J11CH0hFBz9sSM;
 Fri, 26 Nov 2021 17:58:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6oxPbBvnfkz3; Fri, 26 Nov 2021 17:58:03 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J11CC2T7lz9sSL;
 Fri, 26 Nov 2021 17:57:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 458848B781;
 Fri, 26 Nov 2021 17:57:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id KJ3vvRA5g6Hk; Fri, 26 Nov 2021 17:57:59 +0100 (CET)
Received: from [192.168.204.6] (unknown [192.168.204.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B98428B763;
 Fri, 26 Nov 2021 17:57:58 +0100 (CET)
Message-ID: <8e5493ac-dd05-9bad-c9ae-169114e0fdcf@csgroup.eu>
Date: Fri, 26 Nov 2021 17:57:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] w1: Misuse of get_user()/put_user() reported by sparse
Content-Language: fr-FR
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <926b572075a26835f4e39d05710cd1b75fd4d5a4.1637945194.git.christophe.leroy@csgroup.eu>
 <YaERVtyYpJ+BTQ/f@kroah.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <YaERVtyYpJ+BTQ/f@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Evgeniy Polyakov <zbr@ioremap.net>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/11/2021 à 17:54, Greg Kroah-Hartman a écrit :
> On Fri, Nov 26, 2021 at 05:47:58PM +0100, Christophe Leroy wrote:
>> sparse warnings: (new ones prefixed by >>)
>>>> drivers/w1/slaves/w1_ds28e04.c:342:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char [noderef] __user *_pu_addr @@     got char *buf @@
>>     drivers/w1/slaves/w1_ds28e04.c:342:13: sparse:     expected char [noderef] __user *_pu_addr
>>     drivers/w1/slaves/w1_ds28e04.c:342:13: sparse:     got char *buf
>>>> drivers/w1/slaves/w1_ds28e04.c:356:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char const [noderef] __user *_gu_addr @@     got char const *buf @@
>>     drivers/w1/slaves/w1_ds28e04.c:356:13: sparse:     expected char const [noderef] __user *_gu_addr
>>     drivers/w1/slaves/w1_ds28e04.c:356:13: sparse:     got char const *buf
>>
>> The buffer buf is a failsafe buffer in kernel space, it's not user
>> memory hence doesn't deserve the use of get_user() or put_user().
>>
>> Access 'buf' content directly.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Link: https://lore.kernel.org/lkml/202111190526.K5vb7NWC-lkp@intel.com/T/
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> v2: Use sysfs_emit() and kstrtobool()
>> ---
>>   drivers/w1/slaves/w1_ds28e04.c | 25 +++----------------------
>>   1 file changed, 3 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/w1/slaves/w1_ds28e04.c b/drivers/w1/slaves/w1_ds28e04.c
>> index e4f336111edc..98f80f412cfd 100644
>> --- a/drivers/w1/slaves/w1_ds28e04.c
>> +++ b/drivers/w1/slaves/w1_ds28e04.c
>> @@ -32,7 +32,7 @@ static int w1_strong_pullup = 1;
>>   module_param_named(strong_pullup, w1_strong_pullup, int, 0);
>>   
>>   /* enable/disable CRC checking on DS28E04-100 memory accesses */
>> -static char w1_enable_crccheck = 1;
>> +static bool w1_enable_crccheck = true;
>>   
>>   #define W1_EEPROM_SIZE		512
>>   #define W1_PAGE_COUNT		16
>> @@ -339,32 +339,13 @@ static BIN_ATTR_RW(pio, 1);
>>   static ssize_t crccheck_show(struct device *dev, struct device_attribute *attr,
>>   			     char *buf)
>>   {
>> -	if (put_user(w1_enable_crccheck + 0x30, buf))
>> -		return -EFAULT;
>> -
>> -	return sizeof(w1_enable_crccheck);
>> +	return sysfs_emit(buf, "%d\n", w1_enable_crccheck);
>>   }
>>   
>>   static ssize_t crccheck_store(struct device *dev, struct device_attribute *attr,
>>   			      const char *buf, size_t count)
>>   {
>> -	char val;
>> -
>> -	if (count != 1 || !buf)
>> -		return -EINVAL;
>> -
>> -	if (get_user(val, buf))
>> -		return -EFAULT;
>> -
>> -	/* convert to decimal */
>> -	val = val - 0x30;
>> -	if (val != 0 && val != 1)
>> -		return -EINVAL;
>> -
>> -	/* set the new value */
>> -	w1_enable_crccheck = val;
>> -
>> -	return sizeof(w1_enable_crccheck);
>> +	return kstrtobool(buf, &w1_enable_crccheck) ? : count;
> 
> Please spell this line out, using ? : is unreadable at times.
> 

You prefer something like:

	int err = kstrtobool(buf, &w1_enable_crccheck);

	return err ? err : count;


Or

	int err = kstrtobool(buf, &w1_enable_crccheck);

	if (err)
		return err;

	return count;

?
