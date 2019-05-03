Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 532E5128EB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 09:34:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wP5p4ShczDqb9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 17:34:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wNKN5PVbzDqPP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:59:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 44wNKN2r2Nz9sPS; Fri,  3 May 2019 16:59:20 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44wNKN0GLQz9sNC; Fri,  3 May 2019 16:59:19 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 398af571128fe75f07343f929975b26d57eafd18
X-Patchwork-Hint: ignore
In-Reply-To: <20190409131420.18842-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/security: Show powerpc_security_features in
 debugfs
Message-Id: <44wNKN0GLQz9sNC@ozlabs.org>
Date: Fri,  3 May 2019 16:59:19 +1000 (AEST)
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

On Tue, 2019-04-09 at 13:14:20 UTC, Michael Ellerman wrote:
> This can be helpful for debugging problems with the security feature
> flags, especially on guests where the flags come from the hypervisor
> via an hcall and so can't be observed in the device tree.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Applied to powerpc next.

https://git.kernel.org/powerpc/c/398af571128fe75f07343f929975b26d

cheers
