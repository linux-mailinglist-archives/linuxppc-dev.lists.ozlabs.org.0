Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E9E67A2E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 14:50:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45m8lX3rNjzDqsq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 22:50:16 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45m8j23gvMzDqsj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 22:48:06 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6DCllDH011394;
 Sat, 13 Jul 2019 07:47:47 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x6DCliDE011393;
 Sat, 13 Jul 2019 07:47:44 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Sat, 13 Jul 2019 07:47:44 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] powerpc: remove meaningless KBUILD_ARFLAGS addition
Message-ID: <20190713124744.GS14074@gate.crashing.org>
References: <20190713032106.8509-1-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190713032106.8509-1-yamada.masahiro@socionext.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 13, 2019 at 12:21:06PM +0900, Masahiro Yamada wrote:
> The KBUILD_ARFLAGS addition in arch/powerpc/Makefile has never worked
> in a useful way because it is always overridden by the following code
> in the top Makefile:
> 
>   # use the deterministic mode of AR if available
>   KBUILD_ARFLAGS := $(call ar-option,D)
> 
> The code in the top Makefile was added in 2011, by commit 40df759e2b9e
> ("kbuild: Fix build with binutils <= 2.19").
> 
> The KBUILD_ARFLAGS addition for ppc has always been dead code from the
> beginning.

That was added in 43c9127d94d6 to replace my 8995ac870273 from 2007.

Is it no longer supported to build a 64-bit kernel with a toolchain
that defaults to 32-bit, or the other way around?  And with non-native
toolchains (this one didn't run on Linux, even).


Segher
