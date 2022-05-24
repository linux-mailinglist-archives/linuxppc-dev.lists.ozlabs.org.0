Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3BA5328CD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:22:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6sGz3ypYz3cgR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:22:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6s7l3gVwz3bnd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:15:47 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s7l154dz4yT2;
 Tue, 24 May 2022 21:15:47 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Frank Rowand <frowand.list@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210924105653.46963-1-krzysztof.kozlowski@canonical.com>
References: <20210924105653.46963-1-krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 1/2] powerpc/powermac: add missing
 g5_phy_disable_cpu1() declaration
Message-Id: <165339059600.1718562.826859123615066589.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 21:09:56 +1000
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 24 Sep 2021 12:56:52 +0200, Krzysztof Kozlowski wrote:
> g5_phy_disable_cpu1() is used outside of platforms/powermac/feature.c,
> so it should have a declaration to fix W=1 warning:
> 
>   arch/powerpc/platforms/powermac/feature.c:1533:6:
>     error: no previous prototype for ‘g5_phy_disable_cpu1’ [-Werror=missing-prototypes]
> 
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/powermac: add missing g5_phy_disable_cpu1() declaration
      https://git.kernel.org/powerpc/c/cc025916b12a452df7932da528d25b2ef2b05072
[2/2] powerpc/powermac: constify device_node in of_irq_parse_oldworld()
      https://git.kernel.org/powerpc/c/bb12dd42d20f5513a8d1da225232af0a0743fd79

cheers
