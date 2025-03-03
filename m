Return-Path: <linuxppc-dev+bounces-6637-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 799E1A4BDC2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 12:13:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5x3B3pH0z3c6Z;
	Mon,  3 Mar 2025 22:11:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741000310;
	cv=none; b=kg6vn9u/tijdQL7vroCNKTp4f3gAYE8vy+rRhGrMYjg24Er2chkTYsCJWqPQ/VSyRjzd0kAgjPls/FD1eSTsC/vsq2oTp+xLea8XFfl9ekrNjG6E2Zj/kS3ubLSwop+4Te9lBtoE62eJgjokE5TMvOWCq19EZ6dJT+zsQrAAYK03X0ldIzTrZ8ZIOCZJfquyKecjvlVJWEKpTYGfnvu+yy6/qO1aRbLZSCjXr3TDlsEIAkN3Ol2SAgPJ4f8JnQU7eKYxraUi+y91qX1Ax+IeCrmSZQOk7LmpS+1GJrZrM0ToWhxzzar68dn6FqJtm4CddLiv6SC2O7IcYpoH5r1DDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741000310; c=relaxed/relaxed;
	bh=XReqk4Aen4MK7eX+VauyjHHk/TSJRy2pW2Es7/MoImA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PEfB0im+3mB+Ooo0MpV1w2lZsDtdPaf6FqbLRQOWU35/bigvkz/XKSJH7AKuq451d+KM8p+oti9Iqswn92O5MQbhMaXqtW9f2dx4ngbSnRo/PiLdQsxq57N3jUPgGhPWorRZowPbfPTn74AxWLrFeJERHZ8KACy6ySIFLnPpQ7uGat+Bf4DDBo2UDI9AQB5SxRUcWE9DMtuI4xpj763VeTjmti1iZvB5M8oMszR+wEI1MjOVuFoAX2laIQa9zozsCCmVHuvaOcVBwpMTz9oisLgzMxw106jFXQ9UAHv4XpGfm6eEbWWbTT5F1+I9531UsptJrX1MHCkSFq4Z5KvxcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=LmV6BZNb; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cidttnyv; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=LmV6BZNb;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cidttnyv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4Z5x391Ss2z30W9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 22:11:49 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XReqk4Aen4MK7eX+VauyjHHk/TSJRy2pW2Es7/MoImA=;
	b=LmV6BZNbIbXd82Wfm/N0Wga1F48N9yW7wFH/MNP3apM4AwlfaJ7UUHoH2G4jLcqgfirUrZ
	bMP3czVab7xcpYSGXAX1FZ4kPenS3TNCt1QPC1+/65AjmrupUTH2OkrYPIkTvMJ4RM2SSB
	aG0aNqkFKEeAthWGMNFfp6c7yY+Rc5JhcNDkJHE/eZ4CbsNp5XLEkoTvG7IdD8+h+VJDbc
	BQEJ6RY3Sgdsk8Tl1u242U/4fhoyOVyyrQu0swEnzDkSNQ6xj9/6AYQdkbStOA9gup6WlA
	PVQh/RK/KrAdDcgCtKpxNlo2yFx2L7e37BmhphP0xIh5qB8jobwZWf/dOkGROQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XReqk4Aen4MK7eX+VauyjHHk/TSJRy2pW2Es7/MoImA=;
	b=cidttnyvEBhkcKoxcdejbdB8UW6sNnz6bQlRh0g3VIer+5ywzsJPGAUmJBCSkVPa5eIktN
	EbTm/ptslRomsQAQ==
Date: Mon, 03 Mar 2025 12:11:16 +0100
Subject: [PATCH 14/19] time/namespace: Prepare introduction of struct
 vdso_clock
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250303-vdso-clock-v1-14-c1b5c69a166f@linutronix.de>
References: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
In-Reply-To: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=3143;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=rvrB9ifBvRXgxwLjfAy8fiQwFAt4ofAQmLlLCatQ/ko=;
 b=00VGODDgq5LMqN9LKjPqKVX6bcYBv+gb9Z2V8XxONuiiNC44yja15un2b1lmnwgWBadX1tPE6
 zsfhL+2AmkJCVPhjZEGt7SQCB6rqlcljig5snI8lxOHkljl8bO6qj8y
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Anna-Maria Behnsen <anna-maria@linutronix.de>

To support multiple PTP clocks, the VDSO data structure needs to be
reworked. All clock specific data will end up in struct vdso_clock and in
struct vdso_time_data there will be array of it. By now, vdso_clock is
simply a define which maps vdso_clock to vdso_time_data.

To prepare for the rework of the data structures, replace the struct
vdso_time_data pointer with struct vdso_clock pointer whenever applicable.

No functional change.

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 kernel/time/namespace.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/kernel/time/namespace.c b/kernel/time/namespace.c
index f02430a73be8f081618792c8968bf0c112c54505..09bc4fb39f24ccdaa1e6e7f7238660a4f2a63b54 100644
--- a/kernel/time/namespace.c
+++ b/kernel/time/namespace.c
@@ -165,26 +165,26 @@ static struct timens_offset offset_from_ts(struct timespec64 off)
  *     HVCLOCK
  *     VVAR
  *
- * The check for vdso_time_data->clock_mode is in the unlikely path of
+ * The check for vdso_clock->clock_mode is in the unlikely path of
  * the seq begin magic. So for the non-timens case most of the time
  * 'seq' is even, so the branch is not taken.
  *
  * If 'seq' is odd, i.e. a concurrent update is in progress, the extra check
- * for vdso_time_data->clock_mode is a non-issue. The task is spin waiting for the
+ * for vdso_clock->clock_mode is a non-issue. The task is spin waiting for the
  * update to finish and for 'seq' to become even anyway.
  *
- * Timens page has vdso_time_data->clock_mode set to VDSO_CLOCKMODE_TIMENS which
+ * Timens page has vdso_clock->clock_mode set to VDSO_CLOCKMODE_TIMENS which
  * enforces the time namespace handling path.
  */
-static void timens_setup_vdso_clock_data(struct vdso_time_data *vdata,
+static void timens_setup_vdso_clock_data(struct vdso_clock *vc,
 					 struct time_namespace *ns)
 {
-	struct timens_offset *offset = vdata->offset;
+	struct timens_offset *offset = vc->offset;
 	struct timens_offset monotonic = offset_from_ts(ns->offsets.monotonic);
 	struct timens_offset boottime = offset_from_ts(ns->offsets.boottime);
 
-	vdata->seq			= 1;
-	vdata->clock_mode		= VDSO_CLOCKMODE_TIMENS;
+	vc->seq				= 1;
+	vc->clock_mode			= VDSO_CLOCKMODE_TIMENS;
 	offset[CLOCK_MONOTONIC]		= monotonic;
 	offset[CLOCK_MONOTONIC_RAW]	= monotonic;
 	offset[CLOCK_MONOTONIC_COARSE]	= monotonic;
@@ -220,6 +220,7 @@ static void timens_set_vvar_page(struct task_struct *task,
 				struct time_namespace *ns)
 {
 	struct vdso_time_data *vdata;
+	struct vdso_clock *vc;
 	unsigned int i;
 
 	if (ns == &init_time_ns)
@@ -236,9 +237,10 @@ static void timens_set_vvar_page(struct task_struct *task,
 
 	ns->frozen_offsets = true;
 	vdata = page_address(ns->vvar_page);
+	vc = vdata;
 
 	for (i = 0; i < CS_BASES; i++)
-		timens_setup_vdso_clock_data(&vdata[i], ns);
+		timens_setup_vdso_clock_data(&vc[i], ns);
 
 out:
 	mutex_unlock(&offset_lock);

-- 
2.48.1


