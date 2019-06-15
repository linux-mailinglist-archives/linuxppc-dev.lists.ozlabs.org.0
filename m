Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A51584703D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 15:47:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QzLV1CMBzDrh5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 23:47:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Qz5H4dQJzDrfy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 23:36:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45Qz5H2Hq0z9sNk; Sat, 15 Jun 2019 23:36:02 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 0aa82c482ab2ece530a6f44897b63b274bb43c8e
X-Patchwork-Hint: ignore
In-Reply-To: <20190607050407.25444-1-nathanl@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pseries: fix oops in hotplug memory notifier
Message-Id: <45Qz5H2Hq0z9sNk@ozlabs.org>
Date: Sat, 15 Jun 2019 23:36:02 +1000 (AEST)
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

On Fri, 2019-06-07 at 05:04:07 UTC, Nathan Lynch wrote:
> During post-migration device tree updates, we can oops in
> pseries_update_drconf_memory if the source device tree has an
> ibm,dynamic-memory-v2 property and the destination has a
> ibm,dynamic_memory (v1) property. The notifier processes an "update"
> for the ibm,dynamic-memory property but it's really an add in this
> scenario. So make sure the old property object is there before
> dereferencing it.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/0aa82c482ab2ece530a6f44897b63b27

cheers
