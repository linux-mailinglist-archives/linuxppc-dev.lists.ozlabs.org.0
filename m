Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4549822C944
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 17:31:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCtTY2Sz4zF1LR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 01:31:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqgw1p6PzDrPJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:25:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqgt2CHWz9sV7; Fri, 24 Jul 2020 23:25:14 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: npiggin@gmail.com, ego@linux.vnet.ibm.com, pratik.r.sampat@gmail.com,
 Pratik Rajesh Sampat <psampat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mikey@neuling.org, paulus@samba.org, benh@kernel.crashing.org,
 svaidy@linux.ibm.com, linux-kernel@vger.kernel.org, mpe@ellerman.id.au
In-Reply-To: <20200721153708.89057-1-psampat@linux.ibm.com>
References: <20200721153708.89057-1-psampat@linux.ibm.com>
Subject: Re: [PATCH v4 0/3] powernv/idle: Power9 idle cleanup
Message-Id: <159559697373.1657499.7241293049572955828.b4-ty@ellerman.id.au>
Date: Fri, 24 Jul 2020 23:25:14 +1000 (AEST)
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

On Tue, 21 Jul 2020 21:07:05 +0530, Pratik Rajesh Sampat wrote:
> v3: https://lkml.org/lkml/2020/7/17/1093
> Changelog v3-->v4:
> Based on comments from Nicholas Piggin and Gautham Shenoy,
> 1. Changed the naming of pnv_first_spr_loss_level from
> pnv_first_fullstate_loss_level to deep_spr_loss_state
> 2. Make the P9 PVR check only on the top level function
> pnv_probe_idle_states and let the rest of the checks be DT based because
> it is faster to do so
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/powernv/idle: Replace CPU feature check with PVR check
      https://git.kernel.org/powerpc/c/8747bf36f312356f8a295a0c39ff092d65ce75ae
[2/3] powerpc/powernv/idle: Rename pnv_first_spr_loss_level variable
      https://git.kernel.org/powerpc/c/dcbbfa6b05daca94ebcdbce80a7cf05c717d2942
[3/3] powerpc/powernv/idle: Exclude mfspr on HID1, 4, 5 on P9 and above
      https://git.kernel.org/powerpc/c/5c92fb1b46102e1efe0eed69e743f711bc1c7d2e

cheers
