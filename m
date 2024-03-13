Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7098487A85F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 14:29:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tvrvg1wdQz3vZT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 00:29:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tvrt12TPFz3dV6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 00:27:53 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tvrt044nWz4x1k;
	Thu, 14 Mar 2024 00:27:52 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Kajol Jain <kjain@linux.ibm.com>
In-Reply-To: <20240229122847.101162-1-kjain@linux.ibm.com>
References: <20240229122847.101162-1-kjain@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/hv-gpci: Fix the H_GET_PERF_COUNTER_INFO hcall return value checks
Message-Id: <171033598343.517247.4423484584244810742.b4-ty@ellerman.id.au>
Date: Thu, 14 Mar 2024 00:19:43 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, akanksha@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 29 Feb 2024 17:58:47 +0530, Kajol Jain wrote:
> Running event hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=0/
> in one of the system throws below error:
> 
>  ---Logs---
>  # perf list | grep hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles
>   hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=?/[Kernel PMU event]
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/hv-gpci: Fix the H_GET_PERF_COUNTER_INFO hcall return value checks
      https://git.kernel.org/powerpc/c/ad86d7ee43b22aa2ed60fb982ae94b285c1be671

cheers
