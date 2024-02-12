Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2B3851CA4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 19:24:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYXtQ0zB4z3dXP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 05:24:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYXt06t5rz3cB0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 05:24:24 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 41CINMII015661;
	Mon, 12 Feb 2024 12:23:22 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 41CINM2n015660;
	Mon, 12 Feb 2024 12:23:22 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Mon, 12 Feb 2024 12:23:22 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH] powerpc: Add gpr1 and fpu save/restore functions
Message-ID: <20240212182322.GZ19790@gate.crashing.org>
References: <995988479.14839534.1707756078600.JavaMail.zimbra@raptorengineeringinc.com> <20240212170207.GW19790@gate.crashing.org> <1251499652.14843228.1707757778984.JavaMail.zimbra@raptorengineeringinc.com> <20240212173043.GX19790@gate.crashing.org> <572013249.14851324.1707759979044.JavaMail.zimbra@raptorengineeringinc.com> <20240212175906.GY19790@gate.crashing.org> <1119220086.14855806.1707761223318.JavaMail.zimbra@raptorengineeringinc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1119220086.14855806.1707761223318.JavaMail.zimbra@raptorengineeringinc.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 12, 2024 at 12:07:03PM -0600, Timothy Pearson wrote:
> > I have done it for *all* architectures some ten years ago.  Never found
> > any problem.
> 
> That makes sense, what I mean by invasive is that we'd need buy-in from the other
> maintainers across all of the affected architectures.  Is that likely to occur?

I don't know.  Here is my PowerPC-specific patch, it's a bit older, it
might not apply cleanly anymore, the changes needed should be obvious
though:


=== 8< ===
commit f16dfa5257eb14549ce22243fb2b465615085134
Author: Segher Boessenkool <segher@kernel.crashing.org>
Date:   Sat May 3 03:48:06 2008 +0200

    powerpc: Link vmlinux against libgcc.a

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index b7212b619c52..0a2fac6ffc1c 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -158,6 +158,9 @@ core-y                              += arch/powerpc/kernel/ 
 core-$(CONFIG_XMON)            += arch/powerpc/xmon/
 core-$(CONFIG_KVM)             += arch/powerpc/kvm/
 
+LIBGCC := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
+libs-y += $(LIBGCC)
+
 drivers-$(CONFIG_OPROFILE)     += arch/powerpc/oprofile/
 
 # Default to zImage, override when needed
=== 8< ===


> > There are better options than -Os, fwiw.  Some --param's give smaller
> > *and* faster kernels.  What exactly is best is heavily arch-dependent
> > though (as well as dependent on the application code, the kernel code in
> > this case) :-(
> 
> I've been through this a few times, and -Os is the only option that makes
> things (just barely) fit unfortunately.

-O2 with appropriate inlining tuning beats -Os every day of the week,
in my experience.


Segher
