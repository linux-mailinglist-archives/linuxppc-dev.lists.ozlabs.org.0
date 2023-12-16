Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 175FE8159A3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 14:53:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Grk7c+mX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsncY5DHcz3cYh
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 00:53:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Grk7c+mX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnPP6Jksz3cWX
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:44:09 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5c690c3d113so1309146a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734247; x=1703339047; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUAtQDtApcgVJAqnWOXyR/Ya4iTsAGlBvKQ21gyDzAY=;
        b=Grk7c+mXXyuFI3S2p6m7hTiruDy5JbioRoZPam9JNj2Ai0O6jhMksxOaqMa/TTVJF2
         8UUz169b7wzWAWDOy1pYD6rPuz9DSbMBHm32gicaN5QpU/2M4ccg7e5OPR8DSERzjanU
         0GU+rRhOtgsMUwpIW/hDYBJqWilYlnvAD6mWqeG/utxVDbt6BJzrhn9sN3eidKgpEgZw
         lTYIcdm5qFl1LJGXGnPX3nt4fUyoDlr9cF1z/h9kfeY7qT1rrUxY9ZxnWKV00HkGV0r2
         YKAh6Ae+ihTygpFf358LKgn5JaKRbte+JMrkm6btYoxWHYEIRTkydndiAmP+lJJ7z5ix
         0OVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734247; x=1703339047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUAtQDtApcgVJAqnWOXyR/Ya4iTsAGlBvKQ21gyDzAY=;
        b=FI/GmTHUvlZgolUX1jj5HstlgIvm6X+OL3d20Akc2AO9EPSVRmQsLWMejYhFThow2d
         9PB/fM0RRrcKIz3bKJURDhT9VjnJeUt3iCiGVlPsXnS/hqVkY6/nj29eNj8Sf0i604jK
         MBDT7y9V+u2kaOEF4UUdEdAZok50fUpRAb13mHaRrcN0uScoYeVukpMzET1eiS1y2EM3
         368Dyqu9wVFRKMqEiEb2q6BY722YdDSlsazLBzkZrPctrNUcHIGv27OXefMGrn1yXQzW
         gM7McVWa2wdAtaBYaQyw2N7kk1cfR8d+wWbHT46AJYmZKcoHbkiLK0s67H9wNwQp+LV8
         vnjA==
X-Gm-Message-State: AOJu0Yx7ys3JRaFI3AP7MF4fdtKN/OkgEtW8eZ9Xd+xfpl1888kJA8ym
	ifSISwqSOQ7bseN83Y8PzuQ=
X-Google-Smtp-Source: AGHT+IGXiPYOu3Brmfx95kDfKpD6ZJoVeXT7ugdb1G7RY9S++SLmazxazUBOvPCTWBw75wG1Vk42Yg==
X-Received: by 2002:a05:6a20:2583:b0:18c:d38:9169 with SMTP id k3-20020a056a20258300b0018c0d389169mr15658268pzd.21.1702734247178;
        Sat, 16 Dec 2023 05:44:07 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:44:06 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 12/29] powerpc/sprs: Avoid taking async interrupts caused by register fuzzing
Date: Sat, 16 Dec 2023 23:42:39 +1000
Message-ID: <20231216134257.1743345-13-npiggin@gmail.com>
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

Storing certain values in some registers can cause asynchronous
interrupts that can crash the test case, for example decrementer
or PMU interrupts.

Change the msleep to mdelay which does not enable MSR[EE] and so
avoids the problem. This allows removing some of the SPR special
casing.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/sprs.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/powerpc/sprs.c b/powerpc/sprs.c
index 01041912..313698e0 100644
--- a/powerpc/sprs.c
+++ b/powerpc/sprs.c
@@ -481,12 +481,7 @@ static void set_sprs(uint64_t val)
 			continue;
 		if (sprs[i].type & SPR_HARNESS)
 			continue;
-		if (!strcmp(sprs[i].name, "MMCR0")) {
-			/* XXX: could use a comment or better abstraction! */
-			__mtspr(i, (val & 0xfffffffffbab3fffULL) | 0xfa0b2070);
-		} else {
-			__mtspr(i, val);
-		}
+		__mtspr(i, val);
 	}
 }
 
@@ -536,12 +531,7 @@ int main(int argc, char **argv)
 	if (pause) {
 		migrate_once();
 	} else {
-		msleep(2000);
-
-		/* Taking a dec updates SRR0, SRR1, SPRG1, so don't fail. */
-		sprs[26].type |= SPR_ASYNC;
-		sprs[27].type |= SPR_ASYNC;
-		sprs[273].type |= SPR_ASYNC;
+		mdelay(2000);
 	}
 
 	get_sprs(after);
-- 
2.42.0

