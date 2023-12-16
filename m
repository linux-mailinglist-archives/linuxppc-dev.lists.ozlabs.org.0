Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C02F18159B2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 15:01:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FrBd8j56;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ssnnq3D4nz3vwN
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 01:01:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FrBd8j56;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnQB5HcYz3cb1
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:44:50 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-28aea039fb4so2046842a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734288; x=1703339088; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++ZpxvP8vNWeF7k9O8gsby5Qru97SRT8q80ApP6mYYI=;
        b=FrBd8j56atnbPGcsCRpklgAK1dIraz+170hKLiJYIAb3LepbZQd0x+2+28IQl+peZS
         k5pw2+PVHwaXym/YATyAX5m70ubXPDtatJisQDQN+ReXauRE/sqRT76Q+NFUZjDy//qC
         AQJ3/274bc96nkBewhH0nsQie5tPjIS3cDct1FaBWwPecTwtyVxmbnh2Fhv0bV/+GiIX
         vkLY0Dj/SzFUey/neqk7xXEhW5PP6eSNKBOEi42i3oAl/JaBkpVsXVatnHfOc0aIsgDj
         yR1qLQmFiDjIBV9eEeYZfhCQ+dnKh5+/qXoM7+33pvtwJyJE5E89zmPQkU34tBBlW8ei
         o/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734288; x=1703339088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++ZpxvP8vNWeF7k9O8gsby5Qru97SRT8q80ApP6mYYI=;
        b=RFAFaOmTzOxgOUyIF8MwgH4VV6mzBdHYxtG+HBlgMIuHX7rmLxHCWxhCBNmLc7RYzf
         EA2euNB/kzGltWWNURh57I1r1k2FQHSiNy4SMnuhUsjKqJOcIz/EG2Bho3MSuMT6oGVO
         DtzoYjRDXV6ScIGxaIhJxevfoMifneLivHHENFvV3QHT2ySpxIhDLTsIJl2Pbf/Ve/h7
         QGz2W8xSPySsYWI1M3IMLQa0kdzzBYdiR+RDK9I3DQxQ8SxGJ2pWJQWSK5IaAs3ZHXmE
         fmP177xfVHPPXuQcBhOSfYKvnsJshOHV0dRyT2lXF4yH/XhpHIp585Y0tb2MGpdIt64x
         KvKg==
X-Gm-Message-State: AOJu0YzRsj/ut895BBXXKQiR/e8Qfz+WHnIQy172uGiyXnJX/IURRqyx
	R6kr24bQzj3TsLYTe69TSTyVmXof+oc=
X-Google-Smtp-Source: AGHT+IEypAbmCCWLwXKqe4Re1RxPWLqJQ80AzT3PY7FXIpVeefqeGBi4L08W/+Vfrm9dgD9hI5QGig==
X-Received: by 2002:a17:90a:2f64:b0:28b:430d:ad20 with SMTP id s91-20020a17090a2f6400b0028b430dad20mr1741659pjd.3.1702734288005;
        Sat, 16 Dec 2023 05:44:48 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:44:47 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 22/29] powerpc: Fix emulator illegal instruction test for powernv
Date: Sat, 16 Dec 2023 23:42:49 +1000
Message-ID: <20231216134257.1743345-23-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231216134257.1743345-1-npiggin@gmail.com>
References: <20231216134257.1743345-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Illegal instructions cause 0xe40 (HEAI) interrupts rather
than program interrupts.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/emulator.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/powerpc/emulator.c b/powerpc/emulator.c
index 39dd5964..035a903c 100644
--- a/powerpc/emulator.c
+++ b/powerpc/emulator.c
@@ -31,6 +31,20 @@ static void program_check_handler(struct pt_regs *regs, void *opaque)
 	regs->nip += 4;
 }
 
+static void heai_handler(struct pt_regs *regs, void *opaque)
+{
+	int *data = opaque;
+
+	if (verbose) {
+		printf("Detected invalid instruction %#018lx: %08x\n",
+		       regs->nip, *(uint32_t*)regs->nip);
+	}
+
+	*data = 8; /* Illegal instruction */
+
+	regs->nip += 4;
+}
+
 static void alignment_handler(struct pt_regs *regs, void *opaque)
 {
 	int *data = opaque;
@@ -362,7 +376,10 @@ int main(int argc, char **argv)
 {
 	int i;
 
-	handle_exception(0x700, program_check_handler, (void *)&is_invalid);
+	if (machine_is_powernv())
+		handle_exception(0xe40, heai_handler, (void *)&is_invalid);
+	else
+		handle_exception(0x700, program_check_handler, (void *)&is_invalid);
 	handle_exception(0x600, alignment_handler, (void *)&alignment);
 
 	for (i = 1; i < argc; i++) {
-- 
2.42.0

