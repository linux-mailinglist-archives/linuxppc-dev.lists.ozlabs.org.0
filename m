Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CD9697C4C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 13:52:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGydb0Z9gz3f3C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 23:52:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGyRS3p1pz3f3L
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 23:43:16 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PGyRS2ddWz4x8M;
	Wed, 15 Feb 2023 23:43:16 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <20230206021801.105268-1-rmclure@linux.ibm.com>
References: <20230206021801.105268-1-rmclure@linux.ibm.com>
Subject: Re: [PATCH v3 0/5] powerpc: Add KCSAN support
Message-Id: <167646486000.1421441.10070059569986228558.b4-ty@ellerman.id.au>
Date: Wed, 15 Feb 2023 23:41:00 +1100
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 6 Feb 2023 13:17:56 +1100, Rohan McLure wrote:
> Add Kernel Concurrency Sanitiser support for PPC64. Doing so involves
> exclusion of a number of compilation units from instrumentation, as was
> done with KASAN.
> 
> KCSAN uses watchpoints on memory accesses to enforce the semantics of
> the Linux kernel memory model, notifying the user of observed data races
> which have not been declared to be intended in source through the
> data_race() macro, in order to remove false positives.
> 
> [...]

Applied to powerpc/next.

[1/5] powerpc: kcsan: Add exclusions from instrumentation
      https://git.kernel.org/powerpc/c/2fb857bc9f9e106439017ed323f522cc785395bb
[2/5] powerpc: kcsan: Exclude udelay to prevent recursive instrumentation
      https://git.kernel.org/powerpc/c/2a7ce82dc46c591c9244057d89a6591c9639b9b9
[3/5] powerpc: kcsan: Memory barriers semantics
      https://git.kernel.org/powerpc/c/b6e259297a6bffb882d55715284bb5219eefda42
[4/5] powerpc: kcsan: Prevent recursive instrumentation with IRQ save/restores
      https://git.kernel.org/powerpc/c/4f8e09106f6e457c6e9a4ce597fa9ae2bda032c3
[5/5] powerpc: kcsan: Add KCSAN Support
      https://git.kernel.org/powerpc/c/6f0926c00565a91f3bd7ca1aa05db307daed5e0f

cheers
