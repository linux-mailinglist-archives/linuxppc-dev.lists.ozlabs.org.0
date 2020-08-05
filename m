Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EA323C2AC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 02:44:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLtCy3HmDzDqc6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 10:43:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLtBB3wWFzDqXT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 10:42:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4BLtBB2MCcz9sPC; Wed,  5 Aug 2020 10:42:26 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BLtBB1ns1z9sRK; Wed,  5 Aug 2020 10:42:26 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20200722022422.825197-1-mpe@ellerman.id.au>
References: <20200722022422.825197-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/40x: Fix assembler warning about r0
Message-Id: <159658812616.351125.6131435370355606642.b4-ty@ellerman.id.au>
Date: Wed,  5 Aug 2020 10:42:26 +1000 (AEST)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 22 Jul 2020 12:24:22 +1000, Michael Ellerman wrote:
> The assembler says:
>   arch/powerpc/kernel/head_40x.S:623: Warning: invalid register expression
> 
> It's objecting to the use of r0 as the RA argument. That's because
> when RA = 0 the literal value 0 is used, rather than the content of
> r0, making the use of r0 in the source potentially confusing.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/40x: Fix assembler warning about r0
      https://git.kernel.org/powerpc/c/8d8a629d00a5283874b81b594f31f8d436dc57d8

cheers
