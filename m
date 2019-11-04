Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E75BEEAAA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 22:00:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476QCx4mDNzF4Fw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 07:59:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="GqKdo8q3"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476Q9N4PnpzF3D8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 07:57:44 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id g50so26097290qtb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2019 12:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DHyq0HiLvr2oRZ7fsWKuvfiy0KSCrmJQP2N7wxll3ck=;
 b=GqKdo8q3EQ1hr6qek+daVbq7asYL8vgosOUNPq/TbaKVNw+fSwsVZvMXYAXCf0AJyJ
 u82hnz0QILmabMP4l0QBspnNgDON3wCBCl2euZ2xUfz4wbz1CJOCkCDLlOnh4i58Oaj/
 S3gq/Jh9sfa4MobfNbFXPlzU8wQ8qlAiWQ9QDx9r++NF1VyZNacvaIxbfl+Dz9q/YaK7
 LJZ1bbR858MSdLa9WbMS13d/j0HGbePzEAUYRTf3vNGneWwIu7V1pWB8dhbOd6RohsWw
 Lzscw767cSCt9xjt6Uiuin4I08CfE7g1YZRaK11NZ5fT7S0HH+Tq61iyMWJYbr4RPL29
 XI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DHyq0HiLvr2oRZ7fsWKuvfiy0KSCrmJQP2N7wxll3ck=;
 b=ue1o4KnOkq23bBBDEYjcBYIXAJVGHEISYFSMaziOQXo6bnkepVDNBWT2Sdd0EZGlTt
 ChP8iBVZuiY4j6eN+crCOwQ9xgGDaIYO4tG7G3CCdpLflBnRGkmgZnB1XXRbNv1TOGNV
 PaMu1Lvjtte4fkCjymdnUctYLesXUGV1+EsalG89KET/1Ygr/PAe08PJCKuWxJtibpmh
 SYr5k1pxdCnV9lJPqyRrgnHY37bwGpIN8sDbUAnLUnAEnNWqlu6Q5nxMGh4/7DmAU5Qr
 15NFvp9XbFKhY8SaJAF33l1/M1sUIRuLZUwouL/zn1oORDyo8PAEaZxwSvT+hkhr4Qr0
 Z0gA==
X-Gm-Message-State: APjAAAXxA5H2vnHle81CnDylEp2ho1UTKA1tOoTtnde5BksdZlbXSxPJ
 MmD0xfNvU1A6I0Kzp5Cua760Qg==
X-Google-Smtp-Source: APXvYqzcbzV98q5L3IoWgV1btJnfFj6kw4clhQUw4ORkigswFo+IphwlhQMZSa6Hl6m/W3Z9gLas4A==
X-Received: by 2002:ad4:4092:: with SMTP id l18mr462915qvp.114.1572901059500; 
 Mon, 04 Nov 2019 12:57:39 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id l20sm5226323qtq.78.2019.11.04.12.57.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 04 Nov 2019 12:57:38 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iRjPu-0000Zj-4J; Mon, 04 Nov 2019 16:57:38 -0400
Date: Mon, 4 Nov 2019 16:57:38 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 07/18] infiniband: set FOLL_PIN, FOLL_LONGTERM via
 pin_longterm_pages*()
Message-ID: <20191104205738.GH30938@ziepe.ca>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-8-jhubbard@nvidia.com>
 <20191104203346.GF30938@ziepe.ca>
 <578c1760-7221-4961-9f7d-c07c22e5c259@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <578c1760-7221-4961-9f7d-c07c22e5c259@nvidia.com>
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
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 04, 2019 at 12:48:13PM -0800, John Hubbard wrote:
> On 11/4/19 12:33 PM, Jason Gunthorpe wrote:
> ...
> >> diff --git a/drivers/infiniband/core/umem.c b/drivers/infiniband/core/umem.c
> >> index 24244a2f68cc..c5a78d3e674b 100644
> >> +++ b/drivers/infiniband/core/umem.c
> >> @@ -272,11 +272,10 @@ struct ib_umem *ib_umem_get(struct ib_udata *udata, unsigned long addr,
> >>  
> >>  	while (npages) {
> >>  		down_read(&mm->mmap_sem);
> >> -		ret = get_user_pages(cur_base,
> >> +		ret = pin_longterm_pages(cur_base,
> >>  				     min_t(unsigned long, npages,
> >>  					   PAGE_SIZE / sizeof (struct page *)),
> >> -				     gup_flags | FOLL_LONGTERM,
> >> -				     page_list, NULL);
> >> +				     gup_flags, page_list, NULL);
> > 
> > FWIW, this one should be converted to fast as well, I think we finally
> > got rid of all the blockers for that?
> > 
> 
> I'm not aware of any blockers on the gup.c end, anyway. The only broken thing we
> have there is "gup remote + FOLL_LONGTERM". But we can do "gup fast + LONGTERM". 

I mean the use of the mmap_sem here is finally in a way where we can
just delete the mmap_sem and use _fast
 
ie, AFAIK there is no need for the mmap_sem to be held during
ib_umem_add_sg_table()

This should probably be a standalone patch however

Jason
