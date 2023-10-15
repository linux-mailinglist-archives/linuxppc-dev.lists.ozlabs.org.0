Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 822907C989F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 12:08:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Om4CmqeD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S7bYj2K8Hz3vXN
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 21:08:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Om4CmqeD;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S7bRH1L9Kz30P0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Oct 2023 21:03:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697364203;
	bh=xcox8IJpU3oBHW+ZRMPq+Ub/HXTOJ7r/FHewXZozhkQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Om4CmqeD/lu9fi8PeIB8Y+Js5WkKoDyFOHXexP7u3+l5+fQv179MH9S0m8qVM8FK7
	 7d+UpXUbrkzE/WLoN6DTAz0N//YK3ujIj1Q/EdFLHbWnX+vhUgsFFNZJOWf4CqnIJO
	 YL1lu2Bn7qAPz8q0RUovEhE9Dxx1Qw0oNCJMcJ3KJAIKGYSCkEWa3YX+D5Y/Hl89Uw
	 NzLvvyI3BVm4WfH8Z5gMvO2vinzq/XlHwBDzlWJOITgOtiBFCt8HquaVx0b7e9McyS
	 g2vwfxVEMGBizIMdGpHEKGcs4OdRmi/B5n1MIPW39n7RblRxyOSqk2m4iiY/rzLykI
	 wUZjhnDCKh03w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S7bRG6dtpz4wx5;
	Sun, 15 Oct 2023 21:03:22 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20230921072623.828772-1-mpe@ellerman.id.au>
References: <20230921072623.828772-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] selftests/powerpc: Fix emit_tests to work with run_kselftest.sh
Message-Id: <169736402373.957740.11597798236736150728.b4-ty@ellerman.id.au>
Date: Sun, 15 Oct 2023 21:00:23 +1100
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
Cc: keescook@chromium.org, linux-kselftest@vger.kernel.org, skhan@linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 21 Sep 2023 17:26:10 +1000, Michael Ellerman wrote:
> In order to use run_kselftest.sh the list of tests must be emitted to
> populate kselftest-list.txt.
> 
> The powerpc Makefile is written to use EMIT_TESTS. But support for
> EMIT_TESTS was dropped in commit d4e59a536f50 ("selftests: Use runner.sh
> for emit targets"). Although prior to that commit a548de0fe8e1
> ("selftests: lib.mk: add test execute bit check to EMIT_TESTS") had
> already broken run_kselftest.sh for powerpc due to the executable check
> using the wrong path.
> 
> [...]

Applied to powerpc/fixes.

[1/1] selftests/powerpc: Fix emit_tests to work with run_kselftest.sh
      https://git.kernel.org/powerpc/c/58b33e78a31782ffe25d404d5eba9a45fe636e27

cheers
