Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0992F35D7B3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 08:04:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKFRj663Lz3c06
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 16:04:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=LbjjzMLJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f31;
 helo=mail-qv1-xf31.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LbjjzMLJ; dkim-atps=neutral
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKFRF1V5zz2yYt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 16:03:52 +1000 (AEST)
Received: by mail-qv1-xf31.google.com with SMTP id i11so2038550qvu.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 23:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=fx7eFNUKgyLqMFjNQzxMGTEq+3zGtZwIiSrJiXnUMTQ=;
 b=LbjjzMLJTSyr3ydl2ZeJzKd3yMZNG1/ScI66UJ7qGkXeUgcn3DyOHq65g56Vuu3v9L
 S0Uy9ooqbcBX/mj1uQCwqz1PNWzfY/fRKqFS0MiOg68AokoMi2cyNESKVBNQb8p0oPXO
 W28RwnoB2YBM+8hEAaB/jlx0885aj1jJtby1UlsiWnqLoD5iqWR6/3wnCfTBGgv2TiqH
 C4b5IwHj2qlo7wu/XfhZ/Oci3xZ7hG0BYkabLaP49djTriQZFNMsstEaL8dSBzs2J47j
 uy3HrbZd65xpOxjGrEjtZW9+kktYZKgoZ2vLGf+im5uGIl3hjhTcWcyTC+m/lroMmr5u
 UlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=fx7eFNUKgyLqMFjNQzxMGTEq+3zGtZwIiSrJiXnUMTQ=;
 b=NAkQmzhxcsnWG85QE1se/rL4En9WxptkKae1qpVc4bNi2dRjgZKQL3LgIsJq8PaAZ1
 z+NLxMiIH+AgWq7pvpHLwsVAVW1RmneoJYCpt7gQf/scN9+Wrbtvn16JDU725RvRvAfa
 dNXPKATVcaAlzCQn/PNczG7PfxpGf4jcFGXjw4U40LjOZD/QDQt/ZN3uyKV+SPLF8T29
 LAJc+qyc1ga3wnLg8YEB0ltXA6pv5gBcCt3Heh7BBNzTLTYG5KbZRKrZE+/bzAeeES5q
 kWnrng3IzjDHM5FD/JAkGVjtWe/4Cj09mOH3TAcocvfonRE+Hn560SwK0jQhgt3XDOIr
 Atqw==
X-Gm-Message-State: AOAM531z6Ub0VW/J5WijBS/3jHqzsVuqXzJLUNrVx2mqaFF3d2SVi86A
 zklWbLB8ycWY6c7XNg1GoiLI4qvscHE=
X-Google-Smtp-Source: ABdhPJwH7IhpnjlAl4gbj0jRWDGBxHQxpUBpnnlqeXkA7cS1cLGiRlOLEUcm8WHpwYmEcR80dKXRnQ==
X-Received: by 2002:a0c:fd41:: with SMTP id j1mr31683143qvs.29.1618293828741; 
 Mon, 12 Apr 2021 23:03:48 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 ([2804:14c:482:7b04::1000])
 by smtp.gmail.com with ESMTPSA id j129sm9525483qkf.110.2021.04.12.23.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 23:03:48 -0700 (PDT)
Message-ID: <2ac19d2ab5da87c196bc9b3f6db1d80881f73a10.camel@gmail.com>
Subject: Re: [PATCH v2 14/14] powerpc/pseries/iommu: Rename "direct window"
 to "dma window"
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, 
 Christophe Leroy <christophe.leroy@c-s.fr>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>, Brian King
 <brking@linux.vnet.ibm.com>, Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
Date: Tue, 13 Apr 2021 03:03:44 -0300
In-Reply-To: <1167e804-eddb-345e-539d-009b7c8d35fe@ozlabs.ru>
References: <20200911170738.82818-1-leobras.c@gmail.com>
 <20200911170738.82818-15-leobras.c@gmail.com>
 <2ba89065-4e9c-57c2-3825-aed9a7d8451a@ozlabs.ru>
 <1b813ab38869e2e6770ed09487a3fba7befaca86.camel@gmail.com>
 <1167e804-eddb-345e-539d-009b7c8d35fe@ozlabs.ru>
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

On Wed, 2020-09-30 at 17:29 +1000, Alexey Kardashevskiy wrote:
> 
> On 30/09/2020 06:54, Leonardo Bras wrote:
> > On Tue, 2020-09-29 at 13:55 +1000, Alexey Kardashevskiy wrote:
> > > 
> > > On 12/09/2020 03:07, Leonardo Bras wrote:
> > > > Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
> > > > 
> > > > A previous change introduced the usage of DDW as a bigger indirect DMA
> > > > mapping when the DDW available size does not map the whole partition.
> > > > 
> > > > As most of the code that manipulates direct mappings was reused for
> > > > indirect mappings, it's necessary to rename all names and debug/info
> > > > messages to reflect that it can be used for both kinds of mapping.
> > > > 
> > > > Also, defines DEFAULT_DMA_WIN as "ibm,dma-window" to document that
> > > > it's the name of the default DMA window.
> > > 
> > > "ibm,dma-window" is so old so it does not need a macro (which btw would
> > > be DMA_WIN_PROPNAME to match the other names) :)
> > 
> > Thanks for bringing that to my attention!
> > In fact, DMA_WIN_PROPNAME makes more sense, but it's still generic and
> > doesn't look to point to a generic one.
> > 
> > Would that be ok to call it DEFAULT_WIN_PROPNAME ?
> 
> 
> I would not touch it at all, the property name is painfully known and 
> not going to change ever. Does anyone else define it as a macro? I do 
> not see any:

Ok then, reverting define :)

Thanks!

> 
> [fstn1-p1 kernel-dma-bypass]$ git grep "ibm,dma-window"  | wc -l
> 8
> [fstn1-p1 kernel-dma-bypass]$ git grep "define.*ibm,dma-window"  | wc -l
> 0
> 
> 
> 
> > 
> > 
> > > 
> > > 
> > > > Those changes are not supposed to change how the code works in any
> > > > way, just adjust naming.
> > > 
> > > I simply have this in my .vimrc for the cases like this one:
> > > 
> > > ===
> > > This should cause no behavioural change.
> > > ===
> > 
> > Great tip! I will make sure to have this saved here :)
> > 
> > Thank you!
> > 
> 


