Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19074B8D04
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 10:38:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZRtZ2YXSzF1dk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 18:37:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZRrV3XrGzDr8q
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 18:36:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46ZRrV2YtTz9sCJ; Fri, 20 Sep 2019 18:36:10 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: d9101bfa6adc831bda8836c4d774820553c14942
In-Reply-To: <20190918145328.28602-1-aneesh.kumar@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [RFC PATCH] powerpc/mm/mce: Keep irq disabled during lockless
 page table walk
Message-Id: <46ZRrV2YtTz9sCJ@ozlabs.org>
Date: Fri, 20 Sep 2019 18:36:10 +1000 (AEST)
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Santosh Sivaraj <santosh@fossix.org>, Reza Arbab <arbab@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-09-18 at 14:53:28 UTC, "Aneesh Kumar K.V" wrote:
> __find_linux_mm_pte return a page table entry pointer walking the
> page table without holding locks. To make it safe against a THP
> split and collapse, we disable interrupts around the lockless
> page table walk. We need to keep the interrupts disabled as long
> as we use the page table entry pointer.
> 
> Cc: Balbir Singh <bsingharora@gmail.com>
> Cc: Reza Arbab <arbab@linux.ibm.com>
> Cc: Santosh Sivaraj <santosh@fossix.org>
> Fixes: ba41e1e1ccb9 ("powerpc/mce: Hookup derror (load/store) UE errors")
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/d9101bfa6adc831bda8836c4d774820553c14942

cheers
