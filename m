Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1277019AD2C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 15:53:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48snjQ0cZ0zDqJB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 00:53:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48smN52lcqzDr22
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 23:53:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 48smN22mz1z9sTZ; Wed,  1 Apr 2020 23:53:38 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48smN05XGCz9sTb; Wed,  1 Apr 2020 23:53:36 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 9686813f6e9d5568bc045de0be853411e44958c8
In-Reply-To: <20200327095319.2347641-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] selftests/powerpc: Fix try-run when source tree is not
 writable
Message-Id: <48smN05XGCz9sTb@ozlabs.org>
Date: Wed,  1 Apr 2020 23:53:35 +1100 (AEDT)
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
Cc: harish@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-03-27 at 09:53:19 UTC, Michael Ellerman wrote:
> We added a usage of try-run to pmu/ebb/Makefile to detect if the
> toolchain supported the -no-pie option.
> 
> This fails if we build out-of-tree and the source tree is not
> writable, as try-run tries to write its temporary files to the current
> directory. That leads to the -no-pie option being silently dropped,
> which leads to broken executables with some toolchains.
> 
> If we remove the redirect to /dev/null in try-run, we see the error:
> 
>   make[3]: Entering directory '/linux/tools/testing/selftests/powerpc/pmu/ebb'
>   /usr/bin/ld: cannot open output file .54.tmp: Read-only file system
>   collect2: error: ld returned 1 exit status
>   make[3]: Nothing to be done for 'all'.
> 
> And looking with strace we see it's trying to use a file that's in the
> source tree:
> 
>   lstat("/linux/tools/testing/selftests/powerpc/pmu/ebb/.54.tmp", 0x7ffffc0f83c8)
> 
> We can fix it by setting TMPOUT to point to the $(OUTPUT) directory,
> and we can verify with strace it's now trying to write to the output
> directory:
> 
>   lstat("/output/kselftest/powerpc/pmu/ebb/.54.tmp", 0x7fffd1bf6bf8)
> 
> And also see that the -no-pie option is now correctly detected.
> 
> Fixes: 0695f8bca93e ("selftests/powerpc: Handle Makefile for unrecognized option")
> Cc: stable@vger.kernel.org # v5.5+
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Applied to powerpc next.

https://git.kernel.org/powerpc/c/9686813f6e9d5568bc045de0be853411e44958c8

cheers
