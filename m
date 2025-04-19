Return-Path: <linuxppc-dev+bounces-7808-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2A7A942F6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Apr 2025 12:47:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZfpGy4vFSz2yk3;
	Sat, 19 Apr 2025 20:47:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745059626;
	cv=none; b=A5h3zSxMYcwN87IddRpk9CWzS2APjPkkivSPWvCWtLYadum1weR+fcqNPHZuLVcLeh0Abkv0G6jLezi24gOGCJAyD+aM7xw5G2/z+109lEDLWBpq/tdY6upPMJENjG+euc3ZQWOQYQTmEBqFh3mrkSEy2Q3uPkyGIeXzhR5IjXRTVqXZ3ce/iF/QfhvPuAXgvCHqGpGP9DhGoRC5jto1IPISz7BfiBB3fcB+o+41du7uY4veH0u0eDeDWHuGBoc2HUEDz+R9vM4+ofCg/gffZSDkTjT5nAxaMwUnBDMBqz9FngBm+Bc1bagh8LBwBMQi/fkCti8xvuIK/hoHdRFz0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745059626; c=relaxed/relaxed;
	bh=xX2CR6MiLoAPI5M8DdtQtRSJdWYQ9grNQRcfsiQAOis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AanZ3LHfM0eIAyAAr4fuV65sPGgQysYXn34i5EZ3+/9N38wzwf5okRtmQ5PGqPo7VToi/Nw9LHbs4uU6S99XUtBWQvd0VB3f4JQCJzDJX+RLaFsLNub46r8b1wu4A1J7daM83eWGRn0+zjNCexWpx2FR59xTyvU0k4+7aHttmVIXJacvsl3NhzK2QG/0hFG4FcijqX4Q2U3wADWp1pUrbbqPA0FHBb5U663hbOoJ74q/Q7X/eHA12fNJzSf1Pvmf1OCrYqiRBHiHKmcJUgNa7eugPi8Y9NvrgfcGwSTrhglIKaaJIiRxPtP75ngLKU3PLuykPp30TbmynheFqKHS9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U1PYQXlV; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U1PYQXlV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZfpGx3xJZz2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Apr 2025 20:47:05 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 716C144FB8;
	Sat, 19 Apr 2025 10:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48FDC4CEE7;
	Sat, 19 Apr 2025 10:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745059622;
	bh=ZK97eIHavdRm0uW60AowomN0H4pL21DdC6QD66D5J3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U1PYQXlVRGstbxNxCwsF1iMeg2YV/lgOZwzfswcy0qsiYt1Q10mC9ZDc00/HC8s16
	 17QCMV6jGqZv9VM2SGDPJW7nMmPGwz7PDyTke3ZHWQkCBJVK5d6PId9HzKtuYonA82
	 gPbJFsnwsSSlN3W6K4BQA7euDJOVKV6vRkv29U3yXr7CZNNr2PqEp+joxp6ll2jjSn
	 LCMDVflg+ABlJ5B4z3WXln8N6i4fgCpTU4DP28G56bHSaFj3CNfZ5nVxYmh5wVnGqC
	 n6LwWDPr062OzKDZCvDpNqF81oLvfdv/g3iE7U0vWXhiRMHentH7NvHq+yGUznbKf0
	 qFRzBTn4yUGHg==
Date: Sat, 19 Apr 2025 16:12:52 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-trace-kernel@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Michael Ellerman <mpe@ellerman.id.au>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Viktor Malik <vmalik@redhat.com>, stable@vger.kernel.org
Subject: Re: [PATCH] powerpc64/ftrace: fix clobbered r15 during livepatching
Message-ID: <dgqps5smhncufxkayqrdwvni6md2tfawkomkcx4uctatkttoif@biii6zo3c3iv>
References: <20250416191227.201146-1-hbathini@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416191227.201146-1-hbathini@linux.ibm.com>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Apr 17, 2025 at 12:42:27AM +0530, Hari Bathini wrote:
> While r15 is clobbered always with PPC_FTRACE_OUT_OF_LINE, it is
> not restored in livepatch sequence leading to not so obvious fails
> like below:
> 
>   BUG: Unable to handle kernel data access on write at 0xc0000000000f9078
>   Faulting instruction address: 0xc0000000018ff958
>   Oops: Kernel access of bad area, sig: 11 [#1]
>   ...
>   NIP:  c0000000018ff958 LR: c0000000018ff930 CTR: c0000000009c0790
>   REGS: c00000005f2e7790 TRAP: 0300   Tainted: G              K      (6.14.0+)
>   MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 2822880b  XER: 20040000
>   CFAR: c0000000008addc0 DAR: c0000000000f9078 DSISR: 0a000000 IRQMASK: 1
>   GPR00: c0000000018f2584 c00000005f2e7a30 c00000000280a900 c000000017ffa488
>   GPR04: 0000000000000008 0000000000000000 c0000000018f24fc 000000000000000d
>   GPR08: fffffffffffe0000 000000000000000d 0000000000000000 0000000000008000
>   GPR12: c0000000009c0790 c000000017ffa480 c00000005f2e7c78 c0000000000f9070
>   GPR16: c00000005f2e7c90 0000000000000000 0000000000000000 0000000000000000
>   GPR20: 0000000000000000 c00000005f3efa80 c00000005f2e7c60 c00000005f2e7c88
>   GPR24: c00000005f2e7c60 0000000000000001 c0000000000f9078 0000000000000000
>   GPR28: 00007fff97960000 c000000017ffa480 0000000000000000 c0000000000f9078
>   ...
>   Call Trace:
>     check_heap_object+0x34/0x390 (unreliable)
>   __mutex_unlock_slowpath.isra.0+0xe4/0x230
>   seq_read_iter+0x430/0xa90
>   proc_reg_read_iter+0xa4/0x200
>   vfs_read+0x41c/0x510
>   ksys_read+0xa4/0x190
>   system_call_exception+0x1d0/0x440
>   system_call_vectored_common+0x15c/0x2ec
> 
> Fix it by restoring r15 always.
> 
> Fixes: eec37961a56a ("powerpc64/ftrace: Move ftrace sequence out of line")
> Reported-by: Viktor Malik <vmalik@redhat.com>
> Closes: https://lore.kernel.org/lkml/1aec4a9a-a30b-43fd-b303-7a351caeccb7@redhat.com
> Cc: stable@vger.kernel.org # v6.13+
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/kernel/trace/ftrace_entry.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
> index 2c1b24100eca..3565c67fc638 100644
> --- a/arch/powerpc/kernel/trace/ftrace_entry.S
> +++ b/arch/powerpc/kernel/trace/ftrace_entry.S
> @@ -212,10 +212,10 @@
>  	bne-	1f
>  
>  	mr	r3, r15
> +1:	mtlr	r3
>  	.if \allregs == 0
>  	REST_GPR(15, r1)
>  	.endif
> -1:	mtlr	r3
>  #endif

LGTM.
Acked-by: Naveen N Rao (AMD) <naveen@kernel.org>


- Naveen


