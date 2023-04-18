Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 398216E6E6A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 23:39:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1HPB18lzz3fTy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 07:39:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SsV6C3Gi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SsV6C3Gi;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1HNM6XnXz3f61
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 07:38:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9F3516396D;
	Tue, 18 Apr 2023 21:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF6FC433EF;
	Tue, 18 Apr 2023 21:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681853905;
	bh=8y2e9kv+5/6L0m6GFF2Jgn9ApZtit/ZIKZ7FL8RXKgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SsV6C3GiEJWwXRZErvjXUuqGAUYpgpzUOMe+zavOQJgfGagu23c+CxuHDCSH1+RYR
	 IIzk5Myi9+9b5NSLqJWdQwJ5hJ6koxwNCwJWIrlAyd4Uk0VdPAV2O7eahnlJldlgwm
	 6U3fU1uzXKPEJBRLYfrbxwMU/IUzGuWbuzhiE4uCWhLT0MPoLCb37KO3A0H8CooNwk
	 i0Vcetpc//Xdag4h9NHPuY5jv1T3r09zcneLQAAlO6RHQx2jeaNiPkOikk/e1jtMgh
	 8m2SlrI6Q9n87mOUh7Mll+d86Mk5wuXV1aeXiYH6ASWWyX2croUMMrU+qEDSrad4FA
	 IQayVyNw5i01Q==
Date: Tue, 18 Apr 2023 14:38:22 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: ndesaulniers@google.com
Subject: Re: [PATCH v2 0/2] start_kernel: omit stack canary
Message-ID: <20230418213822.xauewkuus25k2aj6@treble>
References: <20230412-no_stackp-v2-0-116f9fe4bbe7@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230412-no_stackp-v2-0-116f9fe4bbe7@google.com>
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
Cc: x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Borislav Petkov \(AMD\)" <bp@alien8.de>, Miguel Ojeda <ojeda@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 17, 2023 at 03:00:04PM -0700, ndesaulniers@google.com wrote:
> ---
> Changes in v2:
> - Rebase to avoid conflicts with Josh's changes.
> - Fix comment style as per Peter.
> - Pick up tags.
> - Link to v1: https://lore.kernel.org/r/20230412-no_stackp-v1-0-46a69b507a4b@google.com
> (sorry for the spam with v2, mrincon is helping me get kinks worked out
> with b4 and our corporate mailer)

Acked-by: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
Josh
