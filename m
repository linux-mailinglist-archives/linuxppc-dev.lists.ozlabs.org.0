Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8D15B378D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 14:23:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPFXB4d38z3hSg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 22:23:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPFF00yQdz3cCc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 22:10:28 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MPFDz5bMxz4xsy;
	Fri,  9 Sep 2022 22:10:27 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: paulus@samba.org, christophe.leroy@csgroup.eu, nixiaoming@huawei.com, Liang He <windhl@126.com>, benh@kernel.crashing.org, mpe@ellerman.id.au
In-Reply-To: <20220617105011.4041123-1-windhl@126.com>
References: <20220617105011.4041123-1-windhl@126.com>
Subject: Re: [PATCH v5] powerpc:85xx: Add missing of_node_put() in sgy_cst1000
Message-Id: <166272522429.2076816.15801397847524175372.b4-ty@ellerman.id.au>
Date: Fri, 09 Sep 2022 22:07:04 +1000
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 17 Jun 2022 18:50:11 +0800, Liang He wrote:
> In gpio_halt_probe(), of_find_matching_node() will return a node
> pointer with refcount incremented. We should use of_node_put() in
> fail path or when it is not used anymore.
> 
> 

Applied to powerpc/next.

[1/1] powerpc:85xx: Add missing of_node_put() in sgy_cst1000
      https://git.kernel.org/powerpc/c/14b9e26c6c9a845c005087b9653459623a7d029b

cheers
