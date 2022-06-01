Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C168753AEB7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 00:38:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LD3vy4r8dz3bml
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 08:38:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EqvxgOum;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EqvxgOum;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LD3vD73SDz2yxT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jun 2022 08:38:00 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 251MJbsO028661;
	Wed, 1 Jun 2022 22:37:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=TYrs4KwLj3iyXDTxkTg7YpQitDN7Z+0E50+OFC5Exdc=;
 b=EqvxgOumIV/ytX03pg9ACclOn1Sy9X5xSQqJEz/y3MA5xGAYq0OdHFDWog/OZqkhXDTS
 OgA9B+ubLf01LUtzcalOeD0E79N48EzhioZn2TWeM3fN9lDsvkdS8cm4EJpKk0Lw5MhU
 aA9jmfPQ+s2YC7dILgfpa55wJwT2n4wbUmAbOs0fo2X/9g+I/SF9vRrDruLYmBdZ5icl
 9z669N3B6FmEtYAiUEzOv3xnwY9drg4sp4vUcf0hUCDramXSxGAEOhj0uR6WoeZLTfQW
 s89tDMbI/WgCP8wDPRWZCeD9LS6RAg6Um+0KdfWigFnXV2670oazk3YObNwLwojAU6TF Dg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gegtd87rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jun 2022 22:37:39 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 251MKA2i031014;
	Wed, 1 Jun 2022 22:37:38 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gegtd87r8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jun 2022 22:37:38 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 251MMEOS000524;
	Wed, 1 Jun 2022 22:32:37 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by ppma01wdc.us.ibm.com with ESMTP id 3gbcbj6hkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jun 2022 22:32:37 +0000
Received: from b03ledav001.gho.boulder.ibm.com (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
	by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 251MWaxL25624986
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jun 2022 22:32:36 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 45D426E052;
	Wed,  1 Jun 2022 22:32:36 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D8A06E04E;
	Wed,  1 Jun 2022 22:32:30 +0000 (GMT)
Received: from [9.160.56.145] (unknown [9.160.56.145])
	by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jun 2022 22:32:30 +0000 (GMT)
Message-ID: <4b92277e-5133-2362-8d3a-fa82b0c7a045@linux.ibm.com>
Date: Wed, 1 Jun 2022 15:32:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/4] of: dynamic: add of_property_alloc() and
 of_property_free()
Content-Language: en-US
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Nathan Lynch <nathanl@linux.ibm.com>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Daniel Henrique Barboza <danielhb413@gmail.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Ohhoon Kwon <ohoono.kwon@samsung.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        YueHaibing <yuehaibing@huawei.com>
References: <20220601081801.348571-1-clement.leger@bootlin.com>
 <20220601081801.348571-3-clement.leger@bootlin.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
In-Reply-To: <20220601081801.348571-3-clement.leger@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lp1lz0Ycy_VhvZvngQ-kC3mx69So2XOK
X-Proofpoint-ORIG-GUID: tDkVIUJVMxoHgLwaUNNq7pUNKqT5ZcMY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-01_08,2022-06-01_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1011 adultscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206010090
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
Cc: devicetree@vger.kernel.org, Steen Hegelund <steen.hegelund@microchip.com>, linux-kernel@vger.kernel.org, Horatiu Vultur <horatiu.vultur@microchip.com>, Allan Nielsen <allan.nielsen@microchip.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <helgaas@kernel.org>, linuxppc-dev@lists.ozlabs.org, Lizhi Hou <lizhi.hou@xilinx.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/1/22 01:17, Clément Léger wrote:
> Add function which allows to dynamically allocate and free properties.
> Use this function internally for all code that used the same logic
> (mainly __of_prop_dup()).
> 
> Signed-off-by: Clément Léger <clement.leger@bootlin.com>
> ---
>  drivers/of/dynamic.c    | 82 ++++++++++++++++++++++++-----------------
>  drivers/of/of_private.h | 21 ++++++++++-
>  include/linux/of.h      | 14 +++++++
>  3 files changed, 82 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index cd3821a6444f..c0dcbea31d28 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -313,9 +313,7 @@ static void property_list_free(struct property *prop_list)
> 
>  	for (prop = prop_list; prop != NULL; prop = next) {
>  		next = prop->next;
> -		kfree(prop->name);
> -		kfree(prop->value);
> -		kfree(prop);
> +		of_property_free(prop);
>  	}
>  }
> 
> @@ -367,48 +365,66 @@ void of_node_release(struct kobject *kobj)
>  }
> 
>  /**
> - * __of_prop_dup - Copy a property dynamically.
> - * @prop:	Property to copy
> + * of_property_free - Free a property allocated dynamically.
> + * @prop:	Property to be freed
> + */
> +void of_property_free(const struct property *prop)
> +{
> +	if (!of_property_check_flag(prop, OF_DYNAMIC))
> +		return;
> +

This looks wrong to me. From what I understand the value data is allocated as
trailing memory that is part of the property allocation itself. (ie. prop =
kzalloc(sizeof(*prop) + len, allocflags)). So, kfree(prop) should also take care
of the trailing value data. Calling kfree(prop->value) is bogus since
prop->value wasn't dynamically allocated on its own.

Also, this condition will always fail. You explicitly set prop->value = prop + 1
in alloc.

Maybe I need to go back and look at v1 again.

-Tyrel

> +	if (prop->value != prop + 1)
> +		kfree(prop->value);
> +
> +	kfree(prop->name);
> +	kfree(prop);
> +}
> +EXPORT_SYMBOL(of_property_free);
> +
> +/**
> + * of_property_alloc - Allocate a property dynamically.
> + * @name:	Name of the new property
> + * @value:	Value that will be copied into the new property value or NULL
> + *		if only @len allocation is needed.
> + * @len:	Length of new property value and if @value is provided, the
> + * 		length of the value to be copied
>   * @allocflags:	Allocation flags (typically pass GFP_KERNEL)
>   *
> - * Copy a property by dynamically allocating the memory of both the
> + * Create a property by dynamically allocating the memory of both the
>   * property structure and the property name & contents. The property's
>   * flags have the OF_DYNAMIC bit set so that we can differentiate between
>   * dynamically allocated properties and not.
>   *
>   * Return: The newly allocated property or NULL on out of memory error.
>   */
> -struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags)
> +struct property *of_property_alloc(const char *name, const void *value,
> +				   size_t len, gfp_t allocflags)
>  {
> -	struct property *new;
> +	struct property *prop;
> 
> -	new = kzalloc(sizeof(*new), allocflags);
> -	if (!new)
> +	prop = kzalloc(sizeof(*prop) + len, allocflags);
> +	if (!prop)
>  		return NULL;
> 
> -	/*
> -	 * NOTE: There is no check for zero length value.
> -	 * In case of a boolean property, this will allocate a value
> -	 * of zero bytes. We do this to work around the use
> -	 * of of_get_property() calls on boolean values.
> -	 */
> -	new->name = kstrdup(prop->name, allocflags);
> -	new->value = kmemdup(prop->value, prop->length, allocflags);
> -	new->length = prop->length;
> -	if (!new->name || !new->value)
> -		goto err_free;
> -
> -	/* mark the property as dynamic */
> -	of_property_set_flag(new, OF_DYNAMIC);
> -
> -	return new;
> -
> - err_free:
> -	kfree(new->name);
> -	kfree(new->value);
> -	kfree(new);
> +	prop->name = kstrdup(name, allocflags);
> +	if (!prop->name)
> +		goto out_err;
> +
> +	prop->value = prop + 1;
> +	if (value)
> +		memcpy(prop->value, value, len);
> +
> +	prop->length = len;
> +	of_property_set_flag(prop, OF_DYNAMIC);
> +
> +	return prop;
> +
> +out_err:
> +	of_property_free(prop);
> +
>  	return NULL;
>  }
> +EXPORT_SYMBOL(of_property_alloc);
> 
>  /**
>   * __of_node_dup() - Duplicate or create an empty device node dynamically.
> @@ -447,9 +463,7 @@ struct device_node *__of_node_dup(const struct device_node *np,
>  			if (!new_pp)
>  				goto err_prop;
>  			if (__of_add_property(node, new_pp)) {
> -				kfree(new_pp->name);
> -				kfree(new_pp->value);
> -				kfree(new_pp);
> +				of_property_free(new_pp);
>  				goto err_prop;
>  			}
>  		}
> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> index 9324483397f6..1d6459bf705d 100644
> --- a/drivers/of/of_private.h
> +++ b/drivers/of/of_private.h
> @@ -115,7 +115,26 @@ extern void *__unflatten_device_tree(const void *blob,
>   * without taking node references, so you either have to
>   * own the devtree lock or work on detached trees only.
>   */
> -struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags);
> +
> +/**
> + * __of_prop_dup - Copy a property dynamically.
> + * @prop:	Property to copy
> + * @allocflags:	Allocation flags (typically pass GFP_KERNEL)
> + *
> + * Copy a property by dynamically allocating the memory of both the
> + * property structure and the property name & contents. The property's
> + * flags have the OF_DYNAMIC bit set so that we can differentiate between
> + * dynamically allocated properties and not.
> + *
> + * Return: The newly allocated property or NULL on out of memory error.
> + */
> +static inline
> +struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags)
> +{
> +	return of_property_alloc(prop->name, prop->value, prop->length,
> +				 allocflags);
> +}
> +
>  struct device_node *__of_node_dup(const struct device_node *np,
>  				  const char *full_name);
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index d74fd82a6963..f1966f3c3847 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -1464,6 +1464,10 @@ enum of_reconfig_change {
>  };
> 
>  #ifdef CONFIG_OF_DYNAMIC
> +struct property *of_property_alloc(const char *name, const void *value,
> +				   size_t len, gfp_t allocflags);
> +void of_property_free(const struct property *prop);
> +
>  extern int of_reconfig_notifier_register(struct notifier_block *);
>  extern int of_reconfig_notifier_unregister(struct notifier_block *);
>  extern int of_reconfig_notify(unsigned long, struct of_reconfig_data *rd);
> @@ -1508,6 +1512,16 @@ static inline int of_changeset_update_property(struct of_changeset *ocs,
>  	return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
>  }
>  #else /* CONFIG_OF_DYNAMIC */
> +
> +static inline
> +struct property *of_property_alloc(const char *name, const void *value,
> +				   size_t len, gfp_t allocflags)
> +{
> +	return NULL;
> +}
> +
> +static inline  void of_property_free(const struct property *prop) {}
> +
>  static inline int of_reconfig_notifier_register(struct notifier_block *nb)
>  {
>  	return -EINVAL;

