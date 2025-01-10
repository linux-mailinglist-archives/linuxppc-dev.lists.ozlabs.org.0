Return-Path: <linuxppc-dev+bounces-4976-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE646A092C3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 14:59:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV3F630Pjz3cW8;
	Sat, 11 Jan 2025 00:59:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736517594;
	cv=none; b=l6AfUdXzlsexT28pTK2U5PBERxMdlp54ntTlDDEIgxcmq3TjXUGmhYja6UWzpB2PIQxhpO2l3JT+MgDgcxsVEyMG+AnYLG+TxZyKEuN6xZkrpqK3fkLoQYgn6T912mL6QbeFLyQ2Q2M+oyhgvjrLeZsRRqO0X49Fg3MiPQqhDDiBLbrTKxnAUSk8kH9xKF8lt+4rDHHbYSu39lhz5rIfA99D+4loZ2+vCK29q5Xn2fOGtB+N+AMrYHBVQPvc2/1ePu2Woq5vzqpQvbaAIlFc/H5nLw2p98VZBgzufaBx6tq/9zgVHT0OpQ8YFOGEbtdAp6iAVE+csBSTXHA4UGRyuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736517594; c=relaxed/relaxed;
	bh=+Ug/6vTB7MELFOq7SJi6N9Zuaz0buTEfJkNRbzfccbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G1sbNUseK5QhBJmCQHTg2WrprF+HLdk1r/iv++Qctu8mnXg4iIqW8mIVltpr90602vB5bvB0QmNIvnsbtUKibN/BJfI/3/VAR3DQDU7h3MaZwpPUgvi5zXToUt26jPmVHVCQRVeJzYY5iL49LZmmbccoEYfc1x0xz9niAZddwyXxURp2u/2BoZ2MH5hNYUnR91xtY6pSfr7fSRjgj0OdG8lEeTeFvPC27Ot0p7D75P/+k4u8M36k8d4DwgRRhhzC8Uz5w9+ze4kTcLGguXB4pwAOB4uy1y0oug9Cgr1iESSEr/Iuf5Vb2p/FOAJ/uyBIKnJFEXE32zVVJBgTeJvWgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV3F457ZYz3c6f
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 00:59:50 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C754F1477;
	Fri, 10 Jan 2025 05:59:45 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DDD93F59E;
	Fri, 10 Jan 2025 05:59:15 -0800 (PST)
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
Cc: kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	vladimir.murzin@arm.com
Subject: [kvm-unit-tests PATCH v1 0/5] arm64: Change the default --processor to max
Date: Fri, 10 Jan 2025 13:58:43 +0000
Message-ID: <20250110135848.35465-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.47.1
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

(CC'ing everyone from MAINTAINERS because I'm touching configure)

Vladimir sent a test for MTE [1], which didn't work on the default -cpu
model, cortex-a57, because that CPU didn't implement MTE. There were two
options to get it working:

1. Add -cpu max to the extra_params unittest parameter.
2. Make the default value for the configure --processor option 'max'.

We decided that the second option was preferable, so here it is.

The first patch might look unrelated, but when I was writing the function
to select the default processor based on the architecture I noticed that
for arm64, $arch is first equal to aarch64, then it gets changed to arm64.
My first instinct was to have it be arm64 from the start, but then I
realized that, despite the help text, --arch=aarch64 has been supported
ever since arm64 was added to kvm-unit-tests. So I decided that it might
more prudent to go with it and document it.

[1] https://lore.kernel.org/all/20241212103447.34593-1-vladimir.murzin@arm.com/

Alexandru Elisei (5):
  configure: Document that the architecture name 'aarch64' is also
    supported
  configure: Display the default processor for arm and arm64
  arm64: Implement the ./configure --processor option
  arm/arm64: Add support for --processor=max
  configure: arm64: Make 'max' the default for --processor

 arm/Makefile.arm    |  1 -
 arm/Makefile.common |  3 +++
 configure           | 35 ++++++++++++++++++++++++++---------
 3 files changed, 29 insertions(+), 10 deletions(-)


base-commit: 0ed2cdf3c80ee803b9150898e687e77e4d6f5db2
-- 
2.47.1


