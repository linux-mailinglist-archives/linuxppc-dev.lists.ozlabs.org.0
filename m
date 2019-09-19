Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E107B778B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 12:35:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YtXz471szF4fY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 20:35:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YtKK5f7tzF4XJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 20:25:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46YtKK3P26z9sP6; Thu, 19 Sep 2019 20:25:41 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 41ba17f20ea835c489e77bd54e2da73184e22060
In-Reply-To: <20190827101635.6942-1-maddy@linux.vnet.ibm.com>
To: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v3] powerpc/imc: Dont create debugfs files for cpu-less
 nodes
Message-Id: <46YtKK3P26z9sP6@ozlabs.org>
Date: Thu, 19 Sep 2019 20:25:41 +1000 (AEST)
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
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, Qian Cai <cai@lca.pw>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-08-27 at 10:16:35 UTC, Madhavan Srinivasan wrote:
> Commit <684d984038aa> ('powerpc/powernv: Add debugfs interface for imc-mode
> and imc') added debugfs interface for the nest imc pmu devices to support
> changing of different ucode modes. Primarily adding this capability for
> debug. But when doing so, the code did not consider the case of cpu-less
> nodes. So when reading the _cmd_ or _mode_ file of a cpu-less node
> will create this crash.
> 
...
> 
> Fixes: 684d984038aa ('powerpc/powernv: Add debugfs interface for imc-mode and imc')
> Reported-by: Qian Cai <cai@lca.pw>
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/41ba17f20ea835c489e77bd54e2da73184e22060

cheers
