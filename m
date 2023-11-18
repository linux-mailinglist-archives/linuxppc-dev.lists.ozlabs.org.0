Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 836467EFDD7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 06:18:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CaBME2UC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXMVy2r9Sz3vjw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 16:18:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CaBME2UC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXMQR5pCpz3cSq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 16:14:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B9E20CE01DC;
	Sat, 18 Nov 2023 05:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7D29C433C8;
	Sat, 18 Nov 2023 05:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700284469;
	bh=e9Ju/XtuI/yxX1VzJwg9mWUEi0MI6gctLUsH1iwDx2M=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=CaBME2UCYV6tMNSihTGNA8zTLAFkRfPQZQJqHQ8OKDnbkeGDf0PuSo/PpznINQ95N
	 NeBV+U4Yn+X/ign7Xv+0HHpfCfXBcfSml4Fc3ojQJfmTiG0Mk74/OuWRJpBzzmuTM8
	 lcvKHfcin6ZZhJv9eJmH3bLeNp8Qs0BfZcD3+okJWp8oLKDzcARbQP4l6WqNsSbg2r
	 roV5gMeNKVP5jEgJCJXbSAZovo360XsaxSeImVh64qxe8nwLeoZzWewrVMOaj29NHr
	 2DJVsctduA3gc0ZHSHWVUuNPfZVlC/0ofxNrqqT2RBchNi7ATgG855yQRISSPGwQkx
	 /BVa7J1gq2qeQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4888C2BB3F;
	Sat, 18 Nov 2023 05:14:29 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Subject: [PATCH v4 00/13] powerpc/pseries: New character devices for system
 parameters and VPD
Date: Fri, 17 Nov 2023 23:14:18 -0600
Message-Id:  <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACpIWGUC/4XO3UoDMRAF4FcpuTZlMtkkXa98DxHJz6wNtpslq
 bGl7LubLSJSZL08A/Odc2WFcqTCHjdXlqnGEtPYQvewYX5vxzfiMbTMEFDCThg+2Snzcimv+WQ
 Lr4Ufkn8P6XPkyqtOgQrO9Mja/5RpiOeb/fzS8j6WU8qXW1UVy/VbRVxRq+DAe4kapR+kN+7pE
 MeP8za649an41K0KAJA/6dIK7UbnNaEdKcs+yr+bBIg5JqGTSMbQHgCYRD/0uQvDdWaJpumyEG
 nVE8m7O61eZ6/APtvq6moAQAA
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700284468; l=5728;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=e9Ju/XtuI/yxX1VzJwg9mWUEi0MI6gctLUsH1iwDx2M=;
 b=VCywQHhiFuxsjY7N6KShZ/0xNr+OKPSrjC8USbblum5X1IaS1GnE3/prhC5QyweMcV7oEq/cy
 1m6mAJWtzT2DXAYI9zp2fY8ru9eOsnxe+oHnQ76BmrKm64O/5dO2zgt
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=jPDF44RvT+9DGFOH3NGoIu1xN9dF+82pjdpnKjXfoJ0=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230817 with auth_id=78
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add character devices that expose PAPR-specific system parameters and
VPD to user space.

The problem: important platform features are enabled on Linux VMs
through the powerpc-specific rtas() syscall in combination with
writeable mappings of /dev/mem. In typical usage, this is encapsulated
behind APIs provided by the librtas library. This paradigm is
incompatible with lockdown, which prohibits /dev/mem access. It also
is too low-level in many cases: a single logical operation may require
multiple sys_rtas() calls in succession to complete. This carries the
risk that a process may exit while leaving an operation unfinished. It
also means that callers must coordinate their use of the syscall for
functions that cannot tolerate multiple concurrent clients, such as
ibm,get-vpd.

The solution presented here is to add a pair of small pseries-specific
"drivers," one for VPD and one for system parameters. The new drivers
expose these facilities to user space in ways that are compatible with
lockdown and require no coordination between their clients.

Since the ibm,get-vpd call sequence performed by the papr-vpd driver
must be serialized against all other uses of the function, the series
begins by adding some new APIs to the core RTAS support code for this
purpose.

Both drivers could potentially support poll() methods to notify
clients of changes to parameters or VPD that happen due to partition
migration and other events. But that should be safe to leave for
later, assuming there's any interest.

I have made changes to librtas to prefer the new interfaces and
verified that existing clients work correctly with the new code. A
draft PR for that work is here:

https://github.com/ibm-power-utilities/librtas/pull/36

The user-space ABI has not changed since v1 of this series.

I expect to propose at least one more small driver in this style for
platform dump retrieval in a separate submission in the future.

---
Changes in v4:
- Fix latent issue in rtas_token_to_function() which causes boot-time
  crashes.
- More small preparatory changes: a function table iterator and
  additional symbolic constants for RTAS function return values.
- Use symbolic constants for ibm,get-vpd statuses in papr-vpd.c.
- Add commentary to papr_vpd_ioc_create_handle() explaining choice to
  retrieve all VPD at file handle creation time instead of deferring
  it to the read handler.
- Rebase on current powerpc/next.
- Link to v3: https://lore.kernel.org/r/20231025-papr-sys_rtas-vs-lockdown-v3-0-5eb04559e7d8@linux.ibm.com

Changes in v3:
- Add new rtas_function_lock()/unlock() APIs and convert existing code
  to use them.
- Convert papr-vpd to use rtas_function_lock()/unlock() instead of
  having sys_rtas() obtain a driver-private mutex.
- Rebase on current powerpc/next.
- Link to v2: https://lore.kernel.org/r/20231013-papr-sys_rtas-vs-lockdown-v2-0-ead01ce01722@linux.ibm.com

Changes in v2:
- Fix unused-but-set variable warning in papr-sysparm code.
- Rebase on powerpc/next branch.
- Link to v1: https://lore.kernel.org/r/20231006-papr-sys_rtas-vs-lockdown-v1-0-3a36bfb66e2e@linux.ibm.com

Changes in v1 vs initial RFC:
- Add papr-sysparm driver and tests.
- Add a papr-miscdev.h uapi header.
- Prevent sys_rtas() from interfering with papr-vpd call sequences.
- Handle -4 ("VPD changed") status in papr-vpd.
- Include string_helpers.h in papr-vpd.c, per Michal Suchánek
- Link to RFC: https://lore.kernel.org/r/20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com

---
Nathan Lynch (13):
      powerpc/rtas: Add for_each_rtas_function() iterator
      powerpc/rtas: Fall back to linear search on failed token->function lookup
      powerpc/rtas: Add function return status constants
      powerpc/rtas: Factor out function descriptor lookup
      powerpc/rtas: Facilitate high-level call sequences
      powerpc/rtas: Serialize firmware activation sequences
      powerpc/rtas: Warn if per-function lock isn't held
      powerpc/uapi: Export papr-miscdev.h header
      powerpc/pseries: Add papr-vpd character driver for VPD retrieval
      powerpc/pseries/papr-sysparm: Validate buffer object lengths
      powerpc/pseries/papr-sysparm: Expose character device to user space
      powerpc/selftests: Add test for papr-vpd
      powerpc/selftests: Add test for papr-sysparm

 Documentation/userspace-api/ioctl/ioctl-number.rst |   4 +
 arch/powerpc/include/asm/papr-sysparm.h            |  17 +-
 arch/powerpc/include/asm/rtas.h                    |  27 +-
 arch/powerpc/include/uapi/asm/papr-miscdev.h       |   9 +
 arch/powerpc/include/uapi/asm/papr-sysparm.h       |  58 +++
 arch/powerpc/include/uapi/asm/papr-vpd.h           |  22 +
 arch/powerpc/kernel/rtas.c                         | 182 +++++--
 arch/powerpc/platforms/pseries/Makefile            |   1 +
 arch/powerpc/platforms/pseries/papr-sysparm.c      | 201 +++++++-
 arch/powerpc/platforms/pseries/papr-vpd.c          | 536 +++++++++++++++++++++
 tools/testing/selftests/powerpc/Makefile           |   2 +
 .../selftests/powerpc/papr_sysparm/.gitignore      |   1 +
 .../selftests/powerpc/papr_sysparm/Makefile        |  12 +
 .../selftests/powerpc/papr_sysparm/papr_sysparm.c  | 164 +++++++
 .../testing/selftests/powerpc/papr_vpd/.gitignore  |   1 +
 tools/testing/selftests/powerpc/papr_vpd/Makefile  |  12 +
 .../testing/selftests/powerpc/papr_vpd/papr_vpd.c  | 352 ++++++++++++++
 17 files changed, 1556 insertions(+), 45 deletions(-)
---
base-commit: 707df298cbde200b939c70be2577b20775fe3345
change-id: 20230817-papr-sys_rtas-vs-lockdown-5c54505db792

Best regards,
-- 
Nathan Lynch <nathanl@linux.ibm.com>

