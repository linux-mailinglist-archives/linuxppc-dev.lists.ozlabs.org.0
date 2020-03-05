Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0836D17AAB4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 17:41:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YGjX0jm5zDqnx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 03:41:36 +1100 (AEDT)
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
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YGgR2zfCzDqMn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 03:39:45 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 025Gdc2Q010734;
 Thu, 5 Mar 2020 10:39:38 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 025GdbaV010733;
 Thu, 5 Mar 2020 10:39:37 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 5 Mar 2020 10:39:37 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/2] powerpc: Suppress .eh_frame generation
Message-ID: <20200305163937.GE22482@gate.crashing.org>
References: <9b22a064de6eb1301d92177eb3a38559df7005d3.1583415544.git.naveen.n.rao@linux.vnet.ibm.com>
 <1ed7cd84a7d1a3180b30c0c60e70eed8bb8b40c3.1583415544.git.naveen.n.rao@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ed7cd84a7d1a3180b30c0c60e70eed8bb8b40c3.1583415544.git.naveen.n.rao@linux.vnet.ibm.com>
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
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 05, 2020 at 08:05:30PM +0530, Naveen N. Rao wrote:
> GCC v8 defaults to enabling -fasynchronous-unwind-tables due to
> https://gcc.gnu.org/r259298, which results in .eh_frame section being
> generated. This results in additional disk usage by the build, as well
> as the kernel modules. Since the kernel has no use for this, this
> section is discarded.
> 
> Add -fno-asynchronous-unwind-tables to KBUILD_CFLAGS to suppress
> generation of .eh_frame section. Note that our VDSOs need .eh_frame, but
> are not affected by this change since our VDSO code are all in assembly.

That may change, but it is easy to change again for just the VDSOs.

> Reported-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>

Thanks!


Segher
