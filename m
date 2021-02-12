Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E479E31977E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 01:34:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcDyN0dW7zDx2M
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 11:34:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcDf51wkkzDwnW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 11:19:57 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DcDf45KfPz9sVX; Fri, 12 Feb 2021 11:19:56 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, msuchanek@suse.de,
 Michael Ellerman <mpe@ellerman.id.au>, npiggin@gmail.com,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1612898425.git.christophe.leroy@csgroup.eu>
References: <cover.1612898425.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v6 0/2] powerpc/32: Implement C syscall entry/exit
 (complement)
Message-Id: <161308904799.3606979.14603109971130321553.b4-ty@ellerman.id.au>
Date: Fri, 12 Feb 2021 11:19:56 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 9 Feb 2021 19:29:26 +0000 (UTC), Christophe Leroy wrote:
> This series implements C syscall entry/exit for PPC32. It reuses
> the work already done for PPC64.
> 
> This series is based on today's next-test (f538b53fd47a) where main patchs from v5 are merged in.
> 
> The first patch is important for performance.
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/syscall: Do not check unsupported scv vector on PPC32
      https://git.kernel.org/powerpc/c/b966f2279048ee9f30d83ef8568b99fa40917c54
[2/3] powerpc/32: Handle bookE debugging in C in syscall entry/exit
      https://git.kernel.org/powerpc/c/d524dda719f06967db4d3ba519edf9267f84c155
[3/3] powerpc/syscall: Avoid storing 'current' in another pointer
      https://git.kernel.org/powerpc/c/5b90b9661a3396e00f6e8bcbb617a0787fb683d0

cheers
