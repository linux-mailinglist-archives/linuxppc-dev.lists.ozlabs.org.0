Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 000D726DB67
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 14:22:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsbgY0f4YzDqQr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 22:22:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsZSp1t3fzDqWy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 21:27:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BsZSm0v03z9sVh; Thu, 17 Sep 2020 21:27:36 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linux-nvdimm@lists.01.org, linuxppc-dev@lists.ozlabs.org,
 Vaibhav Jain <vaibhav@linux.ibm.com>
In-Reply-To: <20200912081451.66225-1-vaibhav@linux.ibm.com>
References: <20200912081451.66225-1-vaibhav@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/papr_scm: Fix warning triggered by
 perf_stats_show()
Message-Id: <160034201769.3339803.11310136880935913841.b4-ty@ellerman.id.au>
Date: Thu, 17 Sep 2020 21:27:36 +1000 (AEST)
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 12 Sep 2020 13:44:51 +0530, Vaibhav Jain wrote:
> A warning is reported by the kernel in case perf_stats_show() returns
> an error code. The warning is of the form below:
> 
>  papr_scm ibm,persistent-memory:ibm,pmemory@44100001:
>  	  Failed to query performance stats, Err:-10
>  dev_attr_show: perf_stats_show+0x0/0x1c0 [papr_scm] returned bad count
>  fill_read_buffer: dev_attr_show+0x0/0xb0 returned bad count
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/papr_scm: Fix warning triggered by perf_stats_show()
      https://git.kernel.org/powerpc/c/ca78ef2f08ccfa29b711d644964cdf9d7ace15e5

cheers
