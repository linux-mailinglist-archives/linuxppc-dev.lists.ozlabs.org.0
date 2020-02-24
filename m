Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A07216A0F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 10:01:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Qwyw4K8rzDqLW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 20:01:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.67; helo=mail-wr1-f67.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Qwvc4D1yzDqMK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 19:58:20 +1100 (AEDT)
Received: by mail-wr1-f67.google.com with SMTP id y17so552548wrn.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 00:58:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H2Cct5hWHL+uQC/bm8Prlx7dsjSsRBh79w87Fgtt9TA=;
 b=KYWdSHi9hOPgub3hyElUhEWTlwoVxeG8EXIUIC3LK/yExodCi8xovMiGYFyt8jTpa9
 ccboMsplpJd0kDoY6zIHjJKH2WjozzPIWSeSqhVc+YCHNczGqS1qf9cgZFFw6QRMfwNa
 BrxIhiWMO3mMGw+nO4wRRWSuqAbmN9JR/VANkyqgAEtVfpEK4/MWREJBjflTaVkIJ8TX
 xO/qL+V0WiJMtfWbuT1HtUbImfoVjjgomQ5w1Kgx6Eu0e7qwZhJ50un0iNcVZZpLvOLc
 ZhLUlXthfwEI+YiMd2wWsIId0v55+a/AErffMnYUX06oMfJ8/HfkuA0JqpOFcg2V5qsZ
 maOg==
X-Gm-Message-State: APjAAAXCV1Na8Kmzx5Ri5lrAWLKGTCUdcp3x5tV5/lAj0zDZzI8Sp7vG
 HBJYUqfdhYPg7/gbPPN4Rr8=
X-Google-Smtp-Source: APXvYqwI6GLQ96fHtBV39r/Kowb15Ks1F1Wur7CqhfRydMNy5c7m6Bj+2tsJRhgk5dCrnqTmrDx97w==
X-Received: by 2002:a5d:5263:: with SMTP id l3mr64736786wrc.405.1582534694073; 
 Mon, 24 Feb 2020 00:58:14 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id z133sm17730879wmb.7.2020.02.24.00.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 00:58:13 -0800 (PST)
Date: Mon, 24 Feb 2020 09:58:12 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Christopher Lameter <cl@linux.com>
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
Message-ID: <20200224085812.GB22443@dhcp22.suse.cz>
References: <3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com>
 <cf6be5f5-4bbc-0d34-fb64-33fd37bc48d9@virtuozzo.com>
 <0ba2a3c6-6593-2cee-1cef-983cd75f920f@virtuozzo.com>
 <F5A68B0C-AFDE-4C45-B0F3-12A5154204E6@linux.vnet.ibm.com>
 <20200218115525.GD4151@dhcp22.suse.cz>
 <D6F45EDD-9F2E-4593-B630-55E5BD7DE915@linux.vnet.ibm.com>
 <20200218142620.GF4151@dhcp22.suse.cz>
 <35EE65CF-40E3-4870-AEBC-D326977176DA@linux.vnet.ibm.com>
 <20200218152441.GH4151@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002220337030.2000@www.lameter.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2002220337030.2000@www.lameter.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, Pekka Enberg <penberg@kernel.org>,
 Kirill Tkhai <ktkhai@virtuozzo.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat 22-02-20 03:38:11, Cristopher Lameter wrote:
> On Tue, 18 Feb 2020, Michal Hocko wrote:
> 
> > Anyway, I do not think it is expected that kmalloc_node just blows up
> > on those nodes. The page allocator simply falls back to the closest
> > node. Something for kmalloc maintainers I believe.
> 
> That is the case for an unconstrained allocation. kmalloc_node means that
> you want memory from that node. And If there is no such node then it is an
> error.

Hmm, nasty. Is there any reason why kmalloc_node behaves differently
from the page allocator?

> > A short summary. kmalloc_node blows up when trying to allocate from a
> > memory less node.
> 
> Use kmalloc instead? And set a memory allocation policy?

The current code (memcg_expand_one_shrinker_map resp. memcg_alloc_shrinker_maps)
already use kvmalloc. Kirill's patch wanted to make those data structure
on the respective node and kvmalloc_node sounded like the right thing to
do. It comes as a surprise that the kernel simply blows up on a memory
less node rather than falling back to a close node gracefully. I suspect
this already happens when the target node is out of memory, right?

How would a memory allocation policy help in this case btw.?

-- 
Michal Hocko
SUSE Labs
