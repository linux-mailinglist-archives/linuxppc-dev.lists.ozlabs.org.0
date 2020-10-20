Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 086A7293C01
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 14:42:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFtYy30ShzDqX3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 23:42:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFt8Z0Dq0zDqRG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 23:23:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CFt8W3RDHz9sRR; Tue, 20 Oct 2020 23:23:54 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
In-Reply-To: <20201019042716.106234-1-srikar@linux.vnet.ibm.com>
References: <20201019042716.106234-1-srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 0/2] Fixes for coregroup
Message-Id: <160319650960.2348169.11451661238920733591.b4-ty@ellerman.id.au>
Date: Tue, 20 Oct 2020 23:23:54 +1100 (AEDT)
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
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Qian Cai <cai@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 19 Oct 2020 09:57:14 +0530, Srikar Dronamraju wrote:
> These patches fixes problems introduced by the coregroup patches.
> The first patch we remove a redundant variable.
> Second patch allows to boot with CONFIG_CPUMASK_OFFSTACK enabled.
> 
> Changelog v1->v2:
> https://lore.kernel.org/linuxppc-dev/20201008034240.34059-1-srikar@linux.vnet.ibm.com/t/#u
> 1. 1st patch was not part of previous posting.
> 2. Updated 2nd patch based on comments from Michael Ellerman
> 
> [...]

Applied to powerpc/fixes.

[1/2] powerpc/smp: Remove unnecessary variable
      https://git.kernel.org/powerpc/c/966730a6e8524c1b5fe64358e5884605cab6ccb3
[2/2] powerpc/smp: Use GFP_ATOMIC while allocating tmp mask
      https://git.kernel.org/powerpc/c/84dbf66c63472069e5eb40b810731367618cd8b5

cheers
