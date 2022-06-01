Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F413253AEB4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 00:32:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LD3mF4Njdz3byW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 08:31:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ULcew1XH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ULcew1XH;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LD3lT4rVdz2ywq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jun 2022 08:31:16 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 251MJVom019512;
	Wed, 1 Jun 2022 22:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+5/18BLA72TKuGiuxuqZG0l+eZJKEbnP1n493Jc3yQc=;
 b=ULcew1XHhTO8l593RTNqVpxnxohk87d27kNZwUJWcqHUUtZltsEKpDIobPQRGf5dcKay
 RlSSPbkvPoxFlkPxpYuadJArZnaWVlCZFmMUp4bDhbhKIW+4RSBIUMxUODcPnu4Mq7VX
 YBkLUAPctHZ66BNjTLdpEyHh0WWSbM0f3BFPuqtMIscR8xTZviwQkHpWXqvDWwDjuyzH
 U0HXL8PY/ZQ20uVA/2pdl9X8Evi4+Cl15VELqVJFe7Ab19NcpNxdyGzqhkR7li/yQKdI
 /fzN5J28YMAu9ffAuVRSu1tCZVcpZieQ9CM+p0WFvn3NbO8Vrtn9rd64XIbnVTwFL31P 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gegtag4q7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jun 2022 22:30:55 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 251MOw7g009569;
	Wed, 1 Jun 2022 22:30:55 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gegtag4q0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jun 2022 22:30:55 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 251MMA5G010699;
	Wed, 1 Jun 2022 22:30:54 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
	by ppma01dal.us.ibm.com with ESMTP id 3gcxt5n7u4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jun 2022 22:30:53 +0000
Received: from b03ledav001.gho.boulder.ibm.com (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 251MUqud32637388
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jun 2022 22:30:52 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62B116E053;
	Wed,  1 Jun 2022 22:30:52 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 447846E04E;
	Wed,  1 Jun 2022 22:30:48 +0000 (GMT)
Received: from [9.160.56.145] (unknown [9.160.56.145])
	by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jun 2022 22:30:48 +0000 (GMT)
Message-ID: <42d9e1af-5576-ed8a-be3a-9dfea6ce1041@linux.ibm.com>
Date: Wed, 1 Jun 2022 15:30:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/3] of: dynamic: add of_property_alloc() and
 of_property_free()
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
        =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <clement.leger@bootlin.com>
References: <20220504154033.750511-1-clement.leger@bootlin.com>
 <20220504154033.750511-2-clement.leger@bootlin.com>
 <YnQnayouXw9/jp/E@robh.at.kernel.org>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
In-Reply-To: <YnQnayouXw9/jp/E@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DIonMy0GmUQItNu3YfS1Rr2sP5IeIsKx
X-Proofpoint-GUID: WJv2mS3lP6uCH3yBV2z2fOXy0vR9JIip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-01_08,2022-06-01_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 spamscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206010088
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, David Hildenbrand <david@redhat.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Steen Hegelund <steen.hegelund@microchip.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ohhoon Kwon <ohoono.kwon@samsung.com>, Allan Nielsen <allan.nielsen@microchip.com>, Andrew Morton <akpm@linux-foundation.org>, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Horatiu Vultur <horatiu.vultur@microchip.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/5/22 12:37, Rob Herring wrote:
> On Wed, May 04, 2022 at 05:40:31PM +0200, Clément Léger wrote:
>> Add function which allows to dynamically allocate and free properties.
>> Use this function internally for all code that used the same logic
>> (mainly __of_prop_dup()).
>>
>> Signed-off-by: Clément Léger <clement.leger@bootlin.com>
>> ---
>>  drivers/of/dynamic.c | 101 ++++++++++++++++++++++++++++++-------------
>>  include/linux/of.h   |  16 +++++++
>>  2 files changed, 88 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
>> index cd3821a6444f..e8700e509d2e 100644
>> --- a/drivers/of/dynamic.c
>> +++ b/drivers/of/dynamic.c
>> @@ -313,9 +313,7 @@ static void property_list_free(struct property *prop_list)
>>  
>>  	for (prop = prop_list; prop != NULL; prop = next) {
>>  		next = prop->next;
>> -		kfree(prop->name);
>> -		kfree(prop->value);
>> -		kfree(prop);
>> +		of_property_free(prop);
>>  	}
>>  }
>>  
>> @@ -367,48 +365,95 @@ void of_node_release(struct kobject *kobj)
>>  }
>>  
>>  /**
>> - * __of_prop_dup - Copy a property dynamically.
>> - * @prop:	Property to copy
>> + * of_property_free - Free a property allocated dynamically.
>> + * @prop:	Property to be freed
>> + */
>> +void of_property_free(const struct property *prop)
>> +{
>> +	kfree(prop->value);
>> +	kfree(prop->name);
>> +	kfree(prop);
>> +}
>> +EXPORT_SYMBOL(of_property_free);
>> +
>> +/**
>> + * of_property_alloc - Allocate a property dynamically.
>> + * @name:	Name of the new property
>> + * @value:	Value that will be copied into the new property value
>> + * @value_len:	length of @value to be copied into the new property value
>> + * @len:	Length of new property value, must be greater than @value_len
> 
> What's the usecase for the lengths being different? That doesn't seem 
> like a common case, so perhaps handle it with a NULL value and 
> non-zero length. Then the caller has to deal with populating 
> prop->value.
> 
>>   * @allocflags:	Allocation flags (typically pass GFP_KERNEL)
>>   *
>> - * Copy a property by dynamically allocating the memory of both the
>> + * Create a property by dynamically allocating the memory of both the
>>   * property structure and the property name & contents. The property's
>>   * flags have the OF_DYNAMIC bit set so that we can differentiate between
>>   * dynamically allocated properties and not.
>>   *
>>   * Return: The newly allocated property or NULL on out of memory error.
>>   */
>> -struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags)
>> +struct property *of_property_alloc(const char *name, const void *value,
>> +				   int value_len, int len, gfp_t allocflags)
>>  {
>> -	struct property *new;
>> +	int alloc_len = len;
>> +	struct property *prop;
>> +
>> +	if (len < value_len)
>> +		return NULL;
>>  
>> -	new = kzalloc(sizeof(*new), allocflags);
>> -	if (!new)
>> +	prop = kzalloc(sizeof(*prop), allocflags);
>> +	if (!prop)
>>  		return NULL;
>>  
>> +	prop->name = kstrdup(name, allocflags);
>> +	if (!prop->name)
>> +		goto out_err;
>> +
>>  	/*
>> -	 * NOTE: There is no check for zero length value.
>> -	 * In case of a boolean property, this will allocate a value
>> -	 * of zero bytes. We do this to work around the use
>> -	 * of of_get_property() calls on boolean values.
>> +	 * Even if the property has no value, it must be set to a
>> +	 * non-null value since of_get_property() is used to check
>> +	 * some values that might or not have a values (ranges for
>> +	 * instance). Moreover, when the node is released, prop->value
>> +	 * is kfreed so the memory must come from kmalloc.
> 
> Allowing for NULL value didn't turn out well...
> 
> We know that we can do the kfree because OF_DYNAMIC is set IIRC...
> 
> If we do 1 allocation for prop and value, then we can test 
> for "prop->value == prop + 1" to determine if we need to free or not.

If its a single allocation do we even need a test? Doesn't kfree(prop) take care
of the property and the trailing memory allocated for the value?

-Tyrel

> 
>>  	 */
>> -	new->name = kstrdup(prop->name, allocflags);
>> -	new->value = kmemdup(prop->value, prop->length, allocflags);
>> -	new->length = prop->length;
>> -	if (!new->name || !new->value)
>> -		goto err_free;
>> +	if (!alloc_len)
>> +		alloc_len = 1;
>>  
>> -	/* mark the property as dynamic */
>> -	of_property_set_flag(new, OF_DYNAMIC);
>> +	prop->value = kzalloc(alloc_len, allocflags);
>> +	if (!prop->value)
>> +		goto out_err;
>>  
>> -	return new;
>> +	if (value)
>> +		memcpy(prop->value, value, value_len);
>> +
>> +	prop->length = len;
>> +	of_property_set_flag(prop, OF_DYNAMIC);
>> +
>> +	return prop;
>> +
>> +out_err:
>> +	of_property_free(prop);
>>  
>> - err_free:
>> -	kfree(new->name);
>> -	kfree(new->value);
>> -	kfree(new);
>>  	return NULL;
>>  }
>> +EXPORT_SYMBOL(of_property_alloc);
>> +
>> +/**
>> + * __of_prop_dup - Copy a property dynamically.
>> + * @prop:	Property to copy
>> + * @allocflags:	Allocation flags (typically pass GFP_KERNEL)
>> + *
>> + * Copy a property by dynamically allocating the memory of both the
>> + * property structure and the property name & contents. The property's
>> + * flags have the OF_DYNAMIC bit set so that we can differentiate between
>> + * dynamically allocated properties and not.
>> + *
>> + * Return: The newly allocated property or NULL on out of memory error.
>> + */
>> +struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags)
>> +{
>> +	return of_property_alloc(prop->name, prop->value, prop->length,
>> +				 prop->length, allocflags);
> 
> This can now be a static inline.
> 
>> +}
>>  
>>  /**
>>   * __of_node_dup() - Duplicate or create an empty device node dynamically.
>> @@ -447,9 +492,7 @@ struct device_node *__of_node_dup(const struct device_node *np,
>>  			if (!new_pp)
>>  				goto err_prop;
>>  			if (__of_add_property(node, new_pp)) {
>> -				kfree(new_pp->name);
>> -				kfree(new_pp->value);
>> -				kfree(new_pp);
>> +				of_property_free(new_pp);
>>  				goto err_prop;
>>  			}
>>  		}
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index 04971e85fbc9..6b345eb71c19 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -1463,6 +1463,11 @@ enum of_reconfig_change {
>>  };
>>  
>>  #ifdef CONFIG_OF_DYNAMIC
>> +extern struct property *of_property_alloc(const char *name, const void *value,
>> +					  int value_len, int len,
>> +					  gfp_t allocflags);
>> +extern void of_property_free(const struct property *prop);
>> +
>>  extern int of_reconfig_notifier_register(struct notifier_block *);
>>  extern int of_reconfig_notifier_unregister(struct notifier_block *);
>>  extern int of_reconfig_notify(unsigned long, struct of_reconfig_data *rd);
>> @@ -1507,6 +1512,17 @@ static inline int of_changeset_update_property(struct of_changeset *ocs,
>>  	return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
>>  }
>>  #else /* CONFIG_OF_DYNAMIC */
>> +
>> +static inline struct property *of_property_alloc(const char *name,
>> +						 const void *value,
>> +						 int value_len, int len,
>> +						 gfp_t allocflags)
>> +{
>> +	return NULL;
>> +}
>> +
>> +static inline  void of_property_free(const struct property *prop) {}
>> +
>>  static inline int of_reconfig_notifier_register(struct notifier_block *nb)
>>  {
>>  	return -EINVAL;
>> -- 
>> 2.34.1
>>
>>

