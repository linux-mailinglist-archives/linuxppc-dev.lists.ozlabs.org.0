Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5C33F9A16
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 15:29:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx0sn1nHTz3fQ1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 23:28:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx0kd0s3xz2ynj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 23:22:33 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gx0kb67Ftz9sWq;
 Fri, 27 Aug 2021 23:22:31 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Jordan Niethe <jniethe5@gmail.com>
In-Reply-To: <20210729041317.366612-1-jniethe5@gmail.com>
References: <20210729041317.366612-1-jniethe5@gmail.com>
Subject: Re: [PATCH v2 1/2] selftests/powerpc: Add missing clobbered register
 to to ptrace TM tests
Message-Id: <163007016833.52768.1911021541749287636.b4-ty@ellerman.id.au>
Date: Fri, 27 Aug 2021 23:16:08 +1000
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
Cc: mikey@neuling.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 29 Jul 2021 14:13:16 +1000, Jordan Niethe wrote:
> ISA v3.1 removes TM but includes a synthetic implementation for
> backwards compatibility.  With this implementation,  the tests
> ptrace-tm-spd-gpr and ptrace-tm-gpr should never be able to make any
> forward progress and eventually should be killed by the timeout.
> Instead on a P10 running in P9 mode, ptrace_tm_gpr fails like so:
> 
> test: ptrace_tm_gpr
> tags: git_version:unknown
> Starting the child
> ...
> ...
> GPR[27]: 1 Expected: 2
> GPR[28]: 1 Expected: 2
> GPR[29]: 1 Expected: 2
> GPR[30]: 1 Expected: 2
> GPR[31]: 1 Expected: 2
> [FAIL] Test FAILED on line 98
> failure: ptrace_tm_gpr
> selftests:  ptrace-tm-gpr [FAIL]
> 
> [...]

Applied to powerpc/next.

[1/2] selftests/powerpc: Add missing clobbered register to to ptrace TM tests
      https://git.kernel.org/powerpc/c/c95278a0534449efc64ac8169382bce217963be2
[2/2] selftests: Skip TM tests on synthetic TM implementations
      https://git.kernel.org/powerpc/c/e42edf9b9d126bb1c743f2e7984877ba27f09fe7

cheers
