Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 479ED5202FC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 18:55:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxnP86y5Qz3cFQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 02:55:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eijuKVmj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eijuKVmj; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxnNR4KDyz3bbn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 02:55:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F26361351
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 16:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5830FC385B7
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 16:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652115315;
 bh=H9ZzoCsU7OPFUVgovkRT4qyt5DBVCY0Rle9z2kImzrk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eijuKVmjFWQILCm+d4ejW1OnRFrE2oH1rPX5DzgPA4UNvJXhmSkQvi+zEF/6MLRzr
 hcYxot6V+PMCx6l1T9bcxi+1TDJTNszcZLLY31TSV5DXKL9Ho4Ok2lPezUH3IMNzcw
 cIY724cFq+e4gmMB6ri1hvMvyiCAqWYC1rdbQMh34v9szEb9jOXQlfTMRp3rZRYehX
 4+YoCOo0ghgT6X1ce8QPu0akgUsYBybZJDHa1yCHcm6UYSPradmWLZJGdogEBAIAOh
 cAt6UVpojzv+oRDwzEtNFBW9H+hP44EdlVihopWHkIw4SwhDZz4Lzf3ZcYeaghsiLW
 J2mrZxaI3zAxQ==
Received: by mail-pl1-f178.google.com with SMTP id i17so14425875pla.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 May 2022 09:55:15 -0700 (PDT)
X-Gm-Message-State: AOAM5315DQnVu7nw9+lE4DTEECc8SzoWFjhBmoi/SQWexZUU5Sy8U3/j
 xyQPbgdtk8I7YzRsTF+ADjFkzkb8ENkwFe+8dw==
X-Google-Smtp-Source: ABdhPJykBkhHUMt8k4qEM3EG8Muzu5edkjXzGUFd+xneIQ1RUYzfb43ThAvp2F2oq+zfpsKhmllOfvQ8ieanSR38mM0=
X-Received: by 2002:a17:902:7c0a:b0:15e:f63b:9a14 with SMTP id
 x10-20020a1709027c0a00b0015ef63b9a14mr13293242pll.35.1652115314773; Mon, 09
 May 2022 09:55:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220504154033.750511-1-clement.leger@bootlin.com>
 <20220504154033.750511-3-clement.leger@bootlin.com>
 <YnQo+mdDBuoKA6Fq@robh.at.kernel.org>
 <20220506124339.2c772fa0@fixe.home>
In-Reply-To: <20220506124339.2c772fa0@fixe.home>
From: Rob Herring <robh@kernel.org>
Date: Mon, 9 May 2022 11:55:02 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+RvygJDe5mug2b9E-gD7LfDt9dBmCx0rOSUEY1yWwHtw@mail.gmail.com>
Message-ID: <CAL_Jsq+RvygJDe5mug2b9E-gD7LfDt9dBmCx0rOSUEY1yWwHtw@mail.gmail.com>
Subject: Re: [PATCH 2/3] of: dynamic: add of_node_alloc() and of_node_free()
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 YueHaibing <yuehaibing@huawei.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
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

On Fri, May 6, 2022 at 5:45 AM Cl=C3=A9ment L=C3=A9ger <clement.leger@bootl=
in.com> wrote:
>
> Le Thu, 5 May 2022 14:43:54 -0500,
> Rob Herring <robh@kernel.org> a =C3=A9crit :
>
> > On Wed, May 04, 2022 at 05:40:32PM +0200, Cl=C3=A9ment L=C3=A9ger wrote=
:
> > > Add functions which allows to create and free nodes.
> > >
> > > Signed-off-by: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
> > > ---
> > >  drivers/of/dynamic.c | 59 ++++++++++++++++++++++++++++++++++++------=
--
> > >  include/linux/of.h   |  9 +++++++
> > >  2 files changed, 58 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> > > index e8700e509d2e..ec28e5ba2969 100644
> > > --- a/drivers/of/dynamic.c
> > > +++ b/drivers/of/dynamic.c
> > > @@ -455,6 +455,54 @@ struct property *__of_prop_dup(const struct prop=
erty *prop, gfp_t allocflags)
> > >                              prop->length, allocflags);
> > >  }
> > >
> > > +/**
> > > + * of_node_free - Free a node allocated dynamically.
> > > + * @node:  Node to be freed
> > > + */
> > > +void of_node_free(const struct device_node *node)
> > > +{
> > > +   kfree(node->full_name);
> > > +   kfree(node->data);
> > > +   kfree(node);
> > > +}
> > > +EXPORT_SYMBOL(of_node_free);
> >
> > This shouldn't be needed. Nodes are refcounted, so any caller should
> > just do a put.
>
> Acked. Do you want the name to be allocated as part of the node
> allocation also ?

Yeah, I think that would be fine.

Rob
