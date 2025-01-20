Return-Path: <linuxppc-dev+bounces-5417-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E825A17093
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 17:46:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQn0nWMz30VF;
	Tue, 21 Jan 2025 03:44:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737391489;
	cv=none; b=RmD52k1ushAlbRiTg9c78DbYb8o00ucuGlBYvNx6iE4MxuSrdvUDvYGSpqDsUkikKYgGu8grhbnRNDYCVVYwOZqzY1zApgFVbJk0d4mGwiMrk3W807MY5vuJc92peWnqnwK8F2Ix3YybGuOq3uvNOfBWhYX/pKDGOaPR5U4d+TM4cmk+xG0tr7hD9t2+8JCJgEpyW8rpqIaSWtCs3sBbzROSSeTwSi6yNvdcYlTvuPrauMOF2cJc+lasPJiMNU5bHvLb237MGJAow5a4TSu/TmtR9SHlGpgu4nZButgkXaVD+5ufyAB6VRIcjBaAImQYzqDBvozCLLs8lY2evPCC0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737391489; c=relaxed/relaxed;
	bh=mp/DRl22NURufWFi9wHD7BC1kcf3HXxorapZ64p6mqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LqjG4D3+vP/JvDdD0ss79jL3VcPFtUaPo/Hi2s0Sjuw7JK2Q2BepO63c3lqPeIk3lCy7LaR86tMvF3P24WXZU2ryKL4Cv5U7LwdTp139P36Fe0yrR1uEJ6870xVrAa1pXiHkZjVC7uuUomI7FLLgVe4WSuh6hScOlpRNGkCGWev3sT5NY4xjJ0fwq4WFtm8eqXxA3TLfw3AB9aP4pnd4oEnsTunKvplhEdFeQR6sQyTwrr8dIx2VH7ldLRfCRyts9I0xPDJ4FjbrA2v8Gp8KYJa2Nk0b8SYVZiSrhRa/VdkK3A3oGjkeEHhfSkTk+BcTbuiffrE0rZsrae4GVfVBVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQm53vpz30Pp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 03:44:48 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19A1D106F;
	Mon, 20 Jan 2025 08:44:46 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A9683F5A1;
	Mon, 20 Jan 2025 08:44:14 -0800 (PST)
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
Subject: [kvm-unit-tests PATCH v2 13/18] run_tests: Do not probe for maximum number of VCPUs when using kvmtool
Date: Mon, 20 Jan 2025 16:43:11 +0000
Message-ID: <20250120164316.31473-14-alexandru.elisei@arm.com>
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

The --probe-maxsmp parameter updates MAX_SMP with the maximum number of
VCPUs that the host supports. Qemu will exit with an error when creating a
virtual machine if the number of VCPUs is exceeded.

kvmtool behaves differently: it will automatically limit the number of
VCPUs to the what KVM supports, which is exactly what --probe-maxsmp wants
to achieve. When doing --probe-maxsmp with kvmtool, print a message
explaining why it's redundant and don't do anything else.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 run_tests.sh | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/run_tests.sh b/run_tests.sh
index 61480d0c05ed..acaaadbb879b 100755
--- a/run_tests.sh
+++ b/run_tests.sh
@@ -89,7 +89,15 @@ while [ $# -gt 0 ]; do
             list_tests="yes"
             ;;
         --probe-maxsmp)
-            probe_maxsmp
+            case "$TARGET" in
+            qemu)
+                probe_maxsmp
+                ;;
+            kvmtool)
+                echo "kvmtool automatically limits the number of VCPUs to maximum supported"
+                echo "The 'smp' test parameter won't be modified"
+                ;;
+            esac
             ;;
         --)
             ;;
-- 
2.47.1


