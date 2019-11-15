Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED94FFDFD0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 15:13:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47F0gf1B0czF66h
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 01:13:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="BFBIgmkk"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47F0bH592PzF7NG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2019 01:09:31 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id e187so8179649qkf.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 06:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=01834Iuy8wrTkyETdgSEfcddUW82cA+Rc6Zt+MvTCwg=;
 b=BFBIgmkk8QkntrHNjJLsvCL1a0ZURlA5X/gmLb4n3VPRP5m3aB6scRcD2DMxTLAV9P
 UaMtjJH/lJaxRT3MaYZLNwy8cw9D1M5/6iAxnqhClJH46gGawBEotmmVwz9bc8u3IFV9
 a3v4lMSNKHekmvWmxSCO3xS9GuPfrTZZ9gfrHLPlSSz+de3k9e1mbvTuAMlgMSg1inD0
 htevxD4Ti62AfDMDE+osEpAwbIBY+1VPeWYkc7W/CwzYOFcM3WvoA9tt0pcZZGXm+LdO
 O8XKMS5WarP50UJ1uTIL/tvlJnyEoGG2Ukx7eqBCtFPfW9ti43J0cbZRwFC28FPxF58w
 Wt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=01834Iuy8wrTkyETdgSEfcddUW82cA+Rc6Zt+MvTCwg=;
 b=Vp9djN1uxhMTmt+b0LfwTg4RLAlZWj85HFNWscI8Lmnb7SdMKFo3OIDhM/ir/EcVxw
 urBal94zEvCVq23tmIiSsn8jN5JR74IEaEyciWv/QAd0tJrwDohxBuJMdar+etrlpMMM
 7eQFdcEeraqxR1N8r4kNCBy3Nb1s8Vx9N346I+roCcF28NLdSIxWbqgHMC1G4GHS3Dc/
 WEreJqfRbX0X335tioYMzZQ5jj+SqELvbTAlvoXlixVIvmTCf9JqqsCXlfelBX+2JXvW
 tYBwehk6qpa0l7gDbJYfcU2p09Pv2FZnpge+qTmpmNX+20WwnuWYofw2pu6NZdpsMUHb
 4Ktw==
X-Gm-Message-State: APjAAAWUrY7v+avQ8lQfd60BaiDH8AtUwSgvGsOhpHqqEdJFx2KNv8D3
 rdC7WusKp8H3eF/8cNmZ+1KUlA==
X-Google-Smtp-Source: APXvYqySuuQ0WzAKMm3kXEkiDMguUlgyvE6K/2D67jOtzEpRUEwGr7GFZW94ehFUiDC6Dq2Nm3hHug==
X-Received: by 2002:a37:76c6:: with SMTP id
 r189mr11712734qkc.303.1573826968699; 
 Fri, 15 Nov 2019 06:09:28 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id m65sm4836053qte.54.2019.11.15.06.09.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 15 Nov 2019 06:09:28 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iVcHv-0002xw-Lj; Fri, 15 Nov 2019 10:09:27 -0400
Date: Fri, 15 Nov 2019 10:09:27 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v5 12/24] IB/{core,hw,umem}: set FOLL_PIN via
 pin_user_pages*(), fix up ODP
Message-ID: <20191115140927.GB4055@ziepe.ca>
References: <20191115055340.1825745-1-jhubbard@nvidia.com>
 <20191115055340.1825745-13-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191115055340.1825745-13-jhubbard@nvidia.com>
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

On Thu, Nov 14, 2019 at 09:53:28PM -0800, John Hubbard wrote:
> Convert infiniband to use the new pin_user_pages*() calls.
> 
> Also, revert earlier changes to Infiniband ODP that had it using
> put_user_page(). ODP is "Case 3" in
> Documentation/core-api/pin_user_pages.rst, which is to say, normal
> get_user_pages() and put_page() is the API to use there.
> 
> The new pin_user_pages*() calls replace corresponding get_user_pages*()
> calls, and set the FOLL_PIN flag. The FOLL_PIN flag requires that the
> caller must return the pages via put_user_page*() calls, but infiniband
> was already doing that as part of an earlier commit.
> 
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/infiniband/core/umem.c              |  2 +-
>  drivers/infiniband/core/umem_odp.c          | 13 ++++++-------
>  drivers/infiniband/hw/hfi1/user_pages.c     |  2 +-
>  drivers/infiniband/hw/mthca/mthca_memfree.c |  2 +-
>  drivers/infiniband/hw/qib/qib_user_pages.c  |  2 +-
>  drivers/infiniband/hw/qib/qib_user_sdma.c   |  2 +-
>  drivers/infiniband/hw/usnic/usnic_uiom.c    |  2 +-
>  drivers/infiniband/sw/siw/siw_mem.c         |  2 +-
>  8 files changed, 13 insertions(+), 14 deletions(-)

Ok

Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>

Jason
