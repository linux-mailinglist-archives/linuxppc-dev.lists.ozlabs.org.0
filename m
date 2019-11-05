Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FBAEF38C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 03:35:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476Yfg3zt9zF4Fn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 13:35:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="RrEUUprS"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476Ybr0j09zF4FJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 13:32:39 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id l24so8928504qtp.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2019 18:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4urm9i82HUz7ctZoqeaJ+eDwbY+Le9I8/NmP0pY1rnA=;
 b=RrEUUprScGGCs1P3lOuGj4a5RoiWbVbfDZ4+HpgRvyTXCYVlJAXQB+MYamRZtedVHY
 f5+sxNxk2K5wkp7PjMMeD8HJWFAJHo3RtLYXlCrUl00LuH1GNIO+43+qB9VoRPGoMtd2
 MhxxJSrVmcyNdw2dcAOft+ieDHmjkqcbx3xo51HlgztpG3sVxpkHZVlG9m+fgORfqdhb
 XySrfwIPRDIjnSUQNZ9F7DSfvHrKSEQZxN/D+pZKoiFoN1H+0mMnDQ/zYc1NegbKO5Qw
 fR/889wgnwS9AagFL4h4X1w9N0H+8w+Cg8HTo2zBy3ABWuxHxMoo0KJgJWvcNzShW5B1
 QLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4urm9i82HUz7ctZoqeaJ+eDwbY+Le9I8/NmP0pY1rnA=;
 b=gEqYmwS2Z6qAw2cylMciGGFAGEZbREsnU2H7rlDSVgFa8WDe2SSFT7y64+bop8oGME
 Rb4RYcQiSX2dXdDnGchn+yne7ZFXKRSMc3Is8Q3naILwC4qMbc2Zi4uzQFgxtH8EAe12
 hvWQFPgXXMoW89Pd54yFDj5pDVnjsxdcc3agOGiZrlFwH32uaf06RM+fGal3C2BLaua0
 +R/gNuKo25UxUvfTJn8Uh+bBuKwWH2YMIpzAwg1EtfZTqI9qnn6o8PCMv5tSNA3muml1
 xLctbsv/sR4i/owemaEA1XY4a5d7QbknOgXOSxkU/MMkbA4XLUpGDratkwxe5ENs9K+J
 by8g==
X-Gm-Message-State: APjAAAW28Ne1rqvn+HGsw8wayNZPJ71dLOWDN9ZdsbUHTNvVk48Zwco2
 nFxsA9ruQd/vQzKgGr+6+1MRCw==
X-Google-Smtp-Source: APXvYqzymmufBg1PiSWGxkk4f7LXgsvyOrzTuuRBB+uFmwh9UO+iQP682ubsI0h94l7eDVroneUqZg==
X-Received: by 2002:a0c:9838:: with SMTP id c53mr25556531qvd.250.1572921156814; 
 Mon, 04 Nov 2019 18:32:36 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id t65sm8907102qkh.23.2019.11.04.18.32.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 04 Nov 2019 18:32:36 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iRoe3-0002uH-K9; Mon, 04 Nov 2019 22:32:35 -0400
Date: Mon, 4 Nov 2019 22:32:35 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 07/18] infiniband: set FOLL_PIN, FOLL_LONGTERM via
 pin_longterm_pages*()
Message-ID: <20191105023235.GA11093@ziepe.ca>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-8-jhubbard@nvidia.com>
 <20191104203346.GF30938@ziepe.ca>
 <578c1760-7221-4961-9f7d-c07c22e5c259@nvidia.com>
 <20191104205738.GH30938@ziepe.ca>
 <1560fa00-0c2b-0f3b-091c-d628f021ce09@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560fa00-0c2b-0f3b-091c-d628f021ce09@nvidia.com>
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

On Mon, Nov 04, 2019 at 02:03:43PM -0800, John Hubbard wrote:
> On 11/4/19 12:57 PM, Jason Gunthorpe wrote:
> > On Mon, Nov 04, 2019 at 12:48:13PM -0800, John Hubbard wrote:
> >> On 11/4/19 12:33 PM, Jason Gunthorpe wrote:
> >> ...
> >>>> diff --git a/drivers/infiniband/core/umem.c b/drivers/infiniband/core/umem.c
> >>>> index 24244a2f68cc..c5a78d3e674b 100644
> >>>> +++ b/drivers/infiniband/core/umem.c
> >>>> @@ -272,11 +272,10 @@ struct ib_umem *ib_umem_get(struct ib_udata *udata, unsigned long addr,
> >>>>  
> >>>>  	while (npages) {
> >>>>  		down_read(&mm->mmap_sem);
> >>>> -		ret = get_user_pages(cur_base,
> >>>> +		ret = pin_longterm_pages(cur_base,
> >>>>  				     min_t(unsigned long, npages,
> >>>>  					   PAGE_SIZE / sizeof (struct page *)),
> >>>> -				     gup_flags | FOLL_LONGTERM,
> >>>> -				     page_list, NULL);
> >>>> +				     gup_flags, page_list, NULL);
> >>>
> >>> FWIW, this one should be converted to fast as well, I think we finally
> >>> got rid of all the blockers for that?
> >>>
> >>
> >> I'm not aware of any blockers on the gup.c end, anyway. The only broken thing we
> >> have there is "gup remote + FOLL_LONGTERM". But we can do "gup fast + LONGTERM". 
> > 
> > I mean the use of the mmap_sem here is finally in a way where we can
> > just delete the mmap_sem and use _fast
> >  
> > ie, AFAIK there is no need for the mmap_sem to be held during
> > ib_umem_add_sg_table()
> > 
> > This should probably be a standalone patch however
> > 
> 
> Yes. Oh, actually I guess the patch flow should be: change to 
> get_user_pages_fast() and remove the mmap_sem calls, as one patch. And then change 
> to pin_longterm_pages_fast() as the next patch. Otherwise, the internal fallback
> from _fast to slow gup would attempt to take the mmap_sem (again) in the same
> thread, which is not good. :)
> 
> Or just defer the change until after this series. Either way is fine, let me
> know if you prefer one over the other.
> 
> The patch itself is trivial, but runtime testing to gain confidence that
> it's solid is much harder. Is there a stress test you would recommend for that?
> (I'm not promising I can quickly run it yet--my local IB setup is still nascent 
> at best.)

If you make a patch we can probably get it tested, it is something
we should do I keep forgetting about.

Jason
