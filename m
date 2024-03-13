Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B9687A87F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 14:33:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tvrzs5gs5z3wXf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 00:32:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tvrt437wgz3dXB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 00:27:56 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tvrt40BKkz4wcR;
	Thu, 14 Mar 2024 00:27:56 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20240229114108.743810-1-mpe@ellerman.id.au>
References: <20240229114108.743810-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Add allmodconfig for all 32-bit sub-arches
Message-Id: <171033598341.517247.11899302647606196025.b4-ty@ellerman.id.au>
Date: Thu, 14 Mar 2024 00:19:43 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: u.kleine-koenig@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 29 Feb 2024 22:41:08 +1100, Michael Ellerman wrote:
> 32-bit powerpc kernels can be built for one of 5 sub-arches, see
> Kconfig.cputype:
> 
>   PPC_BOOK3S_32: "512x/52xx/6xx/7xx/74xx/82xx/83xx/86xx"
>   PPC_85xx: "Freescale 85xx"
>   PPC_8xx: "Freescale 8xx"
>   40x: "AMCC 40x"
>   44x: "AMCC 44x, 46x or 47x"
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Add allmodconfig for all 32-bit sub-arches
      https://git.kernel.org/powerpc/c/af1ebca503f4c5bb9345dd251faaa825431ce972

cheers
