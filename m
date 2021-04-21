Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E86ED366BED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 15:09:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQLVT5ycLz30KL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 23:09:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQLV86cxkz2y0L
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 23:09:04 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FQLV65HT1z9vF3; Wed, 21 Apr 2021 23:09:02 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, jolsa@kernel.org,
 mpe@ellerman.id.au, linux-perf-users@vger.kernel.org
In-Reply-To: <1616425047-1666-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1616425047-1666-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2 0/5] powerpc/perf: Export processor pipeline stage
 cycles information
Message-Id: <161901050007.1961279.2172742114670881645.b4-ty@ellerman.id.au>
Date: Wed, 21 Apr 2021 23:08:20 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: peterz@infradead.org, ravi.bangoria@linux.ibm.com,
 kan.liang@linux.intel.com, maddy@linux.ibm.com, kjain@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 22 Mar 2021 10:57:22 -0400, Athira Rajeev wrote:
> Performance Monitoring Unit (PMU) registers in powerpc exports
> number of cycles elapsed between different stages in the pipeline.
> Example, sampling registers in ISA v3.1.
> 
> This patchset implements kernel and perf tools support to expose
> these pipeline stage cycles using the sample type PERF_SAMPLE_WEIGHT_TYPE.
> 
> [...]

Patch 1 applied to powerpc/next.

[1/5] powerpc/perf: Expose processor pipeline stage cycles using PERF_SAMPLE_WEIGHT_STRUCT
      https://git.kernel.org/powerpc/c/af31fd0c9107e400a8eb89d0eafb40bb78802f79

cheers
