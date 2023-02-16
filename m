Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E7A699BE3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 19:07:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHjZb3NJWz3f6y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 05:07:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UyMVtzJS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UyMVtzJS;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHjYd3QrVz3cdg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 05:06:13 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4C7C16206B;
	Thu, 16 Feb 2023 18:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E920C4339B;
	Thu, 16 Feb 2023 18:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676570769;
	bh=Ljr2eUs6eDwokyGBfab5ui2UKsebb30+uWqGpYOP/Vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UyMVtzJSxon765RySRZXqQ1iaoudYWiVwA6sg9ERgiN2Q9AlRIir02lfWcixt5jbH
	 NwwTvkQIi+wJLFP1UILZfWxB/Hq3m1paIA7XkZ1KH/iq15Md8/z5MuAA2ig1ph6Dtp
	 xRzzLJr0YRf6p2qwNfIyuPla91kZll9hmf+LJMeEKWYkd40i1x717+2qMXoucx5VF7
	 efhnsB0LCKqRFAI/uR+9Ss1s3l1ce65yTUqT4pnaggk5CK946JEPKvwfX7vePgj7XE
	 PBMNVdNTRDSov2BSKCyq6xYI7s1QmpPq3P+kA2OFiPBs1swja1XoK0z2VQN3YXuQqZ
	 DHU0GUC3n1wEw==
Date: Thu, 16 Feb 2023 10:06:07 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Sathvika Vasireddy <sv@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: linux-next: build warning after merge of the powerpc tree
Message-ID: <20230216180607.w666rnbtm5fumziq@treble>
References: <20230216144031.45b1fc12@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230216144031.45b1fc12@canb.auug.org.au>
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
Cc: Peter Zijlstra <peterz@infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 16, 2023 at 02:40:31PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the powerpc tree, today's linux-next build (powerpc
> pseries_le_defconfig) produced this warning:
> 
> arch/powerpc/kernel/head_64.o: warning: objtool: .text+0x6128: unannotated intra-function call
> 
> I have no idea what caused this.

Adding Sathvika and Christophe.

The short term fix would be something like the below, but...

If powerpc objtool is only doing mcount, does it even make sense to run
objtool on asm files?  If so, there are probably a lot more cleanups
needed for the asm code.

So I'm thinking either we should cleanup all the powerpc asm code with
annotations like below, or we should try to make objtool mcount-mode
ignore asm files.


diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 3a7266fa8a18..1febb56ebaeb 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -472,7 +472,7 @@ SYM_FUNC_START_LOCAL(__mmu_off)
 	b	.	/* prevent speculative execution */
 SYM_FUNC_END(__mmu_off)
 
-start_initialization_book3s:
+SYM_FUNC_START_LOCAL(start_initialization_book3s)
 	mflr	r25
 
 	/* Setup some critical 970 SPRs before switching MMU off */
@@ -494,6 +494,7 @@ start_initialization_book3s:
 
 	mtlr	r25
 	blr
+SYM_FUNC_END(start_initialization_book3s)
 #endif
 
 /*
