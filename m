Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E11C8136194
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 21:10:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ty094Bz7zDqZB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 07:10:17 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47txxn2skmzDqZw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 07:08:13 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 009K7ZKP004645;
 Thu, 9 Jan 2020 14:07:35 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 009K7XMf004644;
 Thu, 9 Jan 2020 14:07:33 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 9 Jan 2020 14:07:33 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: Surprising code generated for vdso_read_begin()
Message-ID: <20200109200733.GS3191@gate.crashing.org>
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
 <bd4557a7-9715-59aa-5d8e-488c5e516a98@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd4557a7-9715-59aa-5d8e-488c5e516a98@c-s.fr>
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
Cc: arnd@arndb.de, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Paul Mackerras <paulus@samba.org>, luto@kernel.org,
 tglx@linutronix.de, vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 09, 2020 at 05:52:34PM +0000, Christophe Leroy wrote:
> Wondering why we get something so complicated/redundant for 
> vdso_read_begin() <include/vdso/helpers.h>
> 
> static __always_inline u32 vdso_read_begin(const struct vdso_data *vd)
> {
> 	u32 seq;
> 
> 	while ((seq = READ_ONCE(vd->seq)) & 1)
> 		cpu_relax();
> 
> 	smp_rmb();
> 	return seq;
> }
> 
> 
>  6e0:   81 05 00 f0     lwz     r8,240(r5)
>  6e4:   71 09 00 01     andi.   r9,r8,1
>  6e8:   41 82 00 10     beq     6f8 <__c_kernel_clock_gettime+0x158>
>  6ec:   81 05 00 f0     lwz     r8,240(r5)
>  6f0:   71 0a 00 01     andi.   r10,r8,1
>  6f4:   40 82 ff f8     bne     6ec <__c_kernel_clock_gettime+0x14c>
>  6f8:
> 
> r5 being vd pointer
> 
> Why the first triplet, not only the second triplet ? Something wrong 
> with using READ_ONCE() for that ?

It looks like the compiler did loop peeling.  What GCC version is this?
Please try current trunk (to become GCC 10), or at least GCC 9?


Segher
