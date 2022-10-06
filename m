Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B1D5F6E82
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 21:56:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mk2JX5Slyz3dsx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 06:56:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mk2Hz4Lcgz3c6g
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 06:56:14 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 296JsCWC017787;
	Thu, 6 Oct 2022 14:54:12 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 296JsBux017786;
	Thu, 6 Oct 2022 14:54:11 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 6 Oct 2022 14:54:11 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: POWER10 CPU Kconfig build option
Message-ID: <20221006195411.GS25951@gate.crashing.org>
References: <20220923033004.536127-1-npiggin@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220923033004.536127-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Fri, Sep 23, 2022 at 01:30:04PM +1000, Nicholas Piggin wrote:
> This adds basic POWER10_CPU option, which builds with -mcpu=power10.

> +# No prefix or pcrel
> +KBUILD_CFLAGS += $(call cc-option,-mno-prefixed)
> +KBUILD_CFLAGS += $(call cc-option,-mno-pcrel)

Why do you disable all prefixed insns?  What goes wrong if you don't?

Same question for pcrel.  I'm sure you want to optimise it better, but
it's not clear to me how it fails now?

Please say in the comment what is wrong, don't spread fear :-)

> +# No AltiVec or VSX or MMA instructions when building kernel
>  KBUILD_CFLAGS += $(call cc-option,-mno-altivec)
>  KBUILD_CFLAGS += $(call cc-option,-mno-vsx)
> +KBUILD_CFLAGS += $(call cc-option,-mno-mma)

MMA code is never generated unless the code asks for it explicitly.
This is fundamental, not just an implementations side effect.


Segher
