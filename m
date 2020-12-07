Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6739E2D1881
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 19:27:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqWyB4CGCzDqXl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 05:27:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CqWwV0Hx5zDqTh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 05:26:17 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 0B7IKxap009834;
 Mon, 7 Dec 2020 12:20:59 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 0B7IKwjA009833;
 Mon, 7 Dec 2020 12:20:58 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 7 Dec 2020 12:20:58 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [powerpc:next-test 54/220]
 arch/powerpc/kernel/vdso32/vgettimeofday.c:13:5: warning: no previous
 prototype for function '__c_kernel_clock_gettime64'
Message-ID: <20201207182058.GU2672@gate.crashing.org>
References: <202012042220.zO7hSFT2-lkp@intel.com>
 <87czzlu7n4.fsf@mpe.ellerman.id.au>
 <CAKwvOd=4vu_o3Sr14JwDO6s+tqZWp-DQKWs9So8g2_-zTt+8KA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=4vu_o3Sr14JwDO6s+tqZWp-DQKWs9So8g2_-zTt+8KA@mail.gmail.com>
User-Agent: Mutt/1.4.2.3i
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
Cc: kernel test robot <lkp@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kbuild-all@lists.01.org,
 clang-built-linux <clang-built-linux@googlegroups.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 07, 2020 at 09:56:56AM -0800, Nick Desaulniers wrote:
> On Mon, Dec 7, 2020 at 4:23 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> > So is clang defining __powerpc64__ even for 32-bit code?
> >
> > And the answer appears to be yes:
> >
> >   $ clang --version
> >   Ubuntu clang version 11.0.0-2
> >   Target: powerpc64le-unknown-linux-gnu
> >
> >   $ clang -m32 -dM -E - < /dev/null | grep powerpc
> >   #define __powerpc64__ 1
> >   #define __powerpc__ 1
> >
> > Compare to gcc:
> >
> >   $ gcc --version
> >   gcc (Ubuntu 10.2.0-13ubuntu1) 10.2.0
> >
> >   $ gcc -m32 -dM -E - < /dev/null | grep powerpc
> >   #define __powerpc__ 1
> >   #define powerpc 1
> >   #define __powerpc 1
> >
> >
> > Which is fairly problematic, because we use the presence/absence of
> > __powerpc64__ to determine if we're building 64-bit/32-bit code in
> > several places.
> >
> > Not sure what the best approach for fixing that is.
> 
> Thanks for the triage; we should fix our preprocessor:
> https://bugs.llvm.org/show_bug.cgi?id=48427

Not only is that a compatibility problem (as the bug report says): it is
a straight up violation of the ABI!  (For ELFv2, which you have here;
older ABIs did not mention the preprocessor predefines, but this was
exactly the same on all compilers afaik.)


Segher
