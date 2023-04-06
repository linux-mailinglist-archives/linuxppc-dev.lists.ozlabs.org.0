Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C766D8C83
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 03:11:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsNkJ6TCgz3f6R
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 11:11:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsNjn6cQbz3cLx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 11:11:09 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PsNjn1Z4Pz4xDt;
	Thu,  6 Apr 2023 11:11:09 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Benjamin Gray <bgray@linux.ibm.com>
In-Reply-To: <20230228000709.124727-1-bgray@linux.ibm.com>
References: <20230228000709.124727-1-bgray@linux.ibm.com>
Subject: Re: [PATCH 0/3] Clean up PowerPC selftest stderr output
Message-Id: <168074339917.3678997.16044153456695670396.b4-ty@ellerman.id.au>
Date: Thu, 06 Apr 2023 11:09:59 +1000
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

On Tue, 28 Feb 2023 11:07:06 +1100, Benjamin Gray wrote:
> There are several messages being logged to stderr when building the PowerPC
> selftests:
> 
>   $ make -j$(nproc) O=build -C tools/testing/selftests \
>     INSTALL_PATH="$PWD"/out/selftests TARGETS=powerpc install > /dev/null
> 
>   Makefile:50: warning: overriding recipe for target 'clean'
>   ../../lib.mk:124: warning: ignoring old recipe for target 'clean'
>   1+0 records in
>   1+0 records out
>   65536 bytes (66 kB, 64 KiB) copied, 7.71e-05 s, 850 MB/s
>   Makefile:50: warning: overriding recipe for target 'clean'
>   ../../lib.mk:124: warning: ignoring old recipe for target 'clean'
>   make[2]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
>   ...
>   make[2]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
>   Makefile:50: warning: overriding recipe for target 'clean'
>   ../../lib.mk:124: warning: ignoring old recipe for target 'clean'
>   make[2]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
>   ...
>   make[2]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
> 
> [...]

Applied to powerpc/next.

[1/3] selftests/powerpc: Use CLEAN macro to fix make warning
      https://git.kernel.org/powerpc/c/69608683a65be5322ef44091eaeb9890472b2eea
[2/3] selftests/powerpc: Pass make context to children
      https://git.kernel.org/powerpc/c/4ecd0868c5138238dec8a1549bb6ff8e5b48208b
[3/3] selftests/powerpc: Make dd output quiet
      https://git.kernel.org/powerpc/c/d3cf1662b665f20444a08bff52b6daae912e0d1d

cheers
