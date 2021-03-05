Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E26F32F2C9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 19:37:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dsc0z0WDtz3dNP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 05:37:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Dsc0d3q1zz30MK
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 05:37:21 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 125IX2ju027144;
 Fri, 5 Mar 2021 12:33:02 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 125IX0sO027136;
 Fri, 5 Mar 2021 12:33:00 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 5 Mar 2021 12:33:00 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 1/7] cmdline: Add generic function to build command
 line.
Message-ID: <20210305183300.GX29191@gate.crashing.org>
References: <cover.1614705851.git.christophe.leroy@csgroup.eu>
 <d8cf7979ad986de45301b39a757c268d9df19f35.1614705851.git.christophe.leroy@csgroup.eu>
 <20210303172810.GA19713@willie-the-truck>
 <a0cfef11-efba-2e5c-6f58-ed63a2c3bfa0@csgroup.eu>
 <20210303174627.GC19713@willie-the-truck>
 <dc6576ac-44ff-7db4-d718-7565b83f50b8@csgroup.eu>
 <20210303181651.GE19713@willie-the-truck> <87sg59rewl.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sg59rewl.fsf@mpe.ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Will Deacon <will@kernel.org>,
 danielwa@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 05, 2021 at 10:58:02PM +1100, Michael Ellerman wrote:
> Will Deacon <will@kernel.org> writes:
> > That's very similar to us; we're not relocated, although we are at least
> > in control of the MMU (which is using a temporary set of page-tables).
> 
> prom_init runs as an OF client, with the MMU off (except on some Apple
> machines), and we don't own the MMU. So there's really nothing we can do :)

You *could* take over all memory mapping.  This is complex, and I
estimate the change you get this to work correctly on all supported
systems to be between -400% and 0%.

And not very long later Linux jettisons OF completely anyway.

> Though now that I look at it, I don't think we should be doing this
> level of commandline handling in prom_init. It should just grab the
> value from firmware and pass it to the kernel proper, and then all the
> prepend/append/force etc. logic should happen there.

That sounds much simpler, yes :-)


Segher
