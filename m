Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFF869C4A2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 04:53:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKpRy5CMSz3fWp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 14:53:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKpPp0dmFz3c7S
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 14:51:42 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PKpPn6JDnz4x8Y;
	Mon, 20 Feb 2023 14:51:41 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20230213112322.998003-1-mpe@ellerman.id.au>
References: <20230213112322.998003-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/nohash: Fix build error with binutils >= 2.38
Message-Id: <167686495636.2406274.3495482833734089850.b4-ty@ellerman.id.au>
Date: Mon, 20 Feb 2023 14:49:16 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 13 Feb 2023 22:23:22 +1100, Michael Ellerman wrote:
> With bintils >= 2.38 the ppc64_book3e_allmodconfig build fails:
> 
>   {standard input}: Assembler messages:
>   {standard input}:196: Error: unrecognized opcode: `lbarx'
>   {standard input}:196: Error: unrecognized opcode: `stbcx.'
>   make[5]: *** [scripts/Makefile.build:252: arch/powerpc/mm/nohash/e500_hugetlbpage.o] Error 1
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/nohash: Fix build error with binutils >= 2.38
      https://git.kernel.org/powerpc/c/91360b446a5cced537d61fc2394253e8c6b9ae7b

cheers
