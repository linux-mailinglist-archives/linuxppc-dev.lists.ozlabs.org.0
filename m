Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E93293B97
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 14:30:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFtJZ3klxzDqh3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 23:30:54 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 4CFt3d6kXQzDqJf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 23:19:41 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 09KCGBUp025510;
 Tue, 20 Oct 2020 07:16:16 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 09KCGAIq025509;
 Tue, 20 Oct 2020 07:16:10 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 20 Oct 2020 07:16:10 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 3/3] powerpc: Fix update form addressing in inline
 assembly
Message-ID: <20201020121610.GZ2672@gate.crashing.org>
References: <212d3bc4a52ca71523759517bb9c61f7e477c46a.1603179582.git.christophe.leroy@csgroup.eu>
 <fcff4199459890d107a06dbc39c52668ccd0921b.1603179582.git.christophe.leroy@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcff4199459890d107a06dbc39c52668ccd0921b.1603179582.git.christophe.leroy@csgroup.eu>
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
Cc: linux-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Tue, Oct 20, 2020 at 07:40:09AM +0000, Christophe Leroy wrote:
> In several places, inline assembly uses the "%Un" modifier
> to enable the use of instruction with update form addressing,
> but the associated "<>" constraint is missing.
> 
> As mentioned in previous patch, this fails with gcc 4.9, so
> "<>" can't be used directly.
> 
> Use UPD_CONSTR macro everywhere %Un modifier is used.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Oh well, it will be easy enough to remove this wart later, so

Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>

> --- a/arch/powerpc/include/asm/book3s/32/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
> @@ -525,7 +525,7 @@ static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
>  		stw%U0%X0 %2,%0\n\
>  		eieio\n\
>  		stw%U1%X1 %L2,%1"
> -	: "=m" (*ptep), "=m" (*((unsigned char *)ptep+4))
> +	: "=m"UPD_CONSTR (*ptep), "=m"UPD_CONSTR (*((unsigned char *)ptep+4))
>  	: "r" (pte) : "memory");

Here it would pre-increment ptep+4.  That can never be something useful
afaics?  The order the two operands are (either or not) pre-modified in
the asm is not specified (GCC does not parse the asm template, by
design), so I fail to see how this could ever work.

> --- a/arch/powerpc/include/asm/nohash/pgtable.h
> +++ b/arch/powerpc/include/asm/nohash/pgtable.h
> @@ -200,7 +200,7 @@ static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
>  			stw%U0%X0 %2,%0\n\
>  			eieio\n\
>  			stw%U1%X1 %L2,%1"
> -		: "=m" (*ptep), "=m" (*((unsigned char *)ptep+4))
> +		: "=m"UPD_CONSTR (*ptep), "=m"UPD_CONSTR (*((unsigned char *)ptep+4))
>  		: "r" (pte) : "memory");

Same here.

The rest looks fine.


Segher
