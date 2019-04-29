Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED826E1D9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 14:04:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t3Hf3cXWzDqS6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 22:04:46 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t3GG53drzDqMy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 22:03:34 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x3TC3N75019409;
 Mon, 29 Apr 2019 07:03:23 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x3TC3MCq019406;
 Mon, 29 Apr 2019 07:03:22 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 29 Apr 2019 07:03:22 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/32s: fix BATs setting with
 CONFIG_STRICT_KERNEL_RWX
Message-ID: <20190429120322.GP8599@gate.crashing.org>
References: <3a21c6f19637847e6ed080186a834ede619f3849.1556528569.git.christophe.leroy@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a21c6f19637847e6ed080186a834ede619f3849.1556528569.git.christophe.leroy@c-s.fr>
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
Cc: Serge Belyshev <belyshev@depni.sinp.msu.ru>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Acked-by: Segher Boessenkool <segher@kernel.crashing.org>

(But see comments below.)

On Mon, Apr 29, 2019 at 09:08:09AM +0000, Christophe Leroy wrote:
> diff --git a/arch/powerpc/mm/ppc_mmu_32.c b/arch/powerpc/mm/ppc_mmu_32.c
> index bf1de3ca39bc..37cf2af98f6a 100644
> --- a/arch/powerpc/mm/ppc_mmu_32.c
> +++ b/arch/powerpc/mm/ppc_mmu_32.c
> @@ -101,7 +101,7 @@ static int find_free_bat(void)
>  static unsigned int block_size(unsigned long base, unsigned long top)
>  {
>  	unsigned int max_size = (cpu_has_feature(CPU_FTR_601) ? 8 : 256) << 20;
> -	unsigned int base_shift = (fls(base) - 1) & 31;
> +	unsigned int base_shift = (ffs(base) - 1) & 31;
>  	unsigned int block_shift = (fls(top - base) - 1) & 31;

The code is quite confusing now...  Add a comment, or improve it?


Segher
