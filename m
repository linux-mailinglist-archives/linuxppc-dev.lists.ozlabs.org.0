Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD614545A6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 12:27:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvLJ452TRz3cCs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 22:27:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvLFw5CjYz301g
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 22:25:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HvLFw4Gcwz4xdW;
 Wed, 17 Nov 2021 22:25:40 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Paul Mackerras <paulus@samba.org>
In-Reply-To: <20211109185015.615517-1-masahiroy@kernel.org>
References: <20211109185015.615517-1-masahiroy@kernel.org>
Subject: Re: [PATCH] powerpc: clean vdso32 and vdso64 directories
Message-Id: <163714821050.1508509.1378396894524200025.b4-ty@ellerman.id.au>
Date: Wed, 17 Nov 2021 22:23:30 +1100
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 10 Nov 2021 03:50:15 +0900, Masahiro Yamada wrote:
> Since commit bce74491c300 ("powerpc/vdso: fix unnecessary rebuilds of
> vgettimeofday.o"), "make ARCH=powerpc clean" does not clean up the
> arch/powerpc/kernel/{vdso32,vdso64} directories.
> 
> Use the subdir- trick to let "make clean" descend into them.
> 
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: clean vdso32 and vdso64 directories
      https://git.kernel.org/powerpc/c/964c33cd0be621b291b5d253d8731eb2680082cb

cheers
