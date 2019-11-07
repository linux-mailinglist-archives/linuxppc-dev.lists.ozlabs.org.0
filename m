Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D434F28FA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 09:21:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477xFG34fZzF5mv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 19:21:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477q734Ly5zF5wZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 14:45:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 477q730FcSz9sRD; Thu,  7 Nov 2019 14:45:35 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 477q725sMzz9sR4; Thu,  7 Nov 2019 14:45:34 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: b9e0805abf2e92fc275ac5fbd8c1c9a92b00413d
In-Reply-To: <20191030111231.22720-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Add build-time check of ptrace PT_xx defines
Message-Id: <477q725sMzz9sR4@ozlabs.org>
Date: Thu,  7 Nov 2019 14:45:34 +1100 (AEDT)
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

On Wed, 2019-10-30 at 11:12:31 UTC, Michael Ellerman wrote:
> As part of the uapi we export a lot of PT_xx defines for each register
> in struct pt_regs. These are expressed as an index from gpr[0], in
> units of unsigned long.
> 
> Currently there's nothing tying the values of those defines to the
> actual layout of the struct.
> 
> But we *don't* want to change the uapi defines to derive the PT_xx
> values based on the layout of the struct, those values are ABI and
> must never change.
> 
> Instead we want to do the reverse, make sure that the layout of the
> struct never changes vs the PT_xx defines. So add build time checks of
> that.
> 
> This probably seems paranoid, but at least once in the past someone
> has sent a patch that would have broken the ABI if it hadn't been
> spotted. Although it probably would have been detected via testing,
> it's preferable to just quash any issues at the source.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Applied to powerpc next.

https://git.kernel.org/powerpc/c/b9e0805abf2e92fc275ac5fbd8c1c9a92b00413d

cheers
