Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEDD4070B7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 19:57:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5k954Fz5z2ypc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Sep 2021 03:57:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4H5k8V6859z2yNG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Sep 2021 03:56:41 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 18AHsVaI011440;
 Fri, 10 Sep 2021 12:54:32 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 18AHsQqX011420;
 Fri, 10 Sep 2021 12:54:26 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 10 Sep 2021 12:54:25 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1] powerpc: flexible GPR range save/restore macros
Message-ID: <20210910175425.GZ1583@gate.crashing.org>
References: <20210910143511.375177-1-npiggin@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210910143511.375177-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Sat, Sep 11, 2021 at 12:35:11AM +1000, Nicholas Piggin wrote:
> +.macro OP_REGS op, width, start, end, base, offset
> +	.Lreg=\start
> +	.rept (\end - \start + 1)
> +	\op	.Lreg,\offset+\width*.Lreg(\base)
> +	.Lreg=.Lreg+1
> +	.endr
> +.endm

"offset" here is the offset of reg "0", not the offset of reg "start".
This isn't new, but documenting it would not hurt :-)

".Lreg" does not really give you much protection, you could use any name
that won't collide, it will be a local symbol anyway.  You could use a
name with a "$" in it, even as first letter, for example.  As written it
still conflicts with any other symbol ".Lreg".  Pretty unlikely of
course :-)

Looks fine in any case.

Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>


Segher
