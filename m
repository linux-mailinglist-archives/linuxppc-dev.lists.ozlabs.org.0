Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A76E71F6F1E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 23:04:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jbvL05hgzDqWx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 07:04:14 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49jbsk4Xp6zDqP3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 07:02:49 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 05BL2WSL021038;
 Thu, 11 Jun 2020 16:02:32 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 05BL2UHa021034;
 Thu, 11 Jun 2020 16:02:30 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 11 Jun 2020 16:02:30 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Linux powerpc new system call instruction and ABI
Message-ID: <20200611210230.GH31009@gate.crashing.org>
References: <20200611081203.995112-1-npiggin@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200611081203.995112-1-npiggin@gmail.com>
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
Cc: libc-dev@lists.llvm.org, linux-api@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, musl@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Thu, Jun 11, 2020 at 06:12:01PM +1000, Nicholas Piggin wrote:
> Calling convention
> ------------------
> The proposal is for scv 0 to provide the standard Linux system call ABI 
> with the following differences from sc convention[1]:
> 
> - lr is to be volatile across scv calls. This is necessary because the 
>   scv instruction clobbers lr. From previous discussion, this should be 
>   possible to deal with in GCC clobbers and CFI.
> 
> - cr1 and cr5-cr7 are volatile. This matches the C ABI and would allow the
>   kernel system call exit to avoid restoring the volatile cr registers
>   (although we probably still would anyway to avoid information leaks).
> 
> - Error handling: The consensus among kernel, glibc, and musl is to move to
>   using negative return values in r3 rather than CR0[SO]=1 to indicate error,
>   which matches most other architectures, and is closer to a function call.

What about cr0 then?  Will it be volatile as well (exactly like for
function calls)?

> Notes
> -----
> - r0,r4-r8 are documented as volatile in the ABI, but the kernel patch as
>   submitted currently preserves them. This is to leave room for deciding
>   which way to go with these.

The kernel has to set it to *something* that doesn't leak information ;-)


Segher
