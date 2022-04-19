Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D59507BEA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 23:28:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjcNL1B48z3bdF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 07:28:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k3qUvGot;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=nathan@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=k3qUvGot; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjcMg5tMfz2xlF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Apr 2022 07:27:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BE25DB81A62;
 Tue, 19 Apr 2022 21:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5954C385A7;
 Tue, 19 Apr 2022 21:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650403641;
 bh=J4l6nOhwaGP9gwFmqdP8jxouA835/1GgWpS/8DKzJkg=;
 h=Date:From:To:Cc:Subject:From;
 b=k3qUvGotzVuqDlNl1O1CY7Rh+NP1XAKEDxdjSAQA6nUfeDRU1GNpC17/vPuW6jM1J
 W3H+W13+Ct2s+3btCEWGcsDnhdq5IN5tykWlsNTSWR/Vlfg36a9Gbrc4jra+sBL+wE
 TDJ3vN2A9zpm4AFLu8XDlubcD80FEXqL80xgmQpXJyF5ME5O2KusPi7conjaz6qJHr
 aiBaKhYDwdJNjz5b9fYa0Zb6S0usS655i2XDVAB5PpD9yk7OVxqjjhNwVRvGQUAMWm
 W7WJjT55au+sgRubuSHMMyfHDupZ1U2/7Gk0lSuwKIAog9fuMSTF2zf8QqWitn1zMx
 I/drdBGddnN5A==
Date: Tue, 19 Apr 2022 14:27:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Apply d799769188529abc6cbf035a10087a51f7832b6b to 5.17 and 5.15?
Message-ID: <Yl8pNxSGUgeHZ1FT@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Greg, Sasha, and Michael,

Commit d79976918852 ("powerpc/64: Add UADDR64 relocation support") fixes
a boot failure with CONFIG_RELOCATABLE=y kernels linked with recent
versions of ld.lld [1]. Additionally, it resolves a separate boot
failure that Paul Menzel reported [2] with ld.lld 13.0.0. Is this a
reasonable backport for 5.17 and 5.15? It applies cleanly, resolves both
problems, and does not appear to cause any other issues in my testing
for both trees but I was curious what Michael's opinion was, as I am far
from a PowerPC expert.

This change does apply cleanly to 5.10 (I did not try earlier branches)
but there are other changes needed for ld.lld to link CONFIG_RELOCATABLE
kernels in that branch so to avoid any regressions, I think it is safe
to just focus on 5.15 and 5.17.

Paul, it would not hurt to confirm the results of my testing with your
setup, just to make sure I did not miss anything :)

[1]: https://github.com/ClangBuiltLinux/linux/issues/1581
[2]: https://lore.kernel.org/Yg2h2Q2vXFkkLGTh@dev-arch.archlinux-ax161/

Cheers,
Nathan
