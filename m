Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E97B730DB01
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 14:23:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW2Rj2SdGzF3wn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 00:22:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW0J864xnzDwx0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:46:16 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DW0J76QHCz9tkZ; Wed,  3 Feb 2021 22:46:15 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Masahiro Yamada <masahiroy@kernel.org>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201223171142.707053-1-masahiroy@kernel.org>
References: <20201223171142.707053-1-masahiroy@kernel.org>
Subject: Re: [PATCH 1/2] powerpc/vdso: fix unnecessary rebuilds of
 vgettimeofday.o
Message-Id: <161235275232.1521894.16951995123573238099.b4-ty@ellerman.id.au>
Date: Wed,  3 Feb 2021 22:46:15 +1100 (AEDT)
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Oliver O'Halloran <oohall@gmail.com>,
 Greentime Hu <green.hu@gmail.com>, Michal Suchanek <msuchanek@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 24 Dec 2020 02:11:41 +0900, Masahiro Yamada wrote:
> vgettimeofday.o is unnecessarily rebuilt. Adding it to 'targets' is not
> enough to fix the issue. Kbuild is correctly rebuilding it because the
> command line is changed.
> 
> PowerPC builds each vdso directory twice; first in vdso_prepare to
> generate vdso{32,64}-offsets.h, second as part of the ordinary build
> process to embed vdso{32,64}.so.dbg into the kernel.
> 
> [...]

Applied to powerpc/fixes.

[1/2] powerpc/vdso: fix unnecessary rebuilds of vgettimeofday.o
      https://git.kernel.org/powerpc/c/bce74491c3008e27dd6e8f79a83b4faa77a08f7e
[2/2] powerpc/vdso64: remove meaningless vgettimeofday.o build rule
      https://git.kernel.org/powerpc/c/66f0a9e058fad50e569ad752be72e52701991fd5

cheers
