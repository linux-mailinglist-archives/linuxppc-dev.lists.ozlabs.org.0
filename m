Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EA918857F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 14:28:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hYsf6w9tzDqbr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 00:28:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hYYD1VCyzDqdk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 00:14:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48hYYB6CJzz9sPF; Wed, 18 Mar 2020 00:14:38 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: aa4113340ae6c2811e046f08c2bc21011d20a072
In-Reply-To: <20200123111914.2565-1-laurentiu.tudor@nxp.com>
To: Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 "oss@buserror.net" <oss@buserror.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/fsl_booke: avoid creating duplicate tlb1 entry
Message-Id: <48hYYB6CJzz9sPF@ozlabs.org>
Date: Wed, 18 Mar 2020 00:14:38 +1100 (AEDT)
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
Cc: Diana Madalina Craciun <diana.craciun@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-01-23 at 11:19:25 UTC, Laurentiu Tudor wrote:
> In the current implementation, the call to loadcam_multi() is wrapped
> between switch_to_as1() and restore_to_as0() calls so, when it tries
> to create its own temporary AS=3D1 TLB1 entry, it ends up duplicating the
> existing one created by switch_to_as1(). Add a check to skip creating
> the temporary entry if already running in AS=3D1.
> 
> Fixes: d9e1831a4202 ("powerpc/85xx: Load all early TLB entries at once")
> Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> Cc: stable@vger.kernel.org

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/aa4113340ae6c2811e046f08c2bc21011d20a072

cheers
