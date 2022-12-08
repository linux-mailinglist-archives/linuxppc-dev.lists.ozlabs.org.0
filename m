Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DFF647051
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 14:00:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSZ5T6xSFz3gLV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 00:00:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSYs433M0z3cPg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 23:50:00 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYs41wyWz4xvq;
	Thu,  8 Dec 2022 23:50:00 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20221126095932.1234527-1-npiggin@gmail.com>
References: <20221126095932.1234527-1-npiggin@gmail.com>
Subject: Re: (subset) [PATCH v3 00/17] powerpc: alternate queued spinlock implementation
Message-Id: <167050317695.1457988.13193354925206119446.b4-ty@ellerman.id.au>
Date: Thu, 08 Dec 2022 23:39:36 +1100
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
Cc: Jordan Niethe <jniethe5@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 26 Nov 2022 19:59:15 +1000, Nicholas Piggin wrote:
> This replaces the generic queued spinlock code (like s390 does) with
> our own implementation. There is an extra shim patch 1a to get the
> series to apply.
> 
> Generic PV qspinlock code is causing latency / starvation regressions on
> large systems that are resulting in hard lockups reported (mostly in
> pathoogical cases).  The generic qspinlock code has a number of issues
> important for powerpc hardware and hypervisors that aren't easily solved
> without changing code that would impact other architectures. Follow
> s390's lead and implement our own for now.
> 
> [...]

Applied to powerpc/next.

[00/17] powerpc/qspinlock: powerpc qspinlock implementation
        https://git.kernel.org/powerpc/c/9f61521c7a284e799050cd2adacc9a611bd2b491
[01/17] powerpc/qspinlock: add mcs queueing for contended waiters
        https://git.kernel.org/powerpc/c/84990b169557428c318df87b7836cd15f65b62dc
[02/17] powerpc/qspinlock: use a half-word store to unlock to avoid larx/stcx.
        https://git.kernel.org/powerpc/c/4c93c2e4b9e8988511c06b9c042f23d4b8f593ad
[03/17] powerpc/qspinlock: convert atomic operations to assembly
        https://git.kernel.org/powerpc/c/b3a73b7db2b6cb3b2e5bfda5518a0e92230ef673
[04/17] powerpc/qspinlock: allow new waiters to steal the lock before queueing
        https://git.kernel.org/powerpc/c/6aa42f883c438ea132a28801bef3f86f3883d14c
[05/17] powerpc/qspinlock: theft prevention to control latency
        https://git.kernel.org/powerpc/c/0944534ef4d5cf39c8133575524be0be3337dd62
[06/17] powerpc/qspinlock: store owner CPU in lock word
        https://git.kernel.org/powerpc/c/e1a31e7fd7130628cfd229253da2b4630e7a809c
[07/17] powerpc/qspinlock: paravirt yield to lock owner
        https://git.kernel.org/powerpc/c/085f03311bcede99550e08a1f7cad41bf758b460
[08/17] powerpc/qspinlock: implement option to yield to previous node
        https://git.kernel.org/powerpc/c/bd48287b2cf4cd6e95576db3a94fd2a7cdf9832d
[09/17] powerpc/qspinlock: allow stealing when head of queue yields
        https://git.kernel.org/powerpc/c/b4c3cdc1a698a2f6168768d0bed4bf062723722e
[10/17] powerpc/qspinlock: allow propagation of yield CPU down the queue
        https://git.kernel.org/powerpc/c/28db61e207ea3890d286cff3141c1ce67346074d
[11/17] powerpc/qspinlock: add ability to prod new queue head CPU
        https://git.kernel.org/powerpc/c/be742c573fdafcfa1752642ca1c7aaf08c258128
[12/17] powerpc/qspinlock: allow lock stealing in trylock and lock fastpath
        https://git.kernel.org/powerpc/c/f61ab43cc1a6146d6eef7e0713a452c3677ad13e
[13/17] powerpc/qspinlock: use spin_begin/end API
        https://git.kernel.org/powerpc/c/71c235027ce7940434acd3f553602ad8b5d36469
[14/17] powerpc/qspinlock: reduce remote node steal spins
        https://git.kernel.org/powerpc/c/cc79701114154efe79663ba47d9e51aad2ed3c78
[15/17] powerpc/qspinlock: allow indefinite spinning on a preempted owner
        https://git.kernel.org/powerpc/c/39dfc73596b48bb50cf7e4f3f54e38427dda5b4e
[16/17] powerpc/qspinlock: provide accounting and options for sleepy locks
        https://git.kernel.org/powerpc/c/12b459a5ebf3308e718bc1dd48acb7c4cf7f1a75
[17/17] powerpc/qspinlock: add compile-time tuning adjustments
        https://git.kernel.org/powerpc/c/0b2199841a7952d01a717b465df028b40b2cf3e9

cheers
