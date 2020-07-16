Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9B822251C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 16:18:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6xDv6FDzzDqp5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 00:18:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6vQB1mg0zDqly
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:56:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4B6vQ16bPwz9sVW; Thu, 16 Jul 2020 22:56:09 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6vPx4Cy7z9sTg; Thu, 16 Jul 2020 22:56:05 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, Nayna Jain <nayna@linux.ibm.com>
In-Reply-To: <1594813921-12425-1-git-send-email-nayna@linux.ibm.com>
References: <1594813921-12425-1-git-send-email-nayna@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/pseries: detect secure and trusted boot state
 of the system.
Message-Id: <159490401795.3805857.12377577444442862197.b4-ty@ellerman.id.au>
Date: Thu, 16 Jul 2020 22:56:05 +1000 (AEST)
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
Cc: linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 15 Jul 2020 07:52:01 -0400, Nayna Jain wrote:
> The device-tree property to check secure and trusted boot state is
> different for guests(pseries) compared to baremetal(powernv).
> 
> This patch updates the existing is_ppc_secureboot_enabled() and
> is_ppc_trustedboot_enabled() functions to add support for pseries.
> 
> The secureboot and trustedboot state are exposed via device-tree property:
> /proc/device-tree/ibm,secure-boot and /proc/device-tree/ibm,trusted-boot
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries: Detect secure and trusted boot state of the system.
      https://git.kernel.org/powerpc/c/61f879d97ce4510dd29d676a20d67692e3b34806

cheers
