Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A25C5B37B4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 14:24:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPFYZ13mPz3hh2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 22:24:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPFF126wjz3cfZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 22:10:29 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MPFDy0wCbz4xsm;
	Fri,  9 Sep 2022 22:10:26 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: paulus@samba.org, christophe.leroy@csgroup.eu, Liang He <windhl@126.com>, npiggin@gmail.com, maz@kernel.org, benh@kernel.crashing.org, mpe@ellerman.id.au
In-Reply-To: <20220618041042.4058066-1-windhl@126.com>
References: <20220618041042.4058066-1-windhl@126.com>
Subject: Re: [PATCH v2] powerpc: embedded6xx: Fix refcount leak bugs
Message-Id: <166272522746.2076816.8160630951736110654.b4-ty@ellerman.id.au>
Date: Fri, 09 Sep 2022 22:07:07 +1000
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

On Sat, 18 Jun 2022 12:10:42 +0800, Liang He wrote:
> In xx_init_xx(), of_find_node_by_type() will return a node pointer
> with refcount incremented. We should use of_node_put() when it is
> not used anymore.
> 
> 

Applied to powerpc/next.

[1/1] powerpc: embedded6xx: Fix refcount leak bugs
      https://git.kernel.org/powerpc/c/6b2d17d514b105ecf486bdf011c444978e633085

cheers
