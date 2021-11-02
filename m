Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E5D4425B0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 03:44:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HjvPj0qs9z2ywZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 13:44:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HjvPD4jDrz2xBr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 13:44:16 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HjvP52zKtz4xbd;
 Tue,  2 Nov 2021 13:44:09 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211020132315.2287178-1-aik@ozlabs.ru>
References: <20211020132315.2287178-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel 0/4] Fixes for powerpc/pseries/iommu: Make use of
 DDW for indirect mapping
Message-Id: <163582100676.1804905.10010614237761858649.b4-ty@ellerman.id.au>
Date: Tue, 02 Nov 2021 13:43:26 +1100
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Leonardo Bras <leobras.c@gmail.com>, Brian King <brking@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 21 Oct 2021 00:23:11 +1100, Alexey Kardashevskiy wrote:
> Found some issues on SRIOV enabled PHYP.
> It probably should be one patch, or not?
> 
> Please comment. Thanks.
> 
> 
> 
> [...]

Patches 2-4 applied to powerpc/fixes.

[2/4] powerpc/pseries/iommu: Use correct vfree for it_map
      https://git.kernel.org/powerpc/c/41ee7232fa5f3c034f22baa52bc287e494e2129a
[3/4] powerpc/pseries/iommu: Check if the default window in use before removing it
      https://git.kernel.org/powerpc/c/92fe01b7c655b9767724e7d62bdded0761d232ff
[4/4] powerpc/pseries/iommu: Create huge DMA window if no MMIO32 is present
      https://git.kernel.org/powerpc/c/d853adc7adf601d7d6823afe3ed396065a3e08d1

cheers
