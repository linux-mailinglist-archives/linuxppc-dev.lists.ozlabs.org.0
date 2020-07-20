Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC96226F80
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 22:12:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9Xvs5DVXzDqjy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 06:12:41 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 4B9Xt26Xy2zDqfY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 06:11:06 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 06KKAqcG031342;
 Mon, 20 Jul 2020 15:10:52 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 06KKAgik031334;
 Mon, 20 Jul 2020 15:10:42 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 20 Jul 2020 15:10:41 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [RFC PATCH] powerpc/pseries/svm: capture instruction faulting on
 MMIO access, in sprg0 register
Message-ID: <20200720201041.GM30544@gate.crashing.org>
References: <1594888333-9370-1-git-send-email-linuxram@us.ibm.com>
 <18e3bcee-8a3a-bd13-c995-8e4168471f74@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18e3bcee-8a3a-bd13-c995-8e4168471f74@linux.ibm.com>
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
Cc: aik@ozlabs.ru, Ram Pai <linuxram@us.ibm.com>, kvm-ppc@vger.kernel.org,
 bharata@linux.ibm.com, sathnaga@linux.vnet.ibm.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 20, 2020 at 11:39:56AM +0200, Laurent Dufour wrote:
> Le 16/07/2020 à 10:32, Ram Pai a écrit :
> >+	if (is_secure_guest()) {					\
> >+		__asm__ __volatile__("mfsprg0 %3;"			\
> >+				"lnia %2;"				\
> >+				"ld %2,12(%2);"				\
> >+				"mtsprg0 %2;"				\
> >+				"sync;"					\
> >+				#insn" %0,%y1;"				\
> >+				"twi 0,%0,0;"				\
> >+				"isync;"				\
> >+				"mtsprg0 %3"				\
> >+			: "=r" (ret)					\
> >+			: "Z" (*addr), "r" (0), "r" (0)			\
> 
> I'm wondering if SPRG0 is restored to its original value.
> You're using the same register (r0) for parameters 2 and 3, so when doing 
> lnia %2, you're overwriting the SPRG0 value you saved in r0 just earlier.

It is putting the value 0 in the registers the compiler chooses for
operands 2 and 3.  But operand 3 is written, while the asm says it is an
input.  It needs an earlyclobber as well.

> It may be clearer to use explicit registers for %2 and %3 and to mark them 
> as modified for the compiler.

That is not a good idea, imnsho.


Segher
