Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9985884C34E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 04:54:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C0xzESGv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TV5p13m5Bz3cWw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 14:54:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C0xzESGv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TV5mP1c0Fz2yps
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Feb 2024 14:52:35 +1100 (AEDT)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6e0f43074edso99550a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Feb 2024 19:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707277950; x=1707882750; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nhitXmFJmmyhqpz6mvCkhwCuxWwgB2JA7e7bqOnN1q4=;
        b=C0xzESGvj1igdjkcXoTmdP0T1KmpeZ4R17g5P+5p/bgbMpZNyjgOEpYblz5Xlau0vb
         QVNCCBI6syMwxBi/GYm3xW5ncp4DdEL7HAGXlZ4rzpBGP0fwvTSQxxMCPn33S1jJdejA
         rB0Abm/XuopUqVmhEtTfcLhsmwp8nnTxQwOCaN37M947h0nn2uDyA4wh3rtC1SQkxdh2
         kh9I3DUuqIFaqtWI1esMWwMlnSgJrQzONxCoP3O3Is8gRUf0E8fJNiUiQ6xFjwPZeSUd
         fie+tVvU0UPKwP+jALvKMejZ74vgbWZaGkZk4wiIE119/ZdJYsZo/PORtI4X0vDCPOVL
         BoDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707277950; x=1707882750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhitXmFJmmyhqpz6mvCkhwCuxWwgB2JA7e7bqOnN1q4=;
        b=Qcog3XJDeEJMxSnCwPVB/4hAnaneVOBb4rGjQMT1e0pe8Tj9N1R3lb10gwNrDt8YUX
         NZqtiTXuhDKskvrrsqh2nerraqSNbozxo4fAJLi1WFOIwrltz28DwNPkZWK05cS9I/qW
         phrVqg4gxWbfytgyQlOdzDk2gu+QpGumOkyf//Q7ogabRyfcT9UUsYoh+1aPe+uvmpn7
         AU+a+qO3afTpcjd+66l9HXL2Cdy1czTLnZ/w5MDmmFnD9uuqqvK2EWORjRnXa4bOHaui
         etUstkMqu8s0d1W+8yCI09/qeSYNg8A+4uwk4HmAy4eMAz38+10fZe9USXl8VYxdTcgI
         zckw==
X-Gm-Message-State: AOJu0YwOPdBo3vDHUEZoGSjeKLEf1K3J4I3X/D8iwHm1S4zCDLCUKINC
	PsfIXICBLWPrqCkJbYeaKbT6hOCSL4L+8VgPMLWVOrYcQujRhXdxfWLfNgI0
X-Google-Smtp-Source: AGHT+IEaaaUHOclCiO0V60VZcyMj7akbkg0hhPDnYCIZAowH6A5jeUYvxiU9L92KO37rhAapqj70oQ==
X-Received: by 2002:a05:6358:899:b0:175:6fff:d6a0 with SMTP id m25-20020a056358089900b001756fffd6a0mr1525957rwj.1.1707277950613;
        Tue, 06 Feb 2024 19:52:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXUIY0vDOL7ZUyER4PoLdJmffxpxshNzM6MeV32hP1JXHpsfz1QmxIYo8W7TfC0V+MQpdA/cI9L+MxgTjApZi4Tv3uKw5c=
Received: from wheely.local0.net (220-235-217-21.tpgi.com.au. [220.235.217.21])
        by smtp.gmail.com with ESMTPSA id it7-20020a056a00458700b006e02da39dbcsm325317pfb.10.2024.02.06.19.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 19:52:30 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/pseries: Add a clear modifier to ibm,pa/pi-features parser
Date: Wed,  7 Feb 2024 13:52:18 +1000
Message-ID: <20240207035220.339726-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a new ibm,pa/pi-features bit is introduced that is intended to
apply to existing systems and features, it may have an "inverted"
meaning (i.e., bit clear => feature available; bit set => unavailable).
Depending on the nature of the feature, this may give the best
backward compatibility result where old firmware will continue to
have that bit clear and therefore the feature available.

The 'invert' modifier presumably was introduced for this type of
feature bit. However it invert will set the feature if the bit is
clear, which prevents it being used in the situation where an old
CPU lacks a feature that a new CPU has, then a new firmware comes
out to disable that feature on the new CPU if the bit is set.
Adding an 'invert' entry for that feature would incorrectly enable
it for the old CPU.

So add a 'clear' modifier that clears the feature if the bit is set,
but it does not set the feature if the bit is clear. The feature
is expected to be set in the cpu table.

This replaces the 'invert' modifier, which is unused since commit
7d4703455168 ("powerpc/feature: Remove CPU_FTR_NODSISRALIGN").

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/prom.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 0b5878c3125b..62f4a0229fae 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -151,6 +151,9 @@ static void __init move_device_tree(void)
  * pa-features property is missing, or a 1/0 to indicate if the feature
  * is supported/not supported.  Note that the bit numbers are
  * big-endian to match the definition in PAPR.
+ * Note: the 'clear' flag clears the feature if the bit is set in the
+ * the ibm,pa/pi-features property, it does not set the feature if the
+ * bit is clear.
  */
 struct ibm_feature {
 	unsigned long	cpu_features;	/* CPU_FTR_xxx bit */
@@ -159,7 +162,7 @@ struct ibm_feature {
 	unsigned int	cpu_user_ftrs2;	/* PPC_FEATURE2_xxx bit */
 	unsigned char	pabyte;		/* byte number in ibm,pa/pi-features */
 	unsigned char	pabit;		/* bit number (big-endian) */
-	unsigned char	invert;		/* if 1, pa bit set => clear feature */
+	unsigned char	clear;		/* if 1, pa bit set => clear feature */
 };
 
 static struct ibm_feature ibm_pa_features[] __initdata = {
@@ -220,12 +223,12 @@ static void __init scan_features(unsigned long node, const unsigned char *ftrs,
 		if (fp->pabyte >= ftrs[0])
 			continue;
 		bit = (ftrs[2 + fp->pabyte] >> (7 - fp->pabit)) & 1;
-		if (bit ^ fp->invert) {
+		if (bit && !fp->clear) {
 			cur_cpu_spec->cpu_features |= fp->cpu_features;
 			cur_cpu_spec->cpu_user_features |= fp->cpu_user_ftrs;
 			cur_cpu_spec->cpu_user_features2 |= fp->cpu_user_ftrs2;
 			cur_cpu_spec->mmu_features |= fp->mmu_features;
-		} else {
+		} else if (bit == fp->clear) {
 			cur_cpu_spec->cpu_features &= ~fp->cpu_features;
 			cur_cpu_spec->cpu_user_features &= ~fp->cpu_user_ftrs;
 			cur_cpu_spec->cpu_user_features2 &= ~fp->cpu_user_ftrs2;
-- 
2.42.0

