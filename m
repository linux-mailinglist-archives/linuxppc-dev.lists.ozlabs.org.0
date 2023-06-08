Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7DF72799E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 10:09:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcH1b4Lfjz3dwp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 18:09:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jsPmE4fa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jsPmE4fa;
	dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcGnm6Qzmz3f8G
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 17:59:24 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-662f0feafb2so251546b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 00:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686211163; x=1688803163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIf7mMUq3IomvCRzE/BwBbmr5XmOTNpFkv4p84CsDuY=;
        b=jsPmE4fa/vT9fHYhtvIl+4+1qBxxy9x9h7KJous9XPUnlMoK2Yq84qaDVaYAgzdGsv
         wwzj9dh1JSY3RVDhi/CFgfB69g4HrwyEaHKcxW2Wj5JDpBmRfOT0mhRoEtc+XLq8vXE9
         9F1JUrsDZXZ5oaAqZiF4NOvaROlEKlmclayf5q4alYReCrxdDy8uhu14teAPlnc0sH7z
         YiCaHdTlV2oWOU97+MdATNnkpUJ+qJM0Fe7wCzHoNghxfGfSqJfQ5ZHHET9gO3vQr8Ts
         AHhN5WQCMI2IgqpuqshQxUFf9CSgvmgEap3OI7UV6vERYP5duwMbmQSskAGbzNn3olBd
         hQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686211163; x=1688803163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gIf7mMUq3IomvCRzE/BwBbmr5XmOTNpFkv4p84CsDuY=;
        b=GuYU9qFyioY+so6n786YVny4KHXaFLx9COyqkmUH3lr/88nzCq8sMUHBY1oVxJuRRi
         DcCeMhoNIYK6Q/NWiI9W5fjQGaxiizze0pGHHrjFvdn2MzuOrS129kL9RzcJKyAFBIzA
         STKjHW0Z1VgDqEiXLvtsCw5W5O/SmoK4DxlU6I1ANCmpPMv2ABpBsVh1Jm1lBqJMAiI/
         LAuZx3VGsNcBhieV6lPKdJn8xugVa8gr+lWDuZ/8CK51reYGczHB2kyYj5IgDp9LsIVO
         f9WP0KD0uJIvjPPRn5KnRsifngJ5kmlGevBvBDfYckpZRfWuMqQGehgxW4DNrAe3vmVC
         3lfw==
X-Gm-Message-State: AC+VfDyED55creucuXOfvlc6ZgKUseaIwaM8Vpx+3cNvUNbkZ1+vrRyo
	7nut+sxkj36CZ/eHBaOPKFQ=
X-Google-Smtp-Source: ACHHUZ7j9tL8nMT4K1M5MLI0aYyAcL3vvSvos/iW3DoAZcAQYrxGQJhr3f0xfPBxEk3BSMBsxI26nQ==
X-Received: by 2002:a05:6a20:8405:b0:103:b585:b587 with SMTP id c5-20020a056a20840500b00103b585b587mr1786346pzd.13.1686211163017;
        Thu, 08 Jun 2023 00:59:23 -0700 (PDT)
Received: from wheely.local0.net ([1.146.34.117])
        by smtp.gmail.com with ESMTPSA id 17-20020a630011000000b00542d7720a6fsm673182pga.88.2023.06.08.00.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 00:59:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v4 12/12] powerpc/sprs: Test hypervisor registers on powernv machine
Date: Thu,  8 Jun 2023 17:58:26 +1000
Message-Id: <20230608075826.86217-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608075826.86217-1-npiggin@gmail.com>
References: <20230608075826.86217-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This enables HV privilege registers to be tested with the powernv
machine.

Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/sprs.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/powerpc/sprs.c b/powerpc/sprs.c
index d5664201..07a4e759 100644
--- a/powerpc/sprs.c
+++ b/powerpc/sprs.c
@@ -199,16 +199,16 @@ static const struct spr sprs_power_common[1024] = {
 [190] = {"HFSCR",	64,	HV_RW, },
 [256] = {"VRSAVE",	32,	RW, },
 [259] = {"SPRG3",	64,	RO, },
-[284] = {"TBL",		32,	HV_WO, },
-[285] = {"TBU",		32,	HV_WO, },
-[286] = {"TBU40",	64,	HV_WO, },
+[284] = {"TBL",		32,	HV_WO, }, /* Things can go a bit wonky with */
+[285] = {"TBU",		32,	HV_WO, }, /* Timebase changing. Should save */
+[286] = {"TBU40",	64,	HV_WO, }, /* and restore it. */
 [304] = {"HSPRG0",	64,	HV_RW, },
 [305] = {"HSPRG1",	64,	HV_RW, },
 [306] = {"HDSISR",	32,	HV_RW,		SPR_INT, },
 [307] = {"HDAR",	64,	HV_RW,		SPR_INT, },
 [308] = {"SPURR",	64,	HV_RW | OS_RO,	SPR_ASYNC, },
 [309] = {"PURR",	64,	HV_RW | OS_RO,	SPR_ASYNC, },
-[313] = {"HRMOR",	64,	HV_RW, },
+[313] = {"HRMOR",	64,	HV_RW,		SPR_HARNESS, }, /* Harness can't cope with HRMOR changing */
 [314] = {"HSRR0",	64,	HV_RW,		SPR_INT, },
 [315] = {"HSRR1",	64,	HV_RW,		SPR_INT, },
 [318] = {"LPCR",	64,	HV_RW, },
@@ -306,7 +306,7 @@ static const struct spr sprs_power9_10[1024] = {
 [921] = {"TSCR",	32,	HV_RW, },
 [922] = {"TTR",		64,	HV_RW, },
 [1006]= {"TRACE",	64,	WO, },
-[1008]= {"HID",		64,	HV_RW, },
+[1008]= {"HID",		64,	HV_RW,		SPR_HARNESS, }, /* At least HILE would be unhelpful to change */
 };
 
 /* This covers POWER8 and POWER9 PMUs */
@@ -350,6 +350,22 @@ static const struct spr sprs_power10_pmu[1024] = {
 
 static struct spr sprs[1024];
 
+static bool spr_read_perms(int spr)
+{
+	if (machine_is_powernv())
+		return !!(sprs[spr].access & SPR_HV_READ);
+	else
+		return !!(sprs[spr].access & SPR_OS_READ);
+}
+
+static bool spr_write_perms(int spr)
+{
+	if (machine_is_powernv())
+		return !!(sprs[spr].access & SPR_HV_WRITE);
+	else
+		return !!(sprs[spr].access & SPR_OS_WRITE);
+}
+
 static void setup_sprs(void)
 {
 	uint32_t pvr = mfspr(287);	/* Processor Version Register */
@@ -466,7 +482,7 @@ static void get_sprs(uint64_t *v)
 	int i;
 
 	for (i = 0; i < 1024; i++) {
-		if (!(sprs[i].access & SPR_OS_READ))
+		if (!spr_read_perms(i))
 			continue;
 		v[i] = __mfspr(i);
 	}
@@ -477,8 +493,9 @@ static void set_sprs(uint64_t val)
 	int i;
 
 	for (i = 0; i < 1024; i++) {
-		if (!(sprs[i].access & SPR_OS_WRITE))
+		if (!spr_write_perms(i))
 			continue;
+
 		if (sprs[i].type & SPR_HARNESS)
 			continue;
 		if (!strcmp(sprs[i].name, "MMCR0")) {
@@ -550,7 +567,7 @@ int main(int argc, char **argv)
 	for (i = 0; i < 1024; i++) {
 		bool pass = true;
 
-		if (!(sprs[i].access & SPR_OS_READ))
+		if (!spr_read_perms(i))
 			continue;
 
 		if (sprs[i].width == 32) {
-- 
2.40.1

