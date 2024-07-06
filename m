Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 543A49295DB
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 01:17:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WGmVj1NmWz3gHX
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 09:17:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WGmQB0DDBz3d4L
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jul 2024 09:13:06 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WGmQ74gwWz4xQM;
	Sun,  7 Jul 2024 09:13:03 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, tpearson@raptorengineering.com, alex.williamson@redhat.com, linuxppc-dev@lists.ozlabs.org, aik@amd.com, Shivaprasad G Bhat <sbhat@linux.ibm.com>
In-Reply-To: <171923268781.1397.8871195514893204050.stgit@linux.ibm.com>
References: <171923268781.1397.8871195514893204050.stgit@linux.ibm.com>
Subject: Re: [PATCH v4 0/6] powerpc: pSeries: vfio: iommu: Re-enable support for SPAPR TCE VFIO
Message-Id: <172030740409.964765.9717587564748516161.b4-ty@ellerman.id.au>
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
Cc: svaidy@linux.ibm.com, gbatra@linux.ibm.com, jroedel@suse.de, kvm@vger.kernel.org, robh@kernel.org, aik@ozlabs.ru, sanastasio@raptorengineering.com, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, mahesh@linux.ibm.com, aneesh.kumar@kernel.org, jgg@ziepe.ca, oohall@gmail.com, npiggin@gmail.com, ruscur@russell.cc, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, brking@linux.ibm.com, msuchanek@suse.de, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 24 Jun 2024 12:38:07 +0000, Shivaprasad G Bhat wrote:
> The patches reimplement the iommu table_group_ops for pSeries
> for VFIO SPAPR TCE sub-driver thereby bringing consistency with
> PowerNV implementation and getting rid of limitations/bugs which
> were emanating from these differences on the earlier approach on
> pSeries.
> 
> Structure of the patchset:
> -------------------------
> The first and fifth patches just code movements.
> 
> [...]

Applied to powerpc/next.

[1/6] powerpc/iommu: Move pSeries specific functions to pseries/iommu.c
      https://git.kernel.org/powerpc/c/b09c031d9433dda3186190e5845ba0d720212567
[2/6] powerpc/pseries/iommu: Fix the VFIO_IOMMU_SPAPR_TCE_GET_INFO ioctl output
      https://git.kernel.org/powerpc/c/6af67f2ddfcbbca551d786415beda14c48fb6ddf
[3/6] powerpc/pseries/iommu: Use the iommu table[0] for IOV VF's DDW
      https://git.kernel.org/powerpc/c/aed6e4946ed9654fc965482b045b84f9b9572bb8
[4/6] vfio/spapr: Always clear TCEs before unsetting the window
      https://git.kernel.org/powerpc/c/4ba2fdff2eb174114786784926d0efb6903c88a6
[5/6] powerpc/iommu: Move dev_has_iommu_table() to iommu.c
      https://git.kernel.org/powerpc/c/35146eadcb81d72153a1621f3cc0d5588cae19d3
[6/6] powerpc/iommu: Reimplement the iommu_table_group_ops for pSeries
      https://git.kernel.org/powerpc/c/f431a8cde7f102fce412546db6e62fdbde1131a7

cheers
