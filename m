Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB876693B1A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 00:23:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFNnZ545Gz3c7t
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 10:23:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YynPQDup;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFNmd6tC2z3bg5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Feb 2023 10:22:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YynPQDup;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PFNmc4LsWz4x7W;
	Mon, 13 Feb 2023 10:22:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1676244160;
	bh=RsoH4zXDNZAI4qNZsfWd35WEMUCkQt/8RrKIyZ10p1M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YynPQDup6rae+tCL1eEOJ1zlIm3/LZm2bQGrIWVtXb56rnW05yxyi6CzGiK/P3XQI
	 3sNpk8CCWQyF62t3juP4xzWyzQyXFZXCmvOMEBUsobRr7tPt6e3GviqRvcOkQhqBLc
	 jpQGhw1fBrws35ObnzYg0P4gGoNvvCCStih0QbR6UrS1KM6kpUqr+nIm1PnmiOeZZw
	 XI9AK6PkJrqGDdE0JHnBwwoGz3o7lkmIK1PeqX1Z27iYIPpepy6jvOMipBxcN1z+u1
	 ROJXbCCaaRoZRXJGls2cFbzXx8x5GNnOU+c6Sft51pbVfAuz7rjchUfYS0gYkq5T9I
	 TFnW3RhX8alSQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the powerpc tree
In-Reply-To: <20230210143829.4ab676bd@canb.auug.org.au>
References: <20230210143829.4ab676bd@canb.auug.org.au>
Date: Mon, 13 Feb 2023 10:22:38 +1100
Message-ID: <871qmuwjsx.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> After merging the powerpc tree, today's linux-next build (powerpc64
> allnoconfig) failed like this:
>
> arch/powerpc/kernel/setup_64.c: In function 'early_setup':
> arch/powerpc/kernel/setup_64.c:400:34: error: 'struct thread_info' has no member named 'cpu'
>   400 |         task_thread_info(current)->cpu = boot_cpuid; // fix task_cpu(current)
>       |                                  ^~
>
> Caused by commit
>
>   0ecf51ca51e5 ("powerpc/64: Fix task_cpu in early boot when booting non-zero cpuid")
>
> # CONFIG_SMP is not set

Thanks. I squashed in the fix.

cheers
