Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6409295D7
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 01:15:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WGmTS4s9kz3g78
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 09:15:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WGmQ45555z3cVy
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jul 2024 09:13:00 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WGmQ41lL0z4xPf;
	Sun,  7 Jul 2024 09:13:00 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Scott Wood <oss@buserror.net>, Arnd Bergmann <arnd@arndb.de>, Jeremy Kerr <jk@ozlabs.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240615-md-powerpc-arch-powerpc-v1-1-ba4956bea47a@quicinc.com>
References: <20240615-md-powerpc-arch-powerpc-v1-1-ba4956bea47a@quicinc.com>
Subject: Re: [PATCH] powerpc: add missing MODULE_DESCRIPTION() macros
Message-Id: <172030740426.964765.16456298836722102264.b4-ty@ellerman.id.au>
Date: Sun, 07 Jul 2024 09:10:04 +1000
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
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 15 Jun 2024 10:06:18 -0700, Jeff Johnson wrote:
> With ARCH=powerpc, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/kernel/rtas_flash.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/sysdev/rtc_cmos_setup.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/platforms/pseries/papr_scm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/platforms/cell/spufs/spufs.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/platforms/cell/cbe_thermal.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/platforms/cell/cpufreq_spudemand.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/platforms/cell/cbe_powerbutton.o
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: add missing MODULE_DESCRIPTION() macros
      https://git.kernel.org/powerpc/c/9c5f64734f895528128605e2f3b170d220be086d

cheers
