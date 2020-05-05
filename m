Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 566D51C5CF2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 18:06:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Gl2s3zzGzDqgF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 02:06:29 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49GkvZ4NygzDqTv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 02:00:10 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 045Fxiqh012171;
 Tue, 5 May 2020 10:59:45 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 045FxikO012170;
 Tue, 5 May 2020 10:59:44 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 5 May 2020 10:59:44 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4 1/2] powerpc/uaccess: Implement unsafe_put_user() using
 'asm goto'
Message-ID: <20200505155944.GO31009@gate.crashing.org>
References: <23e680624680a9a5405f4b88740d2596d4b17c26.1587143308.git.christophe.leroy@c-s.fr>
 <87sggecv81.fsf@mpe.ellerman.id.au>
 <1c6379b2-7e0a-91fe-34f0-51f5adca7929@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c6379b2-7e0a-91fe-34f0-51f5adca7929@csgroup.eu>
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 05, 2020 at 05:40:21PM +0200, Christophe Leroy wrote:
> >>+#define __put_user_asm_goto(x, addr, label, op)			\
> >>+	asm volatile goto(					\
> >>+		"1:	" op "%U1%X1 %0,%1	# put_user\n"	\
> >>+		EX_TABLE(1b, %l2)				\
> >>+		:						\
> >>+		: "r" (x), "m<>" (*addr)				\
> >
> >The "m<>" here is breaking GCC 4.6.3, which we allegedly still support.
> >
> >Plain "m" works, how much does the "<>" affect code gen in practice?
> >
> >A quick diff here shows no difference from removing "<>".
> 
> It was recommended by Segher, there has been some discussion about it on 
> v1 of this patch, see 
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/4fdc2aba6f5e51887d1cd0fee94be0989eada2cd.1586942312.git.christophe.leroy@c-s.fr/
> 
> As far as I understood that's mandatory on recent gcc to get the 
> pre-update form of the instruction. With older versions "m" was doing 
> the same, but not anymore.

Yes.  How much that matters depends on the asm.  On older CPUs (6xx/7xx,
say) the update form was just as fast as the non-update form.  On newer
or bigger CPUs it is usually executed just the same as an add followed
by the memory access, so it just saves a bit of code size.

> Should we ifdef the "m<>" or "m" based on GCC 
> version ?

That will be a lot of churn.  Just make 4.8 minimum?


Segher
