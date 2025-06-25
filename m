Return-Path: <linuxppc-dev+bounces-9763-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 536ACAE887C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 17:44:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS5jQ3gV5z30RJ;
	Thu, 26 Jun 2025 01:44:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750866282;
	cv=none; b=SWxDi7XBdciKWMTN131QouoxKGnIq8ln+gE/ZjoObzUqyhCcsyCUz2gWOApUnuCgojRO/c2RkNQONTtA1mE5GAHESZVSrN4xohoVTpwsZrjiKy0argjvVRWcInTJJfrrfwz+qvnCTbO2bmDnH1/7yDADPiGJfVlUJUF+Z4Ovrm2KSdDL6tAdwR4YYhuH7NJudGkXucEMEjwfQBdVeHSZZ6NBWLqPiLSFv6HJZ+dms7PltwH5bjtv3ZYFLYZkFKO/cWn2Iv4mwNAdw+k57ZAVCvFemrW+RccdGPQBogz1ig9CMIIgIW/VCUHUlxkj/juXgA8CP0Tqa7EEM3nA0VytcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750866282; c=relaxed/relaxed;
	bh=oc9oMZflDLqRt2WHpR0PGrjXI+TE9UjVwSaDm+4x84A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=DxeAFNTbzgIMkccZJFJJbIma7i/R36g43RpLrfE01yXl54T4Y/FL7A7NZ5ghcWajrONE8dgvSbwR2FH3lpeRtyNnf8z2l8tlXmxPv9nLK+JMmnxT0CRVcyKafN7Yk63cqnc207c1GQt6YytsJdp39Yz1XLi6yZRMMQ5BkJP6OqitNP2Mmepb+ZD2VoNy/soDDPFrLyttwl5b0jxsxPKr01Ow7gWYYXivIvCBMJz5lHgvxMYx7L9MfoHhg1wZETWBtSQwS5tMS1aRylFymeQl2QEpVGMfXsILj6svjvfkBldbXUP37y5QIiPuTGUVW5m5HshdPvq+zDesS/1FdoCN5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS5jP3Ykjz2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 01:44:39 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B91E106F;
	Wed, 25 Jun 2025 08:43:48 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C26323F58B;
	Wed, 25 Jun 2025 08:44:03 -0700 (PDT)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: kvm@vger.kernel.org,
	andrew.jones@linux.dev,
	lvivier@redhat.com,
	thuth@redhat.com,
	frankja@linux.ibm.com,
	imbrenda@linux.ibm.com,
	nrb@linux.ibm.com,
	pbonzini@redhat.com,
	alexandru.elisei@arm.com,
	eric.auger@redhat.com,
	kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	david@redhat.com,
	linux-s390@vger.kernel.org
Subject: [kvm-unit-tests PATCH 0/2] scripts: extra_params rework
Date: Wed, 25 Jun 2025 16:43:52 +0100
Message-ID: <20250625154354.27015-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.50.0
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

This series was split from the series that adds support to use kvmtool when
using the scripts to run the tests [1]. kvmtool will be supported only for arm
and arm64, as they are the only architectures that compile the tests to run with
kvmtool.

The justification for these changes is to be able to introduce
kvmtool_params for kvmtool specific command line options, and to make a
clear distinction between the qemu options and the kvmtool options. This is
why qemu_params was added as a replacement for extra_params. extra_params
was kept for compatibility purposes for user's custom test definitions.

To avoid duplication of the arguments that are passed to a test's main()
function, test_args has been split from qemu_params. The same test_args
will be used by both qemu and kvmtool.

[1] https://lore.kernel.org/kvm/20250507151256.167769-1-alexandru.elisei@arm.com/

Alexandru Elisei (2):
  scripts: unittests.cfg: Rename 'extra_params' to 'qemu_params'
  scripts: Add 'test_args' test definition parameter

 arm/unittests.cfg     |  94 ++++++++++++++----------
 docs/unittests.txt    |  30 +++++---
 powerpc/unittests.cfg |  21 +++---
 riscv/unittests.cfg   |   2 +-
 s390x/unittests.cfg   |  53 +++++++-------
 scripts/common.bash   |  16 +++--
 scripts/runtime.bash  |  24 ++++---
 x86/unittests.cfg     | 164 ++++++++++++++++++++++++------------------
 8 files changed, 237 insertions(+), 167 deletions(-)


base-commit: 507612326c9417b6330b91f7931678a4c6866395
-- 
2.50.0


