Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 638FE264B1C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 19:22:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnQgp3w8ZzDr0X
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 03:22:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnQdt2NltzDqgS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 03:21:05 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id r8so5416533qtp.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 10:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wS3Cxs+LxMo6gPPzfzs9JS4wraYUHvaNngFKImlbYPQ=;
 b=R7muKjGsMqQxjYn/v3laT3wxz696cPiiZUGTarCqWEmD8sEHzFMnpmRv1NbdWuvxUl
 ES4sa/jWMnYWk8X4X6idi0ndI491v7kNFTPa5GqC+PbSliK0PxcG7BbrKL1SGaFULExx
 kGCtyImpN4w3JYZEvlwpotauF+GyY/wqoWRoFKEJsIkkaaCf8ZEqmuepKdImBUgzQsFC
 Vc+IXldSoElxGSHRRDrr1U2IvhE0zAiCRYQ16d8EWEqzrgIPV6ZfSpzmZYP6/ZBNfv4U
 wV4KH/FXvtzAig33Lc4SwlzTJpcb6YSdw29FHxZ2Fklak2OM0YAdYreU9PkLtv7plyJk
 DE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wS3Cxs+LxMo6gPPzfzs9JS4wraYUHvaNngFKImlbYPQ=;
 b=G3Ckl2OxWGRrZ6UsTLxbPSdUNXzuA/oO/gyh/LUQOlzTC7OcRrTX/SVYl9Ha+6uE6h
 NzZxebIClTJF2PIfdaUzkT0WpfLq39vqLl52vJkHVkaJyDCK0mrso/mROOC9P2HcI6XO
 vXfgkp542MpaGzq+tFHx4Ga/+z5gagmo1rMQTscoCRrcwov4wpIabOXfluJqgxtPsDAL
 AwJo/MlR4L5IEuv3bXlifiv8dxAyAurgI9ug8Q03I9kudGYMS3T42ziNoJvQiYHj6gOD
 wnW/733B9y7l9vhz6NjVLHlxVaxE2tRZiykImcFeZ1aGQcKtZsn+MhqsQDTwVxPz8zK6
 TLpA==
X-Gm-Message-State: AOAM531T3MtASloea/ZM64nbh7PneVBNjjfB+EPyFGxYjYn3MEocUqIH
 217OFqr0mJqsTicKwMqoAw4IZQ==
X-Google-Smtp-Source: ABdhPJzOK6FcVm6akWqNTL2Hu85OsyALxMrEucVBwOeXC6OwPNTX8vss/Xw7hopiKEc6u3QVNfxIcg==
X-Received: by 2002:ac8:54a:: with SMTP id c10mr9299916qth.251.1599758398248; 
 Thu, 10 Sep 2020 10:19:58 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id x126sm6934696qkb.101.2020.09.10.10.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 10:19:57 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kGQEm-004NzL-RL; Thu, 10 Sep 2020 14:19:56 -0300
Date: Thu, 10 Sep 2020 14:19:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Subject: Re: [RFC PATCH v2 1/3] mm/gup: fix gup_fast with dynamic page table
 folding
Message-ID: <20200910171956.GM87483@ziepe.ca>
References: <0dbc6ec8-45ea-0853-4856-2bc1e661a5a5@intel.com>
 <20200909142904.00b72921@thinkpad>
 <aacad1b7-f121-44a5-f01d-385cb0f6351e@intel.com>
 <20200909192534.442f8984@thinkpad>
 <20200909180324.GI87483@ziepe.ca>
 <20200910093925.GB29166@oc3871087118.ibm.com>
 <20200910130233.GK87483@ziepe.ca>
 <20200910152803.1a930afc@thinkpad>
 <20200910151026.GL87483@ziepe.ca>
 <20200910190757.153319d4@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910190757.153319d4@thinkpad>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Richard Weinberger <richard@nod.at>, linux-x86 <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Heiko Carstens <hca@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 John Hubbard <jhubbard@nvidia.com>, Jeff Dike <jdike@addtoit.com>,
 linux-um <linux-um@lists.infradead.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm <linux-arm-kernel@lists.infradead.org>,
 linux-mm <linux-mm@kvack.org>, linux-power <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 10, 2020 at 07:07:57PM +0200, Gerald Schaefer wrote:

> I might have lost track a bit. Are we still talking about possible
> functional impacts of either our current pagetable walking with s390
> (apart from gup_fast), or the proposed generic change (for s390, or
> others?)?

I'm looking for an more understandable explanation what is wrong with
the S390 implementation.

If the page operations require the invariant I described then it is
quite easy to explain the problem and understand the solution.

Jason
