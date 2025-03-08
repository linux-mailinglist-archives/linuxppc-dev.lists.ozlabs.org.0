Return-Path: <linuxppc-dev+bounces-6820-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1C3A57858
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Mar 2025 05:49:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8rL61jXzz300g;
	Sat,  8 Mar 2025 15:49:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741409390;
	cv=none; b=b7cnZ8s4DsSiVd49vIMLGsEAEG5yV9nJPfinFWqkOL84pn+0E3t2V8WO4jQU10yUGVpRXcmCZ1J+EFopP9Bn5C2WQHC7M6pxR4QRiq8F8lcMwRj3E54ReYipGtm1c4aotDBLZSSG5BcJmGxpuZezkUJl0MlFNZ1zy55UIZSDR3A89Ey05ws4c/qeydDuGADUsSS6rdm2w5i7MavT+rBYMjDABKrwkQRyeEhfKqKZ22UjSw3FVnZ+KutObr5txxDTIC4ML+yHACfX42QowkzTqSxHOIyQ2+MK3zYkmd9dtgiJ+giRPtsClb3EvZHdhnmrD3I6J87szjtDJqkp0e0nyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741409390; c=relaxed/relaxed;
	bh=FQmsKTheqvbMZtpOl6tdGZBb/JeoeK/jlnVGDU2Pq5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZ0rZSKXGqyr3AjBiTbibzIwOYLkw0uKrYmAEyOt2EYNS7bBci+XEVVVsicG+Lk282lyYSdueD6QU9GTrL23FSpoB/0Vz4Z4RrDmaidHSRocXCahziNyEF9ycDi1LQZgR/nnJqjUTjBUJKQJZqhA2sb+caSXNYYKhiljcFD/e+DlhXi8TlZhfj090BripoP3CszWJ/HpgUwUIYoclSGusiBuVgRNVgSib/1gu8jmpd5SX8XjEeboGCZ6o0m8aAf3VWm7F/9yMn+HOQHNr65OM5HIhDm55rEA1iztudZyOGTPc9Cb3DjZ7puOe24DskASQfjq1r0RgoJT/Azn2RyUmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IQhEGZcW; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IQhEGZcW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8rL444Vbz2xfX
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Mar 2025 15:49:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2FEE05C1026;
	Sat,  8 Mar 2025 04:47:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48364C4CEE0;
	Sat,  8 Mar 2025 04:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741409385;
	bh=cHCMyURT83iZ0bUABkH5vlmrxJCIFzOvc1VaYxMO3Ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IQhEGZcWsRKjD++O8GD8HN1gxeWgouUnIwY6pBLAEja/E4u2sHlR/mnCjrAflSsg3
	 lwxxM4Uxsw34znfSyIG1sdJO2R15C2P4ru0l7G+13agou6e+c6f2w6sxNWBWPMxEed
	 RfAV2to3mAMvSdMEPwKrQmOSLZEklPw6FEKkGByg4c/tbi18yd+8SeoVbDvrQx63tI
	 0IqJ88Yba96DvfO5TWfo4MC1nHQ6B2ti/saXjIIU+T2iHcuVfwglqub8cgJG+6eb0p
	 rvWk3UbqYRVurjQOb95Mwdwtmqo2rLdKvi06CK26gorEVR2b+LiexRDOebcFVhyv42
	 SJUQs6HSj1mAQ==
Date: Fri, 7 Mar 2025 20:49:42 -0800
From: Kees Cook <kees@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
	David Gow <davidgow@google.com>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: [PATCH v6 0/3] printf: convert self-test to KUnit
Message-ID: <202503072046.34DAF614E6@keescook>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com>
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Mar 07, 2025 at 05:08:55PM -0500, Tamir Duberstein wrote:
> This is one of just 3 remaining "Test Module" kselftests (the others
> being bitmap and scanf), the rest having been converted to KUnit.
> 
> I tested this using:
> 
> $ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 printf
> 
> I have also sent out a series converting scanf[0].
> 
> Link: https://lore.kernel.org/all/20250204-scanf-kunit-convert-v3-0-386d7c3ee714@gmail.com/T/#u [0]
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> Changes in v6:
> - Use __printf correctly on `__test`. (Petr Mladek)
> - Rebase on linux-next.

Thanks for doing this!

If Petr, Rasmus, Andy, and/or others Ack this I can carry it in my
"lib/ kunit tests move to lib/tests/" tree, as that's where all the
infrastructure in lib/tests/ exists.

-Kees

-- 
Kees Cook

