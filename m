Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A843D262F34
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 15:32:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bmjd23ntyzDqW3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 23:32:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjVp1DyXzDqVl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:27:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4BmjVn57H5z9sTN; Wed,  9 Sep 2020 23:27:29 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjVn3DZvz9sTS; Wed,  9 Sep 2020 23:27:29 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Scott Cheloha <cheloha@linux.ibm.com>, linuxppc-dev@ozlabs.org
In-Reply-To: <20200727184605.2945095-1-cheloha@linux.ibm.com>
References: <20200727184605.2945095-1-cheloha@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] powerpc/perf: consolidate GPCI hcall structs into
 asm/hvcall.h
Message-Id: <159965716665.808686.4907664390218681095.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:27:29 +1000 (AEST)
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Tyrel Datwylder <tyreld@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 27 Jul 2020 13:46:04 -0500, Scott Cheloha wrote:
> The H_GetPerformanceCounterInfo (GPCI) hypercall input/output structs are
> useful to modules outside of perf/, so move them into asm/hvcall.h to live
> alongside the other powerpc hypercall structs.
> 
> Leave the perf-specific GPCI stuff in perf/hv-gpci.h.

Applied to powerpc/next.

[1/2] powerpc/perf: consolidate GPCI hcall structs into asm/hvcall.h
      https://git.kernel.org/powerpc/c/59562b5c33d6ff3685509ed58b2ed3c5b5712704
[2/2] powerpc/pseries: new lparcfg key/value pair: partition_affinity_score
      https://git.kernel.org/powerpc/c/5d1bc776428f34941a6237afb9454061b5b5e1e1

cheers
