Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D50B09295D9
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 01:16:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WGmVH4wb2z3fw6
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 09:16:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WGmQ72Q4Hz3cQD
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jul 2024 09:13:03 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WGmQ53pPpz4xPh;
	Sun,  7 Jul 2024 09:13:01 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, Shivaprasad G Bhat <sbhat@linux.ibm.com>
In-Reply-To: <172008854222.784.13666247605789409729.stgit@linux.ibm.com>
References: <172008854222.784.13666247605789409729.stgit@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/iommu: Define spapr_tce_table_group_ops only with CONFIG_IOMMU_API
Message-Id: <172030740421.964765.9452921118927851661.b4-ty@ellerman.id.au>
Date: Sun, 07 Jul 2024 09:10:04 +1000
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
Cc: linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, gbatra@linux.ibm.com, jgg@ziepe.ca, tpearson@raptorengineering.com, npiggin@gmail.com, ruscur@russell.cc, vaibhav@linux.ibm.com, msuchanek@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 04 Jul 2024 10:22:37 +0000, Shivaprasad G Bhat wrote:
> The patch fixes the below warning,
> arch/powerpc/platforms/pseries/iommu.c:1824:37: warning: 'spapr_tce_table_group_ops' defined but not used [-Wunused-variable]
> 
> The other error reported by the test robot no longer exists on the top
> of the tree due to later changes on the file.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries/iommu: Define spapr_tce_table_group_ops only with CONFIG_IOMMU_API
      https://git.kernel.org/powerpc/c/af199e6ca29c77fb8fea9a78f18dfb165af37cd7

cheers
