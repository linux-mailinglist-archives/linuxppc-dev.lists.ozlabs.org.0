Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FD753D2BE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 22:14:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LFDcv62WQz3bs4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jun 2022 06:14:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.172; helo=mail-oi1-f172.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LFDcQ5Q1mz305g
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jun 2022 06:14:12 +1000 (AEST)
Received: by mail-oi1-f172.google.com with SMTP id w16so1889508oie.5
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jun 2022 13:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=T4YFavzX3BoFSvwhmRErrhVpV7X9t8rssvd3ofVK/8M=;
        b=kkdilbgh80rsjHn2VCTffolVuV3pt39qeOlZ07w96siGn0+oefhY6FHOrJJbmFnhMg
         EcAw3J3eyUdKK/aHG681gaXca9UeR6pnOgtpsu2g8jsJHgisjymMCYuk7Qj37AFlkt7V
         3d4QIJc6Nwmwat3bdjUh6RBU1zXaHoLJCKOLAH7iixJjRYSp69yQNn/QdmLJL5mRFjLC
         kjfIO9h2WlVy9Or6CA5xEV+iwXZMOpLXnFgkj+v4IwLSTb8Lmp6vTQwtdfupkUSNzkSc
         2GXey8TrZd2B/4AjPnPjoDfOdkk5/G3BE1zQGK34u4NWjd5sUkWASHV2FZh/Mxnfh4Iw
         3M4A==
X-Gm-Message-State: AOAM533NLMjN06Q743GmxmnUGLnKG//K7XXg1o2QzRTbDLTfjJ/3J/I+
	9s5WynoH1XJAUHzacs0y+Q==
X-Google-Smtp-Source: ABdhPJzTYQ2n3JIqt3FtJFHmA+kFN3elI7JW+A+tawjhc7R7gr5IUK1TjmFswR0AJXvbf3w/E1dWgA==
X-Received: by 2002:a05:6808:10c8:b0:32c:14aa:76c5 with SMTP id s8-20020a05680810c800b0032c14aa76c5mr6609926ois.61.1654287248916;
        Fri, 03 Jun 2022 13:14:08 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e28-20020a544f1c000000b0032c18f04800sm4637488oiy.1.2022.06.03.13.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 13:14:08 -0700 (PDT)
Received: (nullmailer pid 831729 invoked by uid 1000);
	Fri, 03 Jun 2022 20:14:07 -0000
Date: Fri, 3 Jun 2022 15:14:07 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>
Subject: Re: [PATCH v2 4/4] powerpc/pseries: use of_property_alloc/free() and
 of_node_alloc()
Message-ID: <20220603201407.GA688883-robh@kernel.org>
References: <20220601081801.348571-1-clement.leger@bootlin.com>
 <20220601081801.348571-5-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220601081801.348571-5-clement.leger@bootlin.com>
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
Cc: David Hildenbrand <david@redhat.com>, Paul Mackerras <paulus@samba.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ohhoon Kwon <ohoono.kwon@samsung.com>, Frank Rowand <frowand.list@gmail.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Steen Hegelund <steen.hegelund@microchip.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, YueHaibing <yuehaibing@huawei.com>, Bjorn Helgaas <helgaas@kernel.org>, Nathan Lynch <nathanl@linux.ibm.com>, devicetree@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, Laurent Dufour <ldufour@linux.ibm.com>, David Gibson <david@gibson.dropbear.id.au>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Lizhi Hou <lizhi.hou@xilinx.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 01, 2022 at 10:18:01AM +0200, Clément Léger wrote:
> Use of_property_alloc/free() and of_node_alloc() to create and free
> device-tree nodes and properties.
> 
> Signed-off-by: Clément Léger <clement.leger@bootlin.com>
> ---
>  arch/powerpc/platforms/pseries/dlpar.c        | 51 +++----------------
>  .../platforms/pseries/hotplug-memory.c        | 21 +-------
>  arch/powerpc/platforms/pseries/reconfig.c     | 45 +++++-----------
>  3 files changed, 21 insertions(+), 96 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
> index 498d6efcb5ae..5a04566e98a4 100644
> --- a/arch/powerpc/platforms/pseries/dlpar.c
> +++ b/arch/powerpc/platforms/pseries/dlpar.c
> @@ -38,61 +38,25 @@ struct cc_workarea {
>  	__be32	prop_offset;
>  };
>  
> -void dlpar_free_cc_property(struct property *prop)
> -{
> -	kfree(prop->name);
> -	kfree(prop->value);
> -	kfree(prop);
> -}
> -
>  static struct property *dlpar_parse_cc_property(struct cc_workarea *ccwa)
>  {
> -	struct property *prop;
> -	char *name;
> -	char *value;
> -
> -	prop = kzalloc(sizeof(*prop), GFP_KERNEL);
> -	if (!prop)
> -		return NULL;
> +	int length;
> +	char *name, *value;
>  
>  	name = (char *)ccwa + be32_to_cpu(ccwa->name_offset);
> -	prop->name = kstrdup(name, GFP_KERNEL);
> -	if (!prop->name) {
> -		dlpar_free_cc_property(prop);
> -		return NULL;
> -	}
> -
> -	prop->length = be32_to_cpu(ccwa->prop_length);
> +	length = be32_to_cpu(ccwa->prop_length);
>  	value = (char *)ccwa + be32_to_cpu(ccwa->prop_offset);
> -	prop->value = kmemdup(value, prop->length, GFP_KERNEL);
> -	if (!prop->value) {
> -		dlpar_free_cc_property(prop);
> -		return NULL;
> -	}
>  
> -	return prop;
> +	return of_property_alloc(name, value, length, GFP_KERNEL);
>  }
>  
>  static struct device_node *dlpar_parse_cc_node(struct cc_workarea *ccwa)
>  {
> -	struct device_node *dn;
>  	const char *name;
>  
> -	dn = kzalloc(sizeof(*dn), GFP_KERNEL);
> -	if (!dn)
> -		return NULL;
> -
>  	name = (const char *)ccwa + be32_to_cpu(ccwa->name_offset);
> -	dn->full_name = kstrdup(name, GFP_KERNEL);
> -	if (!dn->full_name) {
> -		kfree(dn);
> -		return NULL;
> -	}
>  
> -	of_node_set_flag(dn, OF_DYNAMIC);
> -	of_node_init(dn);
> -
> -	return dn;
> +	return of_node_alloc(name, GFP_KERNEL);

Do you have any need for different flags? I can't really see a need for 
atomic or dma allocs or ???, so drop it I think.

>  }
>  
>  static void dlpar_free_one_cc_node(struct device_node *dn)
> @@ -102,11 +66,10 @@ static void dlpar_free_one_cc_node(struct device_node *dn)
>  	while (dn->properties) {
>  		prop = dn->properties;
>  		dn->properties = prop->next;
> -		dlpar_free_cc_property(prop);
> +		of_property_free(prop);

We should be able to just put the node and all the properties already 
attached will be freed.

Looking at the history of this code, it originally did the kref_init 
much later in dlpar_attach_node(). So there was a window of allocating 
the node and adding properties where you'd need to manually free 
everything. Now that the node is referenced from the start, a put should 
free everything.

>  	}
>  
> -	kfree(dn->full_name);
> -	kfree(dn);
> +	of_node_put(dn);
>  }
>  
>  void dlpar_free_cc_nodes(struct device_node *dn)
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index 2e3a317722a8..2ddf2a0ba048 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -69,33 +69,16 @@ unsigned long pseries_memory_block_size(void)
>  	return memblock_size;
>  }
>  
> -static void dlpar_free_property(struct property *prop)
> -{
> -	kfree(prop->name);
> -	kfree(prop->value);
> -	kfree(prop);
> -}
> -
>  static struct property *dlpar_clone_property(struct property *prop,
>  					     u32 prop_size)
>  {
> -	struct property *new_prop;
> -
> -	new_prop = kzalloc(sizeof(*new_prop), GFP_KERNEL);
> +	struct property *new_prop = of_property_alloc(prop->name, NULL,
> +						      prop_size, GFP_KERNEL);
>  	if (!new_prop)
>  		return NULL;
>  
> -	new_prop->name = kstrdup(prop->name, GFP_KERNEL);
> -	new_prop->value = kzalloc(prop_size, GFP_KERNEL);
> -	if (!new_prop->name || !new_prop->value) {
> -		dlpar_free_property(new_prop);
> -		return NULL;
> -	}
> -
>  	memcpy(new_prop->value, prop->value, prop->length);
> -	new_prop->length = prop_size;
>  
> -	of_property_set_flag(new_prop, OF_DYNAMIC);
>  	return new_prop;
>  }
>  
> diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/platforms/pseries/reconfig.c
> index cad7a0c93117..f1a364995e82 100644
> --- a/arch/powerpc/platforms/pseries/reconfig.c
> +++ b/arch/powerpc/platforms/pseries/reconfig.c
> @@ -24,17 +24,9 @@ static int pSeries_reconfig_add_node(const char *path, struct property *proplist
>  	struct device_node *np;
>  	int err = -ENOMEM;
>  
> -	np = kzalloc(sizeof(*np), GFP_KERNEL);
> +	np = of_node_alloc(kbasename(path), GFP_KERNEL);
>  	if (!np)
> -		goto out_err;
> -
> -	np->full_name = kstrdup(kbasename(path), GFP_KERNEL);
> -	if (!np->full_name)
> -		goto out_err;
> -
> -	np->properties = proplist;
> -	of_node_set_flag(np, OF_DYNAMIC);
> -	of_node_init(np);
> +		return -ENOMEM;
>  
>  	np->parent = pseries_of_derive_parent(path);
>  	if (IS_ERR(np->parent)) {
> @@ -55,8 +47,7 @@ static int pSeries_reconfig_add_node(const char *path, struct property *proplist
>  out_err:
>  	if (np) {
>  		of_node_put(np->parent);
> -		kfree(np->full_name);
> -		kfree(np);
> +		of_node_put(np);
>  	}
>  	return err;
>  }
> @@ -91,9 +82,7 @@ static void release_prop_list(const struct property *prop)
>  	struct property *next;
>  	for (; prop; prop = next) {
>  		next = prop->next;
> -		kfree(prop->name);
> -		kfree(prop->value);
> -		kfree(prop);
> +		of_property_free(prop);

Looks like you need this because code does: alloc properties, alloc 
node, add properties, attach node. It would need to be refactored to 
alloc the node first, but that's a bit more complex needing someone to 
test on pSeries.

>  	}
>  
>  }
> @@ -167,27 +156,17 @@ static char * parse_next_property(char *buf, char *end, char **name, int *length
>  static struct property *new_property(const char *name, const int length,
>  				     const unsigned char *value, struct property *last)
>  {
> -	struct property *new = kzalloc(sizeof(*new), GFP_KERNEL);
> +	struct property *prop;
>  
> -	if (!new)
> +	prop = of_property_alloc(name, NULL, length + 1, GFP_KERNEL);
> +	if (!prop)
>  		return NULL;
>  
> -	if (!(new->name = kstrdup(name, GFP_KERNEL)))
> -		goto cleanup;
> -	if (!(new->value = kmalloc(length + 1, GFP_KERNEL)))
> -		goto cleanup;
> -
> -	memcpy(new->value, value, length);
> -	*(((char *)new->value) + length) = 0;
> -	new->length = length;
> -	new->next = last;
> -	return new;
> -
> -cleanup:
> -	kfree(new->name);
> -	kfree(new->value);
> -	kfree(new);
> -	return NULL;
> +	memcpy(prop->value, value, length);
> +	*(((char *)prop->value) + length) = 0;

Looks to me like this could be avoided with this change:

diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/platforms/pseries/reconfig.c
index cad7a0c93117..614753fc5f27 100644
--- a/arch/powerpc/platforms/pseries/reconfig.c
+++ b/arch/powerpc/platforms/pseries/reconfig.c
@@ -148,7 +148,7 @@ static char * parse_next_property(char *buf, char *end, char **name, int *length
        /* now we're on the value */
        *value = tmp;
        tmp += *length;
-       if (tmp > end) {
+       if (tmp >= end) {
                printk(KERN_ERR "property parse failed in %s at line %d\n",
                       __func__, __LINE__);
                return NULL;
@@ -158,6 +158,7 @@ static char * parse_next_property(char *buf, char *end, char **name, int *length
                       __func__, __LINE__);
                return NULL;
        }
+       *tmp = '\0';
        tmp++;
 
        /* and now we should be on the next name, or the end */


Based on the comments, 'buf' should be nul terminated, so I would think 
that tmp == end would be an error. But I really don't know.

Really need some pSeries people to comment on all this.

Another option is if value is NULL, then of_property_alloc() should 
ensure the buffer is zeroed. Then you just need the memcpy.

Rob
