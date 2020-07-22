Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 968A4228DF1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 04:23:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBK5G6kskzDqlr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 12:23:30 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBK3c281gzDqfM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 12:22:03 +1000 (AEST)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 06M2LIGX018560
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 21 Jul 2020 21:21:25 -0500
Message-ID: <bb461dde0df3eaf0bed949eebf0657b227431bb3.camel@kernel.crashing.org>
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Date: Wed, 22 Jul 2020 12:21:16 +1000
In-Reply-To: <mhng-cd9a74ea-2edf-47e4-aade-b090f1a069f1@palmerdabbelt-glaptop1>
References: <mhng-cd9a74ea-2edf-47e4-aade-b090f1a069f1@palmerdabbelt-glaptop1>
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
Cc: aou@eecs.berkeley.edu, alex@ghiti.fr, linux-mm@kvack.org,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, paulus@samba.org, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-07-21 at 16:48 -0700, Palmer Dabbelt wrote:
> > Why ? Branch distance limits ? You can't use trampolines ?
> 
> Nothing fundamental, it's just that we don't have a large code model in the C
> compiler.  As a result all the global symbols are resolved as 32-bit
> PC-relative accesses.  We could fix this with a fast large code model, but then
> the kernel would need to relax global symbol references in modules and we don't
> even do that for the simple code models we have now.  FWIW, some of the
> proposed large code models are essentially just split-PLT/GOT and therefor
> don't require relaxation, but at that point we're essentially PIC until we
> have more that 2GiB of kernel text -- and even then, we keep all the
> performance issues.

My memory might be out of date but I *think* we do it on powerpc
without going to a large code model, but just having the in-kernel
linker insert trampolines.

Cheers,
Ben.


