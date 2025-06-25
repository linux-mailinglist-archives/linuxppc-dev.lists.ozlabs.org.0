Return-Path: <linuxppc-dev+bounces-9766-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADEEAE88A0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 17:49:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS5pL6djzz30T8;
	Thu, 26 Jun 2025 01:48:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750866538;
	cv=none; b=QL7viFIZ7gVbzhn0TWoDnSikOf0x0q2Stz1GgN9koLXS8O8TzsBA2CAple9yBuqhCWY5cwS73EAO45rmyv82vn2m181pzNqFLIkRWWNgldJ1oracpC676SWunQqvXzyUNdnt/45rRn69muXmz90/0z2rNFyoNNfw842UmGHa+6bL+26RiyXtan24M4+lVWRjXf10wnBN1NkBBsdzXkm3B1/RcK3puQ9Q975qgeM/LTfwQjOdEkDT5N+ddcegKfz5b3aBWf5A2+C6ye6RfjL0wkeuCkMAoRhoNyqshxdPCmllMD0eh0//hwFHazO5dvnq6agS2v8hA5pDWQV45qniTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750866538; c=relaxed/relaxed;
	bh=YJ5X620mIR2UsWum4REPZZ5Or5s1clIGvCFMza+gQ8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bliG/AmxrhZoP1DPFCAxC2rPwN+lki4x555z2E0V8vWxOzFr+K4+QRLpmoxSpijsCF6/rRR+vWB3NHGq+wsDKveIs3I/xWSePlBXs1mSlWXxZsTEHeNXK3Jy2vJNHX0jIR4cKJa0LbafzFLVkpGS6iPTelfNw9G2MApdoDaE2zUiJozoRoIJLRLENjSYtigxbdk8J8uZkKzFfLVzeUFSwvSi4oiwArOQL3wtXYBf+knwbvja8ufkCcJqUwRmiRKe1ScQmyLHQWDqdSGomiIAH/NqnbEqd1vJk6WgVGRs4LFBhAHvgqxftJZgI1rpjIfBj9xNTeVtBWlgNKdaLAtyrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS5pK0HQsz30T3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 01:48:56 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DC711A2D;
	Wed, 25 Jun 2025 08:48:07 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 346E33F58B;
	Wed, 25 Jun 2025 08:48:21 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v4 00/13] arm/arm64: Add kvmtool to the runner script
Date: Wed, 25 Jun 2025 16:48:00 +0100
Message-ID: <20250625154813.27254-1-alexandru.elisei@arm.com>
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

v3 can be found here [1]. Based on top of the series that add qemu_params and
test_args [2].

To goal is to allow the user to do:

$ ./configure --target=kvmtool
$ make clean && make
$ ./run_tests.sh

to run all the tests automatically with kvmtool.

Reasons to use kvmtool:

* kvmtool is smaller and a lot easier to modify compared to qemu, which
means developers may prefer it when adding or prototyping new features to
KVM, and being able to run all the tests reliably and automatically is very
useful.

* kvmtool is faster to run the tests (a couple of times faster on
my rockpro64), making for a quick turnaround. But do keep in mind that not
all tests work on kvmtool because of missing features compared to qemu.

* kvmtool does things differently than qemu: different memory layout,
different uart, PMU emulation is disabled by default, etc. This makes it a
good testing vehicule for kvm-unit-tests itself.

Changes v3->v4
--------------

Overview of the changes:

* Gathered Reviewed-by tags - thanks for the review!

* Sent patches #1 ("scripts: unittests.cfg: Rename 'extra_params' to
'qemu_params'") and #2 ("scripts: Add 'test_args' test definition parameter")
as a separate series.

* Fixed the typos reported during the review.

* Ran shellcheck on the patches, this resulted in minor changes.

* Dropped patch "configure: Export TARGET unconditionally" - now the functions
in vmm.bash will check if TARGET is set, instead of having the other scripts use
$TARGET to directly index the vmm_opts array.

* Direct reads of $TARGET have been replaced with vmm_get_target(), to account
for the fact that most architectures don't configure $TARGET (only arm and
arm64 do that).

* Renamed check_vmm_supported() to vmm_check_supported() to match the
function names introduced in subsequent patches.

* Renamed vmm_opts->vmm_optname to match the new function names.

* Reordered the key-value pairs from vmm_optname in alphabetical order.

* Use the "," separator for the composite keys of the associative array instead
of ":" (don't remember why I originally settled on ":", but it was a really poor
choice).

* Dropped the Reviewed-by tags from Drew and Shaoqin Huang from patch #6
("scripts: Use an associative array for qemu argument names") - the review is
much appreciated, but the way the vmm_opts array (now renamed to vmm_optname) is
created, and used, has changed, and since the patch is about introducing the
associative array, I thought it would be useful to have another round of review.

* Use functions instead of indexing vmm_opts (now vmm_optname) directly.

* Fixed standalone test generation by removing 'source vmm.bash' from
scripts/arch-run.bash, $arch/run and scripts/runtime, and having
scripts/mkstandalone.sh::generate_test() copy it directly in the final test
script. Didn't catch that during the previous iterations because I was
running the standalone tests from the top level source directory, and
"source scripts/vmm.bash" happened to work.

More details in the changelog for the modified patches.

[1] https://lore.kernel.org/kvm/20250507151256.167769-1-alexandru.elisei@arm.com/
[2] https://lore.kernel.org/kvm/20250625154354.27015-1-alexandru.elisei@arm.com/

Alexandru Elisei (13):
  run_tests.sh: Document --probe-maxsmp argument
  scripts: Document environment variables
  scripts: Refuse to run the tests if not configured for qemu
  scripts: Use an associative array for qemu argument names
  scripts: Add 'kvmtool_params' to test definition
  scripts: Add support for kvmtool
  scripts: Add default arguments for kvmtool
  scripts: Add KVMTOOL environment variable for kvmtool binary path
  scripts: Detect kvmtool failure in premature_failure()
  scripts: Do not probe for maximum number of VCPUs when using kvmtool
  scripts/mkstandalone: Export $TARGET
  scripts: Add 'disabled_if' test definition parameter for kvmtool to
    use
  scripts: Enable kvmtool

 README.md               |  18 +++-
 arm/efi/run             |   8 ++
 arm/run                 | 161 ++++++++++++++++-----------
 arm/unittests.cfg       |  31 ++++++
 configure               |   1 -
 docs/unittests.txt      |  26 ++++-
 powerpc/run             |   5 +-
 riscv/run               |   5 +-
 run_tests.sh            |  35 +++---
 s390x/run               |   3 +-
 scripts/arch-run.bash   | 112 +++++++------------
 scripts/common.bash     |  30 ++++--
 scripts/mkstandalone.sh |   8 +-
 scripts/runtime.bash    |  35 ++----
 scripts/vmm.bash        | 234 ++++++++++++++++++++++++++++++++++++++++
 x86/run                 |   5 +-
 16 files changed, 525 insertions(+), 192 deletions(-)
 create mode 100644 scripts/vmm.bash

-- 
2.50.0


