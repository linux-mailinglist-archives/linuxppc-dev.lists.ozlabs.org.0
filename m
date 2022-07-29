Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDCF585087
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:11:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvSZt0Ylbz3dsC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:11:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSYv165Sz2xkY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:10:43 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSYr29zgz4x1b;
	Fri, 29 Jul 2022 23:10:40 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220629060614.1680476-1-aik@ozlabs.ru>
References: <20220629060614.1680476-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel v2] pseries/iommu/ddw: Fix kdump to work in absence of ibm,dma-window
Message-Id: <165909977150.253830.4573134506438140160.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:02:51 +1000
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
Cc: Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>, Leonardo Bras <leobras.c@gmail.com>, Andrew Donnellan <ajd@linux.ibm.com>, Frederic Barrat <fbarrat@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 29 Jun 2022 16:06:14 +1000, Alexey Kardashevskiy wrote:
> The pseries platform uses 32bit default DMA window (always 4K pages) and
> optional 64bit DMA window available via DDW ("Dynamic DMA Windows"),
> 64K or 2M pages. For ages the default one was not removed and a huge
> window was created in addition. Things changed with SRIOV-enabled
> PowerVM which creates a default-and-bigger DMA window in 64bit space
> (still using 4K pages) for IOV VFs so certain OSes do not need to use
> the DDW API in order to utilize all available TCE budget.
> 
> [...]

Applied to powerpc/next.

[1/1] pseries/iommu/ddw: Fix kdump to work in absence of ibm,dma-window
      https://git.kernel.org/powerpc/c/b1fc44eaa9ba31e28c4125d6b9205a3582b47b5d

cheers
