Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7678258AE4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 21:20:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZV9B32mczDqX2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 05:20:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gecuNsfA"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZV780ByzzDqWx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 05:18:43 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id p15so8148549eds.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 12:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=V9/DvrSm1tuMxgh9gCPc5feOBQeRzRI5OCgy1Wf79Gk=;
 b=gecuNsfA+4DkKar9EsBNVwySmvxGtn5QjxCfGe0pL3C8P5PP1Xy2qhhhZDcoqqpsMt
 o6a5PIeN7eNQMIhzmvUeQoUvUM6ihzgxXWIq70u7fu9iVoHK0FzMDxAxRgwfjJ4Y/0Np
 eAncgvXBOQ0xmiVv1lecus3bfWyVdHk5VwzGFxCT2/GbeqlKb/P18E1rbb80hy5diF/H
 4YdJAru4bKV8H2mbVgheU4JQmdx7/dddyh73C9Mp5lr4a6BOUu8eCcrxqeIzo0SKJiFZ
 5sPJgJAVAr2Bwv73DAJQk97UYRN7q89boMhZV+hgUVehyd/t4CV8IjUq7W/y3RK4iS23
 l2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=V9/DvrSm1tuMxgh9gCPc5feOBQeRzRI5OCgy1Wf79Gk=;
 b=qACo/a7B2ULwaHhdf+P1cED+BsmveOm4dO1/vVo4qWl+Fmv9Y5cPA8ygtucWA2TWvF
 cr+QYwWnK+Z4za7VW4gW3Rqu6wTNUnbB0BL3yPeWIyr1PqCE/GpURh+2+MJ+YsW6PYpJ
 uxWFV487ar3adE7o8Z++HFF9HJsSy1Wzx7U2Y02ernDbXRNRwfoppuv7Fd0q6Y/Zz5/S
 Rwg59fekC84tjlW0p2OLLESixeIU6yjh0pNxhur51NOnVBvMMtBj0s/3w2TdSgEf9kpW
 HT6QOc9JO7xokaAzR0wQldnA54cilTyzLM6/WBSi5hcWVlOPt9P2MTfmUC3Kwfidj1NV
 J/iA==
X-Gm-Message-State: APjAAAWbahnrxyPgwnAwn8hx3hMG5QZKp4j36hto+5wipdw/XZghJtlG
 YVuwyTg97g7jZbTHmBEu8lo=
X-Google-Smtp-Source: APXvYqzo3o22jNRP11IR4sgG0M1LkCQD4a9v4DkJtwgfurt3ukcs5ifOVNN2Vcr8awUGY9pHnFRL3A==
X-Received: by 2002:a50:a56d:: with SMTP id z42mr6430929edb.241.1561663119763; 
 Thu, 27 Jun 2019 12:18:39 -0700 (PDT)
Received: from archlinux-epyc ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id bs5sm575800ejb.10.2019.06.27.12.18.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 12:18:39 -0700 (PDT)
Date: Thu, 27 Jun 2019 12:18:37 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] PCI: rpaphp: Avoid a sometimes-uninitialized warning
Message-ID: <20190627191837.GA111331@archlinux-epyc>
References: <20190603174323.48251-1-natechancellor@gmail.com>
 <20190603221157.58502-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190603221157.58502-1-natechancellor@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: linux-pci@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 03, 2019 at 03:11:58PM -0700, Nathan Chancellor wrote:
> When building with -Wsometimes-uninitialized, clang warns:
> 
> drivers/pci/hotplug/rpaphp_core.c:243:14: warning: variable 'fndit' is
> used uninitialized whenever 'for' loop exits because its condition is
> false [-Wsometimes-uninitialized]
>         for (j = 0; j < entries; j++) {
>                     ^~~~~~~~~~~
> drivers/pci/hotplug/rpaphp_core.c:256:6: note: uninitialized use occurs
> here
>         if (fndit)
>             ^~~~~
> drivers/pci/hotplug/rpaphp_core.c:243:14: note: remove the condition if
> it is always true
>         for (j = 0; j < entries; j++) {
>                     ^~~~~~~~~~~
> drivers/pci/hotplug/rpaphp_core.c:233:14: note: initialize the variable
> 'fndit' to silence this warning
>         int j, fndit;
>                     ^
>                      = 0
> 
> fndit is only used to gate a sprintf call, which can be moved into the
> loop to simplify the code and eliminate the local variable, which will
> fix this warning.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/504
> Fixes: 2fcf3ae508c2 ("hotplug/drc-info: Add code to search ibm,drc-info property")
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
> 
> v1 -> v2:
> 
> * Eliminate fndit altogether by shuffling the sprintf call into the for
>   loop and changing the if conditional, as suggested by Nick.
> 
>  drivers/pci/hotplug/rpaphp_core.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpaphp_core.c
> index bcd5d357ca23..c3899ee1db99 100644
> --- a/drivers/pci/hotplug/rpaphp_core.c
> +++ b/drivers/pci/hotplug/rpaphp_core.c
> @@ -230,7 +230,7 @@ static int rpaphp_check_drc_props_v2(struct device_node *dn, char *drc_name,
>  	struct of_drc_info drc;
>  	const __be32 *value;
>  	char cell_drc_name[MAX_DRC_NAME_LEN];
> -	int j, fndit;
> +	int j;
>  
>  	info = of_find_property(dn->parent, "ibm,drc-info", NULL);
>  	if (info == NULL)
> @@ -245,17 +245,13 @@ static int rpaphp_check_drc_props_v2(struct device_node *dn, char *drc_name,
>  
>  		/* Should now know end of current entry */
>  
> -		if (my_index > drc.last_drc_index)
> -			continue;
> -
> -		fndit = 1;
> -		break;
> +		/* Found it */
> +		if (my_index <= drc.last_drc_index) {
> +			sprintf(cell_drc_name, "%s%d", drc.drc_name_prefix,
> +				my_index);
> +			break;
> +		}
>  	}
> -	/* Found it */
> -
> -	if (fndit)
> -		sprintf(cell_drc_name, "%s%d", drc.drc_name_prefix, 
> -			my_index);
>  
>  	if (((drc_name == NULL) ||
>  	     (drc_name && !strcmp(drc_name, cell_drc_name))) &&
> -- 
> 2.22.0.rc3
> 

Gentle ping, can someone pick this up?

Cheers,
Nathan
