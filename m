Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC55372499
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 05:05:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZ4Tr5GQ9z3bsm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 13:05:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RsnRJt1E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RsnRJt1E; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZ4S71rwMz2y6N
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 13:04:06 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14433Ieq173733; Mon, 3 May 2021 23:04:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qcYS5Ik6afr36u+FzjRkSWgTr5aLw9AvvNv0FTPT5yo=;
 b=RsnRJt1Et0STH4TdVxWbd5Sm8XsRWy0mEHTRGNmvoJxptoib6TvhUg97T3Hp/rmr2mus
 NRe5MZdQFT/A/DTS2ttkyLQCitn4gXJrcGnB0+PESrDeFsMJWqm3esexAOBJW9zqOoNZ
 7kYLr6N0/x8XE8x4rLA0ibw7al+V3Xv1qGLIEx3LdUcVf4f/oCLyl1CXY6xWXAt1AFuS
 /R/NbmEiVTuoMvY10NdjHf7CBtQ34Mh8nZw9Ls+o9RtLP+kx4X/4P/ENerDko2Se8mFF
 BApJpNDuGE4ttgv7wxdPjm6SF5H1PNiZoH9hfRC/AC+N9pUUrQ5t+uOeKB8Vw864BAzP XQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38awr509wd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 23:04:01 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14433gQg007207;
 Tue, 4 May 2021 03:04:00 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 388xm8thdc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 03:04:00 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 144340ht21758302
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 May 2021 03:04:00 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1805AAC05B;
 Tue,  4 May 2021 03:04:00 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4AF4AC060;
 Tue,  4 May 2021 03:03:59 +0000 (GMT)
Received: from localhost (unknown [9.211.126.236])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  4 May 2021 03:03:59 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC 01/10] powerpc/rtas: new APIs for busy and extended delay
 statuses
Date: Mon,  3 May 2021 22:03:49 -0500
Message-Id: <20210504030358.1715034-2-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210504030358.1715034-1-nathanl@linux.ibm.com>
References: <20210504030358.1715034-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: a49DbsYZFnE6wfS6d1Sf-nSL8fr00Rd1
X-Proofpoint-ORIG-GUID: a49DbsYZFnE6wfS6d1Sf-nSL8fr00Rd1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_01:2021-05-03,
 2021-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 mlxscore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105040023
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
Cc: aik@ozlabs.ru, ajd@linux.ibm.com, tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add new APIs for handling busy (-2) and extended delay
hint (9900...9905) statuses from RTAS. These are intended to be
drop-in replacements for existing uses of rtas_busy_delay().

A problem with rtas_busy_delay() and rtas_busy_delay_time() is that
they consider -2/busy to be equivalent to 9900 (wait 1ms). In fact,
the OS should call again as soon as it wants on -2, which at least on
PowerVM means RTAS is returning only to uphold the general requirement
that RTAS must return control to the OS in a "timely fashion" (250us).

Combine this with the fact that msleep(1) actually sleeps for more
like 20ms in practice: on busy VMs we schedule away for much longer
than necessary on -2 and 9900.

This is fixed in rtas_sched_if_busy(), which uses usleep_range() for
small delay hints, and only schedules away on -2 if there is other
work available. It also refuses to sleep longer than one second
regardless of the hinted value, on the assumption that even longer
running operations can tolerate polling at 1HZ.

rtas_spin_if_busy() and rtas_force_spin_if_busy() are provided for
atomic contexts which need to handle busy status and extended delay
hints.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h |   4 +
 arch/powerpc/kernel/rtas.c      | 168 ++++++++++++++++++++++++++++++++
 2 files changed, 172 insertions(+)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 9dc97d2f9d27..555ff3290f92 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -266,6 +266,10 @@ extern int rtas_set_rtc_time(struct rtc_time *rtc_time);
 extern unsigned int rtas_busy_delay_time(int status);
 extern unsigned int rtas_busy_delay(int status);
 
+bool rtas_sched_if_busy(int status);
+bool rtas_spin_if_busy(int status);
+bool rtas_force_spin_if_busy(int status);
+
 extern int early_init_dt_scan_rtas(unsigned long node,
 		const char *uname, int depth, void *data);
 
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 6bada744402b..4a1dfbfa51ba 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -519,6 +519,174 @@ unsigned int rtas_busy_delay(int status)
 }
 EXPORT_SYMBOL(rtas_busy_delay);
 
+/**
+ * rtas_force_spin_if_busy() - Consume a busy or extended delay status
+ *                             in atomic context.
+ * @status: Return value from rtas_call() or similar function.
+ *
+ * Use this function when you cannot avoid using an RTAS function
+ * which may return an extended delay hint in atomic context. If
+ * possible, use rtas_spin_if_busy() or rtas_sched_if_busy() instead
+ * of this function.
+ *
+ * Return: True if @status is -2 or 990x, in which case
+ *         rtas_spin_if_busy() will have delayed an appropriate amount
+ *         of time, and the caller should call the RTAS function
+ *         again. False otherwise.
+ */
+bool rtas_force_spin_if_busy(int status)
+{
+	bool was_busy = true;
+
+	switch (status) {
+	case RTAS_BUSY:
+		/* OK to call again immediately; do nothing. */
+		break;
+	case RTAS_EXTENDED_DELAY_MIN...RTAS_EXTENDED_DELAY_MAX:
+		mdelay(1);
+		break;
+	default:
+		was_busy = false;
+		break;
+	}
+
+	return was_busy;
+}
+
+/**
+ * rtas_spin_if_busy() - Consume a busy status in atomic context.
+ * @status: Return value from rtas_call() or similar function.
+ *
+ * Prefer rtas_sched_if_busy() over this function. Prefer this
+ * function over rtas_force_spin_if_busy(). Use this function in
+ * atomic contexts with RTAS calls that are specified to return -2 but
+ * not 990x. This function will complain and execute a minimal delay
+ * if passed a 990x status.
+ *
+ * Return: True if @status is -2 or 990x, in which case
+ *         rtas_spin_if_busy() will have delayed an appropriate amount
+ *         of time, and the caller should call the RTAS function
+ *         again. False otherwise.
+ */
+bool rtas_spin_if_busy(int status)
+{
+	bool was_busy = true;
+
+	switch (status) {
+	case RTAS_BUSY:
+		/* OK to call again immediately; do nothing. */
+		break;
+	case RTAS_EXTENDED_DELAY_MIN...RTAS_EXTENDED_DELAY_MAX:
+		/*
+		 * Generally, RTAS functions which can return this
+		 * status should be considered too expensive to use in
+		 * atomic context. Change the calling code to use
+		 * rtas_sched_if_busy(), or if that's not possible,
+		 * use rtas_force_spin_if_busy().
+		 */
+		pr_warn_once("%pS may use RTAS call in atomic context which returns extended delay.\n",
+			     __builtin_return_address(0));
+		mdelay(1);
+		break;
+	default:
+		was_busy = false;
+		break;
+	}
+
+	return was_busy;
+}
+
+static unsigned long extended_delay_ms(unsigned int status)
+{
+	unsigned int extdelay;
+	unsigned int order;
+	unsigned int ms;
+
+	extdelay = clamp((int)status, RTAS_EXTENDED_DELAY_MIN, RTAS_EXTENDED_DELAY_MAX);
+	WARN_ONCE(extdelay != status, "%s passed invalid status %u\n", __func__, status);
+
+	order = status - RTAS_EXTENDED_DELAY_MIN;
+	for (ms = 1; order > 0; order--)
+		ms *= 10;
+
+	return ms;
+}
+
+static void handle_extended_delay(unsigned int status)
+{
+	unsigned long usecs;
+
+	usecs = 1000 * extended_delay_ms(status);
+
+	/*
+	 * If we have no other work pending, there's no reason to
+	 * sleep.
+	 */
+	if (!need_resched())
+		return;
+
+	/*
+	 * The extended delay hint can be as high as 100
+	 * seconds. Surely any function returning such a status is
+	 * either buggy or isn't going to be significantly slowed by
+	 * us polling at 1HZ. Clamp the sleep time to one second.
+	 */
+	usecs = clamp(usecs, 1000UL, 1000000UL);
+
+	/*
+	 * The delay hint is an order-of-magnitude suggestion, not a
+	 * minimum. It is fine, possibly even advantageous, for us to
+	 * pause for less time than suggested. For small values, use
+	 * usleep_range() to ensure we don't sleep much longer than
+	 * actually suggested.
+	 *
+	 * See Documentation/timers/timers-howto.rst for explanation
+	 * of the threshold used here.
+	 */
+	if (usecs <= 20000)
+		usleep_range(usecs / 2, 2 * usecs);
+	else
+		msleep(DIV_ROUND_UP(usecs, 1000));
+}
+
+/**
+ * rtas_sched_if_busy() - Consume a busy or extended delay status.
+ * @status: Return value from rtas_call() or similar function.
+ *
+ * Prefer this function over rtas_spin_if_busy().
+ *
+ * Context: This function may sleep.
+ *
+ * Return: True if @status is -2 or 990x, in which case
+ *         rtas_sched_if_busy() will have slept an appropriate amount
+ *         of time, and the caller should call the RTAS function
+ *         again. False otherwise.
+ */
+bool rtas_sched_if_busy(int status)
+{
+	bool was_busy = true;
+
+	might_sleep();
+
+	switch (status) {
+	case RTAS_BUSY:
+		/*
+		 * OK to call again immediately. Schedule if there's
+		 * other work to do, but no sleep is necessary.
+		 */
+		cond_resched();
+		break;
+	case RTAS_EXTENDED_DELAY_MIN...RTAS_EXTENDED_DELAY_MAX:
+		handle_extended_delay(status);
+		break;
+	default:
+		was_busy = false;
+		break;
+	}
+
+	return was_busy;
+}
+
 static int rtas_error_rc(int rtas_rc)
 {
 	int rc;
-- 
2.30.2

