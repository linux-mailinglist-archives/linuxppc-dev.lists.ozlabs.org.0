Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF4E15721F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 10:52:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GLmX19BTzDqPS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 20:52:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GLjt5t34zDqJV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 20:50:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=mRC1qUxj; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48GLjs0k3Cz9s3x;
 Mon, 10 Feb 2020 20:50:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1581328209;
 bh=hRjy8Bnj/PCYJ3V15i1OVOLR2WxzGVo7Md7tk0dSU74=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=mRC1qUxjPxoRQ36c1Xqf/J8dCywbF1SvQN7UjdDZ4YyaBrUs02rgSQUNurlfuG0c8
 TY0VBTMRDIANzQjaXchE8PxBDPQVyqpSzU8ygVJ0lSgaLdIy/wPEoxGhhuZ8qJy3Ex
 mpfo27XdPKrLIm242RTVoxdOyHu0j7jLbpspzt/v+kuslamAXS2KzOWB/8T+KPJ5kl
 TrAyQbULoDeOITtibyoJ5o7hrcfov0okvZt5YyIhL4tDuoPg04ADXRWHwq3G0FrbGD
 T13VoUS4NBplob2m0gtErcO14c06Yu8+/akZYFHp6CibFLot0sDYoWyErQoArhueLy
 K/fq96rNqK8kw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Harish <harish@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RESEND][PATCH] selftests/vm: Fix vm tests build and run
In-Reply-To: <20200210073521.14117-1-harish@linux.ibm.com>
References: <20200210073521.14117-1-harish@linux.ibm.com>
Date: Mon, 10 Feb 2020 20:50:05 +1100
Message-ID: <871rr222lu.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Harish <harish@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Harish <harish@linux.ibm.com> writes:
> A recent change overrides the ARCH env variable and hence runs
> using make fails with the following.
>
> $ make -C vm/
> make: Entering directory '/home/harish/linux/tools/testing/selftests/vm'
> make --no-builtin-rules ARCH=ppc64le -C ../../../.. headers_install
> make[1]: Entering directory '/home/harish/linux'
> Makefile:652: arch/ppc64le/Makefile: No such file or directory
> make[1]: *** No rule to make target 'arch/ppc64le/Makefile'.  Stop.
> make[1]: Leaving directory '/home/harish/linux'
> make: *** [../lib.mk:50: khdr] Error 2
> make: Leaving directory '/home/harish/linux/tools/testing/selftests/vm'
>
> Patch fixes this issue and also handles ppc64/ppc64le archs to enable
> few tests
>
> Signed-off-by: Harish <harish@linux.ibm.com>
> ---
>  tools/testing/selftests/vm/Makefile    | 4 ++--
>  tools/testing/selftests/vm/run_vmtests | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

I don't maintain the vm tests. You need to send the patch to the right
people.

But as Christophe points out I think Sandipan has already done that.

cheers
