Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECB85328D2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:23:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6sJf3bTqz3f8M
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:23:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6s7q01STz3bsT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:15:51 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s7p6Nxlz4yT6;
 Tue, 24 May 2022 21:15:50 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220505125123.2088143-1-mpe@ellerman.id.au>
References: <20220505125123.2088143-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc: Add generic PAGE_SIZE config symbols
Message-Id: <165339055669.1718562.2595645003125748288.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 21:09:16 +1000
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 5 May 2022 22:51:22 +1000, Michael Ellerman wrote:
> Other arches (sh, mips, hexagon) use standard names for PAGE_SIZE
> related config symbols.
> 
> Add matching symbols for powerpc, which are enabled by default but
> depend on our architecture specific PAGE_SIZE symbols.
> 
> This allows generic/driver code to express dependencies on the PAGE_SIZE
> without needing to refer to architecture specific config symbols.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc: Add generic PAGE_SIZE config symbols
      https://git.kernel.org/powerpc/c/d036dc79cccd748e2a101c80c31efada7be8bb7c
[2/2] arch/Kconfig: Drop references to powerpc PAGE_SIZE symbols
      https://git.kernel.org/powerpc/c/aa06530a535ffe8ba8b68054003b6fb262a8ec6f

cheers
