Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC3058508A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:12:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvSbj5kM0z3f7H
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:12:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSYv1PXsz2xml
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:10:43 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSYq5XBXz4x1Y;
	Fri, 29 Jul 2022 23:10:39 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220714081119.3714605-1-aik@ozlabs.ru>
References: <20220714081119.3714605-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel] powerpc/iommu: Fix iommu_table_in_use for a small default DMA window case
Message-Id: <165909977346.253830.17171738550660446758.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:02:53 +1000
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
Cc: Leonardo Bras <leobras.c@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 14 Jul 2022 18:11:19 +1000, Alexey Kardashevskiy wrote:
> The existing iommu_table_in_use() helper checks if the kernel is using
> any of TCEs. There are some reserved TCEs:
> 1) the very first one if DMA window starts from 0 to avoid having a zero
> but still valid DMA handle;
> 2) it_reserved_start..it_reserved_end to exclude MMIO32 window in case
> the default window spans across that - this is the default for the first
> DMA window on PowerNV.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/iommu: Fix iommu_table_in_use for a small default DMA window case
      https://git.kernel.org/powerpc/c/d80f6de9d601c30b53c17f00cb7cfe3169f2ddad

cheers
