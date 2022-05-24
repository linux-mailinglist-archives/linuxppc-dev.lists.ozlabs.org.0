Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8602C5328D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:23:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6sJD3Q54z3gBN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:23:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6s7p2Q3Dz3cd9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:15:50 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s7p1QD4z4yT5;
 Tue, 24 May 2022 21:15:50 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20220322045638.10443-1-maddy@linux.ibm.com>
References: <20220322045638.10443-1-maddy@linux.ibm.com>
Subject: Re: [PATCH] selftest/powerpc/pmu/ebb: remove fixed_instruction.S
Message-Id: <165339059080.1718562.62560284365315376.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 21:09:50 +1000
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, shuah@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 22 Mar 2022 10:26:38 +0530, Madhavan Srinivasan wrote:
> Commit 3752e453f6ba ("selftests/powerpc: Add tests of PMU EBBs") added
> selftest testcases to verify EBB interface. instruction_count_test.c
> testcase needs a fixed loop function to count overhead. Instead of
> using the thirty_two_instruction_loop() in fixed_instruction_loop.S
> in ebb folder, file is linked with thirty_two_instruction_loop() in
> loop.S from top folder. Since fixed_instruction_loop.S not used, patch
> removes the file.
> 
> [...]

Applied to powerpc/next.

[1/1] selftest/powerpc/pmu/ebb: remove fixed_instruction.S
      https://git.kernel.org/powerpc/c/079e5fd3a1e41c186c1bc4166d409d22e70729bf

cheers
