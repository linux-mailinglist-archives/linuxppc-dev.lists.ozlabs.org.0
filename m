Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A5A5A1873
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 20:11:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MD9yw4n4Gz3cBB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 04:11:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MD9yR1tZKz3bXR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Aug 2022 04:11:25 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 27PI878E022924;
	Thu, 25 Aug 2022 13:08:07 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 27PI86ZE022921;
	Thu, 25 Aug 2022 13:08:06 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 25 Aug 2022 13:08:06 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] compiler-gcc.h: Remove ancient workaround for gcc PR 58670
Message-ID: <20220825180806.GG25951@gate.crashing.org>
References: <20220624141412.72274-1-ubizjak@gmail.com> <1661422971.cqtahfm22j.naveen@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1661422971.cqtahfm22j.naveen@linux.ibm.com>
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
Cc: x86@kernel.org, Uros Bizjak <ubizjak@gmail.com>, linux-kernel@vger.kernel.org, sv@linux.ibm.com, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Thu, Aug 25, 2022 at 04:00:52PM +0530, Naveen N. Rao wrote:
> This is causing a build issue on ppc64le with a new patch replacing use 
> of unreachable() with __builtin_unreachable() in __WARN_FLAGS():
> https://lore.kernel.org/linuxppc-dev/20220808114908.240813-2-sv@linux.ibm.com/

What is the compiler version?  If this is a GCC version that is still
supported, could you please open a PR?  <https://gcc.gnu.org/bugs.html>

> during RTL pass: combine
> In file included from /linux/kernel/locking/rtmutex_api.c:9:
> /linux/kernel/locking/rtmutex.c: In function 
> '__rt_mutex_slowlock.constprop':
> /linux/kernel/locking/rtmutex.c:1612:1: internal compiler error: in 
> purge_dead_edges, at cfgrtl.c:3369
> 1612 | }
>      | ^
> 0x142817c internal_error(char const*, ...)
> 	???:0
> 0x5c8a1b fancy_abort(char const*, int, char const*)
> 	???:0
> 0x72017f purge_all_dead_edges()
> 	???:0
> Please submit a full bug report,
> with preprocessed source if appropriate.
> Please include the complete backtrace with any bug report.
> See <file:///usr/share/doc/gcc-11/README.Bugs> for instructions.

(For some reason your compiler does not show compiler source code file
names or line numbers.)

So it is GCC 11...  is it 11.3?  If not, please try with that.

> So, it looks like gcc still has issues with certain uses of asm goto.

Could be.  Please attach preprocessed code (or reduced code that shows
the same problem if you have that / can make that).  Thanks!


Segher
