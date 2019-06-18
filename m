Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3880E4A02B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 14:03:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SmtT0wq3zDqKl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 22:02:56 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SmrN6rh6zDqKl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 22:01:08 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x5IC104O029314;
 Tue, 18 Jun 2019 07:01:00 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x5IC0xm9029313;
 Tue, 18 Jun 2019 07:00:59 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 18 Jun 2019 07:00:59 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Gustavo Romero <gromero@linux.vnet.ibm.com>
Subject: Re: [PATCH] selftests/powerpc: Fix earlyclobber in tm-vmxcopy
Message-ID: <20190618120059.GJ7313@gate.crashing.org>
References: <1560806698-26651-1-git-send-email-gromero@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560806698-26651-1-git-send-email-gromero@linux.vnet.ibm.com>
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
Cc: mikey@neuling.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 17, 2019 at 05:24:58PM -0400, Gustavo Romero wrote:
> In some cases, compiler can allocate the same register for operand 'res'
> and 'vecoutptr', resulting in segfault at 'stxvd2x 40,0,%[vecoutptr]'
> because base register will contain 1, yielding a false-positive.
> 
> This is because output 'res' must be marked as an earlyclobber operand so
> it may not overlap an input operand ('vecoutptr').
> 
> Signed-off-by: Gustavo Romero <gromero@linux.vnet.ibm.com>

Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>


Segher


> ---
>  tools/testing/selftests/powerpc/tm/tm-vmxcopy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/powerpc/tm/tm-vmxcopy.c b/tools/testing/selftests/powerpc/tm/tm-vmxcopy.c
> index 147c6dc..c1e788a 100644
> --- a/tools/testing/selftests/powerpc/tm/tm-vmxcopy.c
> +++ b/tools/testing/selftests/powerpc/tm/tm-vmxcopy.c
> @@ -79,7 +79,7 @@ int test_vmxcopy()
>  
>  		"5:;"
>  		"stxvd2x 40,0,%[vecoutptr];"
> -		: [res]"=r"(aborted)
> +		: [res]"=&r"(aborted)
>  		: [vecinptr]"r"(&vecin),
>  		  [vecoutptr]"r"(&vecout),
>  		  [map]"r"(a)
> -- 
> 2.7.4
