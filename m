Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DA05B3756
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 14:17:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPFPK4wNyz3gH2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 22:17:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPFDn42lcz3blw
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 22:10:17 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MPFDn3BGCz4xcZ;
	Fri,  9 Sep 2022 22:10:17 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, paulus@samba.org, Liang He <windhl@126.com>, benh@kernel.crashing.org, mpe@ellerman.id.au
In-Reply-To: <20220702022936.266146-1-windhl@126.com>
References: <20220702022936.266146-1-windhl@126.com>
Subject: Re: [PATCH] powerpc: kernel: pci-common: Fix refcount bug for 'phb->dn'
Message-Id: <166272524765.2076816.11689561095750275477.b4-ty@ellerman.id.au>
Date: Fri, 09 Sep 2022 22:07:27 +1000
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

On Sat, 2 Jul 2022 10:29:36 +0800, Liang He wrote:
> In pcibios_alloc_controller(), 'phb' is allocated and escaped into
> global 'hose_list'. So we should call of_node_get() when a new reference
> created into 'phb->dn'. And when phb is freed, we should call
> of_node_put() on it.
> 
> NOTE: This function is called in the iteration of for_each_xx in
> chrp_find_bridges() function. If there is no of_node_get(), the object
> maybe prematurely freed.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: kernel: pci-common: Fix refcount bug for 'phb->dn'
      https://git.kernel.org/powerpc/c/ce63c44b63cdae892107717ba10fdb6fb4fc6cdb

cheers
