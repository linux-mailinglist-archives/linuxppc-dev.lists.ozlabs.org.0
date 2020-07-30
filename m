Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B162D23329B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 15:06:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHVzX4ZFdzDqD5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 23:06:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHVcr5CQjzDqwh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 22:50:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BHVcr2Jm7z9sRX; Thu, 30 Jul 2020 22:50:20 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200727095704.1432916-1-bharata@linux.ibm.com>
References: <20200727095704.1432916-1-bharata@linux.ibm.com>
Subject: Re: [PATCH] powerpc/mm: Limit resize_hpt_for_hotplug() call to hash
 guests only
Message-Id: <159611327289.1601380.5025700532890207686.b4-ty@ellerman.id.au>
Date: Thu, 30 Jul 2020 22:50:19 +1000 (AEST)
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, aneesh.kumar@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 27 Jul 2020 15:27:04 +0530, Bharata B Rao wrote:
> During memory hotplug and unplug, resize_hpt_for_hotplug() gets called
> for both hash and radix guests but it should be called only for hash
> guests. Though the call does nothing in the radix guest case, it is
> cleaner to push this call into hash specific memory hotplug routines.

Applied to powerpc/next.

[1/1] powerpc/mm: Limit resize_hpt_for_hotplug() call to hash guests only
      https://git.kernel.org/powerpc/c/55548a86ebde2b3691b6a84baef1b02933408994

cheers
