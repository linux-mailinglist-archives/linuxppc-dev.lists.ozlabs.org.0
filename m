Return-Path: <linuxppc-dev+bounces-3373-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 174719D0398
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:26:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xrqj74cQnz3bk0;
	Sun, 17 Nov 2024 23:25:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846331;
	cv=none; b=lo7XnjwYT0m+ksi6Pn0Btoshc6c89WdbeLvUU9mxQq/dksTRq7KGbF0oZrAxNXfISbSA8uOyO3HdDhrmgUCbdIAVgKGxnI+Tmi8dvX9Rm/kN+TqVUcI/DmXtLAQRg4OLq/SRkAnMBCMPQ4t8dMOXRanhI61u+OQFGGy7rioIomJyxYdBz2eEa2mBeRscWCEadP4jveIgnTs5syANqyOrFw4e5bpQDvY83rs5VbDJ801LKzIgf8ahBZmIFSaa0zN+U8e9u5+MD+p6bvT4tUcrIo4A5RtZtT2rKVfwOa2i3flv7TRpIwSACgCYjV2VvzfUwGiSFMWLGTkRQaSEoJTkog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846331; c=relaxed/relaxed;
	bh=uRzVzixg7Mdrf8EHXUktOJebAXNU4c5koSYvpP+Je94=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Kcxxh5OKsJNZboi31SAB4hnrjCGRo/l9uzmAXSTBwSF/d8vEiT91ZuU9I7hnfAoVpH1GlvWjuklE/+rLlrHwDQITgjWKUXHLioxlsCbFPn2y5icf3OpUzR75VlQjAibK74qX7UAOuePYmRGxxeddaaXFWwqUyNXnNrTBK8eYDBC57HfK2MztlLuEKQOL4u32PPt3K3wqvSRivU93SpSkBCApXqfmwSDoMPP2tcBWXk+0uAsvmqqCfVy+w22CZRWgHmdwapAC9SeYHGj+wfIWJnmCaelydNhaIJcpLjBN3S0FcA756qE6qbAUFu9mf7Eg04KWxMhyTjdx3ugGiIIj1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=q2vt/Rw/; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=q2vt/Rw/;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xrqj707n8z3bjk
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846328;
	bh=uRzVzixg7Mdrf8EHXUktOJebAXNU4c5koSYvpP+Je94=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=q2vt/Rw/H042E51ndsAlxlFUiH2elh52Ixzt3p4JWijdzEuUa4aiC0hS9q2RjCCVE
	 n2LNOdSzJ/B81JVUxH82moV88IHik4ksZPzTJgqjIeUYz7HG9lyMJt0om1gaMhEnVp
	 RctwJwdgt+XyRKidEroGn1RUBEesbw+PloaqiEqdLmdZMAfV5DGPKDEFqygOkVgOOu
	 y5aqKfNvxqSJBgFojBwovxXy1FWaJlkJ2vJcA3lzgHx88mw/tHwZWzxRExJucO5c05
	 JHq7fHFbHW5/UKFlINQpBHimUVBuwxpARRrK9sEeXZgb6BC8wIQp6wnbXhcQCSxSyg
	 9CstAHYe4Ov3w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqj36rNrz4xfH;
	Sun, 17 Nov 2024 23:25:27 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-kselftest@vger.kernel.org
In-Reply-To: <20241106130453.1741013-1-mpe@ellerman.id.au>
References: <20241106130453.1741013-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/5] selftests/powerpc: Lower run time of count_stcx_fail test
Message-Id: <173184539745.890800.18144294267684223790.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 23:09:57 +1100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 07 Nov 2024 00:04:49 +1100, Michael Ellerman wrote:
> The count_stcx_fail test runs for close to or just over 2 minutes, which
> means it sometimes times out.
> 
> That's overkill for a test that just demonstrates some PMU counters
> are working. Drop the 64 billion instruction case, to lower the runtime
> to ~30s.
> 
> [...]

Applied to powerpc/next.

[1/5] selftests/powerpc: Lower run time of count_stcx_fail test
      https://git.kernel.org/powerpc/c/3b9bde403aafa55dcbe7dc250b95af917610f139
[2/5] selftests/powerpc: Give all tests 2 minutes timeout
      https://git.kernel.org/powerpc/c/5543d595954eefb3a6faa18a6dc7b1b3d6022052
[3/5] selftests/powerpc: Fix 32-bit BE build errors on Ubuntu 24.04
      https://git.kernel.org/powerpc/c/d5f578f90a34d85f1cabd4c27af1b2d9fbffe64b
[4/5] selftests/powerpc: Return errors from all tests
      https://git.kernel.org/powerpc/c/c6a75555b4b2643365a007b7162a670d69aa28fe
[5/5] selftests/powerpc: Detect taint change in mitigation patching test
      https://git.kernel.org/powerpc/c/a8a54a65cac4f8202df36f925b6746328802d05f

cheers

