Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7657D7B3E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 05:30:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LpAhK08C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGBBl0FjMz3vfr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 14:30:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LpAhK08C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGB4G5Lsjz2yV3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 14:24:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 171A9B82C2C;
	Thu, 26 Oct 2023 03:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29505C433C7;
	Thu, 26 Oct 2023 03:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698290682;
	bh=NFrzlpbJn6Fc8OWDOeBcsMej+VBXx++9QWjmXSI+Jys=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=LpAhK08CTEgJTsBJMHZV8qsOoKMtktz6fMyzVwiob3UjNGqz5WMDBzLYMBAA5opmv
	 iEL/Vj4h/f/t/7qGjKUZCeayL+VujNQ/DOVn+01uljq4J1RPuRH5pu7PANPpc1bpXH
	 NWWMQlMRArYsfDeSpA6dkApjGUdxBYR1kHGFEzd3pYWbtb2BI6f3V0rHc3lbBVQ4uM
	 XHCS8nITciDp9T/4cwd8DKEcDDn2eFnECL8iaowUSDh4N/4Rxi0M5QITw6H3G8hFnE
	 a3cOhD9TE9oUnsCZ3dffpkcgjIfg/U7NIzhHofrwN19fb29bkjnstY9GNRPXvOjvYx
	 LBEghBjh6h9vw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD17C0032E;
	Thu, 26 Oct 2023 03:24:42 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Subject: [PATCH v3 00/10] powerpc/pseries: New character devices for system
 parameters and VPD
Date: Wed, 25 Oct 2023 22:24:14 -0500
Message-Id:  <20231025-papr-sys_rtas-vs-lockdown-v3-0-5eb04559e7d8@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAN7bOWUC/4XOQQ7CIBAF0KsY1mKGwVJ15T2MMUCnSrSlAUWbp
 neXGuPChS7/JPP+H1ik4CiyzWxggZKLzrc5yPmM2ZNuj8RdlTNDQAkrUfJOd4HHPh7CVUeeIr9
 4e678veWFLZYFFJUp18jyfxeodo+XvdvnfHLx6kP/qkpiur5VxB9qEhz4WqJCaWtpS7O9uPb2W
 DjTLKxvpqJJEQDqnyK1VKY2ShHSlzLtS/jZJEDIXxpmjXQFwhKIEvFbG8fxCcUOR75aAQAA
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698290680; l=4920;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=NFrzlpbJn6Fc8OWDOeBcsMej+VBXx++9QWjmXSI+Jys=;
 b=nEthyzViGh9xUiIfOF9rSAOWO6nSP4erLXnMlxxQtn9o08OLVrMRYXrKv2Fey30zfvP1n1er/
 emPtSslOq59Dq7Um4CAOfmWy1IvNWKwoKlbcm5kKdaAuucLdbIcUIS9
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
Nathan Lynch (10):
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
 arch/powerpc/include/asm/rtas.h                    |   2 +
 arch/powerpc/include/uapi/asm/papr-miscdev.h       |   9 +
 arch/powerpc/include/uapi/asm/papr-sysparm.h       |  58 +++
 arch/powerpc/include/uapi/asm/papr-vpd.h           |  22 +
 arch/powerpc/kernel/rtas.c                         | 157 ++++++-
 arch/powerpc/platforms/pseries/Makefile            |   1 +
 arch/powerpc/platforms/pseries/papr-sysparm.c      | 201 +++++++-
 arch/powerpc/platforms/pseries/papr-vpd.c          | 522 +++++++++++++++++++++
 tools/testing/selftests/powerpc/Makefile           |   2 +
 .../selftests/powerpc/papr_sysparm/.gitignore      |   1 +
 .../selftests/powerpc/papr_sysparm/Makefile        |  12 +
 .../selftests/powerpc/papr_sysparm/papr_sysparm.c  | 164 +++++++
 .../testing/selftests/powerpc/papr_vpd/.gitignore  |   1 +
 tools/testing/selftests/powerpc/papr_vpd/Makefile  |  12 +
 .../testing/selftests/powerpc/papr_vpd/papr_vpd.c  | 352 ++++++++++++++
 17 files changed, 1503 insertions(+), 34 deletions(-)
---
base-commit: 36e826b568e412f61d68fedc02a67b4d8b7583cc
change-id: 20230817-papr-sys_rtas-vs-lockdown-5c54505db792

Best regards,
-- 
Nathan Lynch <nathanl@linux.ibm.com>

