Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3572C40EC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 14:12:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch1Wj4xKQzDqrW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 00:12:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgztS3fS1zDqQR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 22:58:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Cgzt250v6z9sWB; Wed, 25 Nov 2020 22:58:01 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>, paulus@samba.org, groug@kaod.org,
 tyreld@linux.ibm.com, mpe@ellerman.id.au, benh@kernel.crashing.org,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201111020752.1686139-1-zhangxiaoxu5@huawei.com>
References: <20201111020752.1686139-1-zhangxiaoxu5@huawei.com>
Subject: Re: [PATCH] Revert "powerpc/pseries/hotplug-cpu: Remove double free
 in error path"
Message-Id: <160630540298.2174375.12757740867260971562.b4-ty@ellerman.id.au>
Date: Wed, 25 Nov 2020 22:58:01 +1100 (AEDT)
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

On Tue, 10 Nov 2020 21:07:52 -0500, Zhang Xiaoxu wrote:
> This reverts commit a0ff72f9f5a780341e7ff5e9ba50a0dad5fa1980.
> 
> Since the commit b015f6bc9547 ("powerpc/pseries: Add cpu DLPAR
> support for drc-info property"), the 'cpu_drcs' wouldn't be double
> freed when the 'cpus' node not found.
> 
> So we needn't apply this patch, otherwise, the memory will be leak.

Applied to powerpc/next.

[1/1] Revert "powerpc/pseries/hotplug-cpu: Remove double free in error path"
      https://git.kernel.org/powerpc/c/a40fdaf1420d6e6bda0dd2df1e6806013e58dbe1

cheers
