Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4FF22E6CD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 09:42:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFWwp5C00zDqyw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 17:42:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFWZz6HDJzDqnG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 17:26:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BFWZy1TfDz9sRN; Mon, 27 Jul 2020 17:26:49 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Bill Wendling <morbo@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <191c67db31264b69cf6b566fd69851beb3dd0abb.1595630874.git.morbo@google.com>
References: <CAGG=3QW4=SmOEY=9mdtZUPBBvHHzVD4UN7hAz9wC83ctr8XsXQ@mail.gmail.com>
 <191c67db31264b69cf6b566fd69851beb3dd0abb.1595630874.git.morbo@google.com>
Subject: Re: [PATCH v2] powerpc/64s: allow for clang's objdump differences
Message-Id: <159583478689.602200.16183439706875321426.b4-ty@ellerman.id.au>
Date: Mon, 27 Jul 2020 17:26:49 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 24 Jul 2020 15:49:01 -0700, Bill Wendling wrote:
> Clang's objdump emits slightly different output from GNU's objdump,
> causing a list of warnings to be emitted during relocatable builds.
> E.g., clang's objdump emits this:
> 
>    c000000000000004: 2c 00 00 48  b  0xc000000000000030
>    ...
>    c000000000005c6c: 10 00 82 40  bf 2, 0xc000000000005c7c
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64s: allow for clang's objdump differences
      https://git.kernel.org/powerpc/c/faedc380129501bdd7f669bf14e9c7ee3e7a2feb

cheers
