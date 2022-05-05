Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2800A51C964
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 21:44:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvPKK1BS5z3cCP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 05:44:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.170;
 helo=mail-oi1-f170.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvPJv57GSz3bpJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 05:43:58 +1000 (AEST)
Received: by mail-oi1-f170.google.com with SMTP id m25so5406826oih.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 May 2022 12:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VfBSloQQ81uRfQc02OmtDaGr9cu+x05nI2mcbylBCsg=;
 b=NzH6PoVMNTq4K57A6zwxzwtqvj6kahBvbtSel/d4XkQg0lGVTA1n4gs80GOPgIfhZQ
 92kNB+K1j8KIgjdDedS9fspaK1EBeKQPJ1XXUtIAEEJ4LV4cYXcFydTnhjew6KqIpKKG
 K3FaNO41VH8Qasuq7GfRJOedlhO/8W7LBJ6ofEYoNufuQ5z6LdrGV5Bj9XByx3ROWTN8
 M53bGusg5UDNo6kaqMgJChESnWKMI3zJRr2evMu90yrJaJmpDPK7V0cpf27chEGfptTO
 zr1QrFssQw6OzktnVdEDCL1aW6WUttW5+qxCtSJ9JHj1c88B13Kpk3MIMTSlEMxwmAbC
 yOLA==
X-Gm-Message-State: AOAM531UXGlBPBOo9Euu/3JknhQP6SnpgU6ADgWSABvgWfbqDk3zbFyE
 AkKVnfHEFnKKK+ibQVIpSw==
X-Google-Smtp-Source: ABdhPJwSBr+UtFMHunpc0UdlmFG0dImEkNGB5BW+Slimw4MKA65OsBzcX/Cj15VVliXwLAu2w1ENDA==
X-Received: by 2002:a05:6808:120c:b0:325:731e:923 with SMTP id
 a12-20020a056808120c00b00325731e0923mr3220267oil.155.1651779835825; 
 Thu, 05 May 2022 12:43:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 d15-20020a05683025cf00b0060603221278sm891396otu.72.2022.05.05.12.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 12:43:55 -0700 (PDT)
Received: (nullmailer pid 73673 invoked by uid 1000);
 Thu, 05 May 2022 19:43:54 -0000
Date: Thu, 5 May 2022 14:43:54 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>
Subject: Re: [PATCH 2/3] of: dynamic: add of_node_alloc() and of_node_free()
Message-ID: <YnQo+mdDBuoKA6Fq@robh.at.kernel.org>
References: <20220504154033.750511-1-clement.leger@bootlin.com>
 <20220504154033.750511-3-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220504154033.750511-3-clement.leger@bootlin.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, devicetree@vger.kernel.org,
 Ohhoon Kwon <ohoono.kwon@samsung.com>, David Hildenbrand <david@redhat.com>,
 Steen Hegelund <steen.hegelund@microchip.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 YueHaibing <yuehaibing@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Allan Nielsen <allan.nielsen@microchip.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Laurent Dufour <ldufour@linux.ibm.com>, Frank Rowand <frowand.list@gmail.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 04, 2022 at 05:40:32PM +0200, Clément Léger wrote:
> Add functions which allows to create and free nodes.
> 
> Signed-off-by: Clément Léger <clement.leger@bootlin.com>
> ---
>  drivers/of/dynamic.c | 59 ++++++++++++++++++++++++++++++++++++--------
>  include/linux/of.h   |  9 +++++++
>  2 files changed, 58 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index e8700e509d2e..ec28e5ba2969 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -455,6 +455,54 @@ struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags)
>  				 prop->length, allocflags);
>  }
>  
> +/**
> + * of_node_free - Free a node allocated dynamically.
> + * @node:	Node to be freed
> + */
> +void of_node_free(const struct device_node *node)
> +{
> +	kfree(node->full_name);
> +	kfree(node->data);
> +	kfree(node);
> +}
> +EXPORT_SYMBOL(of_node_free);

This shouldn't be needed. Nodes are refcounted, so any caller should 
just do a put.

Rob
