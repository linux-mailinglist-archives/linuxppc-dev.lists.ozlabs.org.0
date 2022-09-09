Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C399E5B3789
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 14:22:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPFVV5plKz3h98
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 22:22:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPFDw48SHz3cd9
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 22:10:24 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MPFDw2tXFz4xYQ;
	Fri,  9 Sep 2022 22:10:24 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, paulus@samba.org, osalvador@suse.de, Liang He <windhl@126.com>, npiggin@gmail.com, benh@kernel.crashing.org, mpe@ellerman.id.au
In-Reply-To: <20220621111701.4082889-1-windhl@126.com>
References: <20220621111701.4082889-1-windhl@126.com>
Subject: Re: [PATCH] powerpc/pseries: Hold reference and fix refcount leak bugs
Message-Id: <166272524242.2076816.6588082270734785551.b4-ty@ellerman.id.au>
Date: Fri, 09 Sep 2022 22:07:22 +1000
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

On Tue, 21 Jun 2022 19:17:01 +0800, Liang He wrote:
> In pseries_cpuhp_cache_use_count() and pseries_cpuhp_detach_nodes(),
> we need carefully hold the reference returned by
> of_find_next_cache_node() and use it to call of_node_put() to keep
> refcount balance.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/pseries: Hold reference and fix refcount leak bugs
      https://git.kernel.org/powerpc/c/6ec4836fa15a0ff02e3a382ad6b1920c728a8c95

cheers
