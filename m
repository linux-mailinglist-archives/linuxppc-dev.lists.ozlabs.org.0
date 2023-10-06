Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF347BC0E1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 23:03:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JPLJbdoL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2LWM45bSz3vlp
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Oct 2023 08:03:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JPLJbdoL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2LSW5G4hz2yW7
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Oct 2023 08:01:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E695FB82A29;
	Fri,  6 Oct 2023 21:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47866C433C7;
	Fri,  6 Oct 2023 21:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696626071;
	bh=33bITNWtC+2JNViN32qS5UW9vQGmwDJdJ/Zwaw8wSzc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=JPLJbdoLOghpQbewkmv6P96+I43koi6kgNpMxkMGcQWwIx379ft0A+6q1aS9Uudw8
	 JqZ95o9+fvOd7RerL5SOcyHQuofPn/oZgsvRCpJS7dHiUmvVUpbgQGJT9jXkjdIKmq
	 b9HTcmanbJyIIZREoztbu53eL6hmN3+s78ViL2zY50/I6jOauOFMSnYYPu2dp7XldE
	 MDqHhecTQmZBxnr3PfEwCmxxCN90VxO+h4cbKDXWHpArBE/oRtc5xHLE5FuEDFvW7W
	 KJ/9+ABESXUE64RLt8d2m4b8CGj+BJh7q1B480su05e5sQb8wqtt9mErt0xtDTpIzi
	 NL7nWZCcNVNEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC75E94117;
	Fri,  6 Oct 2023 21:01:11 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Subject: [PATCH 0/7] powerpc/pseries: new character devices for system
 parameters and VPD
Date: Fri, 06 Oct 2023 16:01:03 -0500
Message-Id:  <20231006-papr-sys_rtas-vs-lockdown-v1-0-3a36bfb66e2e@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAI91IGUC/32NwQ6CMBAFf4X07JLSWhFP/ochBkqRjdCSLlYI4
 d+txLPHmeTNWxkZj4bYJVmZNwEJnY2QHRKmu8o+DGATmQkuJD9nOYzV6IEWuvupIggEvdPPxr0
 tKK2OiqumzgvB4n70psV5b9/KyB3S5PyyX4Xsa39VIf5UQwYcCilOQupW6ry+9mhfc4r1kGo3s
 HLbtg9QHc5xxgAAAA==
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1696626070; l=3953;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=33bITNWtC+2JNViN32qS5UW9vQGmwDJdJ/Zwaw8wSzc=;
 b=DrHAnUGMQMwDIMPqbjwbppwVjDiWMF59RLXBox/f9t5HMgWP8l4UNZdn6cls4C4/DAfd1B/aF
 lR6rjKEyWjfAreyq1Ni+yU+ecq5iY318DYsvhESGHI3q0/OI0e5uaCL
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
platform dump retrieval in a separate submission in the future. I
consider the work in this series mature enough now to request review
for inclusion as-is.

---
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
 arch/powerpc/platforms/pseries/papr-sysparm.c      | 207 +++++++-
 arch/powerpc/platforms/pseries/papr-vpd.c          | 542 +++++++++++++++++++++
 tools/testing/selftests/powerpc/Makefile           |   2 +
 .../selftests/powerpc/papr_sysparm/.gitignore      |   1 +
 .../selftests/powerpc/papr_sysparm/Makefile        |  12 +
 .../selftests/powerpc/papr_sysparm/papr_sysparm.c  | 164 +++++++
 .../testing/selftests/powerpc/papr_vpd/.gitignore  |   1 +
 tools/testing/selftests/powerpc/papr_vpd/Makefile  |  12 +
 .../testing/selftests/powerpc/papr_vpd/papr_vpd.c  | 352 +++++++++++++
 17 files changed, 1440 insertions(+), 8 deletions(-)
---
base-commit: eddc90ea2af5933249ea1a78119f2c8ef8d07156
change-id: 20230817-papr-sys_rtas-vs-lockdown-5c54505db792

Best regards,
-- 
Nathan Lynch <nathanl@linux.ibm.com>

