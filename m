Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A06C45B378B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 14:22:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPFWL31RZz3hKG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 22:22:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPFDy66Ggz3cdf
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 22:10:26 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MPFDy4hR6z4xsn;
	Fri,  9 Sep 2022 22:10:26 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: clg@kaod.org, paulus@samba.org, christophe.leroy@csgroup.eu, Liang He <windhl@126.com>, tglx@linutronix.de, benh@kernel.crashing.org, mpe@ellerman.id.au
In-Reply-To: <20220620130221.4073228-1-windhl@126.com>
References: <20220620130221.4073228-1-windhl@126.com>
Subject: Re: [PATCH v2] powerpc/sysdev: Fix refcount leak bugs
Message-Id: <166272523576.2076816.7317671593026628995.b4-ty@ellerman.id.au>
Date: Fri, 09 Sep 2022 22:07:15 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 20 Jun 2022 21:02:21 +0800, Liang He wrote:
> We need add corresponding of_node_put() to keep refcount balance
> in sysdev.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/sysdev: Fix refcount leak bugs
      https://git.kernel.org/powerpc/c/3d31adc47edb6d0cef122a41fba1b639db5d1c37

cheers
