Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5A54CA8A6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 15:57:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7y0F4V1xz3byH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 01:57:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7xzn06FDz3bNs
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 01:57:22 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4K7xzh52Gqz9sSR;
 Wed,  2 Mar 2022 15:57:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EeZi9sqhFvtu; Wed,  2 Mar 2022 15:57:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4K7xzh47VQz9sSN;
 Wed,  2 Mar 2022 15:57:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7CE5B8B76D;
 Wed,  2 Mar 2022 15:57:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Y9Nv-TJ4vYTB; Wed,  2 Mar 2022 15:57:20 +0100 (CET)
Received: from [172.25.230.108] (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 17FEF8B763;
 Wed,  2 Mar 2022 15:57:20 +0100 (CET)
Message-ID: <cfdf8627-8ede-871b-138c-e256fa4b67ee@csgroup.eu>
Date: Wed, 2 Mar 2022 15:57:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH -next] macintosh/therm_adt746x: Replaced simple_strtol()
 with kstrtoint()
Content-Language: fr-FR
To: Liu Shixin <liushixin2@huawei.com>, Colin Leroy <colin@colino.net>
References: <20210524120835.1580420-1-liushixin2@huawei.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20210524120835.1580420-1-liushixin2@huawei.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/05/2021 à 14:08, Liu Shixin a écrit :
> The simple_strtol() function is deprecated in some situation since
> it does not check for the range overflow. Use kstrtoint() instead.
> 
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> ---
>   drivers/macintosh/therm_adt746x.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/macintosh/therm_adt746x.c b/drivers/macintosh/therm_adt746x.c
> index 7e218437730c..0d7ef55126ce 100644
> --- a/drivers/macintosh/therm_adt746x.c
> +++ b/drivers/macintosh/therm_adt746x.c
> @@ -352,7 +352,8 @@ static ssize_t store_##name(struct device *dev, struct device_attribute *attr, c
>   	struct thermostat *th = dev_get_drvdata(dev);		\
>   	int val;						\
>   	int i;							\
> -	val = simple_strtol(buf, NULL, 10);			\
> +	if (unlikely(kstrtoint(buf, 10, &val))			\
> +		return -EINVAL;					\
>   	printk(KERN_INFO "Adjusting limits by %d degrees\n", val);	\
>   	limit_adjust = val;					\
>   	for (i=0; i < 3; i++)					\
> @@ -364,7 +365,8 @@ static ssize_t store_##name(struct device *dev, struct device_attribute *attr, c
>   static ssize_t store_##name(struct device *dev, struct device_attribute *attr, const char *buf, size_t n) \
>   {								\
>   	int val;						\
> -	val = simple_strtol(buf, NULL, 10);			\
> +	if (unlikely(kstrtoint(buf, 10, &val))			\
> +		return -EINVAL;					\
>   	if (val < 0 || val > 255)				\
>   		return -EINVAL;					\
>   	printk(KERN_INFO "Setting specified fan speed to %d\n", val);	\

Obviously no build test has been performed:

   CC [M]  drivers/macintosh/therm_adt746x.o
drivers/macintosh/therm_adt746x.c: In function 'store_specified_fan_speed':
drivers/macintosh/therm_adt746x.c:369:17: error: expected ')' before 
'return'
   369 |                 return -EINVAL;                                 \
       |                 ^~~~~~
drivers/macintosh/therm_adt746x.c:385:1: note: in expansion of macro 
'BUILD_STORE_FUNC_INT'
   385 | BUILD_STORE_FUNC_INT(specified_fan_speed,fan_speed)
       | ^~~~~~~~~~~~~~~~~~~~
drivers/macintosh/therm_adt746x.c:368:12: note: to match this '('
   368 |         if (unlikely(kstrtoint(buf, 10, &val))                  \
       |            ^
drivers/macintosh/therm_adt746x.c:385:1: note: in expansion of macro 
'BUILD_STORE_FUNC_INT'
   385 | BUILD_STORE_FUNC_INT(specified_fan_speed,fan_speed)
       | ^~~~~~~~~~~~~~~~~~~~
drivers/macintosh/therm_adt746x.c:375:1: error: expected expression 
before '}' token
   375 | }
       | ^
drivers/macintosh/therm_adt746x.c:385:1: note: in expansion of macro 
'BUILD_STORE_FUNC_INT'
   385 | BUILD_STORE_FUNC_INT(specified_fan_speed,fan_speed)
       | ^~~~~~~~~~~~~~~~~~~~
drivers/macintosh/therm_adt746x.c:375:1: error: no return statement in 
function returning non-void [-Werror=return-type]
   375 | }
       | ^
drivers/macintosh/therm_adt746x.c:385:1: note: in expansion of macro 
'BUILD_STORE_FUNC_INT'
   385 | BUILD_STORE_FUNC_INT(specified_fan_speed,fan_speed)
       | ^~~~~~~~~~~~~~~~~~~~
drivers/macintosh/therm_adt746x.c: In function 'store_limit_adjust':
drivers/macintosh/therm_adt746x.c:356:17: error: expected ')' before 
'return'
   356 |                 return -EINVAL;                                 \
       |                 ^~~~~~
drivers/macintosh/therm_adt746x.c:391:1: note: in expansion of macro 
'BUILD_STORE_FUNC_DEG'
   391 | BUILD_STORE_FUNC_DEG(limit_adjust,       th)
       | ^~~~~~~~~~~~~~~~~~~~
drivers/macintosh/therm_adt746x.c:355:12: note: to match this '('
   355 |         if (unlikely(kstrtoint(buf, 10, &val))                  \
       |            ^
drivers/macintosh/therm_adt746x.c:391:1: note: in expansion of macro 
'BUILD_STORE_FUNC_DEG'
   391 | BUILD_STORE_FUNC_DEG(limit_adjust,       th)
       | ^~~~~~~~~~~~~~~~~~~~
drivers/macintosh/therm_adt746x.c:362:1: error: expected expression 
before '}' token
   362 | }
       | ^
drivers/macintosh/therm_adt746x.c:391:1: note: in expansion of macro 
'BUILD_STORE_FUNC_DEG'
   391 | BUILD_STORE_FUNC_DEG(limit_adjust,       th)
       | ^~~~~~~~~~~~~~~~~~~~
drivers/macintosh/therm_adt746x.c:354:13: warning: unused variable 'i' 
[-Wunused-variable]
   354 |         int i;                                                  \
       |             ^
drivers/macintosh/therm_adt746x.c:391:1: note: in expansion of macro 
'BUILD_STORE_FUNC_DEG'
   391 | BUILD_STORE_FUNC_DEG(limit_adjust,       th)
       | ^~~~~~~~~~~~~~~~~~~~
drivers/macintosh/therm_adt746x.c:352:28: warning: unused variable 'th' 
[-Wunused-variable]
   352 |         struct thermostat *th = dev_get_drvdata(dev);           \
       |                            ^~
drivers/macintosh/therm_adt746x.c:391:1: note: in expansion of macro 
'BUILD_STORE_FUNC_DEG'
   391 | BUILD_STORE_FUNC_DEG(limit_adjust,       th)
       | ^~~~~~~~~~~~~~~~~~~~
drivers/macintosh/therm_adt746x.c:362:1: error: no return statement in 
function returning non-void [-Werror=return-type]
   362 | }
       | ^
drivers/macintosh/therm_adt746x.c:391:1: note: in expansion of macro 
'BUILD_STORE_FUNC_DEG'
   391 | BUILD_STORE_FUNC_DEG(limit_adjust,       th)
       | ^~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[2]: *** [scripts/Makefile.build:288: 
drivers/macintosh/therm_adt746x.o] Error 1

Christophe
