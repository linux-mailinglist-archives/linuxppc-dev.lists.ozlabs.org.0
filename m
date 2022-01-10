Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2A0488E83
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 02:57:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXH5d0Tc8z3dbv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 12:57:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXH2H3RVnz2yYl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 12:54:47 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JXH2H2MyJz4xmx;
 Mon, 10 Jan 2022 12:54:47 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Guo Ren <guoren@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211228064730.2882351-1-guoren@kernel.org>
References: <20211228064730.2882351-1-guoren@kernel.org>
Subject: Re: (subset) [PATCH V3 0/8] sched: Remove unused TASK_SIZE_OF for all
 archs
Message-Id: <164177945855.1604045.2872871817685076139.b4-ty@ellerman.id.au>
Date: Mon, 10 Jan 2022 12:50:58 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 28 Dec 2021 14:47:21 +0800, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> This macro isn't used in Linux, now. Delete in include/linux/sched.h
> and arch's include/asm. This would confuse people who are
> implementing the COMPAT feature for architecture.
> 
> Changes in v3:
>  - Fixup Documentation/process/submitting-patches.rst, add sender
>    Signed-off-by.
> 
> [...]

Applied to powerpc/next.

[4/8] sched: powerpc: Remove unused TASK_SIZE_OF
      https://git.kernel.org/powerpc/c/08035a67f35a8765cac39bb12e56c61ee880227a

cheers
