Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FC9262FA3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 16:16:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bmkbm66BNzDqXC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 00:16:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjWD6kswzDqFG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:27:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjW549ybz9sW3; Wed,  9 Sep 2020 23:27:45 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
In-Reply-To: <20200630015935.2675676-1-joel@jms.id.au>
References: <20200630015935.2675676-1-joel@jms.id.au>
Subject: Re: [PATCH v2] powerpc: Warn about use of smt_snooze_delay
Message-Id: <159965716554.808686.4840855488904790852.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:27:45 +1000 (AEST)
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 30 Jun 2020 11:29:35 +0930, Joel Stanley wrote:
> It's not done anything for a long time. Save the percpu variable, and
> emit a warning to remind users to not expect it to do anything.
> 
> Fixes: 3fa8cad82b94 ("powerpc/pseries/cpuidle: smt-snooze-delay cleanup.")
> Cc: stable@vger.kernel.org # v3.14
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> --
> v2:
>  Use pr_warn instead of WARN
>  Reword and print proccess name with pid in message
>  Leave CPU_FTR_SMT test in
>  Add Fixes line
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Warn about use of smt_snooze_delay
      https://git.kernel.org/powerpc/c/a02f6d42357acf6e5de6ffc728e6e77faf3ad217

cheers
