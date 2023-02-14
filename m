Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B39695531
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 01:07:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PG1js6gnJz3cFN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 11:07:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=atX5FSy3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=atX5FSy3;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PG1hw67mKz3bh7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 11:06:40 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A93E661368;
	Tue, 14 Feb 2023 00:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC84C433D2;
	Tue, 14 Feb 2023 00:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676333197;
	bh=7w+QCpSPJLTXIjjwLzAaojQaLQkv4JGlLYFaWApxh2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=atX5FSy3oMqM0KJX4C9JKBaYToW3bt9BZfi4iTetnG8kgxG1NORadoz221vwE5XHR
	 VXyIxXQ26X2Xhpwf30nLLhfmhXLQPCYJ8LoSVKpJlU1iXN6UZVmAhM+IPOgswpbuZK
	 ttbnaBBayDQOLKM1/mBoP+bItXrsH/ZLt8ztlmSEGyJdFOA9D2bCoJPLFLFC/tco9G
	 j5/9RkiWU8Fe5GTDu2rdHQcIGj962P3YwhVIPm4N+9zpxT/fxwXunUSrjZb8RwkKXe
	 0p3NVE7Ob6NNeUoEDtZ/ZOrlnhFzEdsccpjZmK2ihBlfHxm17p9P2t0Kz8qUg5Uu1d
	 QGDYjtDmmIEmw==
Date: Mon, 13 Feb 2023 19:06:36 -0500
From: Sasha Levin <sashal@kernel.org>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [PATCH AUTOSEL 6.1 17/38] powerpc/85xx: Fix unannotated
 intra-function call warning
Message-ID: <Y+rQjJr2CyQhfIZN@sashalap>
References: <20230209111459.1891941-1-sashal@kernel.org>
 <20230209111459.1891941-17-sashal@kernel.org>
 <288e133f-f740-6818-8125-8079217ab822@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <288e133f-f740-6818-8125-8079217ab822@linux.ibm.com>
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, npiggin@gmail.com, stable@vger.kernel.org, naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 10, 2023 at 04:55:54PM +0530, Sathvika Vasireddy wrote:
>Hi Sasha,
>
>On 09/02/23 16:44, Sasha Levin wrote:
>>From: Sathvika Vasireddy <sv@linux.ibm.com>
>>
>>[ Upstream commit 8afffce6aa3bddc940ac1909627ff1e772b6cbf1 ]
>>
>>objtool throws the following warning:
>>   arch/powerpc/kernel/head_85xx.o: warning: objtool: .head.text+0x1a6c:
>>   unannotated intra-function call
>>
>>Fix the warning by annotating KernelSPE symbol with SYM_FUNC_START_LOCAL
>>and SYM_FUNC_END macros.
>>
>>Reported-by: kernel test robot <lkp@intel.com>
>>Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
>>Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>>Link: https://lore.kernel.org/r/20230128124138.1066176-1-sv@linux.ibm.com
>>Signed-off-by: Sasha Levin <sashal@kernel.org>
>>---
>>  arch/powerpc/kernel/head_85xx.S | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>>diff --git a/arch/powerpc/kernel/head_85xx.S b/arch/powerpc/kernel/head_85xx.S
>>index 52c0ab416326a..d3939849f4550 100644
>>--- a/arch/powerpc/kernel/head_85xx.S
>>+++ b/arch/powerpc/kernel/head_85xx.S
>>@@ -862,7 +862,7 @@ _GLOBAL(load_up_spe)
>>   * SPE unavailable trap from kernel - print a message, but let
>>   * the task use SPE in the kernel until it returns to user mode.
>>   */
>>-KernelSPE:
>>+SYM_FUNC_START_LOCAL(KernelSPE)
>>  	lwz	r3,_MSR(r1)
>>  	oris	r3,r3,MSR_SPE@h
>>  	stw	r3,_MSR(r1)	/* enable use of SPE after return */
>>@@ -879,6 +879,7 @@ KernelSPE:
>>  #endif
>>  	.align	4,0
>>+SYM_FUNC_END(KernelSPE)
>>  #endif /* CONFIG_SPE */
>>  /*
>
>Please drop this patch because objtool enablement patches for powerpc 
>are not a part of kernel v6.1.

Ack, I'll drop this and the other one you've pointed out. Thanks!

-- 
Thanks,
Sasha
