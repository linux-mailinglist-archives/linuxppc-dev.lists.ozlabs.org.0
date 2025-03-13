Return-Path: <linuxppc-dev+bounces-6985-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17832A5FDC3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 18:29:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDDxp4X7Yz2xHp;
	Fri, 14 Mar 2025 04:29:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741886942;
	cv=none; b=BdLwrCWfOAZ1eQ8qXrupcjH9XASMzC8Ty5s72bBDIPuteRH08THCwSm600XJO5PIDOBaftrX7wfWwCgZ42m3S5tA9aLMDya8e7c2GLmjhH5lQI2cRwV/D85tUcQHBju+aB/Fm7OF7KHESnWItPaEKuoWsphs6uuEdfoZ/wHEwV7sNypzeL7zZL3dEalZ261BNBQWrN0nWDEAh9I5d4f96hLUlpZNPmQqYFMXtcWAh3HkcO0/a9WjSN9csm+p0U5oYvC8YB4un/finKCkd6SFBgqhMbV0Fczk/OyDWjcYSlb00kgVSG5RF8/N8CrS1lX5mWqPvupmmkDsBhNg7GjFbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741886942; c=relaxed/relaxed;
	bh=68jrK55bbIZ10VhchUt0s2FV/53r+meKmVS3GIUNxdM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZLvtd+73K2icEBjZVNGfQK1P0nIrOwzUGDfPTXeIxTfBp1XDWFOXy1m7vF1gM6bKRjqPIQQGqP1athErqFHyxt4BhpNByzZPvgy8+7qKzSbkJA2j13lx3txCnR42cmQnhyuw9V2H0eEHduV9/JjdQ3X34x7ZjtLc0bgdIV1voOsQjUrgpoOH8ogP70piWEGTXtTR2R3NSTmyRRmAvuGGybdjOY9pgj27Zr3ufEO9OcAWlhlw2Ka0Lj+GzRLB32Xkg4txCyCI12w0vdvK8i0D9fF1yX33Sg+BcjzR3CrfMSJ8AOFp8w3VhQbgvg03Et+CHOIgh+O8+1gIK4G8FL1Rww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WsiJ1vS4; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WsiJ1vS4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDDxn4qrTz2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 04:29:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 088A65C62A2;
	Thu, 13 Mar 2025 17:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78296C4CEDD;
	Thu, 13 Mar 2025 17:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741886938;
	bh=pCKx8h4RdPEXnrliEof7w9TGctCJ+lkyJAvPxZvj8as=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WsiJ1vS4VkmRkEQ91gUkBcXJpHCkjiQdXuKiOQrrIiFFBXTiyzWC1lNxpbasmhUpq
	 3JfyOHYn+nAM5kLaFI7eKKMk0HVf0PYt9MfKkoBJ8D20YQKw1ngGTv9SXVphquEE2h
	 5FlTV4pustJ2ITwpRF1Mfnt55HA7MhFAT/DH8k8bfDg8uSfYhcoZzDsRwQ4++FKCuA
	 ot/lfD8WMiYADiTKuF+3761zflCg4viKvvK9vcUUI5qt7A6AsUxSPP/q9N2rzjlyFr
	 zE/pTffZvM1VqP7YEYZUp20FKgVv5uizsSJhZI1T/0EIjucCggWl2hxTSmb3uw6p4S
	 9WKQ0vOSUIRTA==
From: Kees Cook <kees@kernel.org>
To: Arpitha Raghunandan <98.arpi@gmail.com>,
	David Gow <davidgow@google.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Tamir Duberstein <tamird@gmail.com>
Cc: Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org,
	workflows@vger.kernel.org
Subject: Re: [PATCH v6 0/3] printf: convert self-test to KUnit
Date: Thu, 13 Mar 2025 10:28:50 -0700
Message-Id: <174188692856.3317505.16138391415680640168.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com>
References: <20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 07 Mar 2025 17:08:55 -0500, Tamir Duberstein wrote:
> This is one of just 3 remaining "Test Module" kselftests (the others
> being bitmap and scanf), the rest having been converted to KUnit.
> 
> I tested this using:
> 
> $ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 printf
> 
> [...]

Applied to for-next/move-kunit-tests, thanks!

[1/3] printf: convert self-test to KUnit
      https://git.kernel.org/kees/c/7a79e7daa84e
[2/3] printf: break kunit into test cases
      https://git.kernel.org/kees/c/81a03aa9b88c
[3/3] printf: implicate test line in failure messages
      https://git.kernel.org/kees/c/034bee685fd4

Take care,

-- 
Kees Cook


