Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DF13CEB19
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 20:47:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GT9ng0z2Yz3bfD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 04:47:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=tBgEoVYV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tBgEoVYV; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GT9nF2nJ3z2yR2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 04:47:12 +1000 (AEST)
Received: by mail-qk1-x734.google.com with SMTP id q15so4115889qkm.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jul 2021 11:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=8VAc3DE00jU/y6BHOt7Dq8IZFxqIDCeAd2CU/bSAzlU=;
 b=tBgEoVYVw7XrKsAR/IUWn/GrGTdwpVKlJ00gccf4xz0UUaPBNQ9b3+nFJ6Spqbo9Oq
 F8NDCyivPbeAu++4sdIgxo1f+cX16wDSdH7VHJgbxWTCuI34NxZz1A5w2E3+qZ7sEnuw
 gergcJeCq1BsZgs9hUw+wzl2SZ0+UnEEjBg620WEoP8XYlHqOsXyhONWJMgUlaB/29eH
 tAKdIWHGUBCqN9HJ2lThRupJpQ9qNinVcKVSOuogsExI8/0/Wd3nUgU5BXYeXxmMyVye
 gd2gu8TZaTdLMyZc6sPu1DelrbKiBBD4u3e52qZGfChBnx/G5yBhYPczqeQhzb6As1NB
 VNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=8VAc3DE00jU/y6BHOt7Dq8IZFxqIDCeAd2CU/bSAzlU=;
 b=W12gG/gkwBrRm7eBkXNszCzrtgCC3UQHZcdJOt/7F9MCHMmCKIrjZcAFdNGwZBXFcP
 JvCkrSWMPhtBzQWJ+Bi0cJSMXjPBKguYof2ea1Fau0tgiL3G6v5bYAPoUN4UQF35BJb2
 QDP//SWacnjXGRgWRuzxASIY4EwfPgb/eAXJi1qZhiWb3h8WHZ+1wK8kY4jvtCHu01az
 8sKDcgYFHlWheJatXKG41b720qcxdNqexwYRxA6x3ns/NG/hAXgPN4sfNN1icYGF9agj
 +5i9V2Qx5+943408aoulvnF59tOMi7gH+vOMcTyYFct6XVRzFIq0AxdlJif4VSA0Js2d
 GcAA==
X-Gm-Message-State: AOAM533ADxNzOd+L0Srtp3wGVVWsoxyzdwb7k2EjZzsCj8kJ9O8CXaeP
 7xTy3sS/GGLL4JkXZtQyWj0=
X-Google-Smtp-Source: ABdhPJyB60Nv+E0Ucay9mft9FFOPc8+Q/Y9sO9olPyWkMSguwt2ucVKiKYuAjEd5rWVYll8/IvlRMA==
X-Received: by 2002:a37:5d2:: with SMTP id 201mr25530403qkf.489.1626720428136; 
 Mon, 19 Jul 2021 11:47:08 -0700 (PDT)
Received: from ?IPv6:2804:14c:482:92eb:ffdf:6b35:b94d:258?
 ([2804:14c:482:92eb:ffdf:6b35:b94d:258])
 by smtp.gmail.com with ESMTPSA id j7sm8539522qkd.21.2021.07.19.11.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 11:47:07 -0700 (PDT)
Message-ID: <9bad590314e0d2b1f0359ec1610dcfb32a79d524.camel@gmail.com>
Subject: Re: [PATCH v5 03/11] powerpc/pseries/iommu: Add
 iommu_pseries_alloc_table() helper
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>, kernel test robot
 <lkp@intel.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Date: Mon, 19 Jul 2021 15:47:27 -0300
In-Reply-To: <8110756f-a41f-3ba1-d7bc-af15630c4fbc@linux.ibm.com>
References: <20210716082755.428187-1-leobras.c@gmail.com>
 <20210716082755.428187-4-leobras.c@gmail.com>
 <8110756f-a41f-3ba1-d7bc-af15630c4fbc@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Mon, 2021-07-19 at 16:04 +0200, Frederic Barrat wrote:
> 
> 
> On 16/07/2021 10:27, Leonardo Bras wrote:
> > Creates a helper to allow allocating a new iommu_table without the
> > need
> > to reallocate the iommu_group.
> > 
> > This will be helpful for replacing the iommu_table for the new DMA
> > window,
> > after we remove the old one with iommu_tce_table_put().
> > 
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> > ---
> >   arch/powerpc/platforms/pseries/iommu.c | 25 ++++++++++++++-------
> > ----
> >   1 file changed, 14 insertions(+), 11 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/iommu.c
> > b/arch/powerpc/platforms/pseries/iommu.c
> > index b1b8d12bab39..33d82865d6e6 100644
> > --- a/arch/powerpc/platforms/pseries/iommu.c
> > +++ b/arch/powerpc/platforms/pseries/iommu.c
> > @@ -53,28 +53,31 @@ enum {
> >         DDW_EXT_QUERY_OUT_SIZE = 2
> >   };
> >   
> > -static struct iommu_table_group *iommu_pseries_alloc_group(int
> > node)
> > +static struct iommu_table *iommu_pseries_alloc_table(int node)
> >   {
> > -       struct iommu_table_group *table_group;
> >         struct iommu_table *tbl;
> >   
> > -       table_group = kzalloc_node(sizeof(struct
> > iommu_table_group), GFP_KERNEL,
> > -                          node);
> > -       if (!table_group)
> > -               return NULL;
> > -
> >         tbl = kzalloc_node(sizeof(struct iommu_table), GFP_KERNEL,
> > node);
> >         if (!tbl)
> > -               goto free_group;
> > +               return NULL;
> >   
> >         INIT_LIST_HEAD_RCU(&tbl->it_group_list);
> >         kref_init(&tbl->it_kref);
> > +       return tbl;
> > +}
> >   
> > -       table_group->tables[0] = tbl;
> > +static struct iommu_table_group *iommu_pseries_alloc_group(int
> > node)
> > +{
> > +       struct iommu_table_group *table_group;
> > +
> > +       table_group = kzalloc_node(sizeof(*table_group),
> > GFP_KERNEL, node);
> > +       if (!table_group)
> > +               return NULL;
> >   
> > -       return table_group;
> > +       table_group->tables[0] = iommu_pseries_alloc_table(node);
> > +       if (table_group->tables[0])
> > +               return table_group;
> 
> 
> Nitpick: for readability, we'd usually expect the error path to be 
> detected with the if statement and keep going on the good path, and
> here 
> the code does the opposite. No big deal though, so
> 
> Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
> 
> 

Thanks for the tip and review!

Best regards,
Leonardo Bras


> >   
> > -free_group:
> >         kfree(table_group);
> >         return NULL;
> >   }
> > 


