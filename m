Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BB355F772
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 09:02:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXspp05TGz3f6C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 17:02:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXsnh6Jz5z3bq3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 17:01:28 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LXsnh1vFNz4xZB;
	Wed, 29 Jun 2022 17:01:28 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nathan Lynch <nathanl@linux.ibm.com>
In-Reply-To: <20220623182509.3985625-1-nathanl@linux.ibm.com>
References: <20220623182509.3985625-1-nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/xive/spapr: correct bitmap allocation size
Message-Id: <165648606330.2953426.13199772297268070332.b4-ty@ellerman.id.au>
Date: Wed, 29 Jun 2022 17:01:03 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: paulus@samba.org, clg@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 23 Jun 2022 13:25:09 -0500, Nathan Lynch wrote:
> kasan detects access beyond the end of the xibm->bitmap allocation:
> 
> BUG: KASAN: slab-out-of-bounds in _find_first_zero_bit+0x40/0x140
> Read of size 8 at addr c00000001d1d0118 by task swapper/0/1
> 
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.19.0-rc2-00001-g90df023b36dd #28
> Call Trace:
> [c00000001d98f770] [c0000000012baab8] dump_stack_lvl+0xac/0x108 (unreliable)
> [c00000001d98f7b0] [c00000000068faac] print_report+0x37c/0x710
> [c00000001d98f880] [c0000000006902c0] kasan_report+0x110/0x354
> [c00000001d98f950] [c000000000692324] __asan_load8+0xa4/0xe0
> [c00000001d98f970] [c0000000011c6ed0] _find_first_zero_bit+0x40/0x140
> [c00000001d98f9b0] [c0000000000dbfbc] xive_spapr_get_ipi+0xcc/0x260
> [c00000001d98fa70] [c0000000000d6d28] xive_setup_cpu_ipi+0x1e8/0x450
> [c00000001d98fb30] [c000000004032a20] pSeries_smp_probe+0x5c/0x118
> [c00000001d98fb60] [c000000004018b44] smp_prepare_cpus+0x944/0x9ac
> [c00000001d98fc90] [c000000004009f9c] kernel_init_freeable+0x2d4/0x640
> [c00000001d98fd90] [c0000000000131e8] kernel_init+0x28/0x1d0
> [c00000001d98fe10] [c00000000000cd54] ret_from_kernel_thread+0x5c/0x64
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/xive/spapr: correct bitmap allocation size
      https://git.kernel.org/powerpc/c/19fc5bb93c6bbdce8292b4d7eed04e2fa118d2fe

cheers
