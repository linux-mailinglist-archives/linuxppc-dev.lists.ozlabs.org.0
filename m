Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69666CB224
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 01:07:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kpZ32LK4zDq7d
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 09:07:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kpWr16yvzDqYS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2019 09:05:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46kpWq6rYKz9sPd; Fri,  4 Oct 2019 09:05:43 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: e422bd3330e5bc5cd76b063d9fc3a21cd06d9957
In-Reply-To: <20190917145702.9214-1-aneesh.kumar@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH 1/3] powerpc/book3s64/hash/4k: 4k supports only 16TB
 linear mapping
Message-Id: <46kpWq6rYKz9sPd@ozlabs.org>
Date: Fri,  4 Oct 2019 09:05:43 +1000 (AEST)
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
Cc: Cameron Berkenpas <cam@neo-zeon.de>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-09-17 at 14:57:00 UTC, "Aneesh Kumar K.V" wrote:
> With commit: 0034d395f89d ("powerpc/mm/hash64: Map all the kernel regions in the
> same 0xc range"), we now split the 64TB address range into 4 contexts each of
> 16TB. That implies we can do only 16TB linear mapping. Make sure we don't
> add physical memory above 16TB if that is present in the system.
> 
> Fixes: 0034d395f89d ("powerpc/mm/hash64: Map all the kernel regions in thesame 0xc range")
> Reported-by: Cameron Berkenpas <cam@neo-zeon.de>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/e422bd3330e5bc5cd76b063d9fc3a21cd06d9957

cheers
