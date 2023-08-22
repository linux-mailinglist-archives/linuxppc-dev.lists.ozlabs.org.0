Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A130D784C1B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 23:34:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GbD53HM6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVjL43v7qz3c3c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 07:34:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GbD53HM6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVjKC37PBz2yW6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 07:34:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5E40F6148C;
	Tue, 22 Aug 2023 21:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3B35C433C7;
	Tue, 22 Aug 2023 21:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692740044;
	bh=z9fzCwu05p/kJat1VErjewoOFwejlqxL+Y9vVVA5YfE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=GbD53HM6+VwIKGuA2dShSibowuDDyXPks2r8GrnI84WzUCNTLgvq962W1OjESqXcC
	 786tEUR8zOoHDjklcOvdiN9aMOgWJKoOWN7EZoY+M+LcjIPwH09JjsvqjrWuTLqeda
	 4OFuDhDzLT1PU0CkVGAh+QU8ftXcyh6QgUw2S7bM/FouQQX9/422q+OKA2xiJl8F+S
	 I/0pxQWCAqPB9zaAirE8R79VEUDafU57jCS0v7hgpRoE6qFCw0/vs7KUpGqUFFgpcl
	 LrBgNYUjBfusJ5mVtVzQqRIA0ljzrPbpmcS6eSjVfbcI5QBhcNRa0GDp//JV8CMRQi
	 5QP+UuuCeHvxA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D16EE49A5;
	Tue, 22 Aug 2023 21:34:04 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Subject: [PATCH RFC 0/2] powerpc/pseries: new character devices for RTAS
 functions
Date: Tue, 22 Aug 2023 16:33:38 -0500
Message-Id:  <20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALIp5WQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDC0Nz3YLEgiLd4sri+KKSxGLdsmLdnPzk7JT88jxd02RTE1MD05Qkc0s
 jJaD+gqLUtMwKsNnRSkFuzkqxtbUAE+q8h3AAAAA=
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692740044; l=2907;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=z9fzCwu05p/kJat1VErjewoOFwejlqxL+Y9vVVA5YfE=;
 b=tbEDW3JN5f4jc5uhfkxn/pJjIwxbrWp0AnlI1Rn2WpSx8JKa/TFRAhPWQlr/3QzlYVb4lDWQ2
 7JLUF54mu9tABjKxRciHESjLtpbuk1GQB87ghoeTt3sTDqMbM6DSefl
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

This is a proposal for adding chardev-based access to a select subset
of RTAS functions on the pseries platform.

The problem: important platform features are enabled on Linux VMs
through the powerpc-specific rtas() syscall in combination with
writeable mappings of /dev/mem. In typical usage, this is encapsulated
behind APIs provided by the librtas library. This paradigm is
incompatible with lockdown, which prohibits /dev/mem access.

The solution I'm working on is to add a small pseries-specific
"driver" for each functional area, exposing the relevant features to
user space in ways that are compatible with lockdown. In most of these
areas, I believe it's possible to change librtas to prefer the new
chardev interfaces without disrupting existing users.

I've broken down the affected functions into the following areas and
priorities:

High priority:
* VPD retrieval.
* System parameters: retrieval and update.

Medium priority:
* Platform dump retrieval.
* Light path diagnostics (get/set-dynamic-indicator,
  get-dynamic-sensor-state, get-indices).

Low priority (may never happen):
* Error injection: would have to be carefully restricted.
* Physical attestation: no known users.
* LPAR perftools: no known users.

Out of scope:
* DLPAR (configure-connector et al): involves device tree updates
  which must be handled entirely in-kernel for lockdown. This is the
  object of a separate effort.

See https://github.com/ibm-power-utilities/librtas/issues/29 for more
details.

In this RFC, I've included a single driver for VPD retrieval. Clients
use ioctl() to obtain a file descriptor-based handle for the VPD they
want. I think this could be a good model for the other areas too, but
I'd like to get opinions on it.

In the next iteration I expect to add a separate driver for system
parameters.

For reference, I floated a different approach for system parameters
here:

https://lore.kernel.org/linuxppc-dev/20220730000458.130938-1-nathanl@linux.ibm.com/

---
Nathan Lynch (2):
      powerpc/pseries: papr-vpd char driver for VPD retrieval
      powerpc/selftests: add test for papr-vpd

 Documentation/userspace-api/ioctl/ioctl-number.rst |   2 +
 arch/powerpc/include/uapi/asm/papr-vpd.h           |  29 ++
 arch/powerpc/platforms/pseries/Makefile            |   1 +
 arch/powerpc/platforms/pseries/papr-vpd.c          | 353 +++++++++++++++++++++
 tools/testing/selftests/powerpc/Makefile           |   1 +
 .../testing/selftests/powerpc/papr_vpd/.gitignore  |   1 +
 tools/testing/selftests/powerpc/papr_vpd/Makefile  |  12 +
 .../testing/selftests/powerpc/papr_vpd/papr_vpd.c  | 351 ++++++++++++++++++++
 8 files changed, 750 insertions(+)
---
base-commit: d77497508a229529830850ba07e1e52596463d21
change-id: 20230817-papr-sys_rtas-vs-lockdown-5c54505db792

Best regards,
-- 
Nathan Lynch <nathanl@linux.ibm.com>

