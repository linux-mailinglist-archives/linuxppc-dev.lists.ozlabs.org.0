Return-Path: <linuxppc-dev+bounces-10231-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AB5B03151
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jul 2025 16:02:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bg6b00NxNz30WY;
	Mon, 14 Jul 2025 00:02:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752415339;
	cv=none; b=dhGRh66kdqORVc/XIBI44Jh9YXX/s3HsrQstBNF3T1kBtrFtxQpGYkf4XWq+7Rb8RJ/sOmSj/1G6lA6HWhky1lQSYWoewBCDmrxO7Wi3wCY2yEjC+gpAgSKG92UC8meil7IaV3MDSb0hIi4FbJlWQFZ0xqarnmBY5GRudRxknjAECcnGAI3RZnkSR58fc4XlIXI6Fh8sj15PRfGSlDBTXEIExyivl5D1VOSHvk3h9CmvTeTmMpW+93sdMt/SKJHQRs35d4gw4wyC+VUHgg2eEes9o0vzbkP1HZa336X6/hTXJZsTH3Q2zN4kgKgZDTIgpW8mK0GO108FqWsXOqtdrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752415339; c=relaxed/relaxed;
	bh=LIneC7coH6mqV3/3uHkMLFmPFaJAdRukpN+LvG+M5S0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7/l6D+1sTS7P4zUb4J6kqk9oMZWO/Q2uyptmL9jPWrtcYkPyVRN0zBFjVWFYe1TAItWEIP55W1UsIBTZo9nae5wuBAGF6vTW4A72qaHRzg8Wv3Z9kOE9thggqMDWHbkIOBonoo1TsmVv/4EoKTp1dFeZYt7z6RQJbX1pQen3PVapSOwc1S09JmP6HwhCXHDMpe63+4HLU+Mxlqx0OTII+4SrYFw9+kKp+XcgnWgdL1whrhMEJJ15VXe+L6LBrJFkJC4kjsVF6UNVI2VowBP9x7ApmRfpWU/+nQZLuykpBX9pydCuvQ0FyayeTVSO3b2857MRfanNp7i8ChDzx99dQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bg6Zy3sRqz2yhX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jul 2025 00:02:17 +1000 (AEST)
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 56DE1HTu686944;
	Sun, 13 Jul 2025 09:01:17 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 56DE1E5M686943;
	Sun, 13 Jul 2025 09:01:14 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sun, 13 Jul 2025 09:01:14 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Richard Fontana <rfontana@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>, Thomas Huth <thuth@redhat.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, linux-spdx@vger.kernel.org,
        J Lovejoy <opensource@jilayne.com>
Subject: Re: [PATCH v2] powerpc: Replace the obsolete address of the FSF
Message-ID: <aHO8KoFHQVoCK96W@gate>
References: <20250711053509.194751-1-thuth@redhat.com>
 <2025071125-talon-clammy-4971@gregkh>
 <9f7242e8-1082-4a5d-bb6e-a80106d1b1f9@redhat.com>
 <2025071152-name-spoon-88e8@gregkh>
 <aHC-Ke2oLri_m7p6@infradead.org>
 <2025071119-important-convene-ab85@gregkh>
 <CAC1cPGx0Chmz3s+rd5AJAPNCuoyZX-AGC=hfp9JPAG_-H_J6vw@mail.gmail.com>
 <aHGafTZTcdlpw1gN@gate>
 <CAC1cPGzLK8w2e=vz3rgPwWBkqs_2estcbPJgXD-RRx4GjdcB+A@mail.gmail.com>
 <alpine.DEB.2.21.2507122332310.45111@angie.orcam.me.uk>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2507122332310.45111@angie.orcam.me.uk>
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Jul 12, 2025 at 11:48:16PM +0100, Maciej W. Rozycki wrote:
> On Fri, 11 Jul 2025, Richard Fontana wrote:
>  I don't know what the legal status of the statement referred is, however 
> the original exception as published[1] by FSF says:
> 
> '"GCC" means a version of the GNU Compiler Collection, with or without 
> modifications, governed by version 3 (or a specified later version) of the 
> GNU General Public License (GPL) with the option of using any subsequent 
> versions published by the FSF.'

(which is likely the wrong license, the code in the kernel was taken
from something GPLv2).

> which I think makes it clear that "GCC" is a collection of "GNU compilers" 
> and therefore the two terms are synonymous to each other for the purpose 
> of said exception (in the old days "GCC" stood for "GNU C Compiler", but 
> the old meaning makes no sense anymore now that we have compilers for Ada, 
> Fortran and many other languages included in GCC).

Since, what, 2001?  If this matters for these files, they were forked
*very* long ago!


And, of course, the much better way to solve these self-inflicted
problems is to just use the libgcc that your version of GCC want to use,
the one it ships with itself, it being a necessary portion of the
compiler!

Here, an old patch of mine, this one for SuperH (I have stacks of such
patches, for many archs):

===
commit 9289694955c6105fb6bcc35fbf9ce7acddd60674
Author: Segher Boessenkool <segher@kernel.crashing.org>
Date:   Mon Nov 24 09:36:50 2014 -0800

    sh: Use libgcc
    
    Building the kernel with non-ancient compilers fails, because some
    newer libgcc functions are missing from the kernel's clone of it.
    Use the compiler's libgcc, instead.

diff --git a/arch/sh/Makefile b/arch/sh/Makefile
index 5c8776482530..eae83b76f17c 100644
--- a/arch/sh/Makefile
+++ b/arch/sh/Makefile
@@ -171,6 +171,8 @@ KBUILD_CFLAGS		+= -pipe $(cflags-y)
 KBUILD_CPPFLAGS		+= $(cflags-y)
 KBUILD_AFLAGS		+= $(cflags-y)
 
+LIBGCC		:= $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
+
 ifeq ($(CONFIG_MCOUNT),y)
   KBUILD_CFLAGS += -pg
 endif
@@ -180,6 +182,7 @@ ifeq ($(CONFIG_DWARF_UNWINDER),y)
 endif
 
 libs-y			:= arch/sh/lib/	$(libs-y)
+libs-y += $(LIBGCC)
 
 BOOT_TARGETS = uImage uImage.bz2 uImage.gz uImage.lzma uImage.xz uImage.lzo \
 	       uImage.srec uImage.bin zImage vmlinux.bin vmlinux.srec \
diff --git a/arch/sh/lib/Makefile b/arch/sh/lib/Makefile
index eb473d373ca4..2acb2d8c0366 100644
--- a/arch/sh/lib/Makefile
+++ b/arch/sh/lib/Makefile
@@ -6,11 +6,6 @@
 lib-y  = delay.o memmove.o memchr.o \
 	 checksum.o strlen.o div64.o div64-generic.o
 
-# Extracted from libgcc
-obj-y += movmem.o ashldi3.o ashrdi3.o lshrdi3.o \
-	 ashlsi3.o ashrsi3.o ashiftrt.o lshrsi3.o \
-	 udiv_qrnnd.o
-
 udivsi3-y			:= udivsi3_i4i-Os.o
 
 ifneq ($(CONFIG_CC_OPTIMIZE_FOR_SIZE),y)
===


Segher

