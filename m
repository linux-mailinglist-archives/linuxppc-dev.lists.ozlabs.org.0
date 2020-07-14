Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 178E321E5D5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 04:42:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5PtY6PMszDqbh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 12:42:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FrlaItIQ; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5Prm4vfZzDqY7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 12:40:40 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id b185so14348925qkg.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 19:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=VhnzMvRh92bFnB/5JzWL/d0Vx8GKiVAJ76KkNSRUr2c=;
 b=FrlaItIQduAS/q8vh6uL7Tyi1GyQ/HVTA6SK7who6fyJ+dcqTPFsM0HxWEtovLQ1Mr
 tjShazsTsayLomr6pmq7Hw9/B4eSwPfhIAKzqgaq0RX0UMJm69bl0UlVUbHV2IBP3ScJ
 RG0Stwlmm33AbJ32V78v0gMbU+AUykc6Kum7LMlemilraH16BOYOA0bYWKOsscKpqW9j
 GcBLrqgHZKFEZoUb2Kw5Oz7yPhB0cWl3JKsg2iM0pCdiOBqPlOlYPF3eWT1lAwK/fuwx
 grrgJYaRwP69bRHmsKXYpnLlge7cydbLTXXiuipJTtkxHTxWARO3SjITTmd9q5kF8qik
 vg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=VhnzMvRh92bFnB/5JzWL/d0Vx8GKiVAJ76KkNSRUr2c=;
 b=IeiqEhGstMtsXKPQesCb7ZNqSfacn/UAqCpoO2WZ6w68rAVykXIFg1tt11WaX8KtBP
 JxBALW890AXOuApl1j3cl6V5t2caoXPnh018BMGB2gRhQuck+juIdC4BoO5argR1fQwD
 53HgekUT3IhvZDBWhxoP3eJ3gSMTSBqts10l6NMpJKrEmF2YrRWupTCxdVnLmT6s/TpF
 HiUsHy1z1cHqYvIMpPCIa4xtOW+EBqQwoy3HhT3MjbZbNhYj0cTTvjU+fTF8Kqv7q2gc
 NIz4vn7y3G+vYib10w1xlfrmg6BRnq2WRXJ2HXrc6ICN0iiIyOdOYxrK89JmmpWvOrD2
 kiEA==
X-Gm-Message-State: AOAM532/bNq1l4nVKk9dXVvnPJ9XQezuES+GBxZJGyu31ZqnlZ40PN3v
 ZNzp72UK4ajpZ20u/jSDRhU=
X-Google-Smtp-Source: ABdhPJxi0YtrONtF+8IAfqRVT5Lj4N4py9/mZBmawj9Vet9x7vAv3tmeIH/IeS7nBwMCwQoHFVLsKg==
X-Received: by 2002:a37:d0d:: with SMTP id 13mr2671093qkn.234.1594694436832;
 Mon, 13 Jul 2020 19:40:36 -0700 (PDT)
Received: from LeoBras (179-125-193-229.dynamic.desktop.com.br.
 [179.125.193.229])
 by smtp.gmail.com with ESMTPSA id r7sm20604694qtm.66.2020.07.13.19.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 19:40:36 -0700 (PDT)
Message-ID: <8c29be499e8741e7d77d53ca005034a2ca0179ac.camel@gmail.com>
Subject: Re: [PATCH v3 4/6] powerpc/pseries/iommu: Remove default DMA window
 before creating DDW
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>
Date: Mon, 13 Jul 2020 23:40:30 -0300
In-Reply-To: <cc15a81d-04d9-3ee4-4fdb-093618f6e635@ozlabs.ru>
References: <20200703061844.111865-1-leobras.c@gmail.com>
 <20200703061844.111865-5-leobras.c@gmail.com>
 <cc15a81d-04d9-3ee4-4fdb-093618f6e635@ozlabs.ru>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Thank you for this feedback Alexey!

On Mon, 2020-07-13 at 17:33 +1000, Alexey Kardashevskiy wrote:
> [...]
> > -	int len, ret;
> > +	int len, ret, reset_win_ext;
> 
> Make it "reset_token".

Oh, it's not a token here, it just checks if the reset_win extension
exists. The token would be returned in *value, but since we did not
need it here, it's not copied.

> > [...]
> > -out_failed:
> > +out_restore_defwin:
> > +	if (default_win && reset_win_ext == 0)
> 
> reset_win_ext potentially may be uninitialized here. Yeah I know it is
> tied to default_win but still.

I can't see it being used uninitialized here, as you said it's tied to
default_win. 
Could you please tell me how it can be used uninitialized here, or what
is bad by doing this way?

> After looking at this function for a few minutes, it could use some
> refactoring (way too many gotos)  such as:

Yes, I agree.

> 1. move (query.page_size & xx) checks before "if
> (query.windows_available == 0)"

Moving 'page_size selection' above 'checking windows available' will
need us to duplicate the 'page_size selection' after the new query,
inside the if.
I mean, as query will be done again, it will need to get the (new) page
size.

> 2. move "win64 = kzalloc(sizeof(struct property), GFP_KERNEL)" before
> "if (query.windows_available == 0)"

> 3. call "reset_dma_window(dev, pdn)" inside the "if
> (query.windows_available == 0)" branch.

> Then you can drop all "goto out_restore_defwin" and move default_win and
> reset_win_ext inside "if (query.windows_available == 0)".

I did all changes suggested locally and did some analysis in the
result:

I did not see a way to put default_win and reset_win_ext inside 
"if (query.windows_available == 0)", because if we still need a way to
know if the default window was removed, and if so, restore in case
anything ever fails ahead (like creating the node property). 

But from that analysis I noted it's possible to remove all the new
"goto out_restore_defwin", if we do default_win = NULL if
ddw_read_ext() fails. 

So testing only default_win should always be enough to say if the
default window was deleted, and reset_win_ext could be moved inside "if
(query.windows_available == 0)".
Also, it would avoid reset_win_ext being 'used uninitialized' and
"out_restore_defwin:" would not be needed.

Against the current patch, we would have something like this:

#####

 static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 {
-       int len, ret, reset_win_ext;
+       int len, ret;
        struct ddw_query_response query;
        struct ddw_create_response create;
        int page_shift;
@@ -1173,25 +1173,28 @@ static u64 enable_ddw(struct pci_dev *dev,
struct device_node *pdn)
         * for extensions presence.
         */
        if (query.windows_available == 0) {
+               int reset_win_ext;
                default_win = of_find_property(pdn, "ibm,dma-window",
NULL);
                if (!default_win)
                        goto out_failed;
 
                reset_win_ext = ddw_read_ext(pdn,
DDW_EXT_RESET_DMA_WIN, NULL);
-               if (reset_win_ext)
+               if (reset_win_ext){
+                       default_win = NULL;
                        goto out_failed;
+               }
 
                remove_dma_window(pdn, ddw_avail, default_win);
 
                /* Query again, to check if the window is available */
                ret = query_ddw(dev, ddw_avail, &query, pdn);
                if (ret != 0)
-                       goto out_restore_defwin;
+                       goto out_failed;
 
                if (query.windows_available == 0) {
                        /* no windows are available for this device. */
                        dev_dbg(&dev->dev, "no free dynamic windows");
-                       goto out_restore_defwin;
+                       goto out_failed;
                }
        }
        if (query.page_size & 4) {
@@ -1203,7 +1206,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct
device_node *pdn)
        } else {
                dev_dbg(&dev->dev, "no supported direct page size in
mask %x",
                          query.page_size);
-               goto out_restore_defwin;
+               goto out_failed;
        }
        /* verify the window * number of ptes will map the partition */
        /* check largest block * page size > max memory hotplug addr */
@@ -1212,14 +1215,14 @@ static u64 enable_ddw(struct pci_dev *dev,
struct device_node *pdn)
                dev_dbg(&dev->dev, "can't map partition max 0x%llx with
%llu "
                          "%llu-sized pages\n",
max_addr,  query.largest_available_block,
                          1ULL << page_shift);
-               goto out_restore_defwin;
+               goto out_failed;
        }
        len = order_base_2(max_addr);
        win64 = kzalloc(sizeof(struct property), GFP_KERNEL);
        if (!win64) {
                dev_info(&dev->dev,
                        "couldn't allocate property for 64bit dma
window\n");
-               goto out_restore_defwin;
+               goto out_failed;
        }
        win64->name = kstrdup(DIRECT64_PROPNAME, GFP_KERNEL);
        win64->value = ddwprop = kmalloc(sizeof(*ddwprop), GFP_KERNEL);
@@ -1282,11 +1285,10 @@ static u64 enable_ddw(struct pci_dev *dev,
struct device_node *pdn)
        kfree(win64->value);
        kfree(win64);
 
-out_restore_defwin:
-       if (default_win && reset_win_ext == 0)
+out_failed:
+       if (default_win)
                reset_dma_window(dev, pdn);
 
-out_failed:
        fpdn = kzalloc(sizeof(*fpdn), GFP_KERNEL);
        if (!fpdn)
                goto out_unlock;

#####

What do you think?



> The rest of the series is good as it is,

Thank you :)

>  however it may conflict with
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20200713062348.100552-1-aik@ozlabs.ru/
> and the patchset it is made on top of -
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=188385 .

<From the message of the first link>
> (do not rush, let me finish reviewing this first) 

Ok, I have no problem rebasing on top of those patchsets, but what
would you suggest to be done?

Would it be ok doing a big multi-author patchset, so we guarantee it
being applied in the correct order?

(You probably want me to rebase my patchset on top of Hellwig + yours,
right?) 


> thanks,
Thank you!



