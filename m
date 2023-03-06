Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB106AD0AF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 22:38:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVsQn4Y59z3fS0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 08:38:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GjQiA30O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GjQiA30O;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVsKp2fMYz3bjj
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 08:34:37 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DC8CCB81133;
	Mon,  6 Mar 2023 21:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D5C6C433EF;
	Mon,  6 Mar 2023 21:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678138472;
	bh=VfnuSEQxaGUIbnOLjv4z+HHxfo/T4W0MG/POU4Uq4CQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=GjQiA30O+qGelPherqWe99bpW/PbFWz6ani3fyjd2QcFOF0i3eFAitMiWLUoAGGET
	 6q0xhO5QwOAZJaQX9UTwFfUxmkmp55bR8fUNdVDmqhiMWXqCL9H5nXqYWnV4sscQER
	 3twWqDmZE5h3YH+Ty8ASVP36fUdzmsC97izP4nDY0+KgIFmSwT7Py/nEaVWT4tOu3q
	 r5bizPwqflx7xpANHnfmw4Fzuaw8a6SSjJnN85tlf0RBg3T6C7Ft1mkRn+ZbamC/MD
	 H5OAx6t9KxoJAq3UGncx0Ie4Wok32COziZMnXNwkBcUN5OArL6HL6urOLHzTwghDGb
	 AjQx9/JFV6oCA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76316C64EC4;
	Mon,  6 Mar 2023 21:34:32 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Subject: [PATCH 0/8] RTAS changes for 6.4
Date: Mon, 06 Mar 2023 15:33:39 -0600
Message-Id: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADNcBmQC/x2NQQrCQAwAv1JyNrAbFwW/Ih6yNbWBstXEFaH07
 waPMzDMBi6m4nAZNjD5qOvaAvJhgHHm9hDUezBQomMiSmhvdnx16YLTanjCgpSLVKqcSzpDhJV
 dsBq3cY609WUJ+TSZ9Ps/XW/7/gO26XfIeQAAAA==
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678138471; l=1294;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=VfnuSEQxaGUIbnOLjv4z+HHxfo/T4W0MG/POU4Uq4CQ=;
 b=V+ZCPAQi3+0isRkO9hw+PjrczsFROAYdmfl975syJxP/uIa0hk7+JG8Ri2R3Np3D/2GpEM6hs
 nMcntOuk21eBIhwZ/4GiChHcHtjvwQ+EGOivRHMKTOIWCjX77EPrcrR
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=6daubz/ymoaMF+8voz7UHwnhluEsmDZuqygIIMWpQQY=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230206 with auth_id=27
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Proposed changes for the RTAS subsystem and client code.

Fixes that are subject to backporting are at the front of the queue,
followed by documentation and cleanups, with enhancements at the end.

Noteworthy changes:
* Change sys_rtas() to consume -2/990x statuses instead of returning
  them to user space.
* Lockdep annotations for invariants in rtas.c.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
Nathan Lynch (8):
      powerpc/rtas: ensure 8-byte alignment for struct rtas_args
      powerpc/rtas: use memmove for potentially overlapping buffer copy
      powerpc/rtas: rtas_call_unlocked() kerneldoc
      powerpc/rtas: fix miswording in rtas_function kerneldoc
      powerpc/rtas: rename va_rtas_call_unlocked() to va_rtas_call()
      powerpc/rtas: lockdep annotations
      powerpc/rtas: warn on unsafe argument to rtas_call_unlocked()
      powerpc/rtas: consume retry statuses in sys_rtas()

 arch/powerpc/include/asm/rtas-types.h |  5 +-
 arch/powerpc/kernel/rtas.c            | 92 +++++++++++++++++++++++++----------
 2 files changed, 69 insertions(+), 28 deletions(-)
---
base-commit: 422fbcbf91303706823bc3babceb1df1a42112bf
change-id: 20230220-rtas-queue-for-6-4-214eb2ba1407

Best regards,
-- 
Nathan Lynch <nathanl@linux.ibm.com>

