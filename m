Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CE439CEE2
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 14:19:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FybCF3qhcz3bw0
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 22:19:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fyb3W1Smdz30GS
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jun 2021 22:12:23 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Fyb3S0hVzz9t1s; Sun,  6 Jun 2021 22:12:19 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org,
 Vaibhav Jain <vaibhav@linux.ibm.com>
In-Reply-To: <20210508043642.114076-1-vaibhav@linux.ibm.com>
References: <20210508043642.114076-1-vaibhav@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/papr_scm: Reduce error severity if nvdimm
 stats inaccessible
Message-Id: <162298131517.2353459.4172460283508036246.b4-ty@ellerman.id.au>
Date: Sun, 06 Jun 2021 22:08:35 +1000
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 8 May 2021 10:06:42 +0530, Vaibhav Jain wrote:
> Currently drc_pmem_qeury_stats() generates a dev_err in case
> "Enable Performance Information Collection" feature is disabled from
> HMC or performance stats are not available for an nvdimm. The error is
> of the form below:
> 
> papr_scm ibm,persistent-memory:ibm,pmemory@44104001: Failed to query
> 	 performance stats, Err:-10
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/papr_scm: Reduce error severity if nvdimm stats inaccessible
      https://git.kernel.org/powerpc/c/f3f6d18417eb44ef393b23570d384d2778ef22dc

cheers
