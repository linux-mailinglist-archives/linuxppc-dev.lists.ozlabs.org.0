Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6054F23572F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 15:46:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKMkJ1G3SzDqQD
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 23:46:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKMT1538QzDqH2
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Aug 2020 23:35:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4BKMT10RTDz9sSG; Sun,  2 Aug 2020 23:35:01 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BKMT03XzZz9sTM; Sun,  2 Aug 2020 23:35:00 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Anton Blanchard <anton@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Nathan Lynch <nathanl@linux.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
In-Reply-To: <1596087177-30329-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1596087177-30329-1-git-send-email-ego@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 0/3] cpuidle-pseries: Parse extended CEDE information
 for idle.
Message-Id: <159637524065.42190.12857433342577768358.b4-ty@ellerman.id.au>
Date: Sun,  2 Aug 2020 23:35:00 +1000 (AEST)
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
Cc: linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 30 Jul 2020 11:02:54 +0530, Gautham R. Shenoy wrote:
> This is a v3 of the patch series to parse the extended CEDE
> information in the pseries-cpuidle driver.
> 
> The previous two versions of the patches can be found here:
> 
> v2: https://lore.kernel.org/lkml/1596005254-25753-1-git-send-email-ego@linux.vnet.ibm.com/
> 
> [...]

Applied to powerpc/next.

[1/3] cpuidle: pseries: Set the latency-hint before entering CEDE
      https://git.kernel.org/powerpc/c/3af0ada7dd98c6da35c1fd7f107af3b9aa5e904c
[2/3] cpuidle: pseries: Add function to parse extended CEDE records
      https://git.kernel.org/powerpc/c/054e44ba99ae36918631fcbf5f034e466c2f1b73
[3/3] cpuidle: pseries: Fixup exit latency for CEDE(0)
      https://git.kernel.org/powerpc/c/d947fb4c965cdb7242f3f91124ea16079c49fa8b

cheers
