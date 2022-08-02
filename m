Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FB9587B4D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 13:04:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxsZ30GBPz3bXR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 21:04:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxsXX3YMYz3c81
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 21:02:52 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LxsXW6xw8z4x1V;
	Tue,  2 Aug 2022 21:02:51 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, john.ogness@linutronix.de, frank.rowand@sony.com, clg@kaod.org, nick.child@ibm.com, linux-kernel@vger.kernel.org, lance@osuosl.org, christophe.leroy@csgroup.eu, rcu@vger.kernel.org, adobriyan@gmail.com, benh@kernel.crashing.org, paulus@samba.org, robh@kernel.org, mpe@ellerman.id.au, paulmck@kernel.org, zhouzhouyi@gmail.com, npiggin@gmail.com
In-Reply-To: <20220726015747.11754-1-zhouzhouyi@gmail.com>
References: <20220726015747.11754-1-zhouzhouyi@gmail.com>
Subject: Re: [PATCH linux-next v2] powerpc: init jump label early in ppc 64
Message-Id: <165943814554.1061647.998228378866777067.b4-ty@ellerman.id.au>
Date: Tue, 02 Aug 2022 21:02:25 +1000
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

On Tue, 26 Jul 2022 09:57:47 +0800, zhouzhouyi@gmail.com wrote:
> From: Zhouyi Zhou <zhouzhouyi@gmail.com>
> 
> In ppc 64, invoke jump_label_init in setup_feature_keys is too late
> because static key will be used in subroutine of parse_early_param
> which is again subroutine of early_init_devtree.
> 
> So we invoke jump_label_init just before parse_early_param in
> early_init_devtree.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: init jump label early in ppc 64
      https://git.kernel.org/powerpc/c/ca829e05d3d4f728810cc5e4b468d9ebc7745eb3

cheers
