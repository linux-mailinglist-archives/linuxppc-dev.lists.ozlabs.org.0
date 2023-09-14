Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9317A0516
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 15:11:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=e3+ds+98;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rmd454bLnz3cVF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 23:11:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=e3+ds+98;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rmd3F0K9Sz3c9S
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 23:10:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1694697016;
	bh=vjRNE9GBDDIh+LZqescnluax+52f9LuMl91e+i5f6EA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=e3+ds+98KlCctd6iNeD0ROwpZP+z0JMQk5S1YLYywHP8AJsyk03KdfoWuojDE/cji
	 6FwGLQvarAWrppIIGdQRhzLpYcqZjtOV8+PEfVVs6x7iTQvY3/Vo9KwFEVbJRUAr0j
	 CXZWoByrw/Lr+t7vDaZiJ7rH2ycPnGqlvRcNkkDZTWcWoN05tNUBYPcB/Z5Sf7Nayc
	 C2apWYsdWtL9C/y23VjJaDcqOPxCKvLcK6fen8+GBDZ5Zt+gZPD9FphvSlhWCJMtfL
	 qUZPoKxnWZvgrfBbE9aEj7jgASlspmNHHwyFm4YZR1STWvAATHf6lii57i5crRApzC
	 l7gtcy/D9Y36g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rmd374S2Wz4x3H;
	Thu, 14 Sep 2023 23:10:11 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Yuan Tan <tanyuan@tinylab.org>, christophe.leroy@csgroup.eu
Subject: Re: [PATCH v3 1/3] powerpc/config: Cleanup pmac32_defconfig
In-Reply-To: <23b30e8e9e31e7a6af4aa7d317699e1538ad89c2.1694685860.git.tanyuan@tinylab.org>
References: <cover.1694685860.git.tanyuan@tinylab.org>
 <23b30e8e9e31e7a6af4aa7d317699e1538ad89c2.1694685860.git.tanyuan@tinylab.org>
Date: Thu, 14 Sep 2023 23:10:08 +1000
Message-ID: <87y1h87vf3.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, linux@weissschuh.net, linux-kernel@vger.kernel.org, falcon@tinylab.org, linuxppc-dev@lists.ozlabs.org, w@1wt.eu, tanyuan@tinylab.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Yuan Tan <tanyuan@tinylab.org> writes:
> Use 'make savedefconfig' to cleanup pmac32_defconfig, based on Linux
> 7.6-rc1

Thanks but I don't like doing these updates in a single commit like
this, it's easy to accidentally lose a symbol.

I prefer an explanation for what's changing for each symbol. See
1ce7fda142af ("powerpc/configs/64s: Drop IPV6 which is default y") and
the commits leading up to it, to see what I mean.

But I suspect you probably don't want to go to all that effort, which is
fine :)

So I won't take patch 1, but patch 2 and 3 look fine. No need to resend,
I'll deal with any merge fixup needed.

cheers
