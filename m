Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE5120F499
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 14:29:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49x3ZM3jrlzDqjW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 22:29:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49x3Sh3fxmzDqCq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 22:24:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49x3Sh2M9Zz9sRW; Tue, 30 Jun 2020 22:24:20 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Harish <harish@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20200625165721.264904-1-harish@linux.ibm.com>
References: <20200625165721.264904-1-harish@linux.ibm.com>
Subject: Re: [PATCH] selftests/powerpc: Fix build issue with output directory
Message-Id: <159351994133.275830.3319471167492983656.b4-ty@ellerman.id.au>
Date: Tue, 30 Jun 2020 22:24:20 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 25 Jun 2020 22:27:21 +0530, Harish wrote:
> We use OUTPUT directory as TMPOUT for checking no-pie option. When
> building powerpc/ from selftests directory, the OUTPUT directory
> eventually points to powerpc/pmu/ebb/ and gets removed when
> checking for -no-pie option in try-run routine, subsequently build
> fails with the following
> 
> $ make -C powerpc
> ...
> ...
> TARGET=ebb; BUILD_TARGET=$OUTPUT/$TARGET; mkdir -p $BUILD_TARGET; make OUTPUT=$BUILD_TARGET -k -C $TARGET all
> make[2]: Entering directory '/home/linux-master/tools/testing/selftests/powerpc/pmu/ebb'
> make[2]: *** No rule to make target 'Makefile'.
> make[2]: Failed to remake makefile 'Makefile'.
> make[2]: *** No rule to make target 'ebb.c', needed by '/home/linux-master/tools/testing/selftests/powerpc/pmu/ebb/reg_access_test'.
> make[2]: *** No rule to make target 'ebb_handler.S', needed by '/home/linux-master/tools/testing/selftests/powerpc/pmu/ebb/reg_access_test'.
> make[2]: *** No rule to make target 'trace.c', needed by '/home/linux-master/tools/testing/selftests/powerpc/pmu/ebb/reg_access_test'.
> make[2]: *** No rule to make target 'busy_loop.S', needed by '/home/linux-master/tools/testing/selftests/powerpc/pmu/ebb/reg_access_test'.
> make[2]: Target 'all' not remade because of errors.
> 
> [...]

Applied to powerpc/fixes.

[1/1] selftests/powerpc: Fix build failure in ebb tests
      https://git.kernel.org/powerpc/c/896066aa0685af3434637998b76218c2045142a8

cheers
