Return-Path: <linuxppc-dev+bounces-8677-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF9CABC9CE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 23:36:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1WGv0zt0z2ymg;
	Tue, 20 May 2025 07:36:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747690615;
	cv=none; b=hKEcGJrTPyc9dk3lG+B7wc28DTagrX1QnbO8rqeDEMKl1muAcNysLEneE1YbaTQcSzBoRHsjUruQMiHZ8NUrMjnf+aXqMuvyJxsOxKot/wRDtTZEhlgxfr8+mYedUplIlgXMbhJ5G9oGnTHJx+JBJNn2xjQT24wMhp+j5UorEYxLS3qR3/HNiR9TwmxV0fJcohJH51SA1q8lIzFOo6FObLI4dQoThz8PRQZZ01VwVRSA9da7Tq0iVqhv+LDkYEKAyV7jcna44adwG7pU7VPg1RunGQB1s9j6In1+FGcjpOqUvslISITsSGB3cv7K855sye9Ato2r3X/fCOhTrUvuHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747690615; c=relaxed/relaxed;
	bh=vmx9hE+sO1wnTQRmRU/h+hUCEvbL1WhqwUQpgLYP6xg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QzPJ7x2AVr+RkzCJbT3aZ+5BndZk9+Bqu3u/VzIlROhDkXJhc2vCRDGJkhbyM72sXJcSqElzI5oFfbAEI6RSiAufIbJvyGzyHOTyoeK9NQd7UpnEy2HSiwBKRW64H7UGigxm7IuAasOhNRNGRbEGia4MuIQf/JZmvn+OEvOosQuzgYkXtEUS2t2Gahty+Tne9/9oi7Gh10ZlC8xum5kEle8vPIRDvAoTMiIRV+L1tQxoY0GLsGZAbaPKkeEfBNdtf+XsNfLaUs2c3tBu8X8i6EbVRbp4AJvCz9t/mPhtfjCVMoJ0e7cObVg9gDBVZK4Uvb88AaOuYla5D0gMx4u/nw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dD/alx/9; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dD/alx/9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1WGs6c3pz2yhV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 07:36:53 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 697455C55B8;
	Mon, 19 May 2025 21:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17725C4CEE9;
	Mon, 19 May 2025 21:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747690610;
	bh=lBvl18LaQT+t/CXp3Ntta7x6/KSCyUwxhyyopGai6uQ=;
	h=From:To:Cc:Subject:Date:From;
	b=dD/alx/9EyoI+LMRQbvbxI4Sy1XdxACArzosYw1zQvMczIvgYvmog5PH2i0Jcczh0
	 UoRzP7Q+sEAMiG5VPG6IrFd1ver77ke/Rae2FQrAH2VtYZlrn2LL4phpvOCbquhNvD
	 VcTDYu+JHgKjOrjHY3Bc4goGN3Na6xqarBfneBwMsOcnLHFQNraqmIDeJ6DF1HAObQ
	 BWYEhOyr7TeUwPRdm8JVEaO4vskMbW20ivYTqNFeGbjlN3X+a9TUuVFvYdkAgrhoQ3
	 SopSTEV0eIL8CrzU3vqFCtpZVoUhkz7TN2eyGGfUKJzTzUeC8bxE+CvCzYCv2G1ymD
	 jzqSkM/vVWRtw==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Cc: Jon Pan-Doh <pandoh@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Martin Petersen <martin.petersen@oracle.com>,
	Ben Fuller <ben.fuller@oracle.com>,
	Drew Walton <drewwalton@microsoft.com>,
	Anil Agrawal <anilagrawal@meta.com>,
	Tony Luck <tony.luck@intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sargun Dhillon <sargun@meta.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	Keith Busch <kbusch@kernel.org>,
	Robert Richter <rrichter@amd.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v6 00/16] Rate limit AER logs
Date: Mon, 19 May 2025 16:35:42 -0500
Message-ID: <20250519213603.1257897-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bjorn Helgaas <bhelgaas@google.com>

This work is mostly due to Jon Pan-Doh and Karolina Stolarek.  I rebased
this to v6.15-rc1, factored out some of the trace and statistics updates,
and added some minor cleanups.

Proposal
========

When using native AER, spammy devices can flood kernel logs with AER errors
and slow/stall execution. Add per-device per-error-severity ratelimits for
more robust error logging. Allow userspace to configure ratelimits via
sysfs knobs.

Motivation
==========

Inconsistent PCIe error handling, exacerbated at datacenter scale (myriad
of devices), affects repairabilitiy flows for fleet operators.

Exposing PCIe errors/debug info in-band for a userspace daemon (e.g.
rasdaemon) to collect/pass on to repairability services will allow for more
predictable repair flows and decrease machine downtime.

Background
==========

AER error spam has been observed many times, both publicly (e.g. [1], [2],
[3]) and privately. While it usually occurs with correctable errors, it can
happen with uncorrectable errors (e.g. during new HW bringup).

There have been previous attempts to add ratelimits to AER logs ([4], [5]).
The most recent attempt[5] has many similarities with the proposed
approach.


v6:
- Rebase to v6.15-rc1
- Initialize struct aer_err_info completely before using it
- Log DPC Error Source ID only when it's valid
- Consolidate AER Error Source ID logging to one place
- Tidy Error Source ID bus/dev/fn decoding using macros
- Rename aer_print_port_info() to aer_print_source()
- Consolidate trace events and statistic updates to one non-ratelimited place
- Save log level in struct aer_err_info instead of passing as parameter
v5: https://lore.kernel.org/r/20250321015806.954866-1-pandoh@google.com
- Handle multi-error AER by evaluating ratelimits once and storing result
- Reword/rename commit messages/functions/variable
v4: https://lore.kernel.org/r/20250320082057.622983-1-pandoh@google.com
- Fix bug where trace not emitted with malformed aer_err_info
- Extend ratelimit to malformed aer_err_info
- Update commit messages with patch motivation
- Squash AER sysfs filename change (Patch 8)
v3: https://lore.kernel.org/r/20250319084050.366718-1-pandoh@google.com
- Ratelimit aer_print_port_info() (drop Patch 1)
- Add ratelimit enable toggle
- Move trace outside of ratelimit
- Split log level (Patch 2) into two
- More descriptive documentation/sysfs naming
v2: https://lore.kernel.org/r/20250214023543.992372-1-pandoh@google.com
- Rebased on top of pci/aer (6.14.rc-1)
- Split series into log and IRQ ratelimits (defer patch 5)
- Dropped patch 8 (Move AER sysfs)
- Added log level cleanup patch[7] from Karolina's series
- Fixed bug where dpc errors didn't increment counters
- "X callbacks suppressed" message on ratelimit release -> immediately
- Separate documentation into own patch
v1: https://lore.kernel.org/r/20250115074301.3514927-1-pandoh@google.com

[1] https://bugzilla.kernel.org/show_bug.cgi?id=215027
[2] https://bugzilla.kernel.org/show_bug.cgi?id=201517
[3] https://bugzilla.kernel.org/show_bug.cgi?id=196183
[4] https://lore.kernel.org/linux-pci/20230606035442.2886343-2-grundler@chromium.org/
[5] https://lore.kernel.org/linux-pci/cover.1736341506.git.karolina.stolarek@oracle.com/
[6]
https://lore.kernel.org/linux-pci/8bcb8c9a7b38ce3bdaca5a64fe76f08b0b337511.1742202797.git.k
arolina.stolarek@oracle.com/
[7]
https://lore.kernel.org/linux-pci/edd77011aafad4c0654358a26b4e538d0c5a321d.1736341506.git.k
arolina.stolarek@oracle.com/


Bjorn Helgaas (9):
  PCI/DPC: Initialize aer_err_info before using it
  PCI/DPC: Log Error Source ID only when valid
  PCI/AER: Consolidate Error Source ID logging in aer_print_port_info()
  PCI/AER: Extract bus/dev/fn in aer_print_port_info() with
    PCI_BUS_NUM(), etc
  PCI/AER: Move aer_print_source() earlier in file
  PCI/AER: Initialize aer_err_info before using it
  PCI/AER: Simplify pci_print_aer()
  PCI/AER: Update statistics early in logging
  PCI/AER: Combine trace_aer_event() with statistics updates

Jon Pan-Doh (4):
  PCI/AER: Rename aer_print_port_info() to aer_print_source()
  PCI/AER: Introduce ratelimit for error logs
  PCI/AER: Add ratelimits to PCI AER Documentation
  PCI/AER: Add sysfs attributes for log ratelimits

Karolina Stolarek (3):
  PCI/AER: Check log level once and remember it
  PCI/AER: Make all pci_print_aer() log levels depend on error type
  PCI/AER: Rename struct aer_stats to aer_report

 ...es-aer_stats => sysfs-bus-pci-devices-aer} |  34 ++
 Documentation/PCI/pcieaer-howto.rst           |  16 +-
 drivers/pci/pci-sysfs.c                       |   1 +
 drivers/pci/pci.h                             |   5 +-
 drivers/pci/pcie/aer.c                        | 346 ++++++++++++------
 drivers/pci/pcie/dpc.c                        |  49 ++-
 include/linux/pci.h                           |   2 +-
 7 files changed, 329 insertions(+), 124 deletions(-)
 rename Documentation/ABI/testing/{sysfs-bus-pci-devices-aer_stats => sysfs-bus-pci-devices-aer} (77%)

-- 
2.43.0


