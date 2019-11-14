Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2701FC2B5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 10:37:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DGbM1vwrzF49n
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 20:37:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DFxh73hkzF5CH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:07:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47DFxg3C3tz9sRR; Thu, 14 Nov 2019 20:07:51 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 3366ebe9e19ba3c672a00a6fb86f0ac8636ee989
In-Reply-To: <20191016183611.10867-2-nathanl@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2 1/2] powerpc/pseries: address checkpatch warnings in
 dlpar_offline_cpu
Message-Id: <47DFxg3C3tz9sRR@ozlabs.org>
Date: Thu, 14 Nov 2019 20:07:51 +1100 (AEDT)
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
Cc: tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-10-16 at 18:36:10 UTC, Nathan Lynch wrote:
> Remove some stray blank lines, convert a printk to pr_warn, and
> address a line length violation.
> 
> One functional change: use WARN_ON instead of BUG_ON in case H_PROD of
> a ceded thread yields an unexpected result from the platform. We can
> expect this code path to get uninterruptibly stuck in __cpu_die() if
> this happens, but that's more desirable than crashing.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> Fixes: b6db63d1a7f0 ("pseries/pseries: Add code to online/offline CPUs of a DLPAR node")

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/3366ebe9e19ba3c672a00a6fb86f0ac8636ee989

cheers
