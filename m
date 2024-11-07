Return-Path: <linuxppc-dev+bounces-2972-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F01E59C0052
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 09:46:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkbHX45wmz3bmf;
	Thu,  7 Nov 2024 19:45:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730969112;
	cv=none; b=A+k995Bhbpkz+4yLIwRsIZoq5kkbTyjjvavYZ4GEfYHdZumurqKkqkdnDFRq2LMqmOOtnTpkn6V2UqQitiPknqW/u6UFrWrR3gM6vHNvLg8hUgVTCfh61YYWsbJmm1gtuf2FX1TP8BhpQWmGjz7lUWrRcUWo0P1Nj1E6aXCOGdOwzbAFFB5z8Nf82f45j4V7RKVXMmhwGuCp23RjM7FYCJsdvarNVlo+FkmJzc4uV4wZrrqDn/Nqt2KS4X8VrHcGXEDfBtAdbXvC+sW69sYgL0Rh7X3RGqxyF0AzjRcZjs0moBaBZPhPtLGUVWZdnA87psOe07j/bxQrYRV3ttj3pA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730969112; c=relaxed/relaxed;
	bh=6lO1i2T84ndIiemHa44KairFoUH5eTyzgz+EAUTjUz0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oGM9EUF+Nfe0L1kbIiyqD51IBa8zXXpoUxzSaayEDNFEPVwdqU/lfToSYI+zvOBaxsGw6X8fuqpdRnTwud17JfGA24gVtqo0ZbGLBEW/7YHu7Jrft31sdlAaH0D96UxCMke8HpUxUVOf8PbrKyad8/5my5Fg0tqR34o4o1NtGpa2jC8K6cGXZMza8wLy1zMM0auniLRd4OdqUCheUkRVdWh8y91fEavDA9d3YC/jDHSDrc76KDV5YHmnFWpSZMCGBltVf82ViAbtaJ8NXWOXhBqMVYIrQelFwRGqGw4IV19H6vdftEIdzNOKocjMFJ++TJQWF0rIuRnwQO7tT59zBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n+9ol5ZB; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n+9ol5ZB;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkbHW05v3z3bmc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 19:45:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730969098;
	bh=6lO1i2T84ndIiemHa44KairFoUH5eTyzgz+EAUTjUz0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=n+9ol5ZBXqiUvR60eSXCHaCKSI4AS153n/KbJhPT4eyl+rYuEwngam1ATuqLkvef4
	 dAWK+epBzyvDu9IGJW1Bd81U2DcoGFjsoWiY3cCqLTgynpDhkGBqIk9QcO+3ryVxj/
	 j3qDnzLfa4fQ9dpMmUxraPZAlmqK6BW+7fBa5vWe9eZ77yksIjgd9+qJwKp2MNY0iZ
	 Ud9HElKRW0JzjNJ2eKFBYUVMmTajyGtfXtgxSWnBC4kYjV5FvT+iqNlkTSiEaT6Zgx
	 m2iyrzbxi3qbT5GdT7iFq24VpJAUUnKYiyZtwETE7W4ihLXO8CoIns1NW7zvOEz9wS
	 /3LQl+BY/wGJA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XkbHG43zTz4x1w;
	Thu,  7 Nov 2024 19:44:58 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <b6ad2f1ee9887af3ca5ecade2a56f4acda517a85.1728512263.git.christophe.leroy@csgroup.eu>
References: <b6ad2f1ee9887af3ca5ecade2a56f4acda517a85.1728512263.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/vdso: Flag VDSO64 entry points as functions
Message-Id: <173096894628.18315.17865156706800926912.b4-ty@ellerman.id.au>
Date: Thu, 07 Nov 2024 19:42:26 +1100
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

On Thu, 10 Oct 2024 00:17:57 +0200, Christophe Leroy wrote:
> On powerpc64 as shown below by readelf, vDSO functions symbols have
> type NOTYPE.
> 
> $ powerpc64-linux-gnu-readelf -a arch/powerpc/kernel/vdso/vdso64.so.dbg
> ELF Header:
>   Magic:   7f 45 4c 46 02 02 01 00 00 00 00 00 00 00 00 00
>   Class:                             ELF64
>   Data:                              2's complement, big endian
>   Version:                           1 (current)
>   OS/ABI:                            UNIX - System V
>   ABI Version:                       0
>   Type:                              DYN (Shared object file)
>   Machine:                           PowerPC64
>   Version:                           0x1
> ...
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/vdso: Flag VDSO64 entry points as functions
      https://git.kernel.org/powerpc/c/0161bd38c24312853ed5ae9a425a1c41c4ac674a

cheers

