Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E21E46D58B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 22:01:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qQ4P17BgzDqQx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 06:01:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qQ1z23tbzDqM5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 05:59:01 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6IJwpXD009323;
 Thu, 18 Jul 2019 14:58:52 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x6IJwou7009319;
 Thu, 18 Jul 2019 14:58:50 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 18 Jul 2019 14:58:50 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH v2 03/13] powerpc/prom_init: Add the ESM call to prom_init
Message-ID: <20190718195850.GU20882@gate.crashing.org>
References: <20190713060023.8479-1-bauerman@linux.ibm.com>
 <20190713060023.8479-4-bauerman@linux.ibm.com>
 <70f8097f-7222-fe18-78b4-9372c21bfc9d@ozlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70f8097f-7222-fe18-78b4-9372c21bfc9d@ozlabs.ru>
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
Cc: Anshuman Khandual <anshuman.linux@gmail.com>,
 Mike Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

(Sorry to hijack your reply).

On Thu, Jul 18, 2019 at 06:11:48PM +1000, Alexey Kardashevskiy wrote:
> On 13/07/2019 16:00, Thiago Jung Bauermann wrote:
> >From: Ram Pai <linuxram@us.ibm.com>
> >+static int enter_secure_mode(unsigned long kbase, unsigned long fdt)
> >+{
> >+	register uint64_t func asm("r3") = UV_ESM;
> >+	register uint64_t arg1 asm("r4") = (uint64_t)kbase;
> >+	register uint64_t arg2 asm("r5") = (uint64_t)fdt;
> 
> What does UV do with kbase and fdt precisely? Few words in the commit 
> log will do.
> 
> >+
> >+	asm volatile("sc 2\n"
> >+		     : "=r"(func)
> >+		     : "0"(func), "r"(arg1), "r"(arg2)
> >+		     :);
> >+
> >+	return (int)func;
> 
> And why "func"? Is it "function"? Weird name. Thanks,

Maybe the three vars should just be called "r3", "r4", and "r5" --
r3 is used as return value as well, so "func" isn't a great name for it.

Some other comments about this inline asm:

The "\n" makes the generated asm look funny and has no other function.
Instead of using backreferences you can use a "+" constraint, "inout".
Empty clobber list is strange.
Casts to the return type, like most other casts, are an invitation to
bugs and not actually useful.

So this can be written

static int enter_secure_mode(unsigned long kbase, unsigned long fdt)
{
	register uint64_t r3 asm("r3") = UV_ESM;
	register uint64_t r4 asm("r4") = kbase;
	register uint64_t r4 asm("r5") = fdt;

	asm volatile("sc 2" : "+r"(r3) : "r"(r4), "r"(r5));

	return r3;
}

(and it probably should use u64 instead of both uint64_t and unsigned long?)


Segher
