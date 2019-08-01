Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3D17E223
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 20:26:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zzJv59lmzDqlm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 04:26:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zzH00lg6zDqZG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 04:25:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45zzGz0qYQz8x8x
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 04:24:59 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45zzGz0XYsz9sDQ; Fri,  2 Aug 2019 04:24:59 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45zzGy18RQz9s00;
 Fri,  2 Aug 2019 04:24:56 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x71IOqoC030724;
 Thu, 1 Aug 2019 13:24:52 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x71IOpCQ030723;
 Thu, 1 Aug 2019 13:24:51 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 1 Aug 2019 13:24:51 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] selftests/powerpc: Fix build failures with GCC 9
Message-ID: <20190801182451.GU31406@gate.crashing.org>
References: <20190801122628.25084-1-mpe@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190801122628.25084-1-mpe@ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 01, 2019 at 10:26:28PM +1000, Michael Ellerman wrote:
> GCC 9 fails to build some of the ptrace TM tests, with errors such as:
> 
>   ptrace-tm-spd-vsx.c: In function 'tm_spd_vsx':
>   ptrace-tm-spd-vsx.c:51:2: error: listing the stack pointer register 'r1' in a clobber list is deprecated [-Werror=deprecated]
>      51 |  asm __volatile__(
>         |  ^~~
>   ptrace-tm-spd-vsx.c:51:2: note: the value of the stack pointer after an 'asm' statement must be the same as it was before the statement
> 
> Which is probably fair enough.

Maybe you shouldn't build the tests with -Werror though?  (And you could
include the much more useful -Wextra while you're at it ;-) ).

> Some of these inline asm blocks are doing quite a lot and are probably
> pushing the boundaries of what's sane to do with inline asm,

These are just testcases, you sometimes need to do evil things there.
But yeah :-)

> but they shouldn't actually be returning with r1 modified.

But they *do* modify lr, and that one isnt't listed; I guess the r1
clobber was there because of the call in the asm, but that needs an
lr clobber, instead.

(Or it was because of the "or 1,1,1")?


Segher
