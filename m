Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEA01299DD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2019 19:26:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hSVP006jzDqPM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 05:26:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::f43;
 helo=mail-qv1-xf43.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="FctYOOrJ"; 
 dkim-atps=neutral
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hSSS6zBPzDqN8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 05:24:54 +1100 (AEDT)
Received: by mail-qv1-xf43.google.com with SMTP id dc14so6650453qvb.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2019 10:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KNSp0xKzXXca6h2YP8X3emLAqK9GuJuCbstCZTI5ulI=;
 b=FctYOOrJ074bGu2erxfD+ggi+amf34vJ2+/SB/OaLs8ZFEcoEOPSKxrX7J7vfW72iX
 iaD1ph6XI9oWEr/nnku4Pr+MbBh9He5Xr+rBPzoju6TBhM7n5pqaYtl/oqkKFK9Nr8fH
 Us04jbJ3zTX0WDIVdGhJyQO5EPn2JUvIhBvTug4ZRXtCzaFxharK0qUYwO9ZIkwiEqhS
 c9Aa/tUvtqh3RdzKBnkDvwefmOBkVu9RUXlbwmdawA3jtTcA8wQCgHrvBfiWYN8r7VQg
 T/hlkSjI6vXJcCVxYIXrbbrRmfsaCa4t09oEgSwlogc3AYXQW7LtDW06LM/jq8bAmut6
 WCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KNSp0xKzXXca6h2YP8X3emLAqK9GuJuCbstCZTI5ulI=;
 b=OBB7Qaz71uUq1ayzaWZ9fO2d9zmeMsFVSbQ2lrwkSz4uYKb5SJw8Lzlm/C9JbSS7UO
 o1piQYd9SicWiLtY7McoG07+nH03jKAAxm6YLtnbe7kyLDieNvbV64BbfEZPtiyS76Sc
 67rKG7d7TvdHzs/lFdVLAkrNSfzAx74QEkaH9ui8WO3Ij3BfNQQ1mMf1Sz7DhOFE3sLZ
 v0XaPAg77+JMe1RXWxQTf2IhRjvEhdtktM8pg6oX0zShbhZzfgYKJzMum2KhpfPb0tgT
 IRcglOKyz6EOSvwYccqTfQyrxSEWODtyX7l3ir6Bvna4nlTU8mPTdcY84v4A99OOxrR8
 yUoA==
X-Gm-Message-State: APjAAAWTbRxVkd6wC9annFRDWk66Ajcdw2FirIAUV9qgAhFkPuMIcPbS
 aJ5VhooNOU5ntbrLxrgTQT0S1Q==
X-Google-Smtp-Source: APXvYqyOJm+HA/OOXOk1TxOLC8pk6pJEfZhfUy8M7as0rtMhyNSoNfAsriRZZomXf9eRLN7qDrjm+A==
X-Received: by 2002:a0c:e150:: with SMTP id c16mr25637620qvl.51.1577125488455; 
 Mon, 23 Dec 2019 10:24:48 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id b7sm6449933qtj.15.2019.12.23.10.24.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 23 Dec 2019 10:24:47 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1ijSNq-0007Pv-LV; Mon, 23 Dec 2019 14:24:46 -0400
Date: Mon, 23 Dec 2019 14:24:46 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v11 00/25] mm/gup: track dma-pinned pages: FOLL_PIN
Message-ID: <20191223182446.GA28321@ziepe.ca>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191219132607.GA410823@unreal>
 <a4849322-8e17-119e-a664-80d9f95d850b@nvidia.com>
 <20191219210743.GN17227@ziepe.ca>
 <42a3e5c1-6301-db0b-5d09-212edf5ecf2a@nvidia.com>
 <20191220133423.GA13506@ziepe.ca>
 <CAPcyv4hX9TsTMjsv2hnbEM-TpkC9abtWGSVskr9nPwpR8c5E1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPcyv4hX9TsTMjsv2hnbEM-TpkC9abtWGSVskr9nPwpR8c5E1Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 KVM list <kvm@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Maor Gottlieb <maorg@mellanox.com>,
 Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 linux-block@vger.kernel.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 bpf@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>,
 Jens Axboe <axboe@kernel.dk>, Netdev <netdev@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 20, 2019 at 04:32:13PM -0800, Dan Williams wrote:

> > > There's already a limit, it's just a much larger one. :) What does "no limit"
> > > really mean, numerically, to you in this case?
> >
> > I guess I mean 'hidden limit' - hitting the limit and failing would
> > be managable.
> >
> > I think 7 is probably too low though, but we are not using 1GB huge
> > pages, only 2M..
> 
> What about RDMA to 1GB-hugetlbfs and 1GB-device-dax mappings?

I don't think the failing testing is doing that.

It is also less likely that 1GB regions will need multi-mapping, IMHO.

Jason
