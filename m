Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FAF35D8EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 09:33:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKHQr4RlVz30Dq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 17:33:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=NKemL9zX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NKemL9zX; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKHQN6R9Tz2yYn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 17:33:15 +1000 (AEST)
Received: by mail-qk1-x72d.google.com with SMTP id 18so99689qkl.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 00:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=fi/SQYUjP1voxrzKuuwXjFJ4GviRsrxWbyMgEPI3jOo=;
 b=NKemL9zXm1xWpXFIbDbQhPWamB6UPV09hDdBALn960YNO0TeDqSRsZVCnVJEo8vIRE
 X5eR0SEYp7ZD/RiAlw9euQMPaeLARmB6wN+fMKdTLdh4WolavqotZKsUxWzCHn8K9vGV
 ufJz1BS2PsWADhO3PxFrYGoRYt+a/4PCJ6KvS9/kTw9nLxQmzd9kkQ+rQCc7I6i8+qwY
 Aigvnd7byTmA5sU4d1bEFZGo5HqEumAQTto5v5nx0VHBfn1tTJ3ZG7bv7ttZZ8bOEDsB
 aWn+cMNCBDpH8uMpfXM+qLRJFe42E7o25d7hcn5GYt5jN/k1RRKiyDq7gaiaLB9YufOe
 TYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=fi/SQYUjP1voxrzKuuwXjFJ4GviRsrxWbyMgEPI3jOo=;
 b=N6IkWBwEaRt0g8HN6sfOApG7gfS89xAtb9PShPQiJkseUgn0pGlfhjr0+Hn2Tz+l0y
 pf9p4IoLhEOjN3NAXUbXiLioJoHm9o57xMSeU5owQUx8lPSpHuTrkUeWYsYKsYC+h3ly
 fozVZGrqOCnPGfb6g1/+w9zzh1UCe1IsdnNa+1TrWDiowC4DMO/K3Kz+XQSDcA9L/hg4
 5YC11/6/XNw1aV2FC4SzgTaU6TzWL0jCLLA7hqNstHbtH5gVow80ktAzLZyKGyfnjDZx
 cbJOUWVApu6wDNg2o5uGPtIkiSxN8mc9QgblNCldukT5/B7qOZ3aUw93o2Mc70JzDTYW
 239w==
X-Gm-Message-State: AOAM532nxPUR8z0UomJhK9ttU6PlxCfXeU+yN/WRVJLq1oiOQLXlRurp
 FLyva3bFVtvSuSaSY5gmzt4=
X-Google-Smtp-Source: ABdhPJy1SLxHG8RXgn3KJ+gQc3IU6giC+vkz3B0cr49oY48D2rfzihFgdeJB9kJ7UfGbigGOkcEICQ==
X-Received: by 2002:a05:620a:2206:: with SMTP id
 m6mr30375330qkh.176.1618299192514; 
 Tue, 13 Apr 2021 00:33:12 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 ([2804:14c:482:7b04::1000])
 by smtp.gmail.com with ESMTPSA id m8sm9428253qtg.67.2021.04.13.00.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 00:33:12 -0700 (PDT)
Message-ID: <e8789bb568c9cae99f07b1e6021f85c39d92f7ea.camel@gmail.com>
Subject: Re: [PATCH v2 13/14] powerpc/pseries/iommu: Make use of DDW for
 indirect mapping
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, 
 Christophe Leroy <christophe.leroy@c-s.fr>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>, Brian King
 <brking@linux.vnet.ibm.com>, Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
Date: Tue, 13 Apr 2021 04:33:07 -0300
In-Reply-To: <94ef78d5-467e-0492-4b7d-90077fe37343@ozlabs.ru>
References: <20200911170738.82818-1-leobras.c@gmail.com>
 <20200911170738.82818-14-leobras.c@gmail.com>
 <f3bc958f-a656-6481-0a19-3cff4dd3a4ff@ozlabs.ru>
 <0c6eef8181aeb69d69ce72ec86c646dfa7591414.camel@gmail.com>
 <94ef78d5-467e-0492-4b7d-90077fe37343@ozlabs.ru>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2021-04-13 at 17:18 +1000, Alexey Kardashevskiy wrote:
> 
> On 13/04/2021 15:49, Leonardo Bras wrote:
> > Thanks for the feedback!
> > 
> > On Tue, 2020-09-29 at 13:56 +1000, Alexey Kardashevskiy wrote:
> > > > -static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr)
> > > > +static phys_addr_t ddw_memory_hotplug_max(void)
> > > 
> > > 
> > > Please, forward declaration or a separate patch; this creates
> > > unnecessary noise to the actual change.
> > > 
> > 
> > Sure, done!
> > 
> > > 
> > > > +		_iommu_table_setparms(tbl, pci->phb->bus->number, create.liobn, win_addr,
> > > > +				      1UL << len, page_shift, 0, &iommu_table_lpar_multi_ops);
> > > > +		iommu_init_table(tbl, pci->phb->node, 0, 0);
> > > 
> > > 
> > > It is 0,0 only if win_addr>0 which is not the QEMU case.
> > > 
> > 
> > Oh, ok.
> > I previously though it was ok to use 0,0 here as any other usage in
> > this file was also 0,0.
> > 
> > What should I use to get the correct parameters? Use the previous tbl
> > it_reserved_start and tbl->it_reserved_end is enough?
> 
> depends on whether you carry reserved start/end even if they are outside 
> of the dma window.
> 

Oh, that makes sense.
On a previous patch (5/14 IIRC), I changed the behavior to only store
the valid range on tbl, but now I understand why it's important to
store the raw value.

Ok, I will change it back so the reserved range stays in tbl even if it
does not intersect with the DMA window. This way I can reuse the values
in case of indirect mapping with DDW.

Is that ok? Are the reserved values are supposed to stay the same after
changing from Default DMA window to DDW?

Best regards,
Leonardo Bras

