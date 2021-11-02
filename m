Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 851F7442D41
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 12:52:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk7ZG1dkVz3h02
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 22:52:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk7GG2JTwz3cBK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 22:39:02 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hk7GF3VQrz4xdp;
 Tue,  2 Nov 2021 22:39:01 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Wan Jiabing <wanjiabing@vivo.com>, linux-kernel@vger.kernel.org,
 Frederic Barrat <fbarrat@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Leonardo Bras <leobras.c@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <20211014075624.16344-1-wanjiabing@vivo.com>
References: <20211014075624.16344-1-wanjiabing@vivo.com>
Subject: Re: [PATCH] powerpc/pseries/iommu: Add of_node_put() before break
Message-Id: <163584789302.1845480.1021784539653281831.b4-ty@ellerman.id.au>
Date: Tue, 02 Nov 2021 21:11:33 +1100
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
Cc: kael_w@yeah.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 14 Oct 2021 03:56:04 -0400, Wan Jiabing wrote:
> Fix following coccicheck warning:
> 
> ./arch/powerpc/platforms/pseries/iommu.c:924:1-28: WARNING: Function
> for_each_node_with_property should have of_node_put() before break
> 
> Early exits from for_each_node_with_property should decrement the
> node reference counter.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries/iommu: Add of_node_put() before break
      https://git.kernel.org/powerpc/c/915b368f6968122fcab31fd6441ed4ba7cc7574c

cheers
