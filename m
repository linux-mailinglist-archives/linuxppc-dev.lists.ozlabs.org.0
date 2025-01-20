Return-Path: <linuxppc-dev+bounces-5411-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C458A17082
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 17:45:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQd1Hdyz30Sy;
	Tue, 21 Jan 2025 03:44:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737391481;
	cv=none; b=i6Hpg1n7BmyO0O7jSYblkAhokDyTW14CqHM+O/BtaL6syH34aUmTE9V6EszJXkvLidLUuquS6TUTeb6UNoIgKxGRWappe/Ho9LWX+R9iN1RqCb6q7pSJSZci+LYZ/Ct+lx7PKILZ8g5Cigr6tVhP06HsqdUISW0ScNeXq/MHTrbfpGiqriZqgo6hGajeD0Ox7nUm/erLViDKm5by4I5/vD446B7d9IIR3iUEYcUtjF+EHclUlbNozL4/fkeSvGdcDYoFvJ+6zd0N1pcdkDfTO5naoHKdcRwWi0mjvE+uUgwAWafYbTJ0gOh7ADhcnL3A6Rr6d41gWghjM04VhKIXyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737391481; c=relaxed/relaxed;
	bh=XJm+I6g3cMVwztffuBYJ3HkX6dwXgMIWllBhLbpLfes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZKyQvxoSnM/PPUWVA286V17sHgem9nqitaLGTrksTKE51pqC00Zt1StCsEb5ENj9vTxfo35LFF3jAfvozZw5VF7cY1+hnNtg9jrk8S9SvLxs1qcrU5dtC7z7Dy6UhnFXm4LhEg1YR5dPEY94+M4octa2zFLU2n8e2z1YNIsx/vHI49uEqpGJYVRC4ns0viSZWK6InU3Rn+Phe8ViPzbzDZvtDHRUR0lKHiX4rRUdUUFOOYXwUYuKWFZnqHg6wNNgy4AVFEiEFjqGZsz7riESvtfYL5TzxK9ocGR52Dn4M3ln4w3Abgz+7G8Jm3XalFIINmr7n6Ug2vczoXRyjtQvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQb3t0Lz30P3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 03:44:39 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB8FF1D31;
	Mon, 20 Jan 2025 08:44:56 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 080883F5A1;
	Mon, 20 Jan 2025 08:44:24 -0800 (PST)
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
	andre.przywara@arm.com
Subject: [kvm-unit-tests PATCH v2 16/18] scripts/mkstandalone: Export $TARGET
Date: Mon, 20 Jan 2025 16:43:14 +0000
Message-ID: <20250120164316.31473-17-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250120164316.31473-1-alexandru.elisei@arm.com>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
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
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

$TARGET is needed for the test runner to decide if it should use qemu or
kvmtool, so export it.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 scripts/mkstandalone.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
index 4de97056e641..10abb5e191b7 100755
--- a/scripts/mkstandalone.sh
+++ b/scripts/mkstandalone.sh
@@ -51,6 +51,7 @@ generate_test ()
 	config_export ARCH
 	config_export ARCH_NAME
 	config_export PROCESSOR
+	config_export TARGET
 
 	echo "echo BUILD_HEAD=$(cat build-head)"
 
-- 
2.47.1


