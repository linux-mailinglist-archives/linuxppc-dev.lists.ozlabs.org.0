Return-Path: <linuxppc-dev+bounces-3526-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C34479D6DB8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Nov 2024 11:30:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xx4q620xzz2xl5;
	Sun, 24 Nov 2024 21:30:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732444226;
	cv=none; b=Dp4OHmbp/t2jK3eORhvqhee1l1hZ2+KfumtMu2ZLST6naqCp190Kg0pE/72BVzYzsY4f4vnzbtUersEiKGqwG46vDL4ri6xdC1fz7DVW85iYqiA4POWW+vptcEH0S3RYd+wGCcSdW93kSA3hpaepTnspq0WBQ4iu3fBfkr65FiQzdGoiAJG1m1z5TI3fD+jWFHvO1JZ3vmOOY8Q2BD28YTdnXgsrRWsclFAbVjq+uXONvCyKt+LftiEy4VdZBXr2Chy9Dk2/T2bsILmHvdcb+SuqBcdPan32p3RaqvWkYcWXycVay5srodSVfY1bZPaZ7bLI5IRDd+XDwyxUBRpENQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732444226; c=relaxed/relaxed;
	bh=sPRD00FdoMbZ/n35hTaA/kSHOm/Dnrk51VP0TcINavI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dlLuSvI5dn8uMdZjyLjC/o8J5eQm+ZghRiDlhBt/KxnRKYT8DRhIjuXWj7+k8BWuGHlLp1dLAqVpO6qI92HRxaAmDfKefUXKTTpC8xq/9vigIqNlOp9wvMK2o2ftPVB/pzW0iI8GaeT5X39hyYChAgzjtEtyWnGh1LWZ7iYwwuP/8vqrKn+acKhLDg+Ue/z8y0CaNMdeMUFv6cMwmMB073PgO1R8SkqEhbt/xRR0NMWq/DVauR4JOmlThaP+QPyqlxFvc56UJ/UrL3IKLHJQQmKCK77PJK08n1Tzjaa+FCXXo6exuTxAA6zJQCMFSx6CcILr8Pn/IAPtrQ6WBRhttQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SyIBlu/K; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SyIBlu/K;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xx4q33dWLz2xbL
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Nov 2024 21:30:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1732444216;
	bh=sPRD00FdoMbZ/n35hTaA/kSHOm/Dnrk51VP0TcINavI=;
	h=From:To:Cc:Subject:Date:From;
	b=SyIBlu/K3E9e7MBmBl3Bc8hsEcZEQ0ecvwznME+fEsLhCt2AMkcldJqVd7S3d0S7f
	 twPiJY3/zvuAOepK0xtcrdCzC2EOy74kR2nCM6/Ksh6PbKcQ3LWEPBYu/JcIiVVa35
	 te7mZ521WFEXEGHt8DVPpThFNp17Az0c3GPfDzlrhPJ2U7+TNHT833GOOV10FAuMVZ
	 0zdK7Tf4T4o0wwxQPIdpNf8eWACz+oW6F+ziRrV+BBg83pV3taRfLaeEC3Vdd0YEKx
	 ik2qj/DRSudLY3XZ3JSilm3WmG1o9CkShxYWWcpLhvr7gH1Qq3hW7rm0W42pRR+taH
	 PZSueYG05pJIA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xx4pw59YTz4w2L;
	Sun, 24 Nov 2024 21:30:16 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: kjain@linux.ibm.com,
	<linux-doc@vger.kernel.org>
Subject: [PATCH] docs: ABI: sysfs-bus-event_source-devices-vpa-pmu: Fix htmldocs errors
Date: Sun, 24 Nov 2024 21:30:06 +1100
Message-ID: <20241124103006.2236073-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Fix errors during `make htmldocs`, eg:

  Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-pmu:2: ERROR: Unexpected indentation.

Fixes: 4ae0b32ecee7 ("docs: ABI: sysfs-bus-event_source-devices-vpa-pmu: Document sysfs event format entries for vpa_pmu")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20241120171302.2053439c@canb.auug.org.au/
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../sysfs-bus-event_source-devices-vpa-pmu        | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-pmu b/Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-pmu
index 8285263ff78d..a116aee9709a 100644
--- a/Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-pmu
+++ b/Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-pmu
@@ -8,17 +8,18 @@ Description:    Read-only. Attribute group to describe the magic bits
                 Each attribute under this group defines a bit range of the
                 perf_event_attr.config. Supported attribute are listed
                 below::
-			event = "config:0-31" - event ID
 
-		For example::
+                  event = "config:0-31" - event ID
 
-		  l1_to_l2_lat = "event=0x1"
+                For example::
+
+                  l1_to_l2_lat = "event=0x1"
 
 What:           /sys/bus/event_source/devices/vpa_pmu/events
 Date:           November 2024
 Contact:        Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
-Description:	Read-only. Attribute group to describe performance monitoring
+Description:    Read-only. Attribute group to describe performance monitoring
                 events for the Virtual Processor Area events. Each attribute
-		in this group describes a single performance monitoring event
-		supported by vpa_pmu. The name of the file is the name of
-		the event (See ABI/testing/sysfs-bus-event_source-devices-events).
+                in this group describes a single performance monitoring event
+                supported by vpa_pmu. The name of the file is the name of
+                the event (See ABI/testing/sysfs-bus-event_source-devices-events).
-- 
2.47.0


