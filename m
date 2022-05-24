Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A155053289F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:17:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6s9W4FRFz3cCk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:17:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6s7T3V0Kz3bsP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:15:33 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s7T2rBQz4ySV;
 Tue, 24 May 2022 21:15:33 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: devicetree@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>
In-Reply-To: <9949813a6b758903b7bee910f798ba2ca82ff8ee.1648720908.git.christophe.leroy@csgroup.eu>
References: <9949813a6b758903b7bee910f798ba2ca82ff8ee.1648720908.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/85xx: Remove FSL_85XX_CACHE_SRAM
Message-Id: <165339057880.1718562.6883347220711607278.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 21:09:38 +1000
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

On Thu, 31 Mar 2022 12:03:06 +0200, Christophe Leroy wrote:
> CONFIG_FSL_85XX_CACHE_SRAM is an option that is not
> user selectable and which is not selected by any driver
> nor any defconfig.
> 
> Remove it and all associated code.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/85xx: Remove FSL_85XX_CACHE_SRAM
      https://git.kernel.org/powerpc/c/dc21ed2aef4150fc2fcf58227a4ff24502015c03

cheers
