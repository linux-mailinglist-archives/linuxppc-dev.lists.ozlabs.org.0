Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2D14D19B0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 14:54:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCcJW6rp8z3bpF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 00:54:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SHo0MpOx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SHo0MpOx; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCcDc0y4nz3bWR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 00:51:11 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id g19so5821654pfc.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Mar 2022 05:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4V0De/WTAqEpFgdsq0WLjoZvavpXhiXKnbwqrPismR4=;
 b=SHo0MpOxk9mcVKqEf/ZIZulMmT8+yub6+TjOqZIeTKjIkJH7i+nU9jFtuOhZOurVxk
 /jc7CzjCN69uUUVcfGSKi3iJo7qXQrAOOL028qJvGuaLzp2Clc4OXLjYUkHQtM37nilC
 QmuG6VNqLX6m+2k6zQbC8zxiQdIZ3K1sai6/myqdZ49gDr/XfATDkW2QqBI0SWPmePuv
 6hpT0B2OLpxhunLeyV2Nbz3YwcD0xnY8BRd8kxB4JscG93ubnBlpsDEHxtl9vL47i9RS
 eqZ4A4CakDMfhiJhDwLayYR60vd5+C5sXoEXVhkXPYO0oX2wUAPjLXlws09DoNdA+2Tn
 7bnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4V0De/WTAqEpFgdsq0WLjoZvavpXhiXKnbwqrPismR4=;
 b=FinmmoQxYi3RVk6NreioR+923ckNwclw07PeGHuQcieL3r0AmTJ1AeUfrBUxJm1yyS
 pmo/5rppc1PFIGwKzP3VqErwuqTynbgDDNzslDkaeMBn0/JKnBI1gZMI9aSpOOIOMCWT
 U2ErhvF50lVKizrBfA6gfWACoT5Ei96QEr3DXs9LhGF6E+IKUJcCHBJGxL99CP37avyP
 Lmm4/GmCuJYTi0Bnz0k+yb1rOFXhdb9aNg6hJdtw4X8XZXgoucSjI49dNaJGP3/bSyeX
 e2AGkVSuhc2iXW/6IiNynz7hOs8QJC0iR6xP62G0Z8gT/jASGNuYuH9gXaJUevUszUN3
 wKrQ==
X-Gm-Message-State: AOAM532RIiwbUPY52UWpUIifySc58y15wnMj04/QAwXYl3mxKzs0xggh
 FKpElwxdAfkxugVRr80GE3EvfIxmYcE=
X-Google-Smtp-Source: ABdhPJwwWzEXtM+jMbtkzZ00Qw12ObuMIg5g9as6bt97oTXlikReckl9u0YZqXW251GX+zmCvIfU4w==
X-Received: by 2002:a63:814a:0:b0:380:e48:809f with SMTP id
 t71-20020a63814a000000b003800e48809fmr12324946pgd.217.1646747471001; 
 Tue, 08 Mar 2022 05:51:11 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (61-68-211-196.tpgi.com.au. [61.68.211.196])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a056a00150e00b004f741b5c071sm541737pfu.86.2022.03.08.05.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 05:51:10 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 05/14] powerpc/rtas: Modernise RI clearing on 64-bit
Date: Tue,  8 Mar 2022 23:50:38 +1000
Message-Id: <20220308135047.478297-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220308135047.478297-1-npiggin@gmail.com>
References: <20220308135047.478297-1-npiggin@gmail.com>
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mtmsrd L=1 can clear MSR[RI] without the previous MSR value; it does
not require sync; it can be moved later to before SRRs are live.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/rtas_entry.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/rtas_entry.S b/arch/powerpc/kernel/rtas_entry.S
index 45fa661c2ff6..7b93687b9a10 100644
--- a/arch/powerpc/kernel/rtas_entry.S
+++ b/arch/powerpc/kernel/rtas_entry.S
@@ -109,13 +109,13 @@ _GLOBAL(enter_rtas)
 	andc	r6,r0,r9
 
 __enter_rtas:
-	sync				/* disable RI so SRR0/1 */
-	mtmsrd	r0			/* don't get trashed */
-
 	LOAD_REG_ADDR(r4, rtas)
 	ld	r5,RTASENTRY(r4)	/* get the rtas->entry value */
 	ld	r4,RTASBASE(r4)		/* get the rtas->base value */
 
+	li	r0,0
+	mtmsrd	r0,1			/* disable RI before using SRR0/1 */
+
 	mtspr	SPRN_SRR0,r5
 	mtspr	SPRN_SRR1,r6
 	RFI_TO_KERNEL
-- 
2.23.0

