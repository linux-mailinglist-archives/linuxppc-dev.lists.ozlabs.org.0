Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9585413B5E6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 00:31:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47y6DW0JHmzDqR1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 10:31:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Gu0y5Rty; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47y69n6VltzDqDl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2020 10:29:32 +1100 (AEDT)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76F8C24679;
 Tue, 14 Jan 2020 23:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579044570;
 bh=k4eU69C07g5/9QQrVCph8KAUUUUEi8RmXHDj6/HO/Ik=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Gu0y5RtywBnxt/5MHNzmIuAGL99UYOUTR4MOUoFz/V8A0XNK0I0bw+ID9QXrLG+b9
 4yxWu1bIpxAgRKCCzCYPru9Le6et10vSO5ADJMjyl++hjxh7tjrdlkd5kSXYwv5i4H
 zD3MC1qTDzqpxI561Q50RCSE3Ph+HIgvwbWCQkns=
Date: Tue, 14 Jan 2020 15:29:29 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v12 00/22] mm/gup: prereqs to track dma-pinned pages:
 FOLL_PIN
Message-Id: <20200114152929.807fecabfe2258ae2707a88b@linux-foundation.org>
In-Reply-To: <9d7f3c1a-6020-bdec-c513-80c5399e55d7@nvidia.com>
References: <20200107224558.2362728-1-jhubbard@nvidia.com>
 <2a9145d4-586e-6489-64e4-0c54f47afaa1@nvidia.com>
 <9d7f3c1a-6020-bdec-c513-80c5399e55d7@nvidia.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?ISO-8859-1?Q?J=E9r?= =?ISO-8859-1?Q?=F4me?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 14 Jan 2020 12:15:08 -0800 John Hubbard <jhubbard@nvidia.com> wrote:

> > 
> > Hi Andrew and all,
> > 
> > To clarify: I'm hoping that this series can go into 5.6.
> > 
> > Meanwhile, I'm working on tracking down and solving the problem that Leon
> > reported, in the "track FOLL_PIN pages" patch, and that patch is not part of
> > this series.
> > 
> 
> Hi Andrew and all,
> 
> Any thoughts on this?

5.6 is late.  But it was in -mm before (briefly) and appears to be
mature and well-reviewed.

I'll toss it in there and shall push it into -next hopefully today. 
Let's decide 2-3 weeks hence.

