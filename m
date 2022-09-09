Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A575B3748
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 14:13:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPFJc4p4nz3fXB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 22:13:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPFDg16hzz3c2Q
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 22:10:11 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MPFDd2Cc6z4xZk;
	Fri,  9 Sep 2022 22:10:09 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: agust@denx.de, paulus@samba.org, Liang He <windhl@126.com>, nick.child@ibm.com, ulia.Lawall@inria.fr, benh@kernel.crashing.org, mpe@ellerman.id.au
In-Reply-To: <20220615143703.3968898-1-windhl@126.com>
References: <20220615143703.3968898-1-windhl@126.com>
Subject: Re: [PATCH] arch: powerpc: platforms: 512x: Add missing of_node_put()
Message-Id: <166272522122.2076816.13173445897300716877.b4-ty@ellerman.id.au>
Date: Fri, 09 Sep 2022 22:07:01 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, joel@jms.id.au, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 15 Jun 2022 22:37:03 +0800, Liang He wrote:
> In mpc5121_clk_init(), of_find_compatible_node() will return a
> node pointer with refcount incremented. We should use of_node_put()
> when it is not used anymore.
> 
> 

Applied to powerpc/next.

[1/1] arch: powerpc: platforms: 512x: Add missing of_node_put()
      https://git.kernel.org/powerpc/c/06f48f5cb5df2299f5e4b42e9dda1858bf172bcb

cheers
