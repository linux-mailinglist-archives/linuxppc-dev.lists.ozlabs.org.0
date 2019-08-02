Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ED07EA51
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 04:30:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460B2n03rxzDqkV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 12:30:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460B0l0Zy3zDqTh
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 12:28:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 460B0k6y1Hz9sDB; Fri,  2 Aug 2019 12:28:22 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 7440ea8b2a4430eef5120d0a7faac6c39304ae6d
In-Reply-To: <20190730143704.060a2606@canb.auug.org.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] drivers/macintosh/smu.c: Mark expected switch fall-through
Message-Id: <460B0k6y1Hz9sDB@ozlabs.org>
Date: Fri,  2 Aug 2019 12:28:22 +1000 (AEST)
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-07-30 at 04:37:04 UTC, Stephen Rothwell wrote:
> Mark switch cases where we are expecting to fall through.
> 
> This patch fixes the following warning (Building: powerpc):
> 
> drivers/macintosh/smu.c: In function 'smu_queue_i2c':
> drivers/macintosh/smu.c:854:21: warning: this statement may fall through [-=
> Wimplicit-fallthrough=3D]
>    cmd->info.devaddr &=3D 0xfe;
>    ~~~~~~~~~~~~~~~~~~^~~~~~~
> drivers/macintosh/smu.c:855:2: note: here
>   case SMU_I2C_TRANSFER_STDSUB:
>   ^~~~
> 
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Gustavo A. R. Silva <gustavo@embeddedor.com>
> Cc: Kees Cook <keescook@chromium.org>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/7440ea8b2a4430eef5120d0a7faac6c39304ae6d

cheers
