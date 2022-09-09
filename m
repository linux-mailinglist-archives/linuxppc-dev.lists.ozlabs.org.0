Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6F45B378A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 14:22:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPFVw5dGTz3fYJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 22:22:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPFDx4VvZz3bmP
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 22:10:25 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MPFDx3cbLz4xsk;
	Fri,  9 Sep 2022 22:10:25 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, paulus@samba.org, arnd@arndb.de, Liang He <windhl@126.com>, benh@kernel.crashing.org, mpe@ellerman.id.au
In-Reply-To: <20220701144949.252364-1-windhl@126.com>
References: <20220701144949.252364-1-windhl@126.com>
Subject: Re: [PATCH v2 1/2] powerpc: cell: cbe_regs: Fix refcount bugs
Message-Id: <166272523263.2076816.10472120144968266059.b4-ty@ellerman.id.au>
Date: Fri, 09 Sep 2022 22:07:12 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 1 Jul 2022 22:49:48 +0800, Liang He wrote:
> There are several bugs as following:
> 
> (1) In cbe_get_be_node(), we should hold the reference returned by
>     of_find_xxx and of_get_xxx OF APIs and use it to call of_node_put
> (2) In cbe_fill_regs_map(), we should same as above
> (3) In cbe_regs_init(), during the iteration of for_each_node_by_type(),
>     the refcount of 'cpu' will be automatically increased and decreased.
>     However, there is a reference escaped out into 'map->cpu_node' and
>     we should properly handle it.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc: cell: cbe_regs: Fix refcount bugs
      https://git.kernel.org/powerpc/c/ad4b323693abd221798a6479105d22c79605aa0f
[2/2] powerpc: cell: iommu: Hold reference returned by of_find_node_by_name()
      https://git.kernel.org/powerpc/c/f4f8320b01677b467c768c43c1e1d10383a0e30d

cheers
