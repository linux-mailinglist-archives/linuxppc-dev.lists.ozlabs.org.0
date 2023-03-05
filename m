Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFF56AB0F1
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 15:11:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PV3XP0cjNz3fBk
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 01:11:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q3JpGZYW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q3JpGZYW;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PV39F5vKkz3cMR
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 00:54:25 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0721E60B21;
	Sun,  5 Mar 2023 13:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79AA3C433EF;
	Sun,  5 Mar 2023 13:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678024462;
	bh=AHZxvroEmYIa6houU/IrOk4YXJYcirNChFLpMSlmgfM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q3JpGZYW09A2Tf6E8oplijmXxL9Tkpth8qQTsHvKF881BZCx+P+Do+i7kEVAK9O7d
	 IGwK1kSk7H/Y3IOkqd2gXCXfwEzWlKzc5FD5M42pZ0cbTrEb9E7PGTRZHV+E53L5Lm
	 XI32ctVVgzC4Ij7SHRYc6NTGUF5dKk4wGwfdvaK7E3YhVDSpwYwYweExdyVrW9g5Vg
	 VrWY08LUhVa7aKe5q2/k3bv0ShoP8XaKLqpPQ8JtNKDY+DBsjl5z//ZniJqrBreiwl
	 lFTjGGsHwJwhzTLWf+/R4d8pqIWWvM5+TtKhXcZp+zyNfIgyJHtOrU3YzxoLUsDqYE
	 E51kqt2gKt4VA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 7/9] macintosh: windfarm: Use unsigned type for 1-bit bitfields
Date: Sun,  5 Mar 2023 08:53:57 -0500
Message-Id: <20230305135359.1793830-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230305135359.1793830-1-sashal@kernel.org>
References: <20230305135359.1793830-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, llvm@lists.linux.dev, gregkh@linuxfoundation.org, u.kleine-koenig@pengutronix.de, ndesaulniers@google.com, Nathan Chancellor <nathan@kernel.org>, khalasa@piap.pl, srinivas.pandruvada@linux.intel.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Chancellor <nathan@kernel.org>

[ Upstream commit 748ea32d2dbd813d3bd958117bde5191182f909a ]

Clang warns:

  drivers/macintosh/windfarm_lm75_sensor.c:63:14: error: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Werror,-Wsingle-bit-bitfield-constant-conversion]
                  lm->inited = 1;
                             ^ ~

  drivers/macintosh/windfarm_smu_sensors.c:356:19: error: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Werror,-Wsingle-bit-bitfield-constant-conversion]
                  pow->fake_volts = 1;
                                  ^ ~
  drivers/macintosh/windfarm_smu_sensors.c:368:18: error: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Werror,-Wsingle-bit-bitfield-constant-conversion]
                  pow->quadratic = 1;
                                 ^ ~

There is no bug here since no code checks the actual value of these
fields, just whether or not they are zero (boolean context), but this
can be easily fixed by switching to an unsigned type.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20230215-windfarm-wsingle-bit-bitfield-constant-conversion-v1-1-26415072e855@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/macintosh/windfarm_lm75_sensor.c | 4 ++--
 drivers/macintosh/windfarm_smu_sensors.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/macintosh/windfarm_lm75_sensor.c b/drivers/macintosh/windfarm_lm75_sensor.c
index 29f48c2028b6d..e90ad1b78e936 100644
--- a/drivers/macintosh/windfarm_lm75_sensor.c
+++ b/drivers/macintosh/windfarm_lm75_sensor.c
@@ -34,8 +34,8 @@
 #endif
 
 struct wf_lm75_sensor {
-	int			ds1775 : 1;
-	int			inited : 1;
+	unsigned int		ds1775 : 1;
+	unsigned int		inited : 1;
 	struct i2c_client	*i2c;
 	struct wf_sensor	sens;
 };
diff --git a/drivers/macintosh/windfarm_smu_sensors.c b/drivers/macintosh/windfarm_smu_sensors.c
index c8706cfb83fd8..714c1e14074ed 100644
--- a/drivers/macintosh/windfarm_smu_sensors.c
+++ b/drivers/macintosh/windfarm_smu_sensors.c
@@ -273,8 +273,8 @@ struct smu_cpu_power_sensor {
 	struct list_head	link;
 	struct wf_sensor	*volts;
 	struct wf_sensor	*amps;
-	int			fake_volts : 1;
-	int			quadratic : 1;
+	unsigned int		fake_volts : 1;
+	unsigned int		quadratic : 1;
 	struct wf_sensor	sens;
 };
 #define to_smu_cpu_power(c) container_of(c, struct smu_cpu_power_sensor, sens)
-- 
2.39.2

