Return-Path: <linuxppc-dev+bounces-9777-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC2DAE88BE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 17:50:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS5qL2xfwz3bnB;
	Thu, 26 Jun 2025 01:49:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750866590;
	cv=none; b=H2VFzRU7giqdttXQK0fPr70RlGGUGqtcrCaQZfCi6u3HnX6fweLc0VbqXG3t0miLJL8Z1i3NeWEQVQ7FnOQ5nSiBsYlyVVkWDKsKlwYrQZcctLFGeQ94lE2CtZ1MSTOwc6SaQkYZd3vLoSd1flgts0+fXd6KlK1XHH+qKQT350CwZH1lty+bQVhrZzQ5VJ7BZtX/IZJwNygMTxOt+vTJu6pmLbb+FN4WLccbCHg5vBlyL32YzUuRsW9BRGF0vNJKy7DFdlF4ozHOMI/sOnpOws2oxOGspL3IATvh4VkdnbXDNzyXiEe+8FOWH6cpZRgIhLgisiThvkvHpMjIP4hYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750866590; c=relaxed/relaxed;
	bh=hyP35AHLlZK16fxb/xxWNlA7M0z2CNNXLXncW6UM7BU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z7a6ou/SQea1gvDifH3CR7I2Sr0z0Wyw8chIlRvVSlV7wDPcAg/T1VeX2WGykaFO/UdqhtJaXeQoFoBkMYQ1LBeWXZqCdopC0rD83j3OuJuBUCgDW4GouHYoyllri3qwJU4HAn2b2Enb6ZXObCEMigZgU2nQVGLSZlsVZiTAvEJxVzj6wxnKEIWzLYkqys1vmPAhhN7+Z60Q0OlxjRMXjN3LBuX7nmxOAmfhzzipUhX3mJaLENoe8dwJuZj+dHzUCj04rGdQCn2bMQGyuSWssw6t0XQjUaXOaoU/K2ebmj0k/AOOYjrbf+NF7HTqShSsB+39pRVbkT5jSPHtB+CSJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS5qK6HL6z3bn4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 01:49:49 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE1A32680;
	Wed, 25 Jun 2025 08:49:00 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D6E13F58B;
	Wed, 25 Jun 2025 08:49:14 -0700 (PDT)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: andrew.jones@linux.dev,
	eric.auger@redhat.com,
	lvivier@redhat.com,
	thuth@redhat.com,
	frankja@linux.ibm.com,
	imbrenda@linux.ibm.com,
	nrb@linux.ibm.com,
	david@redhat.com,
	pbonzini@redhat.com
Cc: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	will@kernel.org,
	julien.thierry.kdev@gmail.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	joey.gouly@arm.com,
	andre.przywara@arm.com,
	shahuang@redhat.com
Subject: [kvm-unit-tests PATCH v4 11/13] scripts/mkstandalone: Export $TARGET
Date: Wed, 25 Jun 2025 16:48:11 +0100
Message-ID: <20250625154813.27254-12-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625154813.27254-1-alexandru.elisei@arm.com>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

$TARGET is needed for the test runner to decide if it should use qemu or
kvmtool, so export it.

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 scripts/mkstandalone.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
index ebf425564af5..5a23bb59879e 100755
--- a/scripts/mkstandalone.sh
+++ b/scripts/mkstandalone.sh
@@ -47,6 +47,7 @@ generate_test ()
 	config_export ARCH_NAME
 	config_export TARGET_CPU
 	config_export DEFAULT_QEMU_CPU
+	config_export TARGET
 
 	echo "echo BUILD_HEAD=$(cat build-head)"
 
-- 
2.50.0


