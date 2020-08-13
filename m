Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFA5243D5B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 18:28:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSBnX1XQBzDqf1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 02:28:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=1rasLJyM; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSBkw1G96zDqdL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 02:25:44 +1000 (AEST)
Received: from localhost (unknown [70.37.104.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2FB02087D;
 Thu, 13 Aug 2020 16:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597335941;
 bh=yBkCnLmG3vaC6cqj8IElSplsRjjrpSlVe2by7qwYX3M=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
 b=1rasLJyM1DUi3ETcW0agOJ4vi5CXmtRgxA0mKxdDw9qmhtyuq7g0Hrsut6JhEQ7ag
 3tavDJBlzVxNORu2Lspmhi0hzG/DEbImiZzwCAV40OpTf7+NK+IMIipcbbrhhNaplw
 OqCYaMnou3SjfKQt1zCjwi2vahFN1ZW2mLpmRrDU=
Date: Thu, 13 Aug 2020 16:25:41 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: Re: [PATCH v2 3/4] powerpc/memhotplug: Make lmb size 64bit
In-Reply-To: <20200806162329.276534-3-aneesh.kumar@linux.ibm.com>
References: <20200806162329.276534-3-aneesh.kumar@linux.ibm.com>
Message-Id: <20200813162541.B2FB02087D@mail.kernel.org>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

[This is an automated email]

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v5.8, v5.7.14, v5.4.57, v4.19.138, v4.14.193, v4.9.232, v4.4.232.

v5.8: Build OK!
v5.7.14: Build OK!
v5.4.57: Build OK!
v4.19.138: Failed to apply! Possible dependencies:
    Unable to calculate

v4.14.193: Failed to apply! Possible dependencies:
    Unable to calculate

v4.9.232: Failed to apply! Possible dependencies:
    1a367063ca0c ("powerpc/pseries: Check memory device state before onlining/offlining")
    25b587fba9a4 ("powerpc/pseries: Correct possible read beyond dlpar sysfs buffer")
    333f7b76865b ("powerpc/pseries: Implement indexed-count hotplug memory add")
    753843471cbb ("powerpc/pseries: Implement indexed-count hotplug memory remove")
    943db62c316c ("powerpc/pseries: Revert 'Auto-online hotplugged memory'")
    c21f515c7436 ("powerpc/pseries: Make the acquire/release of the drc for memory a seperate step")
    e70d59700fc3 ("powerpc/pseries: Introduce memory hotplug READD operation")
    f84775c2d5d9 ("powerpc/pseries: Fix build break when MEMORY_HOTREMOVE=n")

v4.4.232: Failed to apply! Possible dependencies:
    183deeea5871 ("powerpc/pseries: Consolidate CPU hotplug code to hotplug-cpu.c")
    1a367063ca0c ("powerpc/pseries: Check memory device state before onlining/offlining")
    1dc759566636 ("powerpc/pseries: Use kernel hotplug queue for PowerVM hotplug events")
    1f859adb9253 ("powerpc/pseries: Verify CPU doesn't exist before adding")
    25b587fba9a4 ("powerpc/pseries: Correct possible read beyond dlpar sysfs buffer")
    333f7b76865b ("powerpc/pseries: Implement indexed-count hotplug memory add")
    4a4bdfea7cb7 ("powerpc/pseries: Refactor dlpar_add_lmb() code")
    753843471cbb ("powerpc/pseries: Implement indexed-count hotplug memory remove")
    9054619ef54a ("powerpc/pseries: Add pseries hotplug workqueue")
    943db62c316c ("powerpc/pseries: Revert 'Auto-online hotplugged memory'")
    9dc512819e4b ("powerpc: Fix unused function warning 'lmb_to_memblock'")
    bdf5fc633804 ("powerpc/pseries: Update LMB associativity index during DLPAR add/remove")
    c21f515c7436 ("powerpc/pseries: Make the acquire/release of the drc for memory a seperate step")
    e70d59700fc3 ("powerpc/pseries: Introduce memory hotplug READD operation")
    e9d764f80396 ("powerpc/pseries: Enable kernel CPU dlpar from sysfs")
    ec999072442a ("powerpc/pseries: Auto-online hotplugged memory")
    f84775c2d5d9 ("powerpc/pseries: Fix build break when MEMORY_HOTREMOVE=n")
    fdb4f6e99ffa ("powerpc/pseries: Remove call to memblock_add()")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
