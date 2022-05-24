Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E67875328EA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:26:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6sMx5r8jz3grS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:26:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6s7x0fHnz3cgx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:15:57 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s7x01MJz4yTN;
 Tue, 24 May 2022 21:15:56 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>, Pali Rohár <pali@kernel.org>
In-Reply-To: <20220506203621.26314-1-pali@kernel.org>
References: <20220506203621.26314-1-pali@kernel.org>
Subject: Re: [PATCH] powerpc/85xx: P2020: Add fsl,mpc8548-pmc node
Message-Id: <165339056016.1718562.7051892610899050151.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 21:09:20 +1000
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 6 May 2022 22:36:21 +0200, Pali Rohár wrote:
> P2020 also contains Power Management Controller and their registers at
> offset 0xe0070 compatible with mpc8548. So add PMC node into DTS include
> file fsl/p2020si-post.dtsi
> 
> 

Applied to powerpc/next.

[1/1] powerpc/85xx: P2020: Add fsl,mpc8548-pmc node
      https://git.kernel.org/powerpc/c/294299b3d39e8b4ae10c12ef1ed71405ef7b1e43

cheers
