Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1B1F9E51
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 00:45:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CPW366FdzF5Vs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 10:45:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="it8jHl8A"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CPSK3VqHzDqVx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 10:42:55 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id n4so511758qte.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 15:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vZiC7XI6w4qmcJhiszw5fcLLfKl81FBqJhCu/q1OZew=;
 b=it8jHl8Aeod0zYq+Skrwrg8GwHh9Iu8Lk4aklL2UU1A7NrkgqGz5TacHTvuZENKCSO
 zX5vQsxL6WoNuMWNKkEQjxDubFJia3lLQ6vtybpi5bU815x8TqvUIIt9Kr2Uo5cBSRzI
 2VZYj93gQX0itc+geQUWbcwpbx7dsR+jspiqHjxUKDMEHdunGEQMz6R4qhshIz6xtcbf
 Zhwk9IxmoxlDCj68H/K3Yi1WAV8gDwI3vnoSzzJ5OjxNZ+oTEONNaXk9owbEXpdua0Ac
 Ytg9ljas4ej2TjoNx1nr1x9pd15vss2zsUb9mCqXq0UcPC7FIXHufZoDuL/IWSFTzLDE
 UAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vZiC7XI6w4qmcJhiszw5fcLLfKl81FBqJhCu/q1OZew=;
 b=HA7sMTiq9goFc4xACcHPmSHPLaU9ryBmZC9SntXjTiRJBhvADVDut3DxSkYqtHXa4C
 QSHw9/+3XWwy0FX5jSk6Eao+yuR68veX8GphQGDkWIVRdmEWAukpkGotUnjRJMpbXH8a
 6QrWFD1NJrPBMUgObcawQ/LkiHD9Z+e+tEK+qlytEGy6BQLgVFadxA5kCbPiWYPGRmAW
 8Reis/t+QkrwqncNL2i/AGWv+w5hOOZWPFMRpftriyQb11pavmUAzOCli0CHyvpqK+gd
 PeAVY/SlHuM2PDrBlB8qqBTYsf8gOvIgB5Iqi9y/7oub1mJvlTiN/RAsnQDyicMmcBut
 EQ7Q==
X-Gm-Message-State: APjAAAUZ4KdUG2I/OL5k+Zdc2uwSsfSbOy2EujvJOn0aG6ojtIrb/fvg
 aVbkQnn1yJ7kpLpr+8B8u6yG5A==
X-Google-Smtp-Source: APXvYqz3aftIVfOw8Wxd6a6UdmY0tmO8rvvaAb/aUmwkho+fgsveWFsBhLgURBNyxpICpzEXHNU+vQ==
X-Received: by 2002:aed:26e2:: with SMTP id q89mr18576100qtd.391.1573602171951; 
 Tue, 12 Nov 2019 15:42:51 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id u11sm212203qtg.11.2019.11.12.15.42.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Nov 2019 15:42:51 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iUfoA-0005Um-OB; Tue, 12 Nov 2019 19:42:50 -0400
Date: Tue, 12 Nov 2019 19:42:50 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v3 08/23] vfio, mm: fix get_user_pages_remote() and
 FOLL_LONGTERM
Message-ID: <20191112234250.GA19615@ziepe.ca>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
 <20191112204338.GE5584@ziepe.ca>
 <0db36e86-b779-01af-77e7-469af2a2e19c@nvidia.com>
 <CAPcyv4hAEgw6ySNS+EFRS4yNRVGz9A3Fu1vOk=XtpjYC64kQJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPcyv4hAEgw6ySNS+EFRS4yNRVGz9A3Fu1vOk=XtpjYC64kQJw@mail.gmail.com>
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
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
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

On Tue, Nov 12, 2019 at 02:45:51PM -0800, Dan Williams wrote:
> On Tue, Nov 12, 2019 at 2:43 PM John Hubbard <jhubbard@nvidia.com> wrote:
> >
> > On 11/12/19 12:43 PM, Jason Gunthorpe wrote:
> > ...
> > >> -            }
> > >> +    ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags | FOLL_LONGTERM,
> > >> +                                page, vmas, NULL);
> > >> +    /*
> > >> +     * The lifetime of a vaddr_get_pfn() page pin is
> > >> +     * userspace-controlled. In the fs-dax case this could
> > >> +     * lead to indefinite stalls in filesystem operations.
> > >> +     * Disallow attempts to pin fs-dax pages via this
> > >> +     * interface.
> > >> +     */
> > >> +    if (ret > 0 && vma_is_fsdax(vmas[0])) {
> > >> +            ret = -EOPNOTSUPP;
> > >> +            put_page(page[0]);
> > >>      }
> > >
> > > AFAIK this chunk is redundant now as it is some hack to emulate
> > > FOLL_LONGTERM? So vmas can be deleted too.
> >
> > Let me first make sure I understand what Dan has in mind for the vma
> > checking, in the other thread...
> 
> It's not redundant relative to upstream which does not do anything the
> FOLL_LONGTERM in the gup-slow path... but I have not looked at patches
> 1-7 to see if something there made it redundant.

Oh, the hunk John had below for get_user_pages_remote() also needs to
call __gup_longterm_locked() when FOLL_LONGTERM is specified, then
that calls check_dax_vmas() which duplicates the vma_is_fsdax() check
above.

Certainly no caller of FOLL_LONGTERM should have to do dax specific
VMA checking.

Jason
