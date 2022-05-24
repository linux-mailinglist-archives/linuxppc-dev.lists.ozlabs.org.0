Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA6D5328F5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:28:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6sQ16BdQz3hGn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:28:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6s804jqwz3cj3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:16:00 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s803mz0z4yTS;
 Tue, 24 May 2022 21:16:00 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: nvdimm@lists.linux.dev, Kajol Jain <kjain@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220511082637.646714-1-vaibhav@linux.ibm.com>
References: <20220511082637.646714-1-vaibhav@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/papr_scm: Fix leaking nvdimm_events_map
 elements
Message-Id: <165339058556.1718562.12936352188808932969.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 21:09:45 +1000
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
Cc: Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Shivaprasad G Bhat <sbhat@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 11 May 2022 13:56:36 +0530, Vaibhav Jain wrote:
> Right now 'char *' elements allocated for individual 'stat_id' in
> 'papr_scm_priv.nvdimm_events_map[]' during papr_scm_pmu_check_events(), get
> leaked in papr_scm_remove() and papr_scm_pmu_register(),
> papr_scm_pmu_check_events() error paths.
> 
> Also individual 'stat_id' arent NULL terminated 'char *' instead they are fixed
> 8-byte sized identifiers. However papr_scm_pmu_register() assumes it to be a
> NULL terminated 'char *' and at other places it assumes it to be a
> 'papr_scm_perf_stat.stat_id' sized string which is 8-byes in size.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/papr_scm: Fix leaking nvdimm_events_map elements
      https://git.kernel.org/powerpc/c/0e0946e22f3665d27325d389ff45ade6e93f3678

cheers
