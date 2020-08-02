Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C773235757
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 16:07:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKNBk570GzDqHP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 00:07:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKMT84J2NzDqH2
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Aug 2020 23:35:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BKMT73VtQz9sTm; Sun,  2 Aug 2020 23:35:06 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nathan Lynch <nathanl@linux.ibm.com>
In-Reply-To: <20190919231633.1344-1-nathanl@linux.ibm.com>
References: <20190919231633.1344-1-nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/hotplug-cpu: remove double free in error
 path
Message-Id: <159637524010.42190.8138342804559937363.b4-ty@ellerman.id.au>
Date: Sun,  2 Aug 2020 23:35:06 +1000 (AEST)
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

On Thu, 19 Sep 2019 18:16:33 -0500, Nathan Lynch wrote:
> In the unlikely event that the device tree lacks a /cpus node,
> find_dlpar_cpus_to_add() oddly frees the cpu_drcs buffer it has been
> passed before returning an error. Its only caller also frees the
> buffer on error.
> 
> Remove the less conventional kfree() of a caller-supplied buffer from
> find_dlpar_cpus_to_add().

Applied to powerpc/next.

[1/1] powerpc/pseries/hotplug-cpu: Remove double free in error path
      https://git.kernel.org/powerpc/c/a0ff72f9f5a780341e7ff5e9ba50a0dad5fa1980

cheers
