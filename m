Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 442ED6C4A88
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 13:30:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhSVT1QPJz3fhG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 23:30:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhSR63Bhlz3cjT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 23:27:30 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PhSR52qY4z4xFV;
	Wed, 22 Mar 2023 23:27:29 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: kvm <kvm@vger.kernel.org>, Timothy Pearson <tpearson@raptorengineering.com>
In-Reply-To: <525438831.16998517.1678123820075.JavaMail.zimbra@raptorengineeringinc.com>
References: <525438831.16998517.1678123820075.JavaMail.zimbra@raptorengineeringinc.com>
Subject: Re: [PATCH v2 1/4] powerpc/iommu: Add "borrowing" iommu_table_group_ops
Message-Id: <167948793435.559204.7948325972421120627.b4-ty@ellerman.id.au>
Date: Wed, 22 Mar 2023 23:25:34 +1100
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 6 Mar 2023 11:30:20 -0600 (CST), Timothy Pearson wrote:
> PPC64 IOMMU API defines iommu_table_group_ops which handles DMA windows
> for PEs: control the ownership, create/set/unset a table the hardware
> for dynamic DMA windows (DDW). VFIO uses the API to implement support
> on POWER.
> 
> So far only PowerNV IODA2 (POWER8 and newer machines) implemented this and other cases (POWER7 or nested KVM) did not and instead reused
> existing iommu_table structs. This means 1) no DDW 2) ownership transfer
> is done directly in the VFIO SPAPR TCE driver.
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc/iommu: Add "borrowing" iommu_table_group_ops
      https://git.kernel.org/powerpc/c/9d67c94335096311c0bc7556ad1022de7385790b

cheers
