Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C99B776FF8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 08:06:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLxJx39nhz3f0T
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 16:06:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLxFK61jSz3bhp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Aug 2023 16:03:49 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RLxFH0Z6Lz4wxn;
	Thu, 10 Aug 2023 16:03:47 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1689091022.git.christophe.leroy@csgroup.eu>
References: <cover.1689091022.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 0/9] Cleanup/Optimise KUAP (v3)
Message-Id: <169164734543.180689.11688137369448247481.b4-ty@ellerman.id.au>
Date: Thu, 10 Aug 2023 16:02:25 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 11 Jul 2023 17:59:12 +0200, Christophe Leroy wrote:
> This series is cleaning up a bit KUAP in preparation of using objtool
> to validate UACCESS.
> 
> There are two main changes in this series:
> 
> 1/ Simplification of KUAP on book3s/32
> 
> [...]

Applied to powerpc/next.

[1/9] powerpc/kuap: Avoid unnecessary reads of MD_AP
      https://git.kernel.org/powerpc/c/880df2d46a3f23f30f954f6e64c576d7f411cc46
[2/9] powerpc/kuap: Avoid useless jump_label on empty function
      https://git.kernel.org/powerpc/c/1bec4adcd59e923df6b7f5d492a9e4b8dfd22039
[3/9] powerpc/kuap: Fold kuep_is_disabled() into its only user
      https://git.kernel.org/powerpc/c/38bb171b958480b484e8e980be76c7d3656881ea
[4/9] powerpc/features: Add capability to update mmu features later
      https://git.kernel.org/powerpc/c/6b289911c80d45fd8da3d24ea14706361381b78d
[5/9] powerpc/kuap: MMU_FTR_BOOK3S_KUAP becomes MMU_FTR_KUAP
      https://git.kernel.org/powerpc/c/4589a2b7894d4266380b65e13291f609cf19dd19
[6/9] powerpc/kuap: Use MMU_FTR_KUAP on all and refactor disabling kuap
      https://git.kernel.org/powerpc/c/26e041208291bfdea1cb9e26bc94a0f9499efe15
[7/9] powerpc/kuap: Simplify KUAP lock/unlock on BOOK3S/32
      https://git.kernel.org/powerpc/c/5222a1d5142ec4f9ec063b274b80e20639584dbc
[8/9] powerpc/kuap: KUAP enabling/disabling functions must be __always_inline
      https://git.kernel.org/powerpc/c/eb52f66f0abd468caf8be4e690d7fdef96250c2f
[9/9] powerpc/kuap: Use ASM feature fixups instead of static branches
      https://git.kernel.org/powerpc/c/3a24ea0df83e32355d897a18bbd82e05986dcdc3

cheers
