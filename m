Return-Path: <linuxppc-dev+bounces-6140-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD106A3317B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 22:29:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtWfL2fXdz2y8P;
	Thu, 13 Feb 2025 08:29:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739395754;
	cv=none; b=He4RHLvUE5I7KFoXutkYpPzkOjjzvXkO/jv1wBfa9FHmVw3L3gp9lLp36zk7SecYSL2pwcmHL5cSKXWd6yav3c+tpn8jL35vA5NSSfanK7IRLGYh8dPsPJpKBws6Cvx53Jhjty1deLexjU1jLXVndRy9OZO1axWnUS2sdv6vvSoEerklRTaYKopekjsQvS4/zDILz2KbrjXibR8Ikj2C79f4Xbvuf4FFcY6Qt9mlYYF4u5gxQeETupKHn35pOw5KWtpNxphVFrxpDoRUKA6AAQpLEyL4YYZ+F4sUhKvOGntgLWoq0iQeiWY6WxjJrPzo4skJbVyFV7Jw90Cvfw16Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739395754; c=relaxed/relaxed;
	bh=K+9dSbgU9McR8AFKLVmlCnxR0A7iHdMke/X+gv/pY4k=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JNgnyFo0y55/2+9EALhhw9bwsZqE51K15JLTox9TgrHwHoaHAc3+V9ZhkDKCj5Rb/SNd4nKC2MemR3RRSyaWHlVUN90No3yunDPDvUU8wh2lWWomMRpfvVeKuDj1kfJ/ECp8fD3V5ECelSvbf5fxlRmwAA2FjmFwtZ7IuawcLIYF9U6hJph2J64ffOrXD8T0yiKVxQaS2NaUu5ly6wDWRzQTTdOmTCVm7UjSok49yc5PmgBmajhp1CDRv9u/5QradkeWDT9UYd8HFzYWqpvSS0oA3Dt8WavaZI/zHoGqf64A/SGGGCRccI4fuRWRm0JQcCURz2s7hK8Mm0ZfhAFrnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=g25Zma8j; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=g25Zma8j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YtWfK0bZsz2xsd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2025 08:29:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 624265C623C;
	Wed, 12 Feb 2025 21:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A0BC4CEDF;
	Wed, 12 Feb 2025 21:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1739395747;
	bh=FNuraFRyLvUDzNAGJQHElNh8dikm+1tZHhcNvHqnA6I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=g25Zma8jRSe+HcXS14/PzbDN2QKhvyGISAuzT2nTIcyi0tzAmRIiqNVvrNFgRTdFY
	 7uSES7p8xqHyJhu1dnWAgQ66RboNYCKaRWkv7q9b9WRZV8cvb4OZZ1PAnjokgIQ+jB
	 A9e3YOA0hMF/EY4DR8hYmGquvFcPFjAowGvJdhHY=
Date: Wed, 12 Feb 2025 13:29:06 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Yury Khrustalev <yury.khrustalev@arm.com>, Arnd Bergmann
 <arnd@arndb.de>, linux-arch@vger.kernel.org, Kevin Brodsky
 <kevin.brodsky@arm.com>, Joey Gouly <joey.gouly@arm.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, Sandipan Das <sandipan@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, nd@arm.com
Subject: Re: [RESEND v4 0/3] mm/pkey: Add PKEY_UNRESTRICTED macro
Message-Id: <20250212132906.fdf85ea62b3672cfc1115c09@linux-foundation.org>
In-Reply-To: <Z6zZanGRGd15770_@arm.com>
References: <20250113170619.484698-1-yury.khrustalev@arm.com>
	<Z6zZanGRGd15770_@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 12 Feb 2025 17:24:58 +0000 Catalin Marinas <catalin.marinas@arm.com> wrote:

> On Mon, Jan 13, 2025 at 05:06:16PM +0000, Yury Khrustalev wrote:
> > Add PKEY_UNRESTRICTED macro to mman.h and use it in selftests.
> > 
> > For context, this change will also allow for more consistent update of the
> > Glibc manual which in turn will help with introducing memory protection
> > keys on AArch64 targets.
> [...]
> > Yury Khrustalev (3):
> >   mm/pkey: Add PKEY_UNRESTRICTED macro
> >   selftests/mm: Use PKEY_UNRESTRICTED macro
> >   selftests/powerpc: Use PKEY_UNRESTRICTED macro
> > 
> >  include/uapi/asm-generic/mman-common.h               | 1 +
> >  tools/testing/selftests/mm/mseal_test.c              | 6 +++---
> >  tools/testing/selftests/mm/pkey-helpers.h            | 3 ++-
> >  tools/testing/selftests/mm/pkey_sighandler_tests.c   | 4 ++--
> >  tools/testing/selftests/mm/protection_keys.c         | 2 +-
> >  tools/testing/selftests/powerpc/include/pkeys.h      | 2 +-
> >  tools/testing/selftests/powerpc/mm/pkey_exec_prot.c  | 2 +-
> >  tools/testing/selftests/powerpc/mm/pkey_siginfo.c    | 2 +-
> >  tools/testing/selftests/powerpc/ptrace/core-pkey.c   | 6 +++---
> >  tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c | 6 +++---
> >  10 files changed, 18 insertions(+), 16 deletions(-)
> 
> Andrew, Arnd - are you ok if I take these patches through the arm64
> tree?

Sure.

