Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBE91FF222
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 14:42:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nhQk5pPrzDrG2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 22:42:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nhK541PHzDr3S
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 22:37:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49nhK40cWMz9sSd; Thu, 18 Jun 2020 22:37:11 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
In-Reply-To: <20200524093822.423487-1-aneesh.kumar@linux.ibm.com>
References: <20200524093822.423487-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2 1/4] powerpc/instruction_dump: Fix kernel crash with
 show_instructions
Message-Id: <159248379637.3471720.14154252041270168626.b4-ty@ellerman.id.au>
Date: Thu, 18 Jun 2020 22:37:11 +1000 (AEST)
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

On Sun, 24 May 2020 15:08:19 +0530, Aneesh Kumar K.V wrote:
> With Hard Lockup watchdog, we can hit a BUG() if we take a watchdog
> interrupt when in OPAL mode. This happens in show_instructions()
> where the kernel takes the watchdog NMI IPI with MSR_IR == 0.
> With that show_instructions() updates the variable pc in the loop
> and the second iterations will result in BUG().
> 
> We hit the BUG_ON due the below check in  __va()
> 
> [...]

Patch 1 applied to powerpc/fixes.

[1/4] powerpc: Fix kernel crash in show_instructions() w/DEBUG_VIRTUAL
      https://git.kernel.org/powerpc/c/a6e2c226c3d51fd93636320e47cabc8a8f0824c5

cheers
