Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7865824AE06
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 06:47:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXBw43KrFzDr3G
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 14:47:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oY3oB+tS; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXBt44PYjzDr0X
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 14:45:46 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07K4XJo7183191; Thu, 20 Aug 2020 00:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=GwVLx/xv7tBrzX2p2kv/Zfm1DHG6hQKtMPZL0xSRlZA=;
 b=oY3oB+tSjSgtqkeB9ioEz1SzIlYf0nvk6t7HWh8cf7ONaWAvxnatZob29EaF7tFXni6g
 UD+gsfE9oqjsfOj4f5mdjVZVYGOZjMacPCDvo1VkQaSvGXjbvZxHff+T7P6LLOfV1zkK
 mRxVyIYKRq6iUOkdgDPHNVqVu0swJeb7XUTfBimKnFkSPsj4Hc/g6f7o+DIs34gIjPz9
 NCXBVZQ65Gjn7G7LKrYmj5+7JXz72byx3hSjrGt+zYwZCj+U+zMM3SQp6cVxPJy7SJIt
 CoyvSrVNiZEJU8PVc2lQK4XHisYywxF1aPPb/lEji6TxH8mWv3xRtZZbl1yaUEuUSCYt HQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3304r559k1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Aug 2020 00:45:43 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07K4Xhm8184113;
 Thu, 20 Aug 2020 00:45:42 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3304r559jd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Aug 2020 00:45:42 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07K4jQX3017057;
 Thu, 20 Aug 2020 04:45:40 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3304um2p2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Aug 2020 04:45:40 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07K4jco731588684
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Aug 2020 04:45:38 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96CE9AE059;
 Thu, 20 Aug 2020 04:45:38 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05324AE055;
 Thu, 20 Aug 2020 04:45:38 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 Aug 2020 04:45:37 +0000 (GMT)
Received: from intelligence.ibm.com (unknown [9.102.47.244])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 46AD3A00E7;
 Thu, 20 Aug 2020 14:45:35 +1000 (AEST)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] powerpc/rtas: Restrict RTAS requests from userspace
Date: Thu, 20 Aug 2020 14:45:12 +1000
Message-Id: <20200820044512.7543-1-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-19_13:2020-08-19,
 2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 bulkscore=0
 priorityscore=1501 suspectscore=1 mlxlogscore=999 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008200039
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
Cc: nathanl@linux.ibm.com, leobras.c@gmail.com, stable@vger.kernel.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A number of userspace utilities depend on making calls to RTAS to retrieve
information and update various things.

The existing API through which we expose RTAS to userspace exposes more
RTAS functionality than we actually need, through the sys_rtas syscall,
which allows root (or anyone with CAP_SYS_ADMIN) to make any RTAS call they
want with arbitrary arguments.

Many RTAS calls take the address of a buffer as an argument, and it's up to
the caller to specify the physical address of the buffer as an argument. We
allocate a buffer (the "RMO buffer") in the Real Memory Area that RTAS can
access, and then expose the physical address and size of this buffer in
/proc/powerpc/rtas/rmo_buffer. Userspace is expected to read this address,
poke at the buffer using /dev/mem, and pass an address in the RMO buffer to
the RTAS call.

However, there's nothing stopping the caller from specifying whatever
address they want in the RTAS call, and it's easy to construct a series of
RTAS calls that can overwrite arbitrary bytes (even without /dev/mem
access).

Additionally, there are some RTAS calls that do potentially dangerous
things and for which there are no legitimate userspace use cases.

In the past, this would not have been a particularly big deal as it was
assumed that root could modify all system state freely, but with Secure
Boot and lockdown we need to care about this.

We can't fundamentally change the ABI at this point, however we can address
this by implementing a filter that checks RTAS calls against a list
of permitted calls and forces the caller to use addresses within the RMO
buffer.

The list is based off the list of calls that are used by the librtas
userspace library, and has been tested with a number of existing userspace
RTAS utilities. For compatibility with any applications we are not aware of
that require other calls, the filter can be turned off at build time.

Reported-by: Daniel Axtens <dja@axtens.net>
Cc: stable@vger.kernel.org
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

---
v1->v2:
- address comments from mpe
- shorten the names of some struct members
- make the filter array static/ro_after_init, use const char *
- genericise the fixed buffer size cases
- simplify/get rid of some of the error printing
- get rid of rtas_token_name()
---
 arch/powerpc/Kconfig       |  13 ++++
 arch/powerpc/kernel/rtas.c | 153 +++++++++++++++++++++++++++++++++++++
 2 files changed, 166 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1f48bbfb3ce9..8dd42b82379b 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -989,6 +989,19 @@ config PPC_SECVAR_SYSFS
 	  read/write operations on these variables. Say Y if you have
 	  secure boot enabled and want to expose variables to userspace.
 
+config PPC_RTAS_FILTER
+	bool "Enable filtering of RTAS syscalls"
+	default y
+	depends on PPC_RTAS
+	help
+	  The RTAS syscall API has security issues that could be used to
+	  compromise system integrity. This option enforces restrictions on the
+	  RTAS calls and arguments passed by userspace programs to mitigate
+	  these issues.
+
+	  Say Y unless you know what you are doing and the filter is causing
+	  problems for you.
+
 endmenu
 
 config ISA_DMA_API
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 806d554ce357..954f41676f69 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -992,6 +992,147 @@ struct pseries_errorlog *get_pseries_errorlog(struct rtas_error_log *log,
 	return NULL;
 }
 
+#ifdef CONFIG_PPC_RTAS_FILTER
+
+/*
+ * The sys_rtas syscall, as originally designed, allows root to pass
+ * arbitrary physical addresses to RTAS calls. A number of RTAS calls
+ * can be abused to write to arbitrary memory and do other things that
+ * are potentially harmful to system integrity, and thus should only
+ * be used inside the kernel and not exposed to userspace.
+ *
+ * All known legitimate users of the sys_rtas syscall will only ever
+ * pass addresses that fall within the RMO buffer, and use a known
+ * subset of RTAS calls.
+ *
+ * Accordingly, we filter RTAS requests to check that the call is
+ * permitted, and that provided pointers fall within the RMO buffer.
+ * The rtas_filters list contains an entry for each permitted call,
+ * with the indexes of the parameters which are expected to contain
+ * addresses and sizes of buffers allocated inside the RMO buffer.
+ */
+struct rtas_filter {
+	const char *name;
+	int token;
+	/* Indexes into the args buffer, -1 if not used */
+	int buf_idx1;
+	int size_idx1;
+	int buf_idx2;
+	int size_idx2;
+
+	int fixed_size;
+};
+
+static struct rtas_filter rtas_filters[] __ro_after_init = {
+	{ "ibm,activate-firmware", -1, -1, -1, -1, -1 },
+	{ "ibm,configure-connector", -1, 0, -1, 1, -1, 4096 },	/* Special cased */
+	{ "display-character", -1, -1, -1, -1, -1 },
+	{ "ibm,display-message", -1, 0, -1, -1, -1 },
+	{ "ibm,errinjct", -1, 2, -1, -1, -1, 1024 },
+	{ "ibm,close-errinjct", -1, -1, -1, -1, -1 },
+	{ "ibm,open-errinct", -1, -1, -1, -1, -1 },
+	{ "ibm,get-config-addr-info2", -1, -1, -1, -1, -1 },
+	{ "ibm,get-dynamic-sensor-state", -1, 1, -1, -1, -1 },
+	{ "ibm,get-indices", -1, 2, 3, -1, -1 },
+	{ "get-power-level", -1, -1, -1, -1, -1 },
+	{ "get-sensor-state", -1, -1, -1, -1, -1 },
+	{ "ibm,get-system-parameter", -1, 1, 2, -1, -1 },
+	{ "get-time-of-day", -1, -1, -1, -1, -1 },
+	{ "ibm,get-vpd", -1, 0, -1, 1, 2 },
+	{ "ibm,lpar-perftools", -1, 2, 3, -1, -1 },
+	{ "ibm,platform-dump", -1, 4, 5, -1, -1 },
+	{ "ibm,read-slot-reset-state", -1, -1, -1, -1, -1 },
+	{ "ibm,scan-log-dump", -1, 0, 1, -1, -1 },
+	{ "ibm,set-dynamic-indicator", -1, 2, -1, -1, -1 },
+	{ "ibm,set-eeh-option", -1, -1, -1, -1, -1 },
+	{ "set-indicator", -1, -1, -1, -1, -1 },
+	{ "set-power-level", -1, -1, -1, -1, -1 },
+	{ "set-time-for-power-on", -1, -1, -1, -1, -1 },
+	{ "ibm,set-system-parameter", -1, 1, -1, -1, -1 },
+	{ "set-time-of-day", -1, -1, -1, -1, -1 },
+	{ "ibm,suspend-me", -1, -1, -1, -1, -1 },
+	{ "ibm,update-nodes", -1, 0, -1, -1, -1, 4096 },
+	{ "ibm,update-properties", -1, 0, -1, -1, -1, 4096 },
+	{ "ibm,physical-attestation", -1, 0, 1, -1, -1 },
+};
+
+static bool in_rmo_buf(u32 base, u32 end)
+{
+	return base >= rtas_rmo_buf &&
+		base < (rtas_rmo_buf + RTAS_RMOBUF_MAX) &&
+		base <= end &&
+		end >= rtas_rmo_buf &&
+		end < (rtas_rmo_buf + RTAS_RMOBUF_MAX);
+}
+
+static bool block_rtas_call(int token, int nargs,
+			    struct rtas_args *args)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(rtas_filters); i++) {
+		struct rtas_filter *f = &rtas_filters[i];
+		u32 base, size, end;
+
+		if (token != f->token)
+			continue;
+
+		if (f->buf_idx1 != -1) {
+			base = be32_to_cpu(args->args[f->buf_idx1]);
+			if (f->size_idx1 != -1)
+				size = be32_to_cpu(args->args[f->size_idx1]);
+			else if (f->fixed_size)
+				size = f->fixed_size;
+			else
+				size = 1;
+
+			end = base + size - 1;
+			if (!in_rmo_buf(base, end))
+				goto err;
+		}
+
+		if (f->buf_idx2 != -1) {
+			base = be32_to_cpu(args->args[f->buf_idx2]);
+			if (f->size_idx2 != -1)
+				size = be32_to_cpu(args->args[f->size_idx2]);
+			else if (f->fixed_size)
+				size = f->fixed_size;
+			else
+				size = 1;
+			end = base + size - 1;
+
+			/*
+			 * Special case for ibm,configure-connector where the
+			 * address can be 0
+			 */
+			if (!strcmp(f->name, "ibm,configure-connector") &&
+			    base == 0)
+				return false;
+
+			if (!in_rmo_buf(base, end))
+				goto err;
+		}
+
+		return false;
+	}
+
+err:
+	pr_err_ratelimited("sys_rtas: RTAS call blocked - exploit attempt?\n");
+	pr_err_ratelimited("sys_rtas: token=0x%x, nargs=%d (called by %s)\n",
+			   token, nargs, current->comm);
+	return true;
+}
+
+#else
+
+static bool block_rtas_call(int token, int nargs,
+			    struct rtas_args *args)
+{
+	return false;
+}
+
+#endif /* CONFIG_PPC_RTAS_FILTER */
+
 /* We assume to be passed big endian arguments */
 SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 {
@@ -1029,6 +1170,9 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	args.rets = &args.args[nargs];
 	memset(args.rets, 0, nret * sizeof(rtas_arg_t));
 
+	if (block_rtas_call(token, nargs, &args))
+		return -EINVAL;
+
 	/* Need to handle ibm,suspend_me call specially */
 	if (token == ibm_suspend_me_token) {
 
@@ -1090,6 +1234,9 @@ void __init rtas_initialize(void)
 	unsigned long rtas_region = RTAS_INSTANTIATE_MAX;
 	u32 base, size, entry;
 	int no_base, no_size, no_entry;
+#ifdef CONFIG_PPC_RTAS_FILTER
+	int i;
+#endif
 
 	/* Get RTAS dev node and fill up our "rtas" structure with infos
 	 * about it.
@@ -1129,6 +1276,12 @@ void __init rtas_initialize(void)
 #ifdef CONFIG_RTAS_ERROR_LOGGING
 	rtas_last_error_token = rtas_token("rtas-last-error");
 #endif
+
+#ifdef CONFIG_PPC_RTAS_FILTER
+	for (i = 0; i < ARRAY_SIZE(rtas_filters); i++) {
+		rtas_filters[i].token = rtas_token(rtas_filters[i].name);
+	}
+#endif
 }
 
 int __init early_init_dt_scan_rtas(unsigned long node,
-- 
2.20.1

