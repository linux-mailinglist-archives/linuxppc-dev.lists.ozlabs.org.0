Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C665A7E63
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 15:12:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHl3B3XMqz3cL8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 23:12:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHl2r34BFz3bfC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 23:12:36 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MHl2q442yz4x1D;
	Wed, 31 Aug 2022 23:12:35 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Kajol Jain <kjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, vaibhav@linux.ibm.com
In-Reply-To: <20220804074852.55157-1-kjain@linux.ibm.com>
References: <20220804074852.55157-1-kjain@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/papr_scm: Fix nvdimm event mappings
Message-Id: <166195152081.42804.8091615195567843266.b4-ty@ellerman.id.au>
Date: Wed, 31 Aug 2022 23:12:00 +1000
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
Cc: nvdimm@lists.linux.dev, atrajeev@linux.vnet.ibm.com, rnsastry@linux.ibm.com, aneesh.kumar@linux.ibm.com, maddy@linux.ibm.com, dan.j.williams@intel.com, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 4 Aug 2022 13:18:52 +0530, Kajol Jain wrote:
> Commit 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support")
> added performance monitoring support for papr-scm nvdimm devices via
> perf interface. Commit also added an array in papr_scm_priv
> structure called "nvdimm_events_map", which got filled based on the
> result of H_SCM_PERFORMANCE_STATS hcall.
> 
> Currently there is an assumption that the order of events in the
> stats buffer, returned by the hypervisor is same. And order also
> happens to matches with the events specified in nvdimm driver code.
> But this assumption is not documented in Power Architecture
> Platform Requirements (PAPR) document. Although the order
> of events happens to be same on current generation od system, but
> it might not be true in future generation systems. Fix the issue, by
> adding a static mapping for nvdimm events to corresponding stat-id,
> and removing the dynamic map from papr_scm_priv structure. Also
> remove the function papr_scm_pmu_check_events from papr_scm.c file,
> as we no longer need to copy stat-ids dynamically.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/papr_scm: Fix nvdimm event mappings
      https://git.kernel.org/powerpc/c/9b1ac04698a4bfec146322502cdcd9904c1777fa

cheers
