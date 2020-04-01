Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1605419AC6F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 15:13:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48smpL07RYzDqHJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 00:12:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48smMX4wtnzDr1b
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 23:53:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48smMW2J9cz9sTB; Wed,  1 Apr 2020 23:53:11 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 32377bd2cbb62e23ac0a1aaaf0048957c5fd9f02
In-Reply-To: <1574776274-22355-1-git-send-email-ego@linux.vnet.ibm.com>
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Shilpasri G Bhat <shilpa.bhat11@gmail.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powernv/opal-sensor-groups: Add documentation for the
 sysfs interfaces
Message-Id: <48smMW2J9cz9sTB@ozlabs.org>
Date: Wed,  1 Apr 2020 23:53:10 +1100 (AEDT)
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-11-26 at 13:51:14 UTC, "Gautham R. Shenoy" wrote:
> From: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
> 
> Commit bf9571550f52 ("powerpc/powernv: Add support to clear sensor
> groups data") added a mechanism to clear sensor-group data via a sysfs
> interface. However, the ABI for that interface has not been
> documented.
> 
> This patch documents the ABI for the sysfs interface for sensor-groups
> and clearing the sensor-groups.
> 
> This patch was originally sent by Shilpasri G Bhat on the mailing list:
> https://lkml.org/lkml/2018/8/1/85
> 
> Signed-off-by: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
> Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/32377bd2cbb62e23ac0a1aaaf0048957c5fd9f02

cheers
