Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F4B11ECC3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 22:21:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZNrq0bDwzDrHt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 08:21:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZNph06HmzDqvt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2019 08:19:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47ZNpf6p2kz9sPJ; Sat, 14 Dec 2019 08:19:38 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: a58d37bce0d21cf7fbd589384c619e465ef2f927
In-Reply-To: <20190624144148.32022-1-fbarrat@linux.ibm.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 andrew.donnellan@au1.ibm.com, clombard@linux.ibm.com, groug@kaod.org,
 alastair@au1.ibm.com
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] ocxl: Fix concurrent AFU open and device removal
Message-Id: <47ZNpf6p2kz9sPJ@ozlabs.org>
Date: Sat, 14 Dec 2019 08:19:38 +1100 (AEDT)
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

On Mon, 2019-06-24 at 14:41:48 UTC, Frederic Barrat wrote:
> If an ocxl device is unbound through sysfs at the same time its AFU is
> being opened by a user process, the open code may dereference freed
> stuctures, which can lead to kernel oops messages. You'd have to hit a
> tiny time window, but it's possible. It's fairly easy to test by
> making the time window bigger artificially.
> 
> Fix it with a combination of 2 changes:
> - when an AFU device is found in the IDR by looking for the device
> minor number, we should hold a reference on the device until after the
> context is allocated. A reference on the AFU structure is kept when
> the context is allocated, so we can release the reference on the
> device after the context allocation.
> - with the fix above, there's still another even tinier window,
> between the time the AFU device is found in the IDR and the reference
> on the device is taken. We can fix this one by removing the IDR entry
> earlier, when the device setup is removed, instead of waiting for the
> 'release' device callback. With proper locking around the IDR.
> 
> Fixes: 75ca758adbaf ("ocxl: Create a clear delineation between ocxl backend & frontend")
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/a58d37bce0d21cf7fbd589384c619e465ef2f927

cheers
