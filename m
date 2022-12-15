Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6764364D493
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 01:20:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXXtX5wvWz3f3Z
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 11:20:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXXt11DYMz2xVr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Dec 2022 11:19:36 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 2BF0HSWb025354;
	Wed, 14 Dec 2022 18:17:28 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 2BF0HQ0c025352;
	Wed, 14 Dec 2022 18:17:26 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 14 Dec 2022 18:17:25 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64: Implement arch_within_stack_frames
Message-ID: <20221215001725.GS25951@gate.crashing.org>
References: <20221214044252.1910657-1-nicholas@linux.ibm.com> <0dfbaab8-c962-9127-b56d-8f9989c095d8@csgroup.eu> <CP1IFJNCTTZ4.33ROBE5VAFAKM@bobo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CP1IFJNCTTZ4.33ROBE5VAFAKM@bobo>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Nicholas Miehlbradt <nicholas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 14, 2022 at 09:39:25PM +1000, Nicholas Piggin wrote:
> What about just copying x86's implementation including using
> __builtin_frame_address(1/2)? Are those builtins reliable for all
> our targets and compiler versions?

__builtin_frame_address(n) with n > 0 is specifically not supported, not
on any architecture; it does not work in all situations on *any* arch,
and not in *any* situation on some archs.

This is clearly documented:

     Calling this function with a nonzero argument can have
     unpredictable effects, including crashing the calling program.  As
     a result, calls that are considered unsafe are diagnosed when the
     '-Wframe-address' option is in effect.  Such calls should only be
     made in debugging situations.

(and that warning is enabled by -Wall).


Segher
