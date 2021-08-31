Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B91D43FC92D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 15:59:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzTMH4GvDz3c5d
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 23:59:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzTL92k09z2yPG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 23:58:25 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GzTL40H8Pz9t0Z;
 Tue, 31 Aug 2021 23:58:20 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Nicolin Chen <nicoleotsuka@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Leonardo Bras <leobras.c@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 kernel test robot <lkp@intel.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20210817063929.38701-1-leobras.c@gmail.com>
References: <20210817063929.38701-1-leobras.c@gmail.com>
Subject: Re: [PATCH v6 00/11] DDW + Indirect Mapping
Message-Id: <163041821834.889087.5084622813010302887.b4-ty@ellerman.id.au>
Date: Tue, 31 Aug 2021 23:56:58 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 17 Aug 2021 03:39:18 -0300, Leonardo Bras wrote:
> So far it's assumed possible to map the guest RAM 1:1 to the bus, which
> works with a small number of devices. SRIOV changes it as the user can
> configure hundreds VFs and since phyp preallocates TCEs and does not
> allow IOMMU pages bigger than 64K, it has to limit the number of TCEs
> per a PE to limit waste of physical pages.
> 
> As of today, if the assumed direct mapping is not possible, DDW creation
> is skipped and the default DMA window "ibm,dma-window" is used instead.
> 
> [...]

Applied to powerpc/next.

[01/11] powerpc/pseries/iommu: Replace hard-coded page shift
        https://git.kernel.org/powerpc/c/0c634bafe3bbee7a36dca7f1277057e05bf14d91
[02/11] powerpc/kernel/iommu: Add new iommu_table_in_use() helper
        https://git.kernel.org/powerpc/c/3c33066a21903076722a2881556a92aa3cd7d359
[03/11] powerpc/pseries/iommu: Add iommu_pseries_alloc_table() helper
        https://git.kernel.org/powerpc/c/4ff8677a0b192a58d998d1d34fc5168203041a24
[04/11] powerpc/pseries/iommu: Add ddw_list_new_entry() helper
        https://git.kernel.org/powerpc/c/92a23219299cedde52e3298788484f4875d5ce0f
[05/11] powerpc/pseries/iommu: Allow DDW windows starting at 0x00
        https://git.kernel.org/powerpc/c/2ca73c54ce24489518a56d816331b774044c2445
[06/11] powerpc/pseries/iommu: Add ddw_property_create() and refactor enable_ddw()
        https://git.kernel.org/powerpc/c/7ed2ed2db2685a285cb09ab330dc4efea0b64022
[07/11] powerpc/pseries/iommu: Reorganize iommu_table_setparms*() with new helper
        https://git.kernel.org/powerpc/c/fc8cba8f989fb98e496b33a78476861e246c42a0
[08/11] powerpc/pseries/iommu: Update remove_dma_window() to accept property name
        https://git.kernel.org/powerpc/c/a5fd95120c653962a9e75e260a35436b96d2c991
[09/11] powerpc/pseries/iommu: Find existing DDW with given property name
        https://git.kernel.org/powerpc/c/8599395d34f2dd7b77bef42da1d99798e7a3d58f
[10/11] powerpc/pseries/iommu: Make use of DDW for indirect mapping
        https://git.kernel.org/powerpc/c/381ceda88c4c4c8345cad1cffa6328892f15dca6
[11/11] powerpc/pseries/iommu: Rename "direct window" to "dma window"
        https://git.kernel.org/powerpc/c/57dbbe590f152e5e8a3ff8bf5ba163df34eeae0b

cheers
