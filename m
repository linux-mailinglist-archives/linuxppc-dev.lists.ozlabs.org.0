Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C830F1AB3DD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 00:39:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492cjS5DdnzDrBp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 08:39:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 492cgr2TV1zDr8q
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 08:38:00 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 03FMbmpQ029595;
 Wed, 15 Apr 2020 17:37:48 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 03FMblsA029594;
 Wed, 15 Apr 2020 17:37:47 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 15 Apr 2020 17:37:47 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v2] powerpc/uaccess: Implement unsafe_put_user() using
 'asm goto'
Message-ID: <20200415223747.GX26902@gate.crashing.org>
References: <c9abd91e9bb0b3dd6e3470015e92b98bc2483780.1586942304.git.christophe.leroy@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9abd91e9bb0b3dd6e3470015e92b98bc2483780.1586942304.git.christophe.leroy@c-s.fr>
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

Hi!

On Wed, Apr 15, 2020 at 09:25:59AM +0000, Christophe Leroy wrote:
> +#define __put_user_goto(x, ptr, label) \
> +	__put_user_nocheck_goto((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)), label)

This line gets too long, can you break it up somehow?

> +#define __put_user_asm_goto(x, addr, label, op)			\
> +	asm volatile goto(					\
> +		"1:	" op "%U1%X1 %0,%1	# put_user\n"	\
> +		EX_TABLE(1b, %l2)				\
> +		:						\
> +		: "r" (x), "m" (*addr)				\
> +		:						\
> +		: label)

Same "%Un" problem as in the other patch.  You could use "m<>" here,
but maybe just dropping "%Un" is better.

> +#ifdef __powerpc64__
> +#define __put_user_asm2_goto(x, ptr, label)			\
> +	__put_user_asm_goto(x, ptr, label, "std")
> +#else /* __powerpc64__ */
> +#define __put_user_asm2_goto(x, addr, label)			\
> +	asm volatile goto(					\
> +		"1:	stw%U1%X1 %0, %1\n"			\
> +		"2:	stw%U1%X1 %L0, %L1\n"			\
> +		EX_TABLE(1b, %l2)				\
> +		EX_TABLE(2b, %l2)				\
> +		:						\
> +		: "r" (x), "m" (*addr)				\
> +		:						\
> +		: label)
> +#endif /* __powerpc64__ */

Here, you should drop it for sure.

Rest looks fine.

Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>


Segher
