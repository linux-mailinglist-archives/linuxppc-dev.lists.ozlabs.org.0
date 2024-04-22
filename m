Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C757E8AC8CF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 11:22:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNKXk3mBHz3vkj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 19:22:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNKWd68nSz3dF9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 19:21:49 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VNKWV1Crdz4wyp;
	Mon, 22 Apr 2024 19:21:42 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: iommu@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, Shivaprasad G Bhat <sbhat@linux.ibm.com>
In-Reply-To: <170800513841.2411.13524607664262048895.stgit@linux.ibm.com>
References: <170800513841.2411.13524607664262048895.stgit@linux.ibm.com>
Subject: Re: [PATCH] powerpc/iommu: Refactor spapr_tce_platform_iommu_attach_dev()
Message-Id: <171377768067.1735812.11531947951932765598.b4-ty@ellerman.id.au>
Date: Mon, 22 Apr 2024 19:21:20 +1000
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
Cc: venkat88@linux.vnet.ibm.com, jroedel@suse.de, gbatra@linux.vnet.ibm.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, jgg@ziepe.ca, tpearson@raptorengineering.com, npiggin@gmail.com, bgray@linux.ibm.com, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, aik@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 15 Feb 2024 07:52:32 -0600, Shivaprasad G Bhat wrote:
> The patch makes the iommu_group_get() call only when using it
> thereby avoiding the unnecessary get & put for domain already
> being set case.
> 
> 

Applied to powerpc/fixes.

[1/1] powerpc/iommu: Refactor spapr_tce_platform_iommu_attach_dev()
      https://git.kernel.org/powerpc/c/5bd31ab5f79eb6e3bdfa0ca0b57650f9d1604062

cheers
