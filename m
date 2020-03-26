Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C56ED193F57
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 13:56:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p4jl0WBpzDqwm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 23:56:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p3cw4qVlzDqcj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 23:06:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48p3ct2my5z9sSs; Thu, 26 Mar 2020 23:06:52 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: d95fe371ecd28901f11256c610b988ed44e36ee2
In-Reply-To: <20200316135743.57735-1-psampat@linux.ibm.com>
To: Pratik Rajesh Sampat <psampat@linux.ibm.com>, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 psampat@linux.ibm.com, pratik.r.sampat@gmail.com, ego@linux.vnet.ibm.com,
 dja@axtens.net
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] cpufreq: powernv: Fix frame-size-overflow in
 powernv_cpufreq_work_fn
Message-Id: <48p3ct2my5z9sSs@ozlabs.org>
Date: Thu, 26 Mar 2020 23:06:52 +1100 (AEDT)
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

On Mon, 2020-03-16 at 13:57:43 UTC, Pratik Rajesh Sampat wrote:
> The patch avoids allocating cpufreq_policy on stack hence fixing frame
> size overflow in 'powernv_cpufreq_work_fn'
> 
> Fixes: 227942809b52 ("cpufreq: powernv: Restore cpu frequency to policy->cur on unthrottling")
> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/d95fe371ecd28901f11256c610b988ed44e36ee2

cheers
