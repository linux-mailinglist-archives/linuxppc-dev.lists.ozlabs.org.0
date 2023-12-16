Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C92781599B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 14:53:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AH0Ic5bt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ssnbg1NV2z3vnS
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 00:53:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AH0Ic5bt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::31; helo=mail-oa1-x31.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnPL0HpKz3cJ9
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:44:05 +1100 (AEDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-2039cb39b32so146026fac.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734243; x=1703339043; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpz81cw6IXL/gUJKQ1JuTJJ/AYFIP4kGeCEMgz+hkck=;
        b=AH0Ic5btCOqd82hjS4c+WBCUza2nPd0MhuimIB1DAT5kDjLEw4sD/5v03tXVkKyU3c
         1yCBgrBcUqBRpLeNEPRbcOPzeZ4MQ8kUZGtqM7HIK4zj/UFzXbBNvMc2xGMLHLpMYnCo
         OIw2J3PGjAaGiEDeOjSoqpVIj4kXa4Q5jz0LCvRBiCGL97Bj7CrPonFhmHOpAE+KpEE8
         rBFzw5Cq+ss7vUPWtU0+8iO4ujUkl29I0YgZSF+NP6MGjXu9O/MbZsd9Afqqxae1WRCZ
         /ERMEDhl4bV5WP/PkCjrXZy3tlcaL+MshatcnaFIlggjtiWlczV4eb5Ano/R6LTCxRHZ
         VdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734243; x=1703339043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpz81cw6IXL/gUJKQ1JuTJJ/AYFIP4kGeCEMgz+hkck=;
        b=UzB62LyeGb2vKnZT7bbfQX0To0OamfyAME3o+rJ4lHYUbCYQxy9coTL6UbDalsjCB4
         btNpacsHLZUVvhz7zNFzttdAT6ghjnA8pBS2ZKWGAmnLDSaI6Qte0BCZ6U0a7f/6q+VD
         gL9RB8bmGA+rifzx3OBi5t5ZWVKKlKc1TrZYv9osijHqEmRJxvs/hwDj6zVcY4HFlNVc
         /GXd1SUecFALlucNaYPvye1XAp/6lgJI9YNleljwj/nSOY2xNo+RRzluWxxh4Jb9320S
         BqTrJxX3vrj/wa/wv3npcjKncC0rFQqh0TsrNxILw6MhGrdz/H0bn+894SI6J7pT63br
         mXfQ==
X-Gm-Message-State: AOJu0Yyi0xqWkLSyKNdrc394eLDTs3naROi3m101xqaRfw9YUL33MBU5
	5I/qmunDUNplsrpv37ELp1zb+oaNLG4=
X-Google-Smtp-Source: AGHT+IFg2AwO310R8zzQQs+zdrgcP7ojgiF9wQHDegKwCO7gLz0TdBCsU9sq0SHJCCrdcD8pvmyKoQ==
X-Received: by 2002:a05:6870:2196:b0:1fb:75c:4002 with SMTP id l22-20020a056870219600b001fb075c4002mr15219516oae.98.1702734243197;
        Sat, 16 Dec 2023 05:44:03 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:44:02 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 11/29] powerpc/sprs: Don't fail changed SPRs that are used by the test harness
Date: Sat, 16 Dec 2023 23:42:38 +1000
Message-ID: <20231216134257.1743345-12-npiggin@gmail.com>
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

SPRs annotated with SPR_HARNESS can change between consecutive reads
because the test harness code has changed them. Avoid failing the
test in this case.

[XER was observed to change after the next changeset to use mdelay.]

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/sprs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/powerpc/sprs.c b/powerpc/sprs.c
index cd8b472d..01041912 100644
--- a/powerpc/sprs.c
+++ b/powerpc/sprs.c
@@ -557,7 +557,7 @@ int main(int argc, char **argv)
 			if (before[i] >> 32)
 				pass = false;
 		}
-		if (!(sprs[i].type & SPR_ASYNC) && (before[i] != after[i]))
+		if (!(sprs[i].type & (SPR_HARNESS|SPR_ASYNC)) && (before[i] != after[i]))
 			pass = false;
 
 		if (sprs[i].width == 32 && !(before[i] >> 32) && !(after[i] >> 32))
-- 
2.42.0

