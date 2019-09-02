Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CED9FA4E34
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 06:07:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MGkH4r8KzDqQs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 14:07:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MFv56gVTzDqXW
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 13:29:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46MFv52Nv1z9sNx; Mon,  2 Sep 2019 13:29:37 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: facd04a904ff6cdc6ee85d6e85d500f478a1bec4
In-Reply-To: <20190827033010.28090-2-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH 1/4] powerpc: convert to copy_thread_tls
Message-Id: <46MFv52Nv1z9sNx@ozlabs.org>
Date: Mon,  2 Sep 2019 13:29:37 +1000 (AEST)
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

On Tue, 2019-08-27 at 03:30:06 UTC, Nicholas Piggin wrote:
> Commit 3033f14ab78c3 ("clone: support passing tls argument via C rather
> than pt_regs magic") introduced the HAVE_COPY_THREAD_TLS option. Use it
> to avoid a subtle assumption about the argument ordering of clone type
> syscalls.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Patches 1 & 2 applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/facd04a904ff6cdc6ee85d6e85d500f478a1bec4

cheers
