Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8430B2630BD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 17:41:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmmTG3Vd4zDqM0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 01:41:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjkV6Y6YzDqGT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:37:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjkR5v9Jz9sTS; Wed,  9 Sep 2020 23:37:35 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: ukrishn@linux.ibm.com, clg@kaod.org, christophe_lombard@fr.ibm.com,
 linuxppc-dev@lists.ozlabs.org, ajd@linux.ibm.com, mrochs@linux.ibm.com,
 Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20200403153838.29224-1-fbarrat@linux.ibm.com>
References: <20200403153838.29224-1-fbarrat@linux.ibm.com>
Subject: Re: [PATCH v2 0/4] ocxl: Cleanup AFU interrupt allocation
Message-Id: <159965824187.811679.2176980218519792673.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:37:35 +1000 (AEST)
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
Cc: haren@linux.ibm.com, groug@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 3 Apr 2020 17:38:34 +0200, Frederic Barrat wrote:
> Short series to cleanup AFU interrupt allocation for opencapi.
> Current code was using its own allocation service, calling opal
> directly to get the trigger page. This is not needed and we can use
> xive to achieve the same thing. The only caveat is that the trigger
> page address is only valid after the interrupt has been mapped, but
> that is not a problem with the way the code is using it.
> No functional change.
> 
> [...]

Applied to powerpc/next.

[1/4] scsi: cxlflash: Access interrupt trigger page from xive directly
      https://git.kernel.org/powerpc/c/1e89da5ef9c28c673e86048c89ef9495618d987d
[2/4] ocxl: Access interrupt trigger page from xive directly
      https://git.kernel.org/powerpc/c/ad857d47df6a1adc9798558701dd5426643b859f
[3/4] ocxl: Don't return trigger page when allocating an interrupt
      https://git.kernel.org/powerpc/c/dde6f18a8779dcd88d9fd5d6336032fee7e07fcd
[4/4] ocxl: Remove custom service to allocate interrupts
      https://git.kernel.org/powerpc/c/374f6178f3483dcad151fc14b2fad92ed6652f07

cheers
