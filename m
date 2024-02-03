Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFBD847DC5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Feb 2024 01:27:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FlDMmGQz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TRYPc3BTWz3dBr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Feb 2024 11:27:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FlDMmGQz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TRYNs6HTRz3bTP
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Feb 2024 11:26:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7BC14628DF;
	Sat,  3 Feb 2024 00:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27CE9C433F1;
	Sat,  3 Feb 2024 00:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706920011;
	bh=pZ/1n/nZkWaFD2URCT4Wx7nfSu2Q5NO3HE2dBZaP8IE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=FlDMmGQzdMT9+EtUrI3c2ku73ioEugWbla2n1r7EeCq6lf2Kto+8CVwqX+8P/4nYU
	 kal1dz25oEwYQB/ldOVoCxM5SZ1KWbckwj39ufzdij4KyX0n/gcjAYXgGEGE1RmluL
	 2vafk6Jsqi0YA88i2/VyLrEYXB8hdFWqeXL1WrMar3j9yP+xN6VMNYe9cXlQl6D3M8
	 GMuCnqbxZqduv33l2ktH+jRyxyMlYlHy0rJavFljKIq3Xui9PDucJ2Le17+P7O+g2R
	 kYZa+4PK1kpKEyJz7sF1fghtFLxC41ojIHUHxdfYsUc3m1V7KGzhZTAu9yKn0lidYb
	 g1Fuh5/pq9wXQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC06C4828F;
	Sat,  3 Feb 2024 00:26:51 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 02 Feb 2024 18:26:46 -0600
Subject: [PATCH] powerpc/pseries/papr-sysparm: use u8 arrays for payloads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20240202-papr-sysparm-ioblock-data-use-u8-v1-1-f5c6c89f65ec@linux.ibm.com>
X-B4-Tracking: v=1; b=H4sIAEWIvWUC/x3NwQqDMAyA4VeRnBdoOxmyVxk7xDbO4GZLMsdEf
 HeLx+/y/xsYq7DBvdlA+Scmea7wlwbiSPOLUVI1BBdaF5zHQkXRViukH5Tcv3OcMNGXcDHGpUP
 vUuiusb8NPkLNFOVB/ufi8dz3A/sNfPdyAAAA
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706920010; l=1878;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=+IiR1yRnowpFFkAsHfmCVymG5bRT3lCVdavVDyidwnM=;
 b=dkaLfDQdV8zLrd0BgZdm3eqO/SRoJcTPUMef2TihkbahHtWB5r9V7yO/AIyyHpG8qwTVxcsi3
 i+bVg0AlAXKD0PIZAm7OZpz12n0raqnm6xZqIWAMmdQigh4+Vu9rRvJ
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Some PAPR system parameter values are formatted by firmware as
nul-terminated strings (e.g. LPAR name, shared processor attributes).
But the values returned for other parameters, such as processor module
info and TLB block invalidate characteristics, are binary data with
parameter-specific layouts. So char[] isn't the appropriate type for
the general case. Use u8/__u8.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Fixes: 905b9e48786e ("powerpc/pseries/papr-sysparm: Expose character device to user space")
---
I'd like to get this in for v6.8 so the uapi header has the change for
its first point release.
---
 arch/powerpc/include/asm/papr-sysparm.h      | 2 +-
 arch/powerpc/include/uapi/asm/papr-sysparm.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/papr-sysparm.h b/arch/powerpc/include/asm/papr-sysparm.h
index 0dbbff59101d..c3cd5b131033 100644
--- a/arch/powerpc/include/asm/papr-sysparm.h
+++ b/arch/powerpc/include/asm/papr-sysparm.h
@@ -32,7 +32,7 @@ typedef struct {
  */
 struct papr_sysparm_buf {
 	__be16 len;
-	char val[PAPR_SYSPARM_MAX_OUTPUT];
+	u8 val[PAPR_SYSPARM_MAX_OUTPUT];
 };
 
 struct papr_sysparm_buf *papr_sysparm_buf_alloc(void);
diff --git a/arch/powerpc/include/uapi/asm/papr-sysparm.h b/arch/powerpc/include/uapi/asm/papr-sysparm.h
index 9f9a0f267ea5..f733467b1534 100644
--- a/arch/powerpc/include/uapi/asm/papr-sysparm.h
+++ b/arch/powerpc/include/uapi/asm/papr-sysparm.h
@@ -14,7 +14,7 @@ enum {
 struct papr_sysparm_io_block {
 	__u32 parameter;
 	__u16 length;
-	char data[PAPR_SYSPARM_MAX_OUTPUT];
+	__u8 data[PAPR_SYSPARM_MAX_OUTPUT];
 };
 
 /**

---
base-commit: 44a1aad2fe6c10bfe0589d8047057b10a4c18a19
change-id: 20240201-papr-sysparm-ioblock-data-use-u8-10d283cb6f1c

Best regards,
-- 
Nathan Lynch <nathanl@linux.ibm.com>

