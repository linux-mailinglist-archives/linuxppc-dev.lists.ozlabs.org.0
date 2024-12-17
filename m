Return-Path: <linuxppc-dev+bounces-4213-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 266409F4139
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 04:30:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YC2PN5kBVz2yRM;
	Tue, 17 Dec 2024 14:30:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::a32"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734405655;
	cv=none; b=LGO/hB7gfmv1lZt7oj4EqJbh/zSNUe8b/Mt2x+FvJZk9/CYpGXciQ1PwKyTF666fYTC4a+oMY/0ZScycSO9qB8Byq5jZEvvSrRNbObFytxBN7zd2w5C9e+tQKAOICqWAgDj38xKk6mCoA8QeptWj91+csm9vvaDxqR68b9zwZZAJQnUYljNnOBRrvaG8ViABPfJJ5Ux5ZyVgP09OBWh7YeihVRC6SFGgizTDY5ijPR2+7zx9g/j9IiyPVTbA+J5hwxILigL16PVmBzlD8rkVvlkfbrRoejqGaIIolgUMTf3aCmhIXp7CKrFs50l90tbCBuy6iZSrk1t7LKjsxSoLNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734405655; c=relaxed/relaxed;
	bh=RhLiVegGByTRtcesCH218mLcU4d68P1LDKmOj7M+yj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cfCtngzZ7vQ/SGI0OnhKofjQgum2OaiOcsSqqxCD1gwP1lVVloMgPglGq713Fh15XOdpv1Pkrr/Rs45cMEiSFoVpco/FJbyKQUKupk4btfyhSZ830C0W2wwv84z/gCBhZgxCo1zl1l+smj+c35JYjBF60viNKrp7/QlFwWxeXa5qsDRmEssqrB2O1e9QLgNCHgUN8bEw9HOmSQrpumcBMWXfRuh1zXyoHmInDAmPN6FNKt7Zx0NcTBI+rb5pnlRnuEwnJ9pVNH6KB4KIu2JwphCzepGecvlfViSaCccu0D6K/T21b+Luh/lfw+IaIykwCRqQSjxOynNpg4dKc38ekQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eBWyWdog; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::a32; helo=mail-vk1-xa32.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eBWyWdog;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a32; helo=mail-vk1-xa32.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YC2Bs3NgQz2xtp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 14:20:51 +1100 (AEDT)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-51619b06a1cso2528542e0c.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 19:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734405646; x=1735010446; darn=lists.ozlabs.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RhLiVegGByTRtcesCH218mLcU4d68P1LDKmOj7M+yj4=;
        b=eBWyWdogzwoIw4noqdle/8T9fNwMF2hjGG/vMcK0X5rDPdQi4mJiHhtcUtLn2cTrDB
         eRjDDmgSvy0Yq1RHa0KdYxhNl0Pko9HhgTlm7FBQuMf64MzAElyx2YGQ0+bx2Hxw+zak
         El9qh6oM7SX/d63Qi1Ka8ESnQpQzIsGoV292wtTADa/mGkFYA390v5ztXXb9lTiurDZ8
         sqN1NGF76k0SPMaxZ/kSEkrJZpMMHj+pfyu7mhrlsp6Z1VLPTQOwXRXxVNhoGebJcfOD
         YdoIhPGtnD/TyngiYQ2TtUx9U157+sc9/p9PMZP6lk3kDBv9r1iDKJZk/wx+f0UgtLrX
         pbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734405646; x=1735010446;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RhLiVegGByTRtcesCH218mLcU4d68P1LDKmOj7M+yj4=;
        b=G21PCqLQgbxeTsGgUiFbTqWki4bmhh+nanuE687ATZRM2/O/m3X8BtlSPFbEwxHYP9
         LgYyoaBkIitQupgDxKON5Yfew5DoC6stiHZv8QiKtF3AFqHi6DNQIEjvW1hucoIVwIkA
         M1x5z93edB4FaV5dTGkaSU2TdTT2gyRDkq/1bMVHBLoAhLdmQ1SuBBknvotMngDe3HrW
         OZDE6zbRqZbOyG1W7/regwW17opEfje+FSJZEjmTuEQal750XmSpT5Ur4SAdJzGVc46K
         a7B37DnPyjQCri6P8HLkNv15Ky7TIZIIryem2cpbaY1pymw6yMdjS8KAFvR/3QLZnnZm
         8gMw==
X-Forwarded-Encrypted: i=1; AJvYcCUBMfw4zXcGbhzw7SvKE/S/5O2QF8Rhu6kLNpUYpnctcVlphwy7Z3Ie5oM9U3UCLBWAQV0xAk1phADB+94=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwNQQqfR6KcDHDT14u0nfKpqMORQQe9F5LE+iD9Lv/SvrSNR0d1
	1xDX/Lt4twe/rc3icMaQSZIGIsjhTjQ3Hhvf7yeuW4zk5iegHIOy
X-Gm-Gg: ASbGncvQ7K+fTxtgZZFpMYGXizZ7SqCi9WmqB8A1wY/gW+skaLut7eym9HE7AW/Jq97
	xJar187ZDhNNuMYewPJeeHGg2qiymafgd/EaLWqxyW0FnE3KLCq+hfFhS7Bmw1iu1IoQr+howAg
	8CgxqUyY7oFf4ndE3VWIbpj7f5KIFwlHmG0mw4jVasS1hIl3Dk7qgrcNdK7aYaWRrPHiX5g119B
	NFTdno9RKv78CSmENYhLophoa2ihdmRIND8vxbVyCE8FHS2k74Jw388hLZsMjQW2Zbn17KxZ/w0
	Tv5Eb/9Hbflflxd5IcyJNNlTr0vdfdOULuYFdtlfVA==
X-Google-Smtp-Source: AGHT+IFWexl+zzxuDgk5sv/VaYo1ZTrU+54q4u7wQxi6nqewbZtT2ZFlqFxf9I5ZbaxWWqczIqkxfA==
X-Received: by 2002:a05:6122:908:b0:518:8e53:818b with SMTP id 71dfb90a1353d-518ca231a36mr12679248e0c.0.1734405646241;
        Mon, 16 Dec 2024 19:20:46 -0800 (PST)
Received: from granite.localdomain (syn-142-197-128-048.res.spectrum.com. [142.197.128.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-519eb72a06csm831938e0c.44.2024.12.16.19.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 19:20:45 -0800 (PST)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Date: Mon, 16 Dec 2024 22:20:30 -0500
Subject: [PATCH] macintosh: declare ctl_table as const
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
Message-Id: <20241216-constify_sysctl_mac_hid-v1-1-f60c0871dc03@gmail.com>
X-B4-Tracking: v=1; b=H4sIAP3tYGcC/x3MQQqDMBBA0avIrA2YwQTbqxQJMpnUgTaWjIgi3
 t3Q5Vv8f4JyEVZ4NicU3kRlyRW2bYDmKb/ZSKwG7LC3aL2hJesq6Qh6KK2f8J0ozBKNc8Pg3QM
 JOw+1/hVOsv/Pr/G6bgEhL4RpAAAA
X-Change-ID: 20241216-constify_sysctl_mac_hid-55886592c206
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 "Ricardo B. Marliere" <rbm@suse.com>, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734405644; l=1568;
 i=luis.hernandez093@gmail.com; s=20241216; h=from:subject:message-id;
 bh=t4r7S9UxnOILTHMpfm5vhgGgMiXH7CFWGwg5lMOtJcQ=;
 b=y11xfWENIaBtjTQm2f4ZOzsSILA/g0WLwVrPB06RmXZE2+gi57jZtmcNlbonzbgW2LHIMioc8
 30UtlmHIrIvB0ZfBARLYWzx3CiJX6g1i4GFk6FN7k74D3EdcP+ODTIe
X-Developer-Key: i=luis.hernandez093@gmail.com; a=ed25519;
 pk=E4Sj8ywxKbE+P0rYLQl7e84XZJfcVOiqNallR7p5IO4=
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Since commit 7abc9b53bd51 ("sysctl: allow registration of const struct
ctl_table"), the sysctl registration API allows struct ctl_table variables
to be placed into read-only memory.

mac_hid_files is registered as a sysctl table and should be treated as
read-only. By declaring the mac_hid_files structure as const, we ensure
that it cannot be accidentally modified at runtime. This change improves
safety and aligns with the recommendation from commit 7abc9b53bd51
("sysctl: allow registration of const struct ctl_table").

Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
---
Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
Suggested-by: Ricardo B. Marliere <rbm@suse.com>
---
 drivers/macintosh/mac_hid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/mac_hid.c b/drivers/macintosh/mac_hid.c
index b461b1bed25b2df106ecf612b82efaedf69f62b0..369d72f59b3c10869bc914f31e7dcb73e029ef7f 100644
--- a/drivers/macintosh/mac_hid.c
+++ b/drivers/macintosh/mac_hid.c
@@ -215,7 +215,7 @@ static int mac_hid_toggle_emumouse(const struct ctl_table *table, int write,
 }
 
 /* file(s) in /proc/sys/dev/mac_hid */
-static struct ctl_table mac_hid_files[] = {
+static const struct ctl_table mac_hid_files[] = {
 	{
 		.procname	= "mouse_button_emulation",
 		.data		= &mouse_emulate_buttons,

---
base-commit: e25c8d66f6786300b680866c0e0139981273feba
change-id: 20241216-constify_sysctl_mac_hid-55886592c206

Best regards,
-- 
Luis Felipe Hernandez <luis.hernandez093@gmail.com>


