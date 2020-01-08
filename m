Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D25134F56
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 23:25:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tP266nlyzDqSm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 09:25:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tP066gZXzDqWn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 09:23:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="ABPbwr8D"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 47tP0659qxz9sRG; Thu,  9 Jan 2020 09:23:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1578522198; bh=3AnSngOOwlWYyi6Ck1EZfS60KlEZPykD72bnQpFUsWg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ABPbwr8DY1PBZRIq4LnwwOet9rX3aXrewqCVNF00X3CO684+KJUg2XDC93mEjIeDH
 rq+7lj/nIDevp+wJfmQn19LyIBLNHBOc20EdpqRFhhVZKt5s0AUl+JXrwOFPVjy53C
 dfer2IK3XLnPB3yaP0/Gi1lRmdn3WwA85E8IhE4ukIn7bCZQK+Z0SpxJvIL1JGks6J
 bmFovBrPOqyqchOa8XPSYj64Zg/fdMws40sy4t2cJcruAubKQnjdG3EIwFE6FqNPER
 HfwSUKywSFQDSEUGy65u062DLcGxNsZvhGpVlUK4ZfB/LEgop0CEzCrQbAtG4YbU6U
 VUzFb4UXWtQJQ==
Date: Thu, 9 Jan 2020 09:23:14 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Balamuruhan S <bala24@linux.ibm.com>
Subject: Re: [PATCH 2/3] powerpc sstep: add support for divde[.] and
 divdeu[.] instructions
Message-ID: <20200108222314.GA11821@blackberry>
References: <20191210071904.31013-1-bala24@linux.ibm.com>
 <20191210071904.31013-3-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191210071904.31013-3-bala24@linux.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 sandipan@linux.ibm.com, ravi.bangoria@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 10, 2019 at 12:49:03PM +0530, Balamuruhan S wrote:
> This patch adds emulation support for divde, divdeu instructions,
> 	* Divide Doubleword Extended (divde[.])
> 	* Divide Doubleword Extended Unsigned (divdeu[.])
> 
> Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
> ---
>  arch/powerpc/lib/sstep.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index c077acb983a1..4b4119729e59 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -1736,7 +1736,32 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  			op->val = (int) regs->gpr[ra] /
>  				(int) regs->gpr[rb];
>  			goto arith_done;
> -
> +#ifdef __powerpc64__
> +		case 425:	/* divde[.] */
> +			if (instr & 1) {
> +				asm volatile(PPC_DIVDE_DOT(%0, %1, %2) :
> +					"=r" (op->val) : "r" (regs->gpr[ra]),
> +					"r" (regs->gpr[rb]));
> +				set_cr0(regs, op);

This seems unneccesarily complicated.  You take the trouble to do a
"divde." instruction rather than a "divde" instruction but then don't
use the CR0 setting that the instruction did, but instead go and work
out what happens to CR0 manually in set_cr0().  Also you don't tell
the compiler that CR0 has been modified, which could lead to problems.

This case could be done much more simply like this:



		case 425:	/* divde[.] */
			asm volatile(PPC_DIVDE(%0, %1, %2) :
				"=r" (op->val) : "r" (regs->gpr[ra]),
				"r" (regs->gpr[rb]));
			goto arith_done;

(note, goto arith_done rather than compute_done) and similarly for the
divdeu case.

Paul.
