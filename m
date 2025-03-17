Return-Path: <linuxppc-dev+bounces-7127-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3EFA64C01
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 12:13:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGXQw5tfJz2ygh;
	Mon, 17 Mar 2025 22:13:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742210024;
	cv=none; b=YZ/cPivrUF4+X/fA4gDzqLhj484PI9bhlBTNyd2HzHkbD7p034NJP5amnxFnwl76vsqa+uGmHe6jFqMmFotrOJWArUKUfhKXW5d8d1vkTZHLjfOpAp0sdCIuIWy2PEER9FAIJRfGRleqYJ/ooHrd0yeEHvkWeOQB9A0tm5n2uQ0c40ViEa/euXLA4TzbRRCQyizNLG2m64mVOgOTv05k83Ix9SQQEuL+xiNn5zmaFvmGOkTCFIJJeiSj6Eaer+QqCTrvwJUIXuFIGch4sFqEnOY0zynZI/PG0vYfkrcwNnAuNW1bv5GDGFfi6xkAXMROqZlgsw56yXhxk0E0oBaZOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742210024; c=relaxed/relaxed;
	bh=QmYJK6DbOMSaneqCEueu5eJ3peh4bmGZrCrSWkmUiLA=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=G6eVQLQIjz+oW4Fr/As5rTr8sr53BrHhZsyJVjd6j+jNk2tu+VMa4A+kTwEVtSk6kPTIebG82snIY2vhzgvmsyCkbzmfsZDmEK+Lr32w1Uue1ekDN4jm35wSv2HO0ZcrCqRSwCB2Dq4harlZkUGwYvjZH3kjiAb4io3mqBwbUJ2oeiC0pfi4FXP5vfY8/B+2iRth4/f1ltGXIZOhwffYVbADu9eeghL772jyOeLbKS96Xj8SU+kYEcBQ6zewbltmnysLpeWEzttJtZDokhP9sfhHJvV6E5hTTCdaJrWb7quNGmJ52BDro/6etqDqMN8KTDhmJyJlXc31LhtfnBAq7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IadPcq2s; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IadPcq2s;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGXQw1g6vz2yfG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Mar 2025 22:13:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1742210024;
	bh=QmYJK6DbOMSaneqCEueu5eJ3peh4bmGZrCrSWkmUiLA=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=IadPcq2s0qAUW2pyCB3wc5wE4JkOC1NlqDkMJTAWwDYTyLpFgdkbzR6RxlymHxYP3
	 840MBpY0FB5Y5/gXmCwDbOiLo92gysYBsV9nb1OxKkNMfw7+W8I+poWzLQLzDADV10
	 zRVzeH0n2OfUtYKPlap4d3jDwqQXrFgxvPhb7BdxhQG7wKMILt0wij5ru/KgxW8XBj
	 Pd5ALvUbfAMzfMv7Tr7w84DLC2ncaHd7UkgmhAGgekOriJeKzMAhick6APckwzn6aW
	 RJNggJ1nnTh1/v4QI+PxuDd8ShNpvGkVbANNr6BlVEpYtmQWpVPBMwCU6xslrwi0PV
	 z6rcO5tyNqqQw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGXQw0MgHz4x8W;
	Mon, 17 Mar 2025 22:13:44 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [main-line][PowerPC]selftests/powerpc/signal: sigfuz fails
In-Reply-To: <5f88a95b-1c8d-4a74-9753-9cdb2e64daf4@linux.ibm.com>
References: <5f88a95b-1c8d-4a74-9753-9cdb2e64daf4@linux.ibm.com>
Date: Mon, 17 Mar 2025 22:13:41 +1100
Message-ID: <87v7s7di56.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Venkat Rao Bagalkote <venkat88@linux.ibm.com> writes:
> Greetings!!
>
> I am observing selftests/powerpc/signal:sigfuz test fails on linux 
> mainline repo on IBM Power10 systems.
>
> The test passes on the kernel with commit head: 
> 619f0b6fad524f08d493a98d55bac9ab8895e3a6 and fails on the kernel with 
> commit head: ce69b4019001407f9cd738dd2ba217b3a8ab831b on the main line.
>
>
> Repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>
> I tried to do git bisect and the bisect tool pointed first bad commit 
> to: 16ebb6f5b6295c9688749862a39a4889c56227f8.
>
> But upon reverting the first bad commit issue is still seen. So please 
> ignore, if the bisection dosent help.
>
>
> Error:
>
> # selftests: powerpc/signal: sigfuz
> # test: signal_fuzzer
> # tags: git_version:v6.14-rc7-1-g49c747976afa
> # !! killing signal_fuzzer
> # !! child died by signal 15
> # failure: signal_fuzzer
> not ok 3 selftests: powerpc/signal: sigfuz # exit=1

That error means the test is timing out and being killed by the test
harness.

That could be due to a bug, but it could just be that your system is
overloaded or something. You can increase the timeout in the code by
adding a call to test_harness_timeout().

The test also includes lots of randomisation, so if you actually need to
bisect it you'd want to change the code to use a consistent random seed
in the calls to srand().

cheers

