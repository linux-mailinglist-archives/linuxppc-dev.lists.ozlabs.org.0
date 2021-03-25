Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9101A349256
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 13:47:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5lHL4P3Vz3bms
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 23:47:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4F5lH15jTrz302K
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 23:46:51 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 12PCibZK021425;
 Thu, 25 Mar 2021 07:44:37 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 12PCiakP021422;
 Thu, 25 Mar 2021 07:44:36 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 25 Mar 2021 07:44:36 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v7] powerpc/irq: Inline call_do_irq() and call_do_softirq()
Message-ID: <20210325124436.GG16691@gate.crashing.org>
References: <20210320122227.345427-1-mpe@ellerman.id.au>
 <d2217b4e-718b-674d-c6a0-2cb69e3fd81c@csgroup.eu>
 <87k0pwhh5y.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87k0pwhh5y.fsf@mpe.ellerman.id.au>
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

On Wed, Mar 24, 2021 at 11:26:01PM +1100, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> > Hmm. It is the first time we use named parameters in powerpc assembly, isn't it ?

> Yeah I'd like us to use it more, I think it helps readability a lot.

..in some cases.  Not in most cases :-(

> > Wondering, how would the below look like with named parameters (from __put_user_asm2_goto) ?
> >
> > 	stw%X1 %L0, %L1
> 
> Not sure, possibly that's too complicated for it :)

asm("stw%X[name1] %L[name0],%L[name1]" :: [name0]"r"(x), [name1]"m"(p));

Yes, it is not more readable *at all*.


Segher
