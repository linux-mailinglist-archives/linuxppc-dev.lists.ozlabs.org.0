Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF92077FBFD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 18:23:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tzMVpih5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRVfX4dTJz3cmV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 02:23:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tzMVpih5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRVdf6GsDz2ytf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 02:22:14 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 217CB63242;
	Thu, 17 Aug 2023 16:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 870D1C433CB;
	Thu, 17 Aug 2023 16:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692289330;
	bh=GfQHMVoWl2gmXXD4EiVWjePpkzCiMUIeoepITvP2O/o=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tzMVpih5iyIhCZHRxSLeOB520odgsvnHFAwWOUn05ve4cxtdZ+WaruN+daDSjbKzj
	 /uAn06hWsBKMJkCoLX6P+QVh6SM0SrrEmcUwgeJyH+5uI7bhWlY/rMkJXsHewhJ3FS
	 me1aXxnJWpDyojw5JblDf6eDJ4Ac5oQZJoIXQ5jSsAHUjRclPKkyOZ3HHiADHZ0Ps8
	 GzDZqGq0bQtoq8wZ/g4YQCTX4TOJVcGS44H4od14z+s4QWtWhgnSbZ+2X42bV1Gjm3
	 0fkHzfuDcZqgK+Q40vYxZ/mGaLRrty9vKG5qmLZaiFQupEjpfX6qLKb+fY2itYiqGd
	 Hat/mTXyb2PZg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A69AC3DA4D;
	Thu, 17 Aug 2023 16:22:10 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Subject: [PATCH 0/2] powerpc/selftests: miscellaneous improvements
Date: Thu, 17 Aug 2023 11:21:51 -0500
Message-Id: <20230817-powerpc-selftest-misc-v1-0-a84cc1ef78b2@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB9J3mQC/x3MywqDMBBG4VeRWTvgJFjFVxEXJf7aAS8hI21Bf
 HeDy29xzkmGpDDqipMSvmq6bxlSFhQ+720G65hNrnK+aqXhuP+QYmDDMh2wg1e1wOLCS6T28K6
 l3MaESf/Ptx+u6wZU2UJ7ZwAAAA==
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692289329; l=717;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=GfQHMVoWl2gmXXD4EiVWjePpkzCiMUIeoepITvP2O/o=;
 b=ioBzEPeDFokNnzBxp8fwEZpjvmrfYyX/OiLkqgG6cFDboxG3YcrWtViYTzzGBal9TfmnstUmn
 5fRke7ZM/oaAaWqk2q2ozOkvo9DUKn6GzY9O+Cl4PTQK+AEeZI4aKCW
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Just some minor things to tidy up I noticed when adding tests.

---
Nathan Lynch (2):
      powerpc/selftests: sort mm/.gitignore, add exec_prot
      selftests/powerpc: add const qualification where possible

 tools/testing/selftests/powerpc/harness.c         |  4 ++--
 tools/testing/selftests/powerpc/include/subunit.h | 16 ++++++++--------
 tools/testing/selftests/powerpc/include/utils.h   |  2 +-
 tools/testing/selftests/powerpc/mm/.gitignore     | 17 +++++++++--------
 4 files changed, 20 insertions(+), 19 deletions(-)
---
base-commit: 4f894fe22343138f0dc0ce18b49abfa45cdfeb6b
change-id: 20230817-powerpc-selftest-misc-12c61153e328

Best regards,
-- 
Nathan Lynch <nathanl@linux.ibm.com>

