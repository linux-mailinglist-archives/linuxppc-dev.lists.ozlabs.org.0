Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA9530DB87
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 14:42:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW2tF5P4XzDx0d
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 00:42:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW0JF6rTJzDwx2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:46:21 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DW0JC17kLz9tlX; Wed,  3 Feb 2021 22:46:17 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Raoni Fassina Firmino <raoni@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210201200505.iz46ubcizipnkcxe@work-tp>
References: <20210201200505.iz46ubcizipnkcxe@work-tp>
Subject: Re: [PATCH] powerpc/64/signal: Fix regression in
 __kernel_sigtramp_rt64 semantics
Message-Id: <161235275273.1521894.16491619294758116162.b4-ty@ellerman.id.au>
Date: Wed,  3 Feb 2021 22:46:17 +1100 (AEDT)
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 1 Feb 2021 17:05:05 -0300, Raoni Fassina Firmino wrote:
> Tested on powerpc64 and powerpc64le, with a glibc build and running the
> affected glibc's testcase[2], inspected that glibc's backtrace() now gives
> the correct result and gdb backtrace also keeps working as before.
> 
> I believe this should be backported to releases 5.9 and 5.10 as userspace
> is affected in this releases.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64/signal: Fix regression in __kernel_sigtramp_rt64() semantics
      https://git.kernel.org/powerpc/c/24321ac668e452a4942598533d267805f291fdc9

cheers
