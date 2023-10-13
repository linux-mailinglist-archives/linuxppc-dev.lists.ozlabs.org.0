Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E477C8F29
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 23:33:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kJHIqgzM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6fr92610z3cF4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Oct 2023 08:33:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kJHIqgzM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6fqD5cmRz3bV7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Oct 2023 08:32:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C53B7CE3263;
	Fri, 13 Oct 2023 21:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04C12C433D9;
	Fri, 13 Oct 2023 21:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697232741;
	bh=IEfWyZt/HG1wMIwURxC/fhcJtcXHmo+O3C/3hgdYIfY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=kJHIqgzMNJDbgW0lrN1z/RajsQOKrGowCh0HDzfvzqSCQNrANnRDBpggORz43/aP9
	 qaPrmRrGWfsAWm+wvlOEt4isLIESQdfw3A/rFiQf9QkUNtiLDnMvSAT/b8pupoe3DK
	 0bB4CA3QHCYaBF+mRhHqA1ynerxR4DR2WINcqP83PbvTnjhPpH0hSney8C13gP3DN7
	 TyKXvRuom3JLIBL5S174Sl3rJSjXz4/H1deExcqotf4MOIeIH1aUS2IN4V/rtGY0vc
	 1wmdfF4XG2FUFtZm3t0D9dTbX7yVOHbIzhk7NGVskO47hh0NWeG4d6So0WlpE8leOZ
	 w1mCHB4OjpKng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0AF9CDB482;
	Fri, 13 Oct 2023 21:32:20 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Subject: [PATCH v2 0/7] powerpc/pseries: new character devices for system
 parameters and VPD
Date: Fri, 13 Oct 2023 16:32:07 -0500
Message-Id:  <20231013-papr-sys_rtas-vs-lockdown-v2-0-ead01ce01722@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFe3KWUC/4XNQQ6CMBCF4auQri0pUyniynsYYmgp0ggt6SBCC
 He3EFcudPlPMt9bCGpvNJJztBCvR4PG2RBwiIhqSnvX1FShCTDg7JRktC97T3HGmx9KpCPS1ql
 H5V6Wpio9piytZJYDCf+917WZdvtahG4MDs7P+9SYbNePCvBDHRPKaM5BAFc1V5m8tMY+p9jIL
 lau24Y2JWFM/FN4yYWspRAa9JdSrOv6Bk0NQo4MAQAA
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697232739; l=4080;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=IEfWyZt/HG1wMIwURxC/fhcJtcXHmo+O3C/3hgdYIfY=;
 b=73IsP5J7aupFPCcMuZxJ7b21yWS9eh0Mu5cSbJyeF23z9t/S5H9dAEqqTzuhPaNt+6D5zIv0i
 7DBoUUtW3j1A2t5WX7XO4c0Wed0JEaA9dkcKgKirNR2GeYgqH0ZaY+0
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
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

Both drivers could potentially support poll() methods to notify
clients of changes to parameters or VPD that happen due to partition
migration and other events. But that should be safe to leave for
later, assuming there's any interest.

I have made changes to librtas to prefer the new interfaces and
verified that existing clients work correctly with the new code. A
draft PR for that work is here:

https://github.com/ibm-power-utilities/librtas/pull/36

I expect to propose at least one more small driver in this style for
platform dump retrieval in a separate submission in the future.

---
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
Nathan Lynch (7):
      powerpc/uapi: export papr-miscdev.h header
      powerpc/pseries: papr-vpd char driver for VPD retrieval
      powerpc/rtas: serialize ibm,get-vpd service with papr-vpd sequences
      powerpc/pseries/papr-sysparm: validate buffer object lengths
      powerpc/pseries/papr-sysparm: expose chardev API to user space
      powerpc/selftests: add test for papr-vpd
      powerpc/selftests: add test for papr-sysparm

 Documentation/userspace-api/ioctl/ioctl-number.rst |   4 +
 arch/powerpc/include/asm/papr-sysparm.h            |  17 +-
 arch/powerpc/include/asm/papr-vpd.h                |  18 +
 arch/powerpc/include/uapi/asm/papr-miscdev.h       |   9 +
 arch/powerpc/include/uapi/asm/papr-sysparm.h       |  58 +++
 arch/powerpc/include/uapi/asm/papr-vpd.h           |  22 +
 arch/powerpc/kernel/rtas.c                         |  26 +
 arch/powerpc/platforms/pseries/Makefile            |   1 +
 arch/powerpc/platforms/pseries/papr-sysparm.c      | 201 +++++++-
 arch/powerpc/platforms/pseries/papr-vpd.c          | 542 +++++++++++++++++++++
 tools/testing/selftests/powerpc/Makefile           |   2 +
 .../selftests/powerpc/papr_sysparm/.gitignore      |   1 +
 .../selftests/powerpc/papr_sysparm/Makefile        |  12 +
 .../selftests/powerpc/papr_sysparm/papr_sysparm.c  | 164 +++++++
 .../testing/selftests/powerpc/papr_vpd/.gitignore  |   1 +
 tools/testing/selftests/powerpc/papr_vpd/Makefile  |  12 +
 .../testing/selftests/powerpc/papr_vpd/papr_vpd.c  | 352 +++++++++++++
 17 files changed, 1434 insertions(+), 8 deletions(-)
---
base-commit: 0ebc7feae79ac07772a20382eebd8c3503313714
change-id: 20230817-papr-sys_rtas-vs-lockdown-5c54505db792

Best regards,
-- 
Nathan Lynch <nathanl@linux.ibm.com>

