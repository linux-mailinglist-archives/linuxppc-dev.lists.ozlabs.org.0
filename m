Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F6A18D2F8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 16:33:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kSTn0YjWzF0QP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 02:33:17 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 48kSMS0FKWzF0PZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 02:27:47 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 02KFReLt016151;
 Fri, 20 Mar 2020 10:27:40 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 02KFReSa016150;
 Fri, 20 Mar 2020 10:27:40 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 20 Mar 2020 10:27:40 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] arch/powerpc/64: Avoid isync in flush_dcache_range
Message-ID: <20200320152740.GG22482@gate.crashing.org>
References: <20200320103242.229223-1-aneesh.kumar@linux.ibm.com>
 <20200320150539.GF22482@gate.crashing.org>
 <c98c0044-39ec-452d-34db-f7284e4497df@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c98c0044-39ec-452d-34db-f7284e4497df@linux.ibm.com>
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

On Fri, Mar 20, 2020 at 08:38:42PM +0530, Aneesh Kumar K.V wrote:
> On 3/20/20 8:35 PM, Segher Boessenkool wrote:
> >On Fri, Mar 20, 2020 at 04:02:42PM +0530, Aneesh Kumar K.V wrote:
> >>As per ISA and isync is only needed on instruction cache
> >>block invalidate. Remove the same from dcache invalidate.
> >
> >Is that true on older CPUs?
> >
> 
> That is what I found by checking with hardware team.

Oh, the comment right before this function says "does not invalidat
the corresponding insncache blocks", so this looks fine, sorry for not
looking closely enough before.

> One thing i was not 
> able to get full confirmation about was the usage of 'sync' before 'dcbf'.

Yeah, this looks like something that would matter on some implementations.
Would it make anything measurably faster if you would remove that sync?


Segher
