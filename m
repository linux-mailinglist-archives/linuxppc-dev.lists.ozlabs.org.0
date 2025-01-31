Return-Path: <linuxppc-dev+bounces-5725-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6178BA23831
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 01:22:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ykc6P0c6Kz30Pl;
	Fri, 31 Jan 2025 11:22:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738282957;
	cv=none; b=EvEbg+hpZ0Mjpcrg4laxxDR8WnSbSM8ythTSp7O2nMARS90jXXdwx938bOcKYJ53eAvJK9Hfk8R5Db1p/jNKVEhD5pTmQGV/rvndvD/Go93+/fLUnnyrY7ZRyTSFq4m8YOfUZrLMd7IV4EuB5GK9MmJlF9asEXI4lgTix7bCqQXUGCtwLg7erDPvw3ONtH7P03Y9zKYQFTKBV3Ul+oCykgMFsYjympCdizQ+SUtKJcmhqo5E9+EkZnXzlwHHQ8FtcqDv2EwHZg5k0Es8JqcbtcJnSyKsoimXRfzsZGLiMPa8MXlchePdJH89AkGnswTw7p+KkPpwrDId6gHfXEoEFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738282957; c=relaxed/relaxed;
	bh=25a30crfxY9pAb99iXNL8GYoYiONb0LKuNL8F+wyDgI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=nG1tDO7HXufivW+bac1FFRANbRm0EWJgUk4A6U32PRVoDEnhvu/Zklimj+wL1YfJoPMPFCluLghbnWS/lijfvTCkmk17xmE8M38L/D3GRsThD4JoaHdrauurRDg97Tw3ivDUpM1lLLTjDn+O8MPApaY+8ogkP99kLk+WUv2yxpGHk5ekcA6UwBOpbtoolDKBw/qxelxjHB/XxEOHNkXW7SC0G/MV2GofKsJ9GS8fKKWR259g2bkWEarNavu6H2BWUxtnHiJw6utDPwsBLWVTed3Z40AU5EXO+3t3vW3TO9FwoTghdGIghGc0KtgdI0yFe+eCRGP3CgYwdc2x/V+D8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=f7QIIv3I; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=f7QIIv3I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ykc6M6Fsxz2yYf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 11:22:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9B0FAA425FB;
	Fri, 31 Jan 2025 00:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625B7C4CED2;
	Fri, 31 Jan 2025 00:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1738282951;
	bh=+0gqCmX3XNKCKW4rck9Ou6ozz0RJo/+ewAmbL7uc80A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=f7QIIv3I+QHM9mGjQv6SP2ZPQdLBF2lqmZmTN5kKs/nxgKDJs4xmYxB1j41iQZdba
	 zHCjewXX8KWilpdW4QIm9x1P/vWpPbsodazYEXfjpk2gzen1OEK6LP4/70PIRDVhJ7
	 wLZr6P3WvvMBc+jWGfK6LSKfJxmVXrwhx7VezwRc=
Date: Thu, 30 Jan 2025 16:22:30 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Sidhartha Kumar
 <sidhartha.kumar@oracle.com>, christophe.leroy@csgroup.eu,
 geert@linux-m68k.org, justinstitt@google.com, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
 llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com,
 mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org,
 ndesaulniers@google.com, npiggin@gmail.com, Matthew Wilcox
 <willy@infradead.org>, linux-mm@kvack.org
Subject: Re: [PATCH] xarray: port tests to kunit
Message-Id: <20250130162230.168530a472df1e56ba987f75@linux-foundation.org>
In-Reply-To: <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
	<07cf896e-adf8-414f-a629-a808fc26014a@oracle.com>
	<qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
	<CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
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
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 29 Jan 2025 16:28:32 -0500 Tamir Duberstein <tamird@gmail.com> wrote:

> > How are grammar corrections going to the right person (but not the
> > mailing list) while an entire conversion to kunit is not [1]?
> 
> Very simple: the tests are not properly included in MAINTAINERS. I
> sent https://lore.kernel.org/all/20250129-xarray-test-maintainer-v1-1-482e31f30f47@gmail.com/
> a few minutes ago for this reason.

I failed to notice that this patch didn't cc linux-mm.

MAINTAINERS doesn't ask people to cc linux-mm on xarray changes.

linux-mm averages 130 messages/day - I think it's reasonable to believe
that MM developers spend a few minutes a day scanning the Subject:s.

This:

From: Andrew Morton <akpm@linux-foundation.org>
Subject: MAINTAINERS: include linux-mm for xarray maintenance
Date: Thu Jan 30 04:16:20 PM PST 2025

MM developers have an interest in the xarray code.

Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 MAINTAINERS |    1 +
 1 file changed, 1 insertion(+)

--- a/MAINTAINERS~maintainers-include-linux-mm-for-xarray-maintenance
+++ a/MAINTAINERS
@@ -25676,6 +25676,7 @@ F:	arch/x86/entry/vdso/
 XARRAY
 M:	Matthew Wilcox <willy@infradead.org>
 L:	linux-fsdevel@vger.kernel.org
+L:	linux-mm@kvack.org
 S:	Supported
 F:	Documentation/core-api/xarray.rst
 F:	include/linux/idr.h
_


