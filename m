Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0F06EF408
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 14:10:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5yPR0vBMz3fWh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 22:10:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5yMP32Kfz3cJq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 22:08:49 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q5yMJ2S2fz4xD5;
	Wed, 26 Apr 2023 22:08:44 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Benjamin Gray <bgray@linux.ibm.com>
In-Reply-To: <20230406043320.125138-1-bgray@linux.ibm.com>
References: <20230406043320.125138-1-bgray@linux.ibm.com>
Subject: Re: [PATCH v2 0/7] Update DSCR tests
Message-Id: <168251050525.3973805.7399008940491158034.b4-ty@ellerman.id.au>
Date: Wed, 26 Apr 2023 22:01:45 +1000
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

On Thu, 06 Apr 2023 14:33:13 +1000, Benjamin Gray wrote:
> The randomness based DSCR tests currently have a low probability of doing
> any writes to the DSCR, making them inefficient in uncovering bugs.
> 
> This series adds lockstep variants to these RNG tests, to ensure the happy
> path is always tested, and improves the randomness and size of the RNG
> tests.
> 
> [...]

Applied to powerpc/next.

[1/7] selftests/powerpc/dscr: Correct typos
      https://git.kernel.org/powerpc/c/15f0c2601e141e3c01c8dc3368b81181bc1c9228
[2/7] selftests/powerpc: Move bind_to_cpu() to utils.h
      https://git.kernel.org/powerpc/c/c97b2fc6627e1c26a3a84633e135322918a1e592
[3/7] selftests/powerpc: Allow bind_to_cpu() to automatically pick CPU
      https://git.kernel.org/powerpc/c/6ff4dc25483f3f49d1db48af28d4c485fc77bd21
[4/7] selftests/powerpc/dscr: Add lockstep test cases to DSCR explicit tests
      https://git.kernel.org/powerpc/c/fda8158870063b99b88a0904bbb95188973b4297
[5/7] selftests/powerpc/dscr: Improve DSCR explicit random test case
      https://git.kernel.org/powerpc/c/3067b89ab62305c54ec15b00a2c4dbaf64809c59
[6/7] selftests/powerpc/dscr: Speed up DSCR sysfs tests
      https://git.kernel.org/powerpc/c/c14a9d0a79d4fb83c4e9e8cadc5cb094f41d01d0
[7/7] selftests/powerpc/dscr: Restore timeout to DSCR selftests
      https://git.kernel.org/powerpc/c/ae7312c09014fceb782a92cfb934e973f08b338f

cheers
