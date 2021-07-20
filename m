Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D373CF40A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 07:38:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTSDj5Fm4z3bbp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 15:38:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=P+ARNeRO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=P+ARNeRO; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTSDF4Xr8z2xZh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 15:38:04 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id j3so10906538plx.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jul 2021 22:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=EX/d3F27UugquyAjfTnPTBtVfKy8vmZpCCq0lcY7Gp0=;
 b=P+ARNeROIU5w7F6upM0uMOhnGdKVUfmQhlCpsS+1vEmfU3ZNE4lrRdSnNh9QqZj6/I
 sXH2ULhpNCH6GiGVKn02EwfoGv7kMogMIb064wzJd+KD366WFdbYebagk++I3tbejUcw
 gJmDLKK7MvjwUz8WYnmALHRJ1kCKrea3IisDZr3zOYdiQGK7gRK8HqX0Q1SIUyAwH7nW
 OlcmkF71YUGshKwj+/2JDHrNZX8Mbh4HN1zPUA446yP7pOkJGG368UO215wnZfl5bZ7P
 L1UPztE+l0ypE9iKXJHpYdH8dhhMdCnPwASBPQR+IS3TQ8rpD/3r4pxnsI/BZ88es4y8
 +jeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=EX/d3F27UugquyAjfTnPTBtVfKy8vmZpCCq0lcY7Gp0=;
 b=rAKjUX0bSQw3twjXfp8BLGocNCiurg3EYmwmcKgw0TRQob/8ol03xwK4H+0K1zPuuq
 fdThzIcqYb49PERJnhsnXBT2HfY/RgOEfPf35o7534hpGQ0JFzYbnoyF8M5q7cToioC7
 ZqHb3S+ZDiPYC0Zgn40ob1xQ5nLT7ZPqN+IFyvWQJR05u8sndQM9s0pOK0h+U6Kvi8Zw
 ksP6FOc7liEJven++1VJfVLyhyeTN86/JGQOK/fiHJdseL+yqTJDtIBuzyN0HC+0cerH
 uz/gRe9JdrLsW5aFd5Hb7j3IJRKb1CpilmF+Mu1lnXvcggPBgCD5jQMeghu1+TzV1c4O
 lgEA==
X-Gm-Message-State: AOAM53309keOeMb453m8mdmGRz4lA1O6CbWi3X6efR9aaRb2QduBeSav
 j+2Wx+XAzReXTH+UrG1vyfs=
X-Google-Smtp-Source: ABdhPJyQlHqS3FXu1Dr0bp/psH4zvJsFkI4lU09QGbSL0shBJV5Je3poGArd22+729MmoA7pBwdNSg==
X-Received: by 2002:a17:90a:a6a:: with SMTP id
 o97mr34881140pjo.179.1626759479263; 
 Mon, 19 Jul 2021 22:37:59 -0700 (PDT)
Received: from ?IPv6:2804:14c:482:92eb:ffdf:6b35:b94d:258?
 ([2804:14c:482:92eb:ffdf:6b35:b94d:258])
 by smtp.gmail.com with ESMTPSA id j21sm18004462pjz.26.2021.07.19.22.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 22:37:58 -0700 (PDT)
Message-ID: <283e44591010dcb0690769afaef147add3b36978.camel@gmail.com>
Subject: Re: [PATCH v5 02/11] powerpc/kernel/iommu: Add new
 iommu_table_in_use() helper
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>, kernel test robot
 <lkp@intel.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Date: Tue, 20 Jul 2021 02:38:16 -0300
In-Reply-To: <29c199f3-63a8-3edb-b29e-de157431d89f@linux.ibm.com>
References: <20210716082755.428187-1-leobras.c@gmail.com>
 <20210716082755.428187-3-leobras.c@gmail.com>
 <29c199f3-63a8-3edb-b29e-de157431d89f@linux.ibm.com>
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

Hello Fred, thanks for this feedback!

Sorry if I miss anything, this snippet was written for v1 over an year
ago, and I have not taken a look at it ever since.

On Mon, 2021-07-19 at 15:53 +0200, Frederic Barrat wrote:
> 
> 
> On 16/07/2021 10:27, Leonardo Bras wrote:
> > @@ -1099,18 +1105,13 @@ int iommu_take_ownership(struct iommu_table
> > *tbl)
> >         for (i = 0; i < tbl->nr_pools; i++)
> >                 spin_lock_nest_lock(&tbl->pools[i].lock, &tbl-
> > >large_pool.lock);
> >   
> > -       iommu_table_release_pages(tbl);
> > -
> > -       if (!bitmap_empty(tbl->it_map, tbl->it_size)) {
> > +       if (iommu_table_in_use(tbl)) {
> >                 pr_err("iommu_tce: it_map is not empty");
> >                 ret = -EBUSY;
> > -               /* Undo iommu_table_release_pages, i.e. restore
> > bit#0, etc */
> > -               iommu_table_reserve_pages(tbl, tbl-
> > >it_reserved_start,
> > -                               tbl->it_reserved_end);
> > -       } else {
> > -               memset(tbl->it_map, 0xff, sz);
> >         }
> >   
> > +       memset(tbl->it_map, 0xff, sz);
> > +
> 
> 
> So if the table is not empty, we fail (EBUSY) but we now also
> completely 
> overwrite the bitmap. It was in an unexpected state, but we're making
> it 
> worse. Or am I missing something?

IIRC there was a reason to do that at the time, but TBH I don't really
remember it, and by looking at the code right now you seem to be
correct about this causing trouble.

I will send a v6 fixing it soon.
Please review the remaining patches for some issue I may be missing.

Alexey, any comments on that?

> 
>    Fred
> 

Again, thank you for reviewing Fred! 
Best regards,
Leonardo Bras





