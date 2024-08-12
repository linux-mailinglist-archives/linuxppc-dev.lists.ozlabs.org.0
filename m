Return-Path: <linuxppc-dev+bounces-35-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB98C94F972
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 00:14:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cad7xSwi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjTML5R8Cz2xWY;
	Tue, 13 Aug 2024 08:14:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cad7xSwi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjNwS2B96z2xQF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 04:54:16 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CE27061464;
	Mon, 12 Aug 2024 18:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC1EC32782;
	Mon, 12 Aug 2024 18:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723488851;
	bh=2bny6AfsAGMYdxVlCPF5Px8+T2P7E6H7Ahh+CH8PgJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cad7xSwiJHQQlYF9O8N8m28AQFO/40Pbr/SPt4cS3c9yviejwxN2Oh4jRDCA149Tc
	 g6AWHPfQgtxKQvxVY0+ndJyeAh8FS4fYs+bE3XBOPXwHKdHdgoF+wRwAUGn4MP2SQd
	 pCyvVmwR81HI5w18JI5KLLhm3sFJCIIyo5/H2ftxzBcNNOvvQ01p9s31Fp28Vha5i8
	 vC1VOVVHfk+huKs1+oCVlueCm7RSu0+TW9ROmHXc8TCDlbRCDLko+dZnJ1HCRPGval
	 ET7rwB0MoGcyAtOTIpqZSNXe/+doSqaj/K+GnnzJJzvSa2U4eon92luifigS8hXAoZ
	 sIH7XtR+IZbQQ==
Date: Mon, 12 Aug 2024 11:54:11 -0700
From: Kees Cook <kees@kernel.org>
To: Erhard Furtner <erhard_f@mailbox.org>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
	David Gow <davidgow@google.com>, kunit-dev@googlegroups.com
Subject: Re: OVERFLOW_KUNIT_TEST fails with BUG: KASAN: stack-out-of-bounds
 in string_nocheck+0x168/0x1c8 (kernel 6.11-rc2, PowerMac G4 DP)
Message-ID: <202408121146.1D02EB6E@keescook>
References: <20240809231537.7c9ee7ea@yea>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809231537.7c9ee7ea@yea>

On Fri, Aug 09, 2024 at 11:15:37PM +0200, Erhard Furtner wrote:
> Greetings!
> 
> When KASAN is enabled the Overflow KUnit test fails:
> 
> [...]
>     ok 16 shift_nonsense_test
>     # overflow_allocation_test: 11 allocation overflow tests finished
> ==================================================================
> BUG: KASAN: stack-out-of-bounds in string_nocheck+0x168/0x1c8
> Read of size 1 at addr c976be40 by task kunit_try_catch/1843
> 
> CPU: 0 UID: 0 PID: 1843 Comm: kunit_try_catch Tainted: G                 N 6.11.0-rc2-PMacG4 #1
> Tainted: [N]=TEST
> Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
> Call Trace:
> [c992fb80] [c16651c0] dump_stack_lvl+0x80/0xac (unreliable)
> [c992fba0] [c04e0420] print_report+0xdc/0x504
> [c992fc00] [c04e01d8] kasan_report+0xf8/0x108
> [c992fc80] [c16ae4c8] string_nocheck+0x168/0x1c8
> [c992fcf0] [c16b37a4] string+0xa8/0xbc
> [c992fd60] [c16b8134] vsnprintf+0x868/0x1750
> [c992fdf0] [c0b8490c] kvasprintf+0xa4/0x13c
> [c992fe60] [c0b84c3c] kasprintf+0xb4/0xc8
> [c992fed0] [c0f4c954] module_remove_driver+0x1f0/0x2fc
> [c992ff00] [c0f21628] bus_remove_driver+0x1d0/0x240
> [c992ff30] [bfd0cd40] kunit_put_resource+0x128/0x134 [kunit]
> [c992ff50] [bfd0a120] kunit_cleanup+0x140/0x144 [kunit]
> [c992ff90] [bfd10d64] kunit_generic_run_threadfn_adapter+0xf8/0x148 [kunit]
> [c992ffc0] [c00f57e0] kthread+0x36c/0x37c
> [c992fff0] [c0028304] start_kernel_thread+0x10/0x14
> 
> The buggy address belongs to the physical page:
> page: refcount:0 mapcount:0 mapping:00000000 index:0x0 pfn:0x976b
> flags: 0x0(zone=0)
> raw: 00000000 00000000 eef2bb10 00000000 00000000 00000000 ffffffff 00000000
> raw: 00000000
> page dumped because: kasan: bad access detected
> 
> Memory state around the buggy address:
>  c976bd00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>  c976bd80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >c976be00: 00 00 00 00 00 00 00 00 f1 f1 f1 f1 04 f2 04 f2
>                                    ^
>  c976be80: 00 04 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00
>  c976bf00: 00 00 f1 f1 f1 f1 00 f3 f3 f3 00 00 00 00 00 00
> ==================================================================
> Disabling lock debugging due to kernel taint
>     not ok 17 overflow_allocation_test
>     # overflow_size_helpers_test: 43 overflow size helper tests finished
>     ok 18 overflow_size_helpers_test
>     # overflows_type_test: 378 overflows_type() tests finished
>     ok 19 overflows_type_test
>     # same_type_test: 0 __same_type() tests finished
>     ok 20 same_type_test
>     # castable_to_type_test: 75 castable_to_type() tests finished
>     ok 21 castable_to_type_test
>     ok 22 DEFINE_FLEX_test
> # overflow: pass:21 fail:1 skip:0 total:22
> # Totals: pass:21 fail:1 skip:0 total:22
> not ok 1 overflow
> 
> 
> This is reproducible on my machine and always happens when running the test via 'modprobe -v overflow_kunit'. Without KASAN enabled (but KFENCE) overflow_allocation_test passes.

Hmm, this implies some kind of corruption is sneaking in and the kunit
resource freeing code is exploding. I don't immediately see the problem,
though.

-- 
Kees Cook

