Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D856925C4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 19:50:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PD2pz409Wz3fSL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 05:50:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WobWrKhz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WobWrKhz;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PD2dx0GQnz3f3Y
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Feb 2023 05:42:13 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BA36961E9D;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A17BC4339B;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676054528;
	bh=uLLRqcFS1mDjGvuDDS6DEwr+/11hvMOTfUiFUBoC55w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WobWrKhzirO2vXlP1KxRLczjDleImuY0t2fyiNwadYVTb1o9UmsxZiXOUkVF3uGP5
	 rKOiiJgPUIefho4HS8B8ZJHJZKn4CWEJeJhDXwwdq6j/SzAb1KPwUUlGMYg1+E1J60
	 6NQXynUFfr4Vq8bfSbF2ZtKEwlRtt34KR2hDk24o3sIC3Y0zBNSew5l5tljwflPv7x
	 gtbjx/fwUeZ1MGFaCMK0ejCDVv9yofZCgLCZDlJYu8r2r8ObLWxPpVoXeH/Y1QtnSs
	 Hpi1Akb6qDn78SKmrj6hOuByX36Qu41xW2gPY0UxwR0R14ICYwdCY4kfa3IjSUwz4f
	 0vg7/o5GqMvhw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A19C64ED6;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
From: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 10 Feb 2023 12:42:04 -0600
Subject: [PATCH v3 16/20] powerpc/pseries/lparcfg: convert to papr_sysparm
 API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-b4-powerpc-rtas-queue-v3-16-26929c8cce78@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
In-Reply-To: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Kajol Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676054526; l=5578;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=MXugHju5B+tHrKnmFHjVH1AgnDo+QS595vw3dsmuk7I=;
 b=QwI5xmx1fT46D6jNKIzKXkyK3VY0eLwQpy5pEY4WRSfpXX1/XOtKWC9VsvMPJcYKzV3KgyOxi
 MLL3sBTsIQFDszxw6/qns20bsijJ+dy02NybUTd1HmgNmAyty/BPSu2
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=6daubz/ymoaMF+8voz7UHwnhluEsmDZuqygIIMWpQQY=
X-Endpoint-Received:  by B4 Submission Endpoint for nathanl@linux.ibm.com/20230206 with auth_id=27
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

/proc/powerpc/lparcfg derives the LPAR name and SPLPAR characteristics
it reports using bare calls to the RTAS ibm,get-system-parameter
function. Convert these to the higher-level papr_sysparm API, which
handles the tedious details.

While the SPLPAR string parsing code could stand to be updated, that
should be done in a separate change. It is minimally modified here to
reduce the risk of changing behavior.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/lparcfg.c | 104 +++++++------------------------
 1 file changed, 24 insertions(+), 80 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index cd33d5800763..8acc70509520 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -19,6 +19,7 @@
 #include <linux/errno.h>
 #include <linux/proc_fs.h>
 #include <linux/init.h>
+#include <asm/papr-sysparm.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
@@ -311,16 +312,6 @@ static void parse_mpp_x_data(struct seq_file *m)
 		seq_printf(m, "coalesce_pool_spurr=%ld\n", mpp_x_data.pool_spurr_cycles);
 }
 
-/*
- * PAPR defines, in section "7.3.16 System Parameters Option", the token 55 to
- * read the LPAR name, and the largest output data to 4000 + 2 bytes length.
- */
-#define SPLPAR_LPAR_NAME_TOKEN	55
-#define GET_SYS_PARM_BUF_SIZE	4002
-#if GET_SYS_PARM_BUF_SIZE > RTAS_DATA_BUF_SIZE
-#error "GET_SYS_PARM_BUF_SIZE is larger than RTAS_DATA_BUF_SIZE"
-#endif
-
 /*
  * Read the lpar name using the RTAS ibm,get-system-parameter call.
  *
@@ -332,46 +323,19 @@ static void parse_mpp_x_data(struct seq_file *m)
  */
 static int read_rtas_lpar_name(struct seq_file *m)
 {
-	int rc, len, token;
-	union {
-		char raw_buffer[GET_SYS_PARM_BUF_SIZE];
-		struct {
-			__be16 len;
-			char name[GET_SYS_PARM_BUF_SIZE-2];
-		};
-	} *local_buffer;
+	struct papr_sysparm_buf *buf;
+	int err;
 
-	token = rtas_token("ibm,get-system-parameter");
-	if (token == RTAS_UNKNOWN_SERVICE)
-		return -EINVAL;
-
-	local_buffer = kmalloc(sizeof(*local_buffer), GFP_KERNEL);
-	if (!local_buffer)
+	buf = papr_sysparm_buf_alloc();
+	if (!buf)
 		return -ENOMEM;
 
-	do {
-		spin_lock(&rtas_data_buf_lock);
-		memset(rtas_data_buf, 0, sizeof(*local_buffer));
-		rc = rtas_call(token, 3, 1, NULL, SPLPAR_LPAR_NAME_TOKEN,
-			       __pa(rtas_data_buf), sizeof(*local_buffer));
-		if (!rc)
-			memcpy(local_buffer->raw_buffer, rtas_data_buf,
-			       sizeof(local_buffer->raw_buffer));
-		spin_unlock(&rtas_data_buf_lock);
-	} while (rtas_busy_delay(rc));
+	err = papr_sysparm_get(PAPR_SYSPARM_LPAR_NAME, buf);
+	if (!err)
+		seq_printf(m, "partition_name=%s\n", buf->val);
 
-	if (!rc) {
-		/* Force end of string */
-		len = min((int) be16_to_cpu(local_buffer->len),
-			  (int) sizeof(local_buffer->name)-1);
-		local_buffer->name[len] = '\0';
-
-		seq_printf(m, "partition_name=%s\n", local_buffer->name);
-	} else
-		rc = -ENODATA;
-
-	kfree(local_buffer);
-	return rc;
+	papr_sysparm_buf_free(buf);
+	return err;
 }
 
 /*
@@ -397,7 +361,6 @@ static void read_lpar_name(struct seq_file *m)
 		pr_err_once("Error can't get the LPAR name");
 }
 
-#define SPLPAR_CHARACTERISTICS_TOKEN 20
 #define SPLPAR_MAXLENGTH 1026*(sizeof(char))
 
 /*
@@ -408,45 +371,25 @@ static void read_lpar_name(struct seq_file *m)
  */
 static void parse_system_parameter_string(struct seq_file *m)
 {
-	const s32 token = rtas_token("ibm,get-system-parameter");
-	int call_status;
+	struct papr_sysparm_buf *buf;
 
-	unsigned char *local_buffer = kmalloc(SPLPAR_MAXLENGTH, GFP_KERNEL);
-	if (!local_buffer) {
-		printk(KERN_ERR "%s %s kmalloc failure at line %d\n",
-		       __FILE__, __func__, __LINE__);
+	buf = papr_sysparm_buf_alloc();
+	if (!buf)
 		return;
-	}
 
-	do {
-		spin_lock(&rtas_data_buf_lock);
-		memset(rtas_data_buf, 0, SPLPAR_MAXLENGTH);
-		call_status = rtas_call(token, 3, 1, NULL, SPLPAR_CHARACTERISTICS_TOKEN,
-					__pa(rtas_data_buf), RTAS_DATA_BUF_SIZE);
-		memcpy(local_buffer, rtas_data_buf, SPLPAR_MAXLENGTH);
-		local_buffer[SPLPAR_MAXLENGTH - 1] = '\0';
-		spin_unlock(&rtas_data_buf_lock);
-	} while (rtas_busy_delay(call_status));
-
-	if (call_status != 0) {
-		printk(KERN_INFO
-		       "%s %s Error calling get-system-parameter (0x%x)\n",
-		       __FILE__, __func__, call_status);
+	if (papr_sysparm_get(PAPR_SYSPARM_SHARED_PROC_LPAR_ATTRS, buf)) {
+		goto out_free;
 	} else {
+		const char *local_buffer;
 		int splpar_strlen;
 		int idx, w_idx;
 		char *workbuffer = kzalloc(SPLPAR_MAXLENGTH, GFP_KERNEL);
-		if (!workbuffer) {
-			printk(KERN_ERR "%s %s kmalloc failure at line %d\n",
-			       __FILE__, __func__, __LINE__);
-			kfree(local_buffer);
-			return;
-		}
-#ifdef LPARCFG_DEBUG
-		printk(KERN_INFO "success calling get-system-parameter\n");
-#endif
-		splpar_strlen = local_buffer[0] * 256 + local_buffer[1];
-		local_buffer += 2;	/* step over strlen value */
+
+		if (!workbuffer)
+			goto out_free;
+
+		splpar_strlen = be16_to_cpu(buf->len);
+		local_buffer = buf->val;
 
 		w_idx = 0;
 		idx = 0;
@@ -480,7 +423,8 @@ static void parse_system_parameter_string(struct seq_file *m)
 		kfree(workbuffer);
 		local_buffer -= 2;	/* back up over strlen value */
 	}
-	kfree(local_buffer);
+out_free:
+	papr_sysparm_buf_free(buf);
 }
 
 /* Return the number of processors in the system.

-- 
2.39.1

