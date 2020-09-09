Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BB926306F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 17:23:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bmm4235DmzDqNJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 01:22:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjkR3mlrzDqFh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:37:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjkP4f7pz9sV5; Wed,  9 Sep 2020 23:37:33 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: alexandre.belloni@bootlin.com, robh+dt@kernel.org, a.zummo@towertech.it,
 mpe@ellerman.id.au, leoyang.li@nxp.com, benh@kernel.crashing.org,
 Biwen Li <biwen.li@oss.nxp.com>
In-Reply-To: <20200527034228.23793-1-biwen.li@oss.nxp.com>
References: <20200527034228.23793-1-biwen.li@oss.nxp.com>
Subject: Re: [v3 1/2] dts: ppc: t4240rdb: remove interrupts property
Message-Id: <159965824243.811679.11439322992907877530.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:37:33 +1000 (AEST)
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Biwen Li <biwen.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 27 May 2020 11:42:27 +0800, Biwen Li wrote:
> Since the interrupt pin for RTC DS1374 is not connected
> to the CPU on T4240RDB, remove the interrupt property
> from the device tree.
> 
> This also fix the following warning for hwclock.util-linux:
> $ hwclock.util-linux
> hwclock.util-linux: select() to /dev/rtc0
> to wait for clock tick timed out

Applied to powerpc/next.

[1/2] powerpc/dts/t4240rdb: remove interrupts property
      https://git.kernel.org/powerpc/c/8c7614d648037b0776e0b76cb62911be3b059ea4
[2/2] powerc/dtc/t1024rdb: remove interrupts property
      https://git.kernel.org/powerpc/c/843dc8ee23d1b353fa9cc24da3e52be0111d5931

cheers
