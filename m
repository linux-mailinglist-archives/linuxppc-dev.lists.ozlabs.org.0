Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A991179B93
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 23:54:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yD3y1770zDqSM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 07:54:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yD1q0sPjzDqQJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 07:52:30 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6TLq2Kf032552;
 Mon, 29 Jul 2019 16:52:02 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x6TLq0h1032546;
 Mon, 29 Jul 2019 16:52:00 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 29 Jul 2019 16:52:00 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] powerpc: workaround clang codegen bug in dcbz
Message-ID: <20190729215200.GN31406@gate.crashing.org>
References: <20190729202542.205309-1-ndesaulniers@google.com>
 <20190729203246.GA117371@archlinux-threadripper>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190729203246.GA117371@archlinux-threadripper>
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
Cc: kbuild test robot <lkp@intel.com>, arnd@arndb.de,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 29, 2019 at 01:32:46PM -0700, Nathan Chancellor wrote:
> For the record:
> 
> https://godbolt.org/z/z57VU7
> 
> This seems consistent with what Michael found so I don't think a revert
> is entirely unreasonable.

Try this:

  https://godbolt.org/z/6_ZfVi

This matters in non-trivial loops, for example.  But all current cases
where such non-trivial loops are done with cache block instructions are
actually written in real assembler already, using two registers.
Because performance matters.  Not that I recommend writing code as
critical as memset in C with inline asm :-)


Segher
