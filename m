Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBA512862E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 01:53:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47fnCq1HmqzDqvy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 11:53:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="pKfg9UEB"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fn9w1ClgzDqlf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2019 11:51:26 +1100 (AEDT)
Received: by mail-ot1-x342.google.com with SMTP id d7so9677941otf.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2019 16:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f33NX0mVyrexoBKmQnsG32ndr6o8M91RbejlTLuxhxw=;
 b=pKfg9UEBLsx6njksUWHLBV9YCmC5Ieahekn+9soc7jLMlGZN8QDuUe3MhuCdhXgXC6
 g0gDbbESs7X3oUrBExJ9JsdMsONU9A10XuSMv7r8Td92VT1lvZSJH3UfCQW1i7Y0MISg
 uS2PRHygg40RsyzjDa8SUbOj6VLjR2LDyqGO5Ul/NJDf/46uh1PoxGQX+YfMU/CyyhtG
 IsL2jFD1nFl5Z6Er0wIUYcOuiqmnJVB2yzStFIksAJDkZZdbo/uCNxgEImf+VVc9jwa2
 glafhYHVftVEBCWLnGSypqNiji5kRigGyeEpI9CJW0wN6LfgAQUPFbSEuCWO48b4Xx35
 0q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f33NX0mVyrexoBKmQnsG32ndr6o8M91RbejlTLuxhxw=;
 b=UNetq6Ewz/5/XkpKwPAijBsOf57htre7frW/GM92tw3m0y1GeHTw/OuGwiexUjlnTU
 5W6GBgE07ivIUJR0EcMfxrzmJafEYl4oHJJjteIeRm2tYaXs7wCg2JNrw1ShyoZ79dC9
 JfGN55eYMOfSmVE+JMijGwoi5DOibnCXisdnlz+4Uam90iAA9x84eNMapTp3BEQCHSXQ
 Qs2cul7x+rDwSMjgc36U2yZwl8v0vkeTrKxQqqR/uWXaowDW0YQzgt+O5JtjjYKeU3+O
 IO2nXxWSNZDg+fuqqphxF6fGmF5VeV6SKqq9kk5+/paIS4JtO6a6iwtCkhWKffs8M8Dz
 0JOA==
X-Gm-Message-State: APjAAAVLlnFBMR0YApqOIiAWnQxcmXOw/UwLuEmH7chtHrWABDP1XFBe
 kg3cOVEChuqNqKV4ijiE9UuRG9+qVy+YOKqLdYPCog==
X-Google-Smtp-Source: APXvYqxbY+fIz2rYDoZ2kDh5L9IxT6HAH53HFulCDl1AVxBdn9qKQM5q+s8gqlaKrOEYdyRgaFLwOdCutzqFOh8YHY0=
X-Received: by 2002:a9d:6f11:: with SMTP id n17mr4302678otq.126.1576889483302; 
 Fri, 20 Dec 2019 16:51:23 -0800 (PST)
MIME-Version: 1.0
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191219132607.GA410823@unreal>
 <a4849322-8e17-119e-a664-80d9f95d850b@nvidia.com>
 <20191220092154.GA10068@quack2.suse.cz>
 <CAPcyv4gYnXE-y_aGehazzF-Kej5ibSfqvE2hTnjKJD68bm8ANg@mail.gmail.com>
 <437f2bff-13ba-0ae9-2f3c-bc8eb82d20f0@nvidia.com>
In-Reply-To: <437f2bff-13ba-0ae9-2f3c-bc8eb82d20f0@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 20 Dec 2019 16:51:12 -0800
Message-ID: <CAPcyv4hMvTmb5X8gNtXnapJFR1qej1bKto2fvv9zUtebHMhvVw@mail.gmail.com>
Subject: Re: [PATCH v11 00/25] mm/gup: track dma-pinned pages: FOLL_PIN
To: John Hubbard <jhubbard@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
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
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
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

On Fri, Dec 20, 2019 at 4:41 PM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 12/20/19 4:33 PM, Dan Williams wrote:
> ...
> >> I believe there might be also a different solution for this: For
> >> transparent huge pages, we could find a space in 'struct page' of the
> >> second page in the huge page for proper pin counter and just account pins
> >> there so we'd have full width of 32-bits for it.
> >
> > That would require THP accounting for dax pages. It is something that
> > was probably going to be needed, but this would seem to force the
> > issue.
> >
>
> Thanks for mentioning that, it wasn't obvious to me yet.
>
> How easy is it for mere mortals outside of Intel, to set up a DAX (nvdimm?)
> test setup? I'd hate to go into this without having that coverage up
> and running. It's been sketchy enough as it is. :)

You too can have the power of the gods for the low low price of a
kernel command line parameter, or a qemu setup.

Details here:

https://nvdimm.wiki.kernel.org/how_to_choose_the_correct_memmap_kernel_parameter_for_pmem_on_your_system
https://nvdimm.wiki.kernel.org/pmem_in_qemu
