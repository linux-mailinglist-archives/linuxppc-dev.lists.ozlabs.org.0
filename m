Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4303203FE0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 21:08:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rJq52t12zDqMg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 05:08:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eECU36ZV; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rJcW67r8zDqWL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 04:59:39 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id l6so12911421qkc.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 11:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=f4iy9Hd1w0zJAlXEFRCnJHxvinMyhXg+8Iy3wz3TXII=;
 b=eECU36ZVjZz8hZY846jkt5SJoCTI+4a8kDaC/+DEX+OfOjFg6ncgMcPhIa4GruhLg4
 BG0cLqfGfolvPcZcFYfhqxo0FMAiF/NmAK2HYMwjazdJKX/eJo5MbeANBbFofDZTb8/X
 KfLkchm/gOLRPh5Swk3bdBZJTWhq4+Nq0XQGKZtLZPWCC4ZEM2cwJ5QXjSaJ4mbqAHUR
 fL54FRINqrSwmhGbUlA+k0veRzVjSDDENfLH8KCJyeyewscnfXHU5+7gWkTOZ/ofU+Mx
 JEqK6Pk//PAeJwzG7aOPEG0TnnarSIzf0+KMcAnsPoC+Vv10k0DON44NqOTCyOb1C1SQ
 FgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=f4iy9Hd1w0zJAlXEFRCnJHxvinMyhXg+8Iy3wz3TXII=;
 b=QAh+lh8m7QxGV8PHWMxEoTSEqpgInZNdmzhObxamBbb3M4yMCwxMACtA1DtFXsriU9
 9WM+8Q+pPlj4HWE5mSF+iQqWZTzwUb9SmZONBO57r7Zn9SNSI0RwUm6WLS5K+q0oTT3g
 K3gM903Xs5GHCjHtZ3TtICP+6u7i+P4EYHdRGRssx75XfL0CT3Rc67Ay9VbVe5Ot6Lc7
 GP/+iYN/gOG9TbwCDCFn79y7UE033W4T3JfovKRKny4XO4gKi1lHO4GwpLUzXentAXsC
 nMimoya4b5Lb4UJY/0XPk9lk4rEdOnZXr8O6X67W3WzXUaOlzHlQjnd0AMRrM6SBmtsF
 mmXQ==
X-Gm-Message-State: AOAM5319dVVH+jzxvYTEBzVrU1gnDQAnzhnVeD8j4bH2Utjexj9LRHQx
 dCUbnvbrgsvz3Wja4s6fz4k=
X-Google-Smtp-Source: ABdhPJzzoWaREA/uNfK0f9aPzY48EBbv95gn9nHTvdkd33MN1QQwXKfRvdvvVRCYJRObdZRJCWK7aQ==
X-Received: by 2002:a05:620a:788:: with SMTP id
 8mr7327048qka.127.1592852376858; 
 Mon, 22 Jun 2020 11:59:36 -0700 (PDT)
Received: from LeoBras (177-131-65-187.dynamic.desktop.com.br.
 [177.131.65.187])
 by smtp.gmail.com with ESMTPSA id i14sm13900216qkl.105.2020.06.22.11.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 11:59:36 -0700 (PDT)
Message-ID: <ccf7b591f2bf61ba4705699b2e2b050c3cf48d99.camel@gmail.com>
Subject: Re: [PATCH 3/4] powerpc/pseries/iommu: Move window-removing part of
 remove_ddw into remove_dma_window
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>
Date: Mon, 22 Jun 2020 15:59:14 -0300
In-Reply-To: <51201582-efe5-85df-7e65-a998e91ab63f@ozlabs.ru>
References: <20200619050619.266888-1-leobras.c@gmail.com>
 <20200619050619.266888-4-leobras.c@gmail.com>
 <51201582-efe5-85df-7e65-a998e91ab63f@ozlabs.ru>
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

Hello Alexey, thanks for the feedback!

On Mon, 2020-06-22 at 20:02 +1000, Alexey Kardashevskiy wrote:
> 
> On 19/06/2020 15:06, Leonardo Bras wrote:
> > Move the window-removing part of remove_ddw into a new function
> > (remove_dma_window), so it can be used to remove other DMA windows.
> > 
> > It's useful for removing DMA windows that don't create DIRECT64_PROPNAME
> > property, like the default DMA window from the device, which uses
> > "ibm,dma-window".
> > 
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > ---
> >  arch/powerpc/platforms/pseries/iommu.c | 53 +++++++++++++++-----------
> >  1 file changed, 31 insertions(+), 22 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> > index 5e1fbc176a37..de633f6ae093 100644
> > --- a/arch/powerpc/platforms/pseries/iommu.c
> > +++ b/arch/powerpc/platforms/pseries/iommu.c
> > @@ -767,25 +767,14 @@ static int __init disable_ddw_setup(char *str)
> >  
> >  early_param("disable_ddw", disable_ddw_setup);
> >  
> > -static void remove_ddw(struct device_node *np, bool remove_prop)
> > +static void remove_dma_window(struct device_node *pdn, u32 *ddw_avail,
> 
> You do not need the entire ddw_avail here, pass just the token you need.

Well, I just emulated the behavior of create_ddw() and query_ddw() as
both just pass the array instead of the token, even though they only
use a single token. 

I think it's to make the rest of the code independent of the design of
the "ibm,ddw-applicable" array, and if it changes, only local changes
on the functions will be needed.

> Also, despite this particular file, the "pdn" name is usually used for
> struct pci_dn (not device_node), let's keep it that way.

Sure, I got confused for some time about this, as we have:
static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn).
but on *_ddw() we have "struct pci_dn *pdn".

I will also add a patch that renames those 'struct device_node *pdn' to
something like 'struct device_node *parent_dn'.

> > +			      struct property *win)
> >  {
> >  	struct dynamic_dma_window_prop *dwp;
> > -	struct property *win64;
> > -	u32 ddw_avail[3];
> >  	u64 liobn;
> > -	int ret = 0;
> > -
> > -	ret = of_property_read_u32_array(np, "ibm,ddw-applicable",
> > -					 &ddw_avail[0], 3);
> > -
> > -	win64 = of_find_property(np, DIRECT64_PROPNAME, NULL);
> > -	if (!win64)
> > -		return;
> > -
> > -	if (ret || win64->length < sizeof(*dwp))
> > -		goto delprop;
> > +	int ret;
> >  
> > -	dwp = win64->value;
> > +	dwp = win->value;
> >  	liobn = (u64)be32_to_cpu(dwp->liobn);
> >  
> >  	/* clear the whole window, note the arg is in kernel pages */
> > @@ -793,24 +782,44 @@ static void remove_ddw(struct device_node *np, bool remove_prop)
> >  		1ULL << (be32_to_cpu(dwp->window_shift) - PAGE_SHIFT), dwp);
> >  	if (ret)
> >  		pr_warn("%pOF failed to clear tces in window.\n",
> > -			np);
> > +			pdn);
> >  	else
> >  		pr_debug("%pOF successfully cleared tces in window.\n",
> > -			 np);
> > +			 pdn);
> >  
> >  	ret = rtas_call(ddw_avail[2], 1, 1, NULL, liobn);
> >  	if (ret)
> >  		pr_warn("%pOF: failed to remove direct window: rtas returned "
> >  			"%d to ibm,remove-pe-dma-window(%x) %llx\n",
> > -			np, ret, ddw_avail[2], liobn);
> > +			pdn, ret, ddw_avail[2], liobn);
> >  	else
> >  		pr_debug("%pOF: successfully removed direct window: rtas returned "
> >  			"%d to ibm,remove-pe-dma-window(%x) %llx\n",
> > -			np, ret, ddw_avail[2], liobn);
> > +			pdn, ret, ddw_avail[2], liobn);
> > +}
> > +
> > +static void remove_ddw(struct device_node *np, bool remove_prop)
> > +{
> > +	struct property *win;
> > +	u32 ddw_avail[3];
> > +	int ret = 0;
> > +
> > +	ret = of_property_read_u32_array(np, "ibm,ddw-applicable",
> > +					 &ddw_avail[0], 3);
> > +	if (ret)
> > +		return;
> > +
> > +	win = of_find_property(np, DIRECT64_PROPNAME, NULL);
> > +	if (!win)
> > +		return;
> > +
> > +	if (win->length >= sizeof(struct dynamic_dma_window_prop))
> 
> Any good reason not to make it "=="? Is there something optional or we
> expect extension (which may not grow from the end but may add cells in
> between). Thanks,

Well, it comes from the old behavior of remove_ddw():
-	if (ret || win64->length < sizeof(*dwp))
-		goto delprop;

As I reversed the logic from 'if (test) go out' to 'if (!test) do
stuff', I also reversed (a < b) to !(a < b) => (a >= b).

I have no problem changing that to '==', but it will produce a
different behavior than before. 

> 
> 
> > +		remove_dma_window(np, ddw_avail, win);
> > +
> > +	if (!remove_prop)
> > +		return;
> >  
> > -delprop:
> > -	if (remove_prop)
> > -		ret = of_remove_property(np, win64);
> > +	ret = of_remove_property(np, win);
> >  	if (ret)
> >  		pr_warn("%pOF: failed to remove direct window property: %d\n",
> >  			np, ret);
> > 

Best regards,
Leonardo

