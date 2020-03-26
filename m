Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97017193EAB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 13:11:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p3k56N3mzDqY0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 23:11:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p3cJ5vGpzDqsR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 23:06:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48p3cH4SZ2z9sRY; Thu, 26 Mar 2020 23:06:23 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 915b7f6f9a5e232c138bb36743a1fdb0fcf2c432
In-Reply-To: <20200211033831.11165-2-gustavold@linux.ibm.com>
To: Gustavo Luiz Duarte <gustavold@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v3 2/3] selftests/powerpc: Add tm-signal-pagefault test
Message-Id: <48p3cH4SZ2z9sRY@ozlabs.org>
Date: Thu, 26 Mar 2020 23:06:23 +1100 (AEDT)
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
Cc: mikey@neuling.org, gromero@linux.ibm.com,
 Gustavo Luiz Duarte <gustavold@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-02-11 at 03:38:30 UTC, Gustavo Luiz Duarte wrote:
> This test triggers a TM Bad Thing by raising a signal in transactional state
> and forcing a pagefault to happen in kernelspace when the kernel signal
> handling code first touches the user signal stack.
> 
> This is inspired by the test tm-signal-context-force-tm but uses userfaultfd to
> make the test deterministic. While this test always triggers the bug in one
> run, I had to execute tm-signal-context-force-tm several times (the test runs
> 5000 times each execution) to trigger the same bug.
> 
> tm-signal-context-force-tm is kept instead of replaced because, while this test
> is more reliable and triggers the same bug, tm-signal-context-force-tm has a
> better coverage, in the sense that by running the test several times it might
> trigger the pagefault and/or be preempted at different places.
> 
> v3: skip test if userfaultfd is unavailable.
> 
> Signed-off-by: Gustavo Luiz Duarte <gustavold@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/915b7f6f9a5e232c138bb36743a1fdb0fcf2c432

cheers
