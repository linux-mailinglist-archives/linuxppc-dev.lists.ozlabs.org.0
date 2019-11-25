Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 176EC108CDB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 12:23:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47M4RF5W1CzDqcX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 22:23:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47M3dJ02fVzDqVl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 21:47:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 47M3dH26sPz9sRh; Mon, 25 Nov 2019 21:47:15 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47M3dG5t2kz9sRM; Mon, 25 Nov 2019 21:47:14 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: bf9c95e23324cbaf2e58fc3f0cbdc73137f2d1ca
In-Reply-To: <20191120023924.13130-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] selftests/powerpc: spectre_v2 test must be built 64-bit
Message-Id: <47M3dG5t2kz9sRM@ozlabs.org>
Date: Mon, 25 Nov 2019 21:47:14 +1100 (AEDT)
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

On Wed, 2019-11-20 at 02:39:24 UTC, Michael Ellerman wrote:
> The spectre_v2 test must be built 64-bit, it includes hand-written asm
> that is 64-bit only, and segfaults if built 32-bit.
> 
> Fixes: c790c3d2b0ec ("selftests/powerpc: Add a test of spectre_v2 mitigations")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Applied to powerpc next.

https://git.kernel.org/powerpc/c/bf9c95e23324cbaf2e58fc3f0cbdc73137f2d1ca

cheers
