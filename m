Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3D9228C89
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 01:13:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBDt96RjczDqkj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 09:13:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=76.164.61.194; helo=kernel.crashing.org;
 envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBDrB5TZZzDqcl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 09:11:54 +1000 (AEST)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 06LNB4EP017146
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 21 Jul 2020 18:11:11 -0500
Message-ID: <54af168083aee9dbda1b531227521a26b77ba2c8.camel@kernel.crashing.org>
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Alex Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>
Date: Wed, 22 Jul 2020 09:11:02 +1000
In-Reply-To: <7cb2285e-68ba-6827-5e61-e33a4b65ac03@ghiti.fr>
References: <mhng-831c4073-aefa-4aa0-a583-6a17f9aff9b7@palmerdabbelt-glaptop1>
 <d7e3cbb7-c12a-bce2-f1db-c336d15f74bd@ghiti.fr>
 <7cb2285e-68ba-6827-5e61-e33a4b65ac03@ghiti.fr>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
Cc: aou@eecs.berkeley.edu, linux-mm@kvack.org, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 paulus@samba.org, zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-07-21 at 14:36 -0400, Alex Ghiti wrote:
> > > I guess I don't understand why this is necessary at all.  
> > > Specifically: why
> > > can't we just relocate the kernel within the linear map?  That would 
> > > let the
> > > bootloader put the kernel wherever it wants, modulo the physical 
> > > memory size we
> > > support.  We'd need to handle the regions that are coupled to the 
> > > kernel's
> > > execution address, but we could just put them in an explicit memory 
> > > region
> > > which is what we should probably be doing anyway.
> > 
> > Virtual relocation in the linear mapping requires to move the kernel 
> > physically too. Zong implemented this physical move in its KASLR RFC 
> > patchset, which is cumbersome since finding an available physical spot 
> > is harder than just selecting a virtual range in the vmalloc range.
> > 
> > In addition, having the kernel mapping in the linear mapping prevents 
> > the use of hugepage for the linear mapping resulting in performance loss 
> > (at least for the GB that encompasses the kernel).
> > 
> > Why do you find this "ugly" ? The vmalloc region is just a bunch of 
> > available virtual addresses to whatever purpose we want, and as noted by 
> > Zong, arm64 uses the same scheme.

I don't get it :-)

At least on powerpc we move the kernel in the linear mapping and it
works fine with huge pages, what is your problem there ? You rely on
punching small-page size holes in there ?

At least in the old days, there were a number of assumptions that
the kernel text/data/bss resides in the linear mapping.

If you change that you need to ensure that it's still physically
contiguous and you'll have to tweak __va and __pa, which might induce
extra overhead.

Cheers,
Ben.
 

