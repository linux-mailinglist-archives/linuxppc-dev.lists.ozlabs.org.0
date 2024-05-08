Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B628BFF3C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 15:47:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZGfX3SRxz3fmB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 23:47:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZGXR2l7kz3cYF
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 23:41:59 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZGXR24Wnz4xGX;
	Wed,  8 May 2024 23:41:59 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Masahiro Yamada <masahiroy@kernel.org>
In-Reply-To: <20240216135517.2002749-1-masahiroy@kernel.org>
References: <20240216135517.2002749-1-masahiroy@kernel.org>
Subject: Re: [PATCH] powerpc: remove unused *_syscall_64.o variables in Makefile
Message-Id: <171517558552.165093.5436397769184900794.b4-ty@ellerman.id.au>
Date: Wed, 08 May 2024 23:39:45 +1000
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 16 Feb 2024 22:55:17 +0900, Masahiro Yamada wrote:
> Commit ab1a517d55b0 ("powerpc/syscall: Rename syscall_64.c into
> interrupt.c") missed to update these three lines:
> 
>   GCOV_PROFILE_syscall_64.o := n
>   KCOV_INSTRUMENT_syscall_64.o := n
>   UBSAN_SANITIZE_syscall_64.o := n
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: remove unused *_syscall_64.o variables in Makefile
      https://git.kernel.org/powerpc/c/4f1dad618587fa2fa903235301111c8c382b6f3e

cheers
