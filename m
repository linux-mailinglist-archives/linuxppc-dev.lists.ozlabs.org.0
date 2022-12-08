Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C6E647045
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 13:59:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSZ3m69yHz3g8c
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 23:59:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSYs26cCWz3cMR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 23:49:58 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYs25VsDz4xmp;
	Thu,  8 Dec 2022 23:49:58 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <cover.1669096083.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1669096083.git.naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/3] selftests/powerpc: ptrace/perf_hwbreak test fixes
Message-Id: <167050316095.1457988.8784412287959529979.b4-ty@ellerman.id.au>
Date: Thu, 08 Dec 2022 23:39:20 +1100
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
Cc: Rohan Deshpande <rohan_d@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 22 Nov 2022 12:10:51 +0530, Naveen N. Rao wrote:
> This series fixes two issues with the perf_hwbreak test:
> - Test fails on systems with large number of cpus due to hitting the
>   resource limit for maximum number of open file descriptors.
> - Test fails on systems running with lower SMT levels since it assumes
>   all cpus are online.
> 
> Fix those issues. The first patch is a small cleanup to aid subsequent
> fixes.
> 
> [...]

Applied to powerpc/next.

[1/3] selftests/powerpc: Move perror closer to its use
      https://git.kernel.org/powerpc/c/71ae6305ad41cfd1ac5aa91d356e71c7a537df2e
[2/3] selftests/powerpc: Bump up rlimit for perf-hwbreak test
      https://git.kernel.org/powerpc/c/616ad3f4aac287c48b66c92cb777395b4465ed4f
[3/3] selftests/powerpc: Account for offline cpus in perf-hwbreak test
      https://git.kernel.org/powerpc/c/260095926d3956071c6699a28824c3f0fa7cd97a

cheers
