Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B96BE5850CF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:22:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvSql5Dqgz3hKL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:22:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSk52lLpz3bb2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:17:49 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSk522s8z4xG5;
	Fri, 29 Jul 2022 23:17:49 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Rashmica Gupta <rashmica@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220617043935.428083-1-rashmica@linux.ibm.com>
References: <20220617043935.428083-1-rashmica@linux.ibm.com>
Subject: Re: [PATCH] selftests/powerpc: Fix matrix multiply assist test
Message-Id: <165909978606.253830.18356182209193654780.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:03:06 +1000
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
Cc: alistair@popple.id.au, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 17 Jun 2022 14:39:35 +1000, Rashmica Gupta wrote:
> The ISA states: "when ACC[i] contains defined data, the contents of VSRs
> 4×i to 4×i+3 are undefined until either a VSX Move From ACC instruction
> is used to copy the contents of ACC[i] to VSRs 4×i to 4×i+3 or some other
> instruction directly writes to one of these VSRs." We aren't doing this.
> 
> This test only works on Power10 because the hardware implementation
> happens to map ACC0 to VSRs 0-3, but will fail on any other implementation
> that doesn't do this. So add xxmfacc between writing to the accumulator
> and accessing the VSRs.
> 
> [...]

Applied to powerpc/next.

[1/1] selftests/powerpc: Fix matrix multiply assist test
      https://git.kernel.org/powerpc/c/cd1e64935f79e31d666172c52c951ca97152b783

cheers
