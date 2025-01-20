Return-Path: <linuxppc-dev+bounces-5402-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F22A17065
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 17:44:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGPz4gtjz2yvj;
	Tue, 21 Jan 2025 03:44:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737391447;
	cv=none; b=PrDkM9IYliVcQ3pECtt7hT6OngfDQbOupKi94HbadnFsFUenMQxrxpVRd4GQoDlwILqYbAVesZLtkeOZhy3Ki9A7At1C5ybESNVwN4NktXKM1/R+puE62ubCGKwXcPTynGpkQy53Il6VuAiTvRKpzMSfIz+cMa3ABqt5fQOCm0PN7JotiIm5CGmm8Y0ELFqbq4yJQGYoyPJZSzHtRBt4tZhgMvXHPPfzsBbcyyJS5ZuGHZBEEpOJPP2Vs04Alniq5AZV3IU53KaAhyvnxg+oUYup29YUx9OI4jSYYQmq30vP+4fro9NHzG4d6RuGiQxaAEAi3rF97Or2nTx2qczLww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737391447; c=relaxed/relaxed;
	bh=K1Rarx//W6aTN5tT5MRI2OkYb1S/SbpxrhF7OY4kQTc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Am7vG72QEm25zqi+agqcGbD2alIwAAauCSfdWq4Ty1UL6OsEpuoZ65iHMEdydxhBgegPZZWDbt6QyBVWkl/NdOaeC0SpOTHRghFsNQnWh4e7bhFVakEOrbyvRbDRxwSf37tDFvRhLXaW5OqakfL6t4s34/2tztGVuHzwgqNREMbvPGryLDIwP9qk++TlZ+tZ/UU+L6Rn9+4pvesLO0cHN9n5jCcZurXurDs5TQxnnImzwkliZ8k1/Y6+LluUhCez8RSQRnliTkn93AdnEzT+FKy7TV2WCcbhFnhQ7wJTeagx6fByDLSwUliJWSM7ArC8r06Tigsm7qr4KGAZXdjMzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGPy16T2z2ydQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 03:44:04 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5758FEC;
	Mon, 20 Jan 2025 08:44:00 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 081F73F5A1;
	Mon, 20 Jan 2025 08:43:28 -0800 (PST)
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
Subject: [kvm-unit-tests PATCH v2 00/18] arm/arm64: Add kvmtool to the runner script
Date: Mon, 20 Jan 2025 16:42:58 +0000
Message-ID: <20250120164316.31473-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.48.1
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

Finally got fed up with manually running a test with kvmtool, so I've
decided to send v2 of the series [1] that adds kvmtool support to
run_tests.sh. The series has significantly more patches now, but that's
mostly because I split a large patch into several smaller ones (as per
Andre's suggestion), which I hope will make reviewing easier. Because of
this I removed two Reviewed-by tags from Drew and Thomas Huth - your review
is much appreciated!

To goal is to have an user do:

$ ./configure --target=kvmtool
$ make clean && make
$ ./run_tests.sh

to run all the tests automatically with kvmtool.

Reasons to use kvmtool:

* kvmtool is smaller and a lot easier to hack than qemu, which means
developers may prefer it when adding or prototyping new features to KVM.
Being able to run all the tests reliably and automatically is very useful
in the development process.

* kvmtool is faster to run the tests (a couple of times faster on
my rockpro64), making for a quick turnaround. But do keep in mind that not
all tests work on kvmtool because of missing features compared to qemu.

* kvmtool does things differently than qemu: different memory layout,
different uart, PMU emulation is disabled by default, etc. This makes it a
good testing vehicule for kvm-unit-tests itself.

The series has been rewritten since v1 [1]. This is a brief overview of the
major changes:

* Split into smaller patches.
* Document environment variables and --probe-maxsmp options.
* New unittest parameter, qemu_params, to replace extra_params going
forward (extra_params has been kept for compatibility)
* New unittest parameter, kvmtool_params, for kvmtool specific arguments
needed to run a test.
* New unittest parameter, disabled_if, to disable a test that cannot run
under kvmtool.

I would very much like more input regarding disabled_if. Allows all sorts
of combinations, like:

[ "$TARGET" = kvmtool ] && ([ -z "$CONFIG_EFI" ] || [ "$CONFIG_EFI" = n ])

and that's because it's evaluated as-is in a bash if statement - might have
security implications. I could have just added something like
supported_vmms, but I thought the current approach looks more flexible.
Although that might just be premature optimization.

There's only one limitation as far as I know - UEFI tests don't work. I
tried to run a .efi test with kvmtool manually, but kvmtool froze and I
didn't get any output. I am not familiar with EDK2, so I thought I can send
the this series and get feedback on it while I make time to figure out what
is going on - it might be something with kvm-unit-tests, EDK2, kvmtool, or
a combination of them. And I don't think UEFI support is very important at
the moment, no distro ships a EDK2 binary compiled for kvmtool so I don't
think there would be many users for it.

[1] https://lore.kernel.org/kvm/20210702163122.96110-1-alexandru.elisei@arm.com/

Please review,
Alex

Alexandru Elisei (18):
  run_tests: Document --probe-maxsmp argument
  Document environment variables
  scripts: Refuse to run the tests if not configured for qemu
  run_tests: Introduce unittest parameter 'qemu_params'
  scripts: Rename run_qemu_status -> run_test_status
  scripts: Merge the qemu parameter -smp into $qemu_opts
  scripts: Introduce kvmtool_opts
  scripts/runtime: Detect kvmtool failure in premature_failure()
  scripts/runtime: Skip test when kvmtool and $accel is not KVM
  scripts/arch-run: Add support for kvmtool
  arm/run: Add support for kvmtool
  scripts/runtime: Add default arguments for kvmtool
  run_tests: Do not probe for maximum number of VCPUs when using kvmtool
  run_tests: Add KVMTOOL environment variable for kvmtool binary path
  Add kvmtool_params to test specification
  scripts/mkstandalone: Export $TARGET
  unittest: Add disabled_if parameter and use it for kvmtool
  run_tests: Enable kvmtool

 arm/efi/run             |   8 ++
 arm/run                 | 164 +++++++++++++++++++++++++---------------
 arm/unittests.cfg       |  34 +++++++++
 docs/unittests.txt      |  43 +++++++++--
 powerpc/run             |   2 +-
 riscv/run               |   4 +-
 run_tests.sh            |  50 ++++++++----
 s390x/run               |   2 +-
 scripts/arch-run.bash   |  80 ++++++++++++++++++--
 scripts/common.bash     |  63 +++++++++------
 scripts/mkstandalone.sh |   9 +++
 scripts/runtime.bash    |  64 +++++++++++++---
 12 files changed, 399 insertions(+), 124 deletions(-)


base-commit: 0ed2cdf3c80ee803b9150898e687e77e4d6f5db2
-- 
2.34.1


