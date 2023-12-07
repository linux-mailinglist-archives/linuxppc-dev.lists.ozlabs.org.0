Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA52808843
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 13:47:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmDYs0vSwz3dXG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 23:47:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmDVp2fXFz3dBs
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 23:44:34 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SmDVp1Tw7z4xPQ;
	Thu,  7 Dec 2023 23:44:34 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20231130114433.3053544-1-mpe@ellerman.id.au>
References: <20231130114433.3053544-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/mm: Fix build failures due to arch_reserved_kernel_pages()
Message-Id: <170195271172.2310221.6102752620377148359.b4-ty@ellerman.id.au>
Date: Thu, 07 Dec 2023 23:38:31 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 30 Nov 2023 22:44:32 +1100, Michael Ellerman wrote:
> With NUMA=n and FA_DUMP=y or PRESERVE_FA_DUMP=y the build fails with:
> 
>   arch/powerpc/kernel/fadump.c:1739:22: error: no previous prototype for ‘arch_reserved_kernel_pages’ [-Werror=missing-prototypes]
>   1739 | unsigned long __init arch_reserved_kernel_pages(void)
>        |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> The prototype for arch_reserved_kernel_pages() is in include/linux/mm.h,
> but it's guarded by __HAVE_ARCH_RESERVED_KERNEL_PAGES. The powerpc
> headers define __HAVE_ARCH_RESERVED_KERNEL_PAGES in asm/mmzone.h, which
> is not included into the generic headers when NUMA=n.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/mm: Fix build failures due to arch_reserved_kernel_pages()
      https://git.kernel.org/powerpc/c/d8c3f243d4db24675b653f0568bb65dae34e6455
[2/2] powerpc: Fix build error due to is_valid_bugaddr()
      https://git.kernel.org/powerpc/c/f8d3555355653848082c351fa90775214fb8a4fa

cheers
