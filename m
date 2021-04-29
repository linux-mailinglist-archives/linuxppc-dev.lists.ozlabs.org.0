Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 020A236EC1B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 16:08:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWHQn0Npkz3fpQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 00:08:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWHJT4gncz3bqy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 00:02:49 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FWHJQ73ngz9tD5; Fri, 30 Apr 2021 00:02:46 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Ravi Bangoria <ravi.bangoria@linux.ibm.com>
In-Reply-To: <20210412112218.128183-1-ravi.bangoria@linux.ibm.com>
References: <20210412112218.128183-1-ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH v3 0/4] powerpc/selftests: Add Power10 2nd DAWR selftests
Message-Id: <161970488433.4033873.12531351983196456423.b4-ty@ellerman.id.au>
Date: Fri, 30 Apr 2021 00:01:24 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, mikey@neuling.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 12 Apr 2021 16:52:14 +0530, Ravi Bangoria wrote:
> Power10 introduced 2nd watchpoint (DAWR). ISA 3.1, Book 3S, Ch 9 -
> 'Debug Facilities' covers the feature in detail. Kernel patches to
> enable the 2nd DAWR are already in[1], including kvm enablement[2].
> These patches adds selftests for 2nd DAWR.
> 
> [1]: https://git.kernel.org/torvalds/c/deb2bd9bcc8428d4b65b6ba640ba8b57c1b20b17
> [2]: https://git.kernel.org/torvalds/c/bd1de1a0e6eff4bde5ceae969673b85b8446fd6a
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc/selftests/ptrace-hwbreak: Add testcases for 2nd DAWR
      https://git.kernel.org/powerpc/c/dae4ff8031b49af4721101d6298fc14cb9c16a4c
[2/4] powerpc/selftests/perf-hwbreak: Coalesce event creation code
      https://git.kernel.org/powerpc/c/c9cb0afb4eaa03801322f48dad4093979ff45e88
[3/4] powerpc/selftests/perf-hwbreak: Add testcases for 2nd DAWR
      https://git.kernel.org/powerpc/c/c65c64cc7bbd273121edf96a7a5a0269038ab454
[4/4] powerpc/selftests: Add selftest to test concurrent perf/ptrace events
      https://git.kernel.org/powerpc/c/290f7d8ce2b1eea5413bb120e0d9d610675b7fba

cheers
