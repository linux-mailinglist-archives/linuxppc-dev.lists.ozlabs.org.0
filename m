Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7DB36EC1C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 16:08:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWHR726VYz3ftP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 00:08:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWHJZ32W3z3bpm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 00:02:54 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FWHJZ0GBWz9tk3; Fri, 30 Apr 2021 00:02:49 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linux-nvdimm@lists.01.org,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210329113103.476760-1-vaibhav@linux.ibm.com>
References: <20210329113103.476760-1-vaibhav@linux.ibm.com>
Subject: Re: [PATCH] powerpc/papr_scm: Mark nvdimm as unarmed if needed during
 probe
Message-Id: <161970488717.4033873.11862743130806736936.b4-ty@ellerman.id.au>
Date: Fri, 30 Apr 2021 00:01:27 +1000
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
Cc: Shivaprasad G Bhat <sbhat@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 29 Mar 2021 17:01:03 +0530, Vaibhav Jain wrote:
> In case an nvdimm is found to be unarmed during probe then set its
> NDD_UNARMED flag before nvdimm_create(). This would enforce a
> read-only access to the ndimm region. Presently even if an nvdimm is
> unarmed its not marked as read-only on ppc64 guests.
> 
> The patch updates papr_scm_nvdimm_init() to force query of nvdimm
> health via __drc_pmem_query_health() and if nvdimm is found to be
> unarmed then set the nvdimm flag ND_UNARMED for nvdimm_create().

Applied to powerpc/next.

[1/1] powerpc/papr_scm: Mark nvdimm as unarmed if needed during probe
      https://git.kernel.org/powerpc/c/adb68c38d8d49a3d60805479c558649bb2182473

cheers
