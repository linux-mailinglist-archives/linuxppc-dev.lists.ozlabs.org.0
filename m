Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E049FC312
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 10:54:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DGz04XZszF7ZR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 20:54:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DFxs4gnyzF5JP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:08:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47DFxs1J6nz9sSL; Thu, 14 Nov 2019 20:08:00 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 8e6b6da91ac9b9ec5a925b6cb13f287a54bd547d
In-Reply-To: <20191029190759.84821-1-asteinhauser@google.com>
To: asteinhauser@google.com, benh@kernel.crashing.org, paulus@samba.org,
 diana.craciun@nxp.com
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] L1TF support in PowerPC SYSFS.
Message-Id: <47DFxs1J6nz9sSL@ozlabs.org>
Date: Thu, 14 Nov 2019 20:08:00 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Anthony Steinhauser <asteinhauser@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-10-29 at 19:07:59 UTC, asteinhauser@google.com wrote:
> From: Anthony Steinhauser <asteinhauser@google.com>
> 
> PowerPC CPUs are vulnerable to L1TF to the same extent as to Meltdown.
> It is also mitigated by flushing the L1D on privilege transition.
> Currently the SYSFS gives a false negative on L1TF on CPUs that I verified
> to be vulnerable.
> https://www.ibm.com/blogs/psirt/potential-impact-processors-power-family/
> https://github.com/google/safeside/pull/52
> Signed-off-by: Anthony Steinhauser <asteinhauser@google.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/8e6b6da91ac9b9ec5a925b6cb13f287a54bd547d

cheers
