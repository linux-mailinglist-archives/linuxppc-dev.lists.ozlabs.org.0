Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7647774552A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:58:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZwG2wQhz3c96
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:58:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZp53GLcz3br5
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:52:45 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZp50Ttjz4wxt;
	Mon,  3 Jul 2023 15:52:45 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <20230510033117.1395895-1-rmclure@linux.ibm.com>
References: <20230510033117.1395895-1-rmclure@linux.ibm.com>
Subject: Re: (subset) [PATCH v2 00/11] powerpc: KCSAN fix warnings and mark accesses
Message-Id: <168836201905.50010.12237655841268386104.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 15:26:59 +1000
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
Cc: gautam@linux.ibm.com, npiggin@gmail.com, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 10 May 2023 13:31:06 +1000, Rohan McLure wrote:
> v1 of this patch series available here:
> Link: https://lore.kernel.org/linuxppc-dev/20230508020120.218494-1-rmclure@linux.ibm.com/
> 
> The KCSAN sanitiser notifies programmers of instances where unmarked
> accesses to shared state has lead to a data race, or when the compiler
> has liberty to reorder an unmarked access and so generate a data race.
> This patch series deals with benign data races, which nonetheless need
> annotation in order to ensure the correctness of the emitted code.
> 
> [...]

Patches 1, 2, 4, 6-9 applied to powerpc/next.

[01/11] powerpc: qspinlock: Mark accesses to qnode lock checks
        https://git.kernel.org/powerpc/c/03d44ee80eac980a869ed3d5637ed85de6fb957f
[02/11] powerpc: qspinlock: Enforce qnode writes prior to publishing to queue
        https://git.kernel.org/powerpc/c/6f3136326ee47ae2dd5dac9306c9b08ccbc7e81e
[04/11] powerpc: Mark [h]ssr_valid accesses in check_return_regs_valid
        https://git.kernel.org/powerpc/c/be286b8637d417a7d7eb25dc3a509c10d0afef66
[06/11] powerpc: powernv: Fix KCSAN datarace warnings on idle_state contention
        https://git.kernel.org/powerpc/c/b0c5b4f1ee3687c57dab65ac0729a4d61967f032
[07/11] powerpc: Annotate accesses to ipi message flags
        https://git.kernel.org/powerpc/c/8608f14b49a0a3f8644a326d32dc1bf7ed78836a
[08/11] powerpc: Mark writes registering ipi to host cpu through kvm and polling
        https://git.kernel.org/powerpc/c/86dacd967b80114c0c6cf0648ed1dcaea8853937
[09/11] powerpc: powernv: Annotate data races in opal events
        https://git.kernel.org/powerpc/c/331e2cad6d168ac5ccb25ae34bdc305b8b731bc0

cheers
