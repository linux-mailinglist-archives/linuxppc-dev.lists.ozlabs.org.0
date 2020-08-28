Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1152256270
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 23:30:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BdXnZ2ypnzDqsv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Aug 2020 07:30:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mirSGP20; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BdXlh3N7dzDqfK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Aug 2020 07:28:46 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id e5so677007qth.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 14:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=F7YyLemxrye9vgwPANavphVUg5hUjdLvXb0s+tyE/S8=;
 b=mirSGP20EYE+rkDKeOgRE0lTgkLJS454+wg0q/OHk9jLqZ8qTUujlw4TUCC21bnOxi
 KpP4rqtF28fnMWVOnxSprnQ3/pzobOe0lhnGwvdVnVZXbuZkLtsN9gmxyb4O9YS5qcme
 05x/tFtJUotyno2fam3PxrJBFHbmcByoKEQd/t14c+4chOaYK9UlYnNsbrKPCtIzSgcO
 IQpWvVgM/7r2+1fRpbqwYiZldRhhwou6Fln71kUvYY7/wVKW5qPPHSdtFdM58HuIoVKA
 o4961oH1oclAGHmU7BE+PUXXjJC4WMaeOra7KAWtLKZGAZw0sudUh/GR68km/4puQTjT
 orDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=F7YyLemxrye9vgwPANavphVUg5hUjdLvXb0s+tyE/S8=;
 b=JSSdb9kGMzloEp202q0J9Wqiq0CspOIwZSM0OA3VmdJ3xDwH7phkrwzJZIfCfoO1IY
 Ew77TI8UkOwCEMdtRjLbzC+MWDiMZpgWALWpRX8Z7Nc5NS242s5pmGkssRbcXT9JuD4n
 F0nkBKLw3+EL0LDthQLQwMmMkygjAJldOnf6r6V/UcvYBmZd4JLOYwmJjh8EE0pEGQku
 Ak+gDeOM8QsvzH3szG15v9Oxkp0S6tG6cYwL/lABw57/OteVUoBh5XiQ2uD7QqK367kp
 +FD93xIdGwJwgTdZ/on1hudo/6mhBOzYYHw/EtDZ/lTRVrevSx5WUprnUYJ+UX721eqg
 kxAg==
X-Gm-Message-State: AOAM533XNPnZzyEwRwvGY5vQl20gStLx8I5FWAhDm2YfOQnWsZhiGlGI
 WAq1UfSDubMftg744dNNniM=
X-Google-Smtp-Source: ABdhPJyk0vYbjHnfek7tokPDZ8L3Qx3TKVWTIQB00j5kNsq1CosEkPcRW/SbLvDtwVOmDelVJaGxeQ==
X-Received: by 2002:aed:2907:: with SMTP id s7mr3220049qtd.321.1598650122362; 
 Fri, 28 Aug 2020 14:28:42 -0700 (PDT)
Received: from LeoBras ([2804:14d:8084:8e41:9b0d:571e:a65:b5d8])
 by smtp.gmail.com with ESMTPSA id r34sm395582qtr.18.2020.08.28.14.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 14:28:41 -0700 (PDT)
Message-ID: <b9349897f3a9e8c247796708c0817f9bc93295fb.camel@gmail.com>
Subject: Re: [PATCH v1 06/10] powerpc/pseries/iommu: Add ddw_list_add() helper
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>,  Joel Stanley <joel@jms.id.au>, Thiago Jung
 Bauermann <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,  Brian
 King <brking@linux.vnet.ibm.com>, Murilo Fossa Vicentini
 <muvic@linux.ibm.com>, David Dai <zdai@linux.vnet.ibm.com>
Date: Fri, 28 Aug 2020 18:28:34 -0300
In-Reply-To: <54cfb977-6d30-47b8-b26b-f47efd10299f@ozlabs.ru>
References: <20200817234033.442511-1-leobras.c@gmail.com>
 <20200817234033.442511-7-leobras.c@gmail.com>
 <af4246bb-9357-098e-f167-8f30c6b893f2@ozlabs.ru>
 <f80040bf941755469918fb75cf520590a4a5e3db.camel@gmail.com>
 <54cfb977-6d30-47b8-b26b-f47efd10299f@ozlabs.ru>
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

On Fri, 2020-08-28 at 11:58 +1000, Alexey Kardashevskiy wrote:
> 
> On 28/08/2020 08:11, Leonardo Bras wrote:
> > On Mon, 2020-08-24 at 13:46 +1000, Alexey Kardashevskiy wrote:
> > > >  static int find_existing_ddw_windows(void)
> > > >  {
> > > >  	int len;
> > > > @@ -887,18 +905,11 @@ static int find_existing_ddw_windows(void)
> > > >  		if (!direct64)
> > > >  			continue;
> > > >  
> > > > -		window = kzalloc(sizeof(*window), GFP_KERNEL);
> > > > -		if (!window || len < sizeof(struct dynamic_dma_window_prop)) {
> > > > +		window = ddw_list_add(pdn, direct64);
> > > > +		if (!window || len < sizeof(*direct64)) {
> > > 
> > > Since you are touching this code, it looks like the "len <
> > > sizeof(*direct64)" part should go above to "if (!direct64)".
> > 
> > Sure, makes sense.
> > It will be fixed for v2.
> > 
> > > 
> > > 
> > > >  			kfree(window);
> > > >  			remove_ddw(pdn, true);
> > > > -			continue;
> > > >  		}
> > > > -
> > > > -		window->device = pdn;
> > > > -		window->prop = direct64;
> > > > -		spin_lock(&direct_window_list_lock);
> > > > -		list_add(&window->list, &direct_window_list);
> > > > -		spin_unlock(&direct_window_list_lock);
> > > >  	}
> > > >  
> > > >  	return 0;
> > > > @@ -1261,7 +1272,8 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> > > >  	dev_dbg(&dev->dev, "created tce table LIOBN 0x%x for %pOF\n",
> > > >  		  create.liobn, dn);
> > > >  
> > > > -	window = kzalloc(sizeof(*window), GFP_KERNEL);
> > > > +	/* Add new window to existing DDW list */
> > > 
> > > The comment seems to duplicate what the ddw_list_add name already suggests.
> > 
> > Ok, I will remove it then.
> > 
> > > > +	window = ddw_list_add(pdn, ddwprop);
> > > >  	if (!window)
> > > >  		goto out_clear_window;
> > > >  
> > > > @@ -1280,16 +1292,14 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> > > >  		goto out_free_window;
> > > >  	}
> > > >  
> > > > -	window->device = pdn;
> > > > -	window->prop = ddwprop;
> > > > -	spin_lock(&direct_window_list_lock);
> > > > -	list_add(&window->list, &direct_window_list);
> > > > -	spin_unlock(&direct_window_list_lock);
> > > 
> > > I'd leave these 3 lines here and in find_existing_ddw_windows() (which
> > > would make  ddw_list_add -> ddw_prop_alloc). In general you want to have
> > > less stuff to do on the failure path. kmalloc may fail and needs kfree
> > > but you can safely delay list_add (which cannot fail) and avoid having
> > > the lock help twice in the same function (one of them is hidden inside
> > > ddw_list_add).
> > > Not sure if this change is really needed after all. Thanks,
> > 
> > I understand this leads to better performance in case anything fails.
> > Also, I think list_add happening in the end is less error-prone (in
> > case the list is checked between list_add and a fail).
> 
> Performance was not in my mind at all.
> 
> I noticed you remove from a list with a lock help and it was not there
> before and there is a bunch on labels on the exit path and started
> looking for list_add() and if you do not double remove from the list.
> 
> 
> > But what if we put it at the end?
> > What is the chance of a kzalloc of 4 pointers (struct direct_window)
> > failing after walk_system_ram_range?
> 
> This is not about chances really, it is about readability. If let's say
> kmalloc failed, you just to the error exit label and simply call kfree()
> on that pointer, kfree will do nothing if it is NULL already, simple.
> list_del() does not have this simplicity.
> 
> 
> > Is it not worthy doing that for making enable_ddw() easier to
> > understand?
> 
> This is my goal here :)

Ok, it makes sense to me now. 
I tried creating list_add() to keep everything related to list-adding
into a single place, instead of splitting it around the other stuff,
but now I understand that the code may look more complex than it was
before, because of the failing path increasing in size.

For me it was strange creating a list entry end not list_add()ing it
right away, but maybe it's something worth to get used to, as it may
increase the failing path simplicity, since list_add() don't fail.

I will try to see if the ddw_list_add() routine would become a useful
ddw_list_entry(), but if not, I will remove this patch.

Alexey, Thank you for reviewing this series!
Best regards,

Leonardo

