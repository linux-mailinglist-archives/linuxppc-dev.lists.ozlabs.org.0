Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2F28245C5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jan 2024 17:07:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aSTs4kkj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T5WgS5x6yz3cbt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jan 2024 03:07:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aSTs4kkj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T5Wfg1DW0z3bpk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jan 2024 03:06:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 09F81618A6;
	Thu,  4 Jan 2024 16:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8CA7C433C8;
	Thu,  4 Jan 2024 16:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704384375;
	bh=TAWT/INzG+9nYzwzqhBxsSvW9WYNiknpgg46LmQySnU=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=aSTs4kkj4IzwmQ2M33LpsZse9z00H8xhXkrtTeslRA9ma/oWBOOGak5iEtn9EIeIX
	 S6lO5jzgOed1tMB/kI4tXWGkgbFnzxH1AvTpM1vW6IwI+HHaNiZLxLg0oPbcaajgKX
	 +C+y1NpdUWBrGRho9MNOpKW5CiWu6jk0NXDeBYaX9KrvHr67XcXqsvPtbFPknztCXP
	 +0WTl1trwPqFPXnJEDr0MjdvDTbrfHF1roGORj1o4dpl1wND06aepyW3txb1GR3uA9
	 k+OXnwyFLpezfGR7O4kXMPMsicuKJx9tUWyWLQnEmNbhk02Vd+JjJ+fp6KcLt1wvsQ
	 guZMGyrH5WHuw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DBFC47073;
	Thu,  4 Jan 2024 16:06:15 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Thu, 04 Jan 2024 10:06:07 -0600
Subject: [PATCH] powerpc/pseries/lparcfg: drop error message from guest
 name lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240104-lparcfg-updates-v1-1-66a0184a4eb1@linux.ibm.com>
X-B4-Tracking: v=1; b=H4sIAG7XlmUC/x3MTQqAIBBA4avErBP8yYSuEi3ERhuIEq0IxLsnL
 b/FewUyJsIMU1cg4UOZzqNB9B24zR4BGa3NILlUQgrJ9miT84HdcbUXZoZe6EEZN2rDoVUxoaf
 3P85LrR9VyZygYQAAAA==
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704384374; l=1163;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=GMz0IiAh9zK5P880g/A7U6ApcCcqSeLA3Ql+a2XZK9Y=;
 b=O1xFqRDdGK5iRd8E3mmF8YTU9mQPmDWI4unbFo8rvxNIHwPuNzNIQJ+kvN0QEvz9QKmOdtkFB
 wgYIHj6T2l1DU/bmiamqFGCoamt6/CFJUFtQla9AD4xRuTvkiYtXVbp
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

From: Nathan Lynch <nathanl@linux.ibm.com>

It's not an error or exceptional situation when the hosting
environment does not expose a name for the LP/guest via RTAS or the
device tree. This happens with qemu when run without the '-name'
option. The message also lacks a newline. Remove it.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/lparcfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index 1c151d77e74b..ff02ade17a75 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -357,8 +357,8 @@ static int read_dt_lpar_name(struct seq_file *m)
 
 static void read_lpar_name(struct seq_file *m)
 {
-	if (read_rtas_lpar_name(m) && read_dt_lpar_name(m))
-		pr_err_once("Error can't get the LPAR name");
+	if (read_rtas_lpar_name(m))
+		read_dt_lpar_name(m);
 }
 
 #define SPLPAR_MAXLENGTH 1026*(sizeof(char))

---
base-commit: 44a1aad2fe6c10bfe0589d8047057b10a4c18a19
change-id: 20231212-lparcfg-updates-ef15437c6570

Best regards,
-- 
Nathan Lynch <nathanl@linux.ibm.com>

