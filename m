Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B5D828CC0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 19:41:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8fsG38R2z3cbd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jan 2024 05:41:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8frp2pdYz2xQG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jan 2024 05:40:54 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 409IdbVJ019544;
	Tue, 9 Jan 2024 12:39:37 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 409IdblN019543;
	Tue, 9 Jan 2024 12:39:37 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 9 Jan 2024 12:39:36 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/Makefile: Remove bits related to the previous use of -mcmodel=large
Message-ID: <20240109183936.GK19790@gate.crashing.org>
References: <20240109133420.3048719-1-naveen@kernel.org> <47691590-3698-4dea-b093-6619796fa9ea@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47691590-3698-4dea-b093-6619796fa9ea@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Naveen N Rao <naveen@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 09, 2024 at 03:15:35PM +0000, Christophe Leroy wrote:
> >   CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcall-aixdesc)
> >   endif
> >   endif
> > -CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcmodel=medium,$(call cc-option,-mminimal-toc))
> > +CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcmodel=medium)
> 
> Should we still use $(call cc-option  here ?
> As we only deal with medium model now, shouldn't we make it such that it 
> fails in case the compiler doesn't support -mcmodel=medium ?

The -mcmodel= flag has been supported since 2010.  The kernel requires
a GCC from 2015 or later (GCC 5.1 is the minimum).  -mcmodel=medium is
(and always has been) the default, so it is always supported, yes.


Segher
