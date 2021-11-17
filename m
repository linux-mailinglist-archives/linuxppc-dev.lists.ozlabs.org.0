Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FB84545AA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 12:28:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvLKM28y0z3cSH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 22:28:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvLFy2XwBz30Bl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 22:25:42 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HvLFy0mFYz4xdd;
 Wed, 17 Nov 2021 22:25:42 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Scott Wood <oss@buserror.net>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20211110110739.1072634-1-u.kleine-koenig@pengutronix.de>
References: <20211110003932.51a605ef@canb.auug.org.au>
 <20211110110739.1072634-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] powerpc/83xx/mpc8349emitx: Drop unused variable
Message-Id: <163714820970.1508509.13083421770022046388.b4-ty@ellerman.id.au>
Date: Wed, 17 Nov 2021 22:23:29 +1100
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
Cc: Anders Roxell <anders.roxell@linaro.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, Paul Mackerras <paulus@samba.org>,
 kernel@pengutronix.de, Linux Kernel Functional Testing <lkft@linaro.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 10 Nov 2021 12:07:39 +0100, Uwe Kleine-König wrote:
> Commit 5d354dc35ebb ("powerpc/83xx/mpc8349emitx: Make
> mcu_gpiochip_remove() return void") removed the usage of the variable
> ret, but failed to remove the variable itself, resulting in:
> 
> 	arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c: In function ‘mcu_remove’:
> 	arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c:189:6: error: unused variable ‘ret’ [-Werror=unused-variable]
> 	  189 |  int ret;
> 	      |      ^~~
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/83xx/mpc8349emitx: Drop unused variable
      https://git.kernel.org/powerpc/c/2da516d7ed0865bf9835830907f2f6631006d628

cheers
