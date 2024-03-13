Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CF287A86E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 14:30:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvrxL40F1z3w6h
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 00:30:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tvrt22vX7z3dV6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 00:27:54 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tvrt22648z4x1s;
	Thu, 14 Mar 2024 00:27:54 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20240306125853.3714578-1-mpe@ellerman.id.au>
References: <20240306125853.3714578-1-mpe@ellerman.id.au>
Subject: Re: (subset) [PATCH 1/3] powerpc/64s: Fix get_hugepd_cache_index() build failure
Message-Id: <171033598348.517247.11610170961747503235.b4-ty@ellerman.id.au>
Date: Thu, 14 Mar 2024 00:19:43 +1100
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

On Wed, 06 Mar 2024 23:58:51 +1100, Michael Ellerman wrote:
> With CONFIG_BUG=n, the 64-bit Book3S build fails with:
> 
>   arch/powerpc/include/asm/book3s/64/pgtable-64k.h: In function 'get_hugepd_cache_index':
>   arch/powerpc/include/asm/book3s/64/pgtable-64k.h:51:1: error: no return statement in function returning non-void
> 
> Currently the body of the function is just BUG(), so when CONFIG_BUG=n
> it is an empty function, leading to the error.
> 
> [...]

Patches 1 & 2 applied to powerpc/next.

[1/3] powerpc/64s: Fix get_hugepd_cache_index() build failure
      https://git.kernel.org/powerpc/c/329105ce53437ff64b29f6c429dfe5dc2aa7b676
[2/3] powerpc/83xx: Fix build failure with FPU=n
      https://git.kernel.org/powerpc/c/c2e5d70cf05b48bfbd5b6625bbd0ec3052cecd5d

cheers
