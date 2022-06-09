Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75309544FBF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 16:47:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJn4K2N9Bz3dxy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 00:47:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJn2H63p2z3bmQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 00:45:27 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LJn286JLLz4xD5;
	Fri, 10 Jun 2022 00:45:20 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: catalin.marinas@arm.com, keescook@chromium.org, mpe@ellerman.id.au, He Ying <heying24@huawei.com>, npiggin@gmail.com, peterz@infradead.org, christophe.leroy@csgroup.eu, benh@kernel.crashing.org, paulus@samba.org, sxwjean@gmail.com
In-Reply-To: <20220121014418.155675-1-heying24@huawei.com>
References: <20220119015025.136902-1-heying24@huawei.com> <20220121014418.155675-1-heying24@huawei.com>
Subject: Re: [PATCH -v2] powerpc/process, kasan: Silence KASAN warnings in __get_wchan()
Message-Id: <165478587162.589231.6430852932301326942.b4-ty@ellerman.id.au>
Date: Fri, 10 Jun 2022 00:44:31 +1000
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
Cc: chenjingwen6@huawei.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, huwanming@huaweil.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 20 Jan 2022 20:44:18 -0500, He Ying wrote:
> The following KASAN warning was reported in our kernel.
> 
>   BUG: KASAN: stack-out-of-bounds in get_wchan+0x188/0x250
>   Read of size 4 at addr d216f958 by task ps/14437
> 
>   CPU: 3 PID: 14437 Comm: ps Tainted: G           O      5.10.0 #1
>   Call Trace:
>   [daa63858] [c0654348] dump_stack+0x9c/0xe4 (unreliable)
>   [daa63888] [c035cf0c] print_address_description.constprop.3+0x8c/0x570
>   [daa63908] [c035d6bc] kasan_report+0x1ac/0x218
>   [daa63948] [c00496e8] get_wchan+0x188/0x250
>   [daa63978] [c0461ec8] do_task_stat+0xce8/0xe60
>   [daa63b98] [c0455ac8] proc_single_show+0x98/0x170
>   [daa63bc8] [c03cab8c] seq_read_iter+0x1ec/0x900
>   [daa63c38] [c03cb47c] seq_read+0x1dc/0x290
>   [daa63d68] [c037fc94] vfs_read+0x164/0x510
>   [daa63ea8] [c03808e4] ksys_read+0x144/0x1d0
>   [daa63f38] [c005b1dc] ret_from_syscall+0x0/0x38
>   --- interrupt: c00 at 0x8fa8f4
>       LR = 0x8fa8cc
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/process, kasan: Silence KASAN warnings in __get_wchan()
      https://git.kernel.org/powerpc/c/a1b29ba2f2c171b9bea73be993bfdf0a62d37d15

cheers
