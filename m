Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C01167558DD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 02:32:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R432d5RJ3z3c2G
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 10:32:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R43280Y9Vz2y3Y
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 10:32:32 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4R43276QpZz4wxx;
	Mon, 17 Jul 2023 10:32:31 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20230517123033.18430-1-mpe@ellerman.id.au>
References: <20230517123033.18430-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64s: Fix native_hpte_remove() to be irq-safe
Message-Id: <168955377881.195506.5601269587244004112.b4-ty@ellerman.id.au>
Date: Mon, 17 Jul 2023 10:29:38 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 17 May 2023 22:30:33 +1000, Michael Ellerman wrote:
> Lockdep warns that the use of the hpte_lock in native_hpte_remove() is
> not safe against an IRQ coming in:
> 
>   ================================
>   WARNING: inconsistent lock state
>   6.4.0-rc2-g0c54f4d30ecc #1 Not tainted
>   --------------------------------
>   inconsistent {IN-SOFTIRQ-W} -> {SOFTIRQ-ON-W} usage.
>   qemu-system-ppc/93865 [HC0[0]:SC0[0]:HE1:SE1] takes:
>   c0000000021f5180 (hpte_lock){+.?.}-{0:0}, at: native_lock_hpte+0x8/0xd0
>   {IN-SOFTIRQ-W} state was registered at:
>     lock_acquire+0x134/0x3f0
>     native_lock_hpte+0x44/0xd0
>     native_hpte_insert+0xd4/0x2a0
>     __hash_page_64K+0x218/0x4f0
>     hash_page_mm+0x464/0x840
>     do_hash_fault+0x11c/0x260
>     data_access_common_virt+0x210/0x220
>     __ip_select_ident+0x140/0x150
>     ...
>     net_rx_action+0x3bc/0x440
>     __do_softirq+0x180/0x534
>     ...
>     sys_sendmmsg+0x34/0x50
>     system_call_exception+0x128/0x320
>     system_call_common+0x160/0x2e4
>   ...
>    Possible unsafe locking scenario:
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64s: Fix native_hpte_remove() to be irq-safe
      https://git.kernel.org/powerpc/c/8bbe9fee5848371d4af101be445303cac8d880c5

cheers
