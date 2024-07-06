Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E9A9295B9
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 00:51:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WGlxl6KlZz3fTN
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 08:51:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WGlx21FYjz3cZm
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jul 2024 08:51:18 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WGlwv13RLz4w2M;
	Sun,  7 Jul 2024 08:51:11 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20240706120833.909853-1-mpe@ellerman.id.au>
References: <20240706120833.909853-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] selftests/powerpc: Fix build with USERCFLAGS set
Message-Id: <172030619794.961024.17013714297436863309.b4-ty@ellerman.id.au>
Date: Sun, 07 Jul 2024 08:49:57 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 06 Jul 2024 22:08:33 +1000, Michael Ellerman wrote:
> Currently building the powerpc selftests with USERCFLAGS set to anything
> causes the build to break:
> 
>   $ make -C tools/testing/selftests/powerpc V=1 USERCFLAGS=-Wno-error
>   ...
>   gcc -Wno-error    cache_shape.c ...
>   cache_shape.c:18:10: fatal error: utils.h: No such file or directory
>      18 | #include "utils.h"
>         |          ^~~~~~~~~
>   compilation terminated.
> 
> [...]

Applied to powerpc/fixes.

[1/1] selftests/powerpc: Fix build with USERCFLAGS set
      https://git.kernel.org/powerpc/c/8b7f59de92ac65aa21c7d779274dbfa577ae2d2c

cheers
