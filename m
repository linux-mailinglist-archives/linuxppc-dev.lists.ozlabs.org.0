Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AC16BE965
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 13:37:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdNv70zs5z3chJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 23:37:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l3n0YBij;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l3n0YBij;
	dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdNt71Rb3z3cDT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 23:36:45 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id p20so5116748plw.13
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 05:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679056602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGrixfxvALez5iC7y5jSzp88ksEIk5PU6pEUFuV6u+I=;
        b=l3n0YBijw6wscEwhxo3xJinQJ9wZs0xJPB12moudZQtIPDNfb3Lv4Z8KHFGw08/5Ca
         6x3tAPZlR+UMqzZ16kCWQfSzAS75RQ+netKObgq+xJ7PMFHyLvt8meVOr4oFC65I+Vby
         XJzNQg2qOb6ZxLwwgpdtt81g23o8l13KRwt0CNhJtkaKSRGTQwdvTZo6gGNVyfAON4fl
         gedyafRgeyP+807zC6n/GGQIwlsxN48ru5w1UR34TCjf0kYziCL2cQViUC2hsxI0K4E2
         0ZepkhwsyYEbD1H2faAGJnbif4po73rMfL8MJ3ngYIjFRYgzw8VpdfMBM2owi2QrDQSx
         pOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679056602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGrixfxvALez5iC7y5jSzp88ksEIk5PU6pEUFuV6u+I=;
        b=J+K4sQ41ArKdPPhkFH8iHJLD8K/649Q6BFmQ9vR/RMahEcesUntTHzi1zV5msc5VYN
         TJ1mYDzmG4SBwveB9CnGVkb3X7I/EGgtRVWKhCQux1CRTKAJHdHe2NvHtnzgqchARScs
         ne1tz47+ayko6Zx1yUwOc1ygKAhy8hGv+25yL532F8wHtVpJUI+wUuycDEdbLRkxV5oq
         /Ja0kSABfhj7hkLHt6f1KsgJPesN/JHyx2+6PrS8tfA0A4x9NLwqQACUkwoQbAoNuhfl
         F9RdDp9GFhkhF0c9cqFe14f9UeCpY4JPKQthxbQosMYjQn5Behl+ZU9gs10NolwsCkyX
         6ZLQ==
X-Gm-Message-State: AO0yUKUzP6CDbo/thVWQrnNweGtfoa/RfKBzvu28lN3Buqe9yXZg0KTH
	M9s3WYK23KCe27DGxNwikEo=
X-Google-Smtp-Source: AK7set8DOmchCV0AGBT2BTU5yIrD1m6yPwDMqTK5iiBDwDMPVSD6dfoqpYDRoYdj6kq34GTSj1v2Fg==
X-Received: by 2002:a17:903:234c:b0:19e:8bfe:7d79 with SMTP id c12-20020a170903234c00b0019e8bfe7d79mr8892343plh.1.1679056602184;
        Fri, 17 Mar 2023 05:36:42 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (121-44-69-75.tpgi.com.au. [121.44.69.75])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902b28400b001a19d4592e1sm1430990plr.282.2023.03.17.05.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 05:36:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH 2/7] powerpc: add local variant of SPR test
Date: Fri, 17 Mar 2023 22:36:09 +1000
Message-Id: <20230317123614.3687163-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230317123614.3687163-1-npiggin@gmail.com>
References: <20230317123614.3687163-1-npiggin@gmail.com>
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

This adds the non-migration variant of the SPR test to the matrix,
which can be simpler to run and debug.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/unittests.cfg | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index 1e74948..3e41598 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -68,5 +68,9 @@ groups = h_cede_tm
 
 [sprs]
 file = sprs.elf
+groups = sprs
+
+[sprs-migration]
+file = sprs.elf
 extra_params = -append '-w'
 groups = migration
-- 
2.37.2

