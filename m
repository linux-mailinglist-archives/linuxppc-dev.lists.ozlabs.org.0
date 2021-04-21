Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F141B366BEE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 15:09:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQLVr71htz3bq8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 23:09:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQLV914VQz2y0L
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 23:09:04 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FQLV74fxFz9vF7; Wed, 21 Apr 2021 23:09:03 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: sxwjean@gmail.com, Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <e1147287bf6f2fb0693048fe8db0298c7870e419.1618847273.git.christophe.leroy@csgroup.eu>
References: <e1147287bf6f2fb0693048fe8db0298c7870e419.1618847273.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/3] powerpc/8xx: Enhance readability of trap types
Message-Id: <161901050214.1961279.6836507660126364944.b4-ty@ellerman.id.au>
Date: Wed, 21 Apr 2021 23:08:22 +1000
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 19 Apr 2021 15:48:09 +0000 (UTC), Christophe Leroy wrote:
> This patch makes use of trap types in head_8xx.S

Applied to powerpc/next.

[1/3] powerpc/8xx: Enhance readability of trap types
      https://git.kernel.org/powerpc/c/0f5eb28a6ce6ab0882010e6727bfd6e8cd569273
[2/3] powerpc/32s: Enhance readability of trap types
      https://git.kernel.org/powerpc/c/7fab639729ce4a0ecb3c528cd68b0c0598696ef9
[3/3] powerpc/irq: Enhance readability of trap types
      https://git.kernel.org/powerpc/c/e522331173ec9af563461e0fae534e83ce39e8e3

cheers
