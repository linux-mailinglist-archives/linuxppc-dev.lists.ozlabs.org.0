Return-Path: <linuxppc-dev+bounces-3381-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4EF9D03B1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:27:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrqjF0MnKz3bpn;
	Sun, 17 Nov 2024 23:25:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846336;
	cv=none; b=HnTwEPL+pCh5uQ6N7Xm39JUNdJNcEjJuaTf4/VtfQd3H+0YQTaL3xFpMkLLjE1RqxIir8TvKsbOZjsGx2eBXCN490iXA/n8yX5V5PLPLJq3ofI06Gu45HotHmw4SEOt2J7maL/OCxyHb7wtNvHrwfvrLZRhBwBmGLkSarhtXk0pojpWgjlX9ViIylwwcDMeIKBMbaY1pSM3ZuY1dPgyZ3q5xuAfVhAqRH+hzrh5194FvZaCwujw41GbSZKrnUwdfOAwapntKbtNsxC5yXKLbfo9CFfiAH2fi+K2sEDRHaPowaBq5+aGtpbXZ/mMYJlXqrZQt9ioI0526hgHyIVAzvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846336; c=relaxed/relaxed;
	bh=ivoElLl6v01dXn3j88D2JzVuA8zDCUIbPPKgg72fH4U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CTabwHvmjpCvFVXbTb9COwFH0PBG9K/aL1Gaq65WI7MrhK+eunEXapoeClqZHeTNKHUgAnsF/sOGbk/OMDZElAUGZEG7w4FIYQO1oAoAsU740y8YbYU7lT8PHTwjaQQktn5u5Zsd+4ZFB6CSh3tO5oaLcqJlkGIq8/RzKB4bZzPQ2Soz7PeFpqVfaDuuz8Eeb6lW4UX+1Zk2RaBOUyftb8LpaX05A7dJ5iRHuDkLmsRb7oQLxPHGPoOfvnUdIN7+XfakhBq2G0ev+lUaqd0g+FN8A8K3sWz3etEwMF5GQeXMH+OFai3Uh9yuuRncSvFElze8F5+m8y6i7fkrGZHeCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jddM0Hic; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jddM0Hic;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrqjC1cw1z3bnB
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846332;
	bh=ivoElLl6v01dXn3j88D2JzVuA8zDCUIbPPKgg72fH4U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jddM0HicZ6glVWTVoexDcRGDtEPZfSdXC7PSUXrPxmgesfCZ2mwmnvfWGKtSBOGVE
	 iXieeSBAr/q0k6Bz1u6q7Sl+d815QqpV9yXMhzWX4UlRIVOF51A3kQHz44ZAfFWhC6
	 866nTk/LG/jkUUfdGNTEZbPe3tgAYV4aLpqY5YvZA2vyDy3xhK1AOkL1xpYhe998dx
	 hi5LceFRxk8yPcizRFgj9lgIMC9zNr8Jlc47ExTwxayHgrCHKVLsvYPWymHw6djMqk
	 /Zqc9VP5nVkoBikYSzX6kfE4pqaTZczuq+VWIoMn/vEEI+B3PP9V1nt0SeTZZ7kfoX
	 oZjVswpgJPv/A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqj76vXHz4xfV;
	Sun, 17 Nov 2024 23:25:31 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nathan Chancellor <nathan@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org
In-Reply-To: <20241030-powerpc-vdso-drop-stackp-flags-clang-v1-1-d95e7376d29c@kernel.org>
References: <20241030-powerpc-vdso-drop-stackp-flags-clang-v1-1-d95e7376d29c@kernel.org>
Subject: Re: [PATCH] powerpc/vdso: Drop -mstack-protector-guard flags in 32-bit files with clang
Message-Id: <173184539742.890800.7357374459961481947.b4-ty@ellerman.id.au>
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

On Wed, 30 Oct 2024 11:41:37 -0700, Nathan Chancellor wrote:
> Under certain conditions, the 64-bit '-mstack-protector-guard' flags may
> end up in the 32-bit vDSO flags, resulting in build failures due to the
> structure of clang's argument parsing of the stack protector options,
> which validates the arguments of the stack protector guard flags
> unconditionally in the frontend, choking on the 64-bit values when
> targeting 32-bit:
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/vdso: Drop -mstack-protector-guard flags in 32-bit files with clang
      https://git.kernel.org/powerpc/c/d677ce521334d8f1f327cafc8b1b7854b0833158

cheers

