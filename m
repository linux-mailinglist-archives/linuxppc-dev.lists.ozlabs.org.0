Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F2763D26D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:49:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMZDx1P0Wz3hB4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 20:49:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMYtm714jz3fPR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 20:34:08 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYtm49rHz4xvq;
	Wed, 30 Nov 2022 20:34:08 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Wolfram Sang <wsa@kernel.org>, Lee Jones <lee.jones@linaro.org>, Angel Iglesias <ang.iglesiasg@gmail.com>, Uwe Kleine-König <uwe@kleine-koenig.org>, Grant Likely <grant.likely@linaro.org>
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
Subject: Re: (subset) [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
Message-Id: <166980021492.3017288.12497206089279575173.b4-ty@ellerman.id.au>
Date: Wed, 30 Nov 2022 20:23:34 +1100
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 18 Nov 2022 23:35:34 +0100, Uwe Kleine-König wrote:
> since commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type") from 2016 there is a "temporary" alternative probe
> callback for i2c drivers.
> 
> This series completes all drivers to this new callback (unless I missed
> something). It's based on current next/master.
> A part of the patches depend on commit 662233731d66 ("i2c: core:
> Introduce i2c_client_get_device_id helper function"), there is a branch that
> you can pull into your tree to get it:
> 
> [...]

Applied to powerpc/next.

[289/606] macintosh: ams/ams-i2c: Convert to i2c's .probe_new()
          https://git.kernel.org/powerpc/c/8daa9c1dc9b4a3422801017ca46d935073dc14c0
[290/606] macintosh: therm_adt746x: Convert to i2c's .probe_new()
          https://git.kernel.org/powerpc/c/0424113fed923a2fcb699b5f3aa335d16e092f3d
[291/606] macintosh: therm_windtunnel: Convert to i2c's .probe_new()
          https://git.kernel.org/powerpc/c/dc9be0735c3e245fe60775307cf7842b1f9b45a2
[292/606] macintosh: windfarm_ad7417_sensor: Convert to i2c's .probe_new()
          https://git.kernel.org/powerpc/c/9d533bdf4a582f037327f1a38ed8cf689d67cab4
[293/606] macintosh: windfarm_fcu_controls: Convert to i2c's .probe_new()
          https://git.kernel.org/powerpc/c/472e4c61d2bb4977ade8e2491953954bf9723563
[294/606] macintosh: windfarm_lm75_sensor: Convert to i2c's .probe_new()
          https://git.kernel.org/powerpc/c/51a9e1755cdd8b127191030d15b74b97f7d3ce75
[295/606] macintosh: windfarm_lm87_sensor: Convert to i2c's .probe_new()
          https://git.kernel.org/powerpc/c/0e2211b3373ea718d2161bcc360cd4d9a3bcebc6
[296/606] macintosh: windfarm_max6690_sensor: Convert to i2c's .probe_new()
          https://git.kernel.org/powerpc/c/2d7a9d780444c8f31ee6af522a92a99492d9eeb2
[297/606] macintosh: windfarm_smu_sat: Convert to i2c's .probe_new()
          https://git.kernel.org/powerpc/c/d05921a09a5a72805a1d669dce0fcbd66df86237

cheers
