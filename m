Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBF2247CA5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 05:22:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVx7C33ZvzDqZ1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 13:22:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVx5Q0tKwzDqXM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 13:21:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BVx5P5gv8z9sTR; Tue, 18 Aug 2020 13:21:13 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1596794701-23530-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1596794701-23530-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V6 0/2] powerpc/perf: Add support for perf extended regs
 in powerpc
Message-Id: <159772076195.1537671.8929069233918277642.b4-ty@ellerman.id.au>
Date: Tue, 18 Aug 2020 13:21:13 +1000 (AEST)
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
Cc: ravi.bangoria@linux.ibm.com, mikey@neuling.org, maddy@linux.vnet.ibm.com,
 kjain@linux.ibm.com, acme@kernel.org, jolsa@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 7 Aug 2020 06:04:59 -0400, Athira Rajeev wrote:
> Patch set to add support for perf extended register capability in
> powerpc. The capability flag PERF_PMU_CAP_EXTENDED_REGS, is used to
> indicate the PMU which support extended registers. The generic code
> define the mask of extended registers as 0 for non supported architectures.
> 
> patch 1/2 defines the PERF_PMU_CAP_EXTENDED_REGS mask to output the
> values of mmcr0,mmcr1,mmcr2 for POWER9. Defines `PERF_REG_EXTENDED_MASK`
> at runtime which contains mask value of the supported registers under
> extended regs.
> 
> [...]

Applied to powerpc/fixes.

[1/2] powerpc/perf: Add support for outputting extended regs in perf intr_regs
      https://git.kernel.org/powerpc/c/781fa4811d95314c1965c0c3337c9ac36ef26093
[2/2] powerpc/perf: Add extended regs support for power10 platform
      https://git.kernel.org/powerpc/c/d735599a069f6936c1392e07075c34a19bda949a

cheers
