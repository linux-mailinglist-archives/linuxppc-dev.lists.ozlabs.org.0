Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC112550F4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 00:13:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcxnT48dzzDqWx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 08:13:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XufHWbEz; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bcxlb6274zDqCF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 08:11:38 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id o196so7106880qke.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 15:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=tckEyhhhQ7HGtoJozq598EKm+bx20MWZHeieMIF9q5g=;
 b=XufHWbEzrTArFbdd0uvm8hn5uvxsEsVAO3eGPiZJG+A34kNZEwwswC15vWvmQxWbe4
 ic9hXfr/HdobtOL/qWXE8X09cd5SECRxF7Nvhjc9tywTzsuI/kb2rK1MWcXoNC1QcTil
 rWeTMaWqvJeaMWo1xDp6qs8COZPe5OMKNxKoUO8IRfaUWqKI6XIqiR9NwFhe19yg25c0
 Dt3syjscZUmmI3s3Zf9PQFjv6C9Sd9ThAcIkQuKLYr4CeUG0ybKD0khabMM+YhyjqTtK
 GcBHW8KGgand8Vp4WWk6lOg0yUrSlCdN2L9DIi3iPHRIJcs9kGsyHJ+uYtqwT+Iht9to
 A4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=tckEyhhhQ7HGtoJozq598EKm+bx20MWZHeieMIF9q5g=;
 b=AT6WZLYd0oGCniaCRmC7F9teJQfBCfi7OSZG5nvIoHgUAYTWlLyfgtELU8iV2giHHU
 bmgZMwaNgUHHlc4tPEQW9Exku01WUb8fItZELe2wsYyHpcMtu80Ste1/pRwu4JRlxdgw
 yEGHSiLsj5nSc5cXsG+dT6gZa82vjl8gd1vIqAJRWoYXPkjf2pRWRdpWvNan4nW0Y8Qo
 I2AOXX+QFAKjkOIsfyhd44TmTomW5RCBNTANHOuPaw99MraCCHWygRNGO67xbiQJKJ9Q
 v4U5PnckOgP32FAUogHZ/YVpGrLhlT7NBzvodiovo88Hw5EYOzSw0dB65Ydu4an7HFFP
 O6vg==
X-Gm-Message-State: AOAM531R4LBMK1tCUGqtBGcvcqT/xNDqC9LImNCc0y79qfqJnlxS+L/y
 GqxZFycJVsQY73MWlkdWOog=
X-Google-Smtp-Source: ABdhPJwtCZUwqtlcF8l5OmsR4/12SZH/mhBkSlTzKlRzZWsnWrsjxsA04j84C1jKbFRO0yCFcP5S1Q==
X-Received: by 2002:a37:7407:: with SMTP id p7mr21257829qkc.350.1598566295135; 
 Thu, 27 Aug 2020 15:11:35 -0700 (PDT)
Received: from LeoBras ([2804:14d:8084:8e41:9b0d:571e:a65:b5d8])
 by smtp.gmail.com with ESMTPSA id x5sm2813588qtp.76.2020.08.27.15.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 15:11:34 -0700 (PDT)
Message-ID: <f80040bf941755469918fb75cf520590a4a5e3db.camel@gmail.com>
Subject: Re: [PATCH v1 06/10] powerpc/pseries/iommu: Add ddw_list_add() helper
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>,  Joel Stanley <joel@jms.id.au>, Thiago Jung
 Bauermann <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,  Brian
 King <brking@linux.vnet.ibm.com>, Murilo Fossa Vicentini
 <muvic@linux.ibm.com>, David Dai <zdai@linux.vnet.ibm.com>
Date: Thu, 27 Aug 2020 19:11:28 -0300
In-Reply-To: <af4246bb-9357-098e-f167-8f30c6b893f2@ozlabs.ru>
References: <20200817234033.442511-1-leobras.c@gmail.com>
 <20200817234033.442511-7-leobras.c@gmail.com>
 <af4246bb-9357-098e-f167-8f30c6b893f2@ozlabs.ru>
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

On Mon, 2020-08-24 at 13:46 +1000, Alexey Kardashevskiy wrote:
> >  static int find_existing_ddw_windows(void)
> >  {
> >  	int len;
> > @@ -887,18 +905,11 @@ static int find_existing_ddw_windows(void)
> >  		if (!direct64)
> >  			continue;
> >  
> > -		window = kzalloc(sizeof(*window), GFP_KERNEL);
> > -		if (!window || len < sizeof(struct dynamic_dma_window_prop)) {
> > +		window = ddw_list_add(pdn, direct64);
> > +		if (!window || len < sizeof(*direct64)) {
> 
> Since you are touching this code, it looks like the "len <
> sizeof(*direct64)" part should go above to "if (!direct64)".

Sure, makes sense.
It will be fixed for v2.

> 
> 
> 
> >  			kfree(window);
> >  			remove_ddw(pdn, true);
> > -			continue;
> >  		}
> > -
> > -		window->device = pdn;
> > -		window->prop = direct64;
> > -		spin_lock(&direct_window_list_lock);
> > -		list_add(&window->list, &direct_window_list);
> > -		spin_unlock(&direct_window_list_lock);
> >  	}
> >  
> >  	return 0;
> > @@ -1261,7 +1272,8 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> >  	dev_dbg(&dev->dev, "created tce table LIOBN 0x%x for %pOF\n",
> >  		  create.liobn, dn);
> >  
> > -	window = kzalloc(sizeof(*window), GFP_KERNEL);
> > +	/* Add new window to existing DDW list */
> 
> The comment seems to duplicate what the ddw_list_add name already suggests.

Ok, I will remove it then.

> > +	window = ddw_list_add(pdn, ddwprop);
> >  	if (!window)
> >  		goto out_clear_window;
> >  
> > @@ -1280,16 +1292,14 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> >  		goto out_free_window;
> >  	}
> >  
> > -	window->device = pdn;
> > -	window->prop = ddwprop;
> > -	spin_lock(&direct_window_list_lock);
> > -	list_add(&window->list, &direct_window_list);
> > -	spin_unlock(&direct_window_list_lock);
> 
> I'd leave these 3 lines here and in find_existing_ddw_windows() (which
> would make  ddw_list_add -> ddw_prop_alloc). In general you want to have
> less stuff to do on the failure path. kmalloc may fail and needs kfree
> but you can safely delay list_add (which cannot fail) and avoid having
> the lock help twice in the same function (one of them is hidden inside
> ddw_list_add).
> Not sure if this change is really needed after all. Thanks,

I understand this leads to better performance in case anything fails.
Also, I think list_add happening in the end is less error-prone (in
case the list is checked between list_add and a fail).

But what if we put it at the end?
What is the chance of a kzalloc of 4 pointers (struct direct_window)
failing after walk_system_ram_range?  

Is it not worthy doing that for making enable_ddw() easier to
understand?

Best regards,
Leonardo

