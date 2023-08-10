Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFD7776FF0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 08:04:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLxGH4xb9z3dF7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 16:04:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLxFH0GXfz2ygx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Aug 2023 16:03:47 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RLxFG4GHgz4wxK;
	Thu, 10 Aug 2023 16:03:46 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Benjamin Gray <bgray@linux.ibm.com>
In-Reply-To: <20230725005841.28854-1-bgray@linux.ibm.com>
References: <20230725005841.28854-1-bgray@linux.ibm.com>
Subject: Re: (subset) [PATCH v1 0/4] Improve ptrace selftest usability
Message-Id: <169164734544.180689.15632219650808795120.b4-ty@ellerman.id.au>
Date: Thu, 10 Aug 2023 16:02:25 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 25 Jul 2023 10:58:37 +1000, Benjamin Gray wrote:
> While trying to test changes to the breakpoint implementation in the kernel, I
> tried to run the ptrace tests and met many unexplained skips and failures.
> 
> This series addresses the pain points of trying to run these tests and learn
> what they are doing.
> 
> Benjamin Gray (4):
>   Documentation/powerpc: Fix ptrace request names
>   selftests/powerpc/ptrace: Explain why tests are skipped
>   selftests/powerpc/ptrace: Fix typo in pid_max search error
>   selftests/powerpc/ptrace: Declare test temporary variables as volatile
> 
> [...]

Applied to powerpc/next.

[2/4] selftests/powerpc/ptrace: Explain why tests are skipped
      https://git.kernel.org/powerpc/c/68877ff20a7f4f773069784cfe4f6fe9c7b9a841
[3/4] selftests/powerpc/ptrace: Fix typo in pid_max search error
      https://git.kernel.org/powerpc/c/fc6732a8556c1099b89f4777a96bd6a1ae5a4378
[4/4] selftests/powerpc/ptrace: Declare test temporary variables as volatile
      https://git.kernel.org/powerpc/c/c3062ede9927053754ba27b280afe00b9b31b37a

cheers
