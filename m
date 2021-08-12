Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7A13EA849
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 18:11:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlsBQ4Mw2z3cSS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 02:11:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=srs0=im2c=nd=kernel.crashing.org=segher@ozlabs.org;
 receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gls9w3FfGz2yYJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 02:10:59 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4Gls9t3QVDz9sXS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 02:10:58 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4Gls9t32H5z9sXN; Fri, 13 Aug 2021 02:10:58 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by ozlabs.org (Postfix) with ESMTP id 4Gls9s5v7Xz9sX1;
 Fri, 13 Aug 2021 02:10:57 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 17CG9jBo015370;
 Thu, 12 Aug 2021 11:09:45 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 17CG9iHg015367;
 Thu, 12 Aug 2021 11:09:44 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 12 Aug 2021 11:09:44 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 5/9] powerpc/microwatt: Use standard 16550 UART for
 console
Message-ID: <20210812160944.GU1583@gate.crashing.org>
References: <YMwWPcsaWzMlDPqQ@thinks.paulus.ozlabs.org>
 <YMwXGCTzedpQje7r@thinks.paulus.ozlabs.org>
 <ec000575-7f7a-57b7-50d2-9444e17f2a7e@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec000575-7f7a-57b7-50d2-9444e17f2a7e@csgroup.eu>
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 12, 2021 at 03:14:44PM +0200, Christophe Leroy wrote:
> Le 18/06/2021 à 05:46, Paul Mackerras a écrit :
> >+static u8 udbg_uart_in_isa300_rm(unsigned int reg)
> >+{
> >+	uint64_t msr = mfmsr();
> >+	uint8_t  c;
> >+
> >+	mtmsr(msr & ~(MSR_EE|MSR_DR));
> >+	isync();
> >+	eieio();
> >+	c = __raw_rm_readb(UDBG_UART_MW_ADDR + (reg << 2));
> >+	mtmsr(msr);
> >+	isync();
> >+	return c;
> >+}
> 
> How do you make sure that GCC won't emit any access to the stack between 
> the two mtmsr() ?

The mtmsr are asm with a memory clobber so nothing will be moved between
these, and it is very unlikely anything will sprout up here out of
nothing.  But yes, this whole thing should be written as real asm (or as
one huge inline asm, but ugh).


Segher
