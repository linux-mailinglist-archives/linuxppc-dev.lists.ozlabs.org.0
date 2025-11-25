Return-Path: <linuxppc-dev+bounces-14493-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C24DDC8779C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Nov 2025 00:39:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dGK0s3hZ0z2yrZ;
	Wed, 26 Nov 2025 10:39:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764113981;
	cv=none; b=kFma5SH+ms2uniX1igk17m4WygZK0zEYXUc62Rfd9VW0Nk0gISzRcKSq9PfGv4Ojka6KQfLT+pL1OO3dcktK9tRBng+aeKSpI8L5LbA5n/8Brl5z5UTiHdEonhygYc/t8LFTvSGiVzB4b6uLqFhjSh9oRvqRK0I+29nt+PM8Xtsa0Ph96yWBMo+6h109DRP99WMBAgg4VcGspUDsC9GRLrfx0dycf4k2q3LwLPQva46bsTuCVelg7EVuGUxzrpSyMRan9zSPX0SUPSqStqB66Vo8HUs1Z0cuiKAwkfiHbNLlTm463dwb8jlzYFUpVPDNTzoPGdZ/CuyBjVil56uUsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764113981; c=relaxed/relaxed;
	bh=ClFBMXYAL6JxWmmn/i2/+qJdyEpLGoepwkN+oBGG9O0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A+Yh1lUCXXDzMeVdTH6aspJC/AjWt6G9QZ8syF+btTDoTMv/9wNQ/NORf2NoKP0eCn3EorBNukWl6mqljusFBbhGdW8CElF5vmhLmvito8LXIUJC4nIAgV3zLj/d1ZnKvmmz2Rvj/ldv7IgwRU2oMk0cPQTJkrT7ao+J6uTnqFIQUnWQZNlrulFRh/NKImbYs7FHY1MrUdOfZrgj/fXSPBhNrd7T6n3y8TbBkROmDoxa46foaXasGnO5l9eNOjB/kaVr0OX1EgmaCi3hjSPfEH3FA7uMcwJ3gnYzQm4NMnx42GnkF74MojCW+V1/Xnp9lR5N0q8G+6KAnr3QFzQyPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fo9Y0U51; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fo9Y0U51;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dGK0r4RZpz2yr9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Nov 2025 10:39:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 469D34358B;
	Tue, 25 Nov 2025 23:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A87C4CEF1;
	Tue, 25 Nov 2025 23:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764113978;
	bh=ClFBMXYAL6JxWmmn/i2/+qJdyEpLGoepwkN+oBGG9O0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fo9Y0U510eeY9Owy5sGr6cr6Y8LIZtk/qgaHOEkt1FA5sqyU/AwFQzNCrlJHiwCVj
	 pyWyscKsYOUdIL6gEvVCwm1YmMnwXcY6PtaJR+nO2YNNiHhL1hYAzWUdkHjO8Gq9PH
	 v1kqzY3nW8957I1Aa//pCdWq6F/FRcWd6DxFwUcaYDEA5c7P/2ywGEOzM9BU5qJCYL
	 epQKHgTyNxeUTKhkIEEaFYwbUVP+F7ckvkP5uRS41aPB/l3dYirWZ07zSj+mFt59iS
	 Gun7GEjwwRFArz8pAlSDHgjihN6ycWPQwBR97ogkMJo5Sr8CW+HLawe/GQXrC4zg4g
	 CQpMuCTT31hcw==
Date: Tue, 25 Nov 2025 16:39:33 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, kernel test robot <lkp@intel.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [tip:core/rseq 25/39] include/linux/rseq_entry.h:132:3: error:
 invalid operand for instruction
Message-ID: <20251125233933.GA1102709@ax162>
References: <202511250134.i0Jm8d7I-lkp@intel.com>
 <874iqji6n1.ffs@tglx>
 <897c6ba7-e27d-4170-be56-4d0f544bfa42@kernel.org>
 <20251125231834.GA4012217@ax162>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125231834.GA4012217@ax162>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 25, 2025 at 04:18:34PM -0700, Nathan Chancellor wrote:
> That avoids the error for me. I notice that this does not reproduce
> beyond clang-16 for me so I am going to bisect LLVM to see what fixes
> this error.

Oh, it is because of commit e2ffa15b9baa ("kbuild: Disable
CC_HAS_ASM_GOTO_OUTPUT on clang < 17"). Prior to that change, all
supported versions of clang would use the CONFIG_CC_HAS_ASM_GOTO_OUTPUT
blocks in arch/powerpc/include/asm/uaccess.h, whereas now clang-15 and
clang-16 will use the variants without asm goto with outputs.

Cheers,
Nathan

