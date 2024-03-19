Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B5387F8DB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:06:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FwsNVywA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPSj4CR2z3vwT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:06:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FwsNVywA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPK73Vb5z3d36
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 19:00:11 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6e6ee9e3cffso3170352b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835209; x=1711440009; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fndo0MEe/uD2EZQF5VsTSnetuecWQ7lAuCXwwSf7lcs=;
        b=FwsNVywA8ps095+gXo6CC4Fto/STxbGIeCPekJTaAv0HYcXwd5E/aVp+Tf+r+FbjhL
         JD8Di5ljrizCpPZJsFWtl9nnh1h0hoYqLx3CxPFmaycZaoNcwdwgmJtvhdUSFKGpWUg8
         RMu4g3ATMlnL42HV4kIUne/PULUCo+NSpjJ/7+5biokKLs/kjLXlS9b8CFSk2jK3UTqd
         Y7754eFiZ11COjIgGWiYZ6iVPELOaTlX5OmnCxdfEgfioZMnAMqNuVckaHb6VVN1567w
         /LPtOK7P3s3iMk5OV/OljCTEnpnxbe1ud3iamgyWcUY4DBtxFrn0/80mEU7Dd37yzwGE
         4JRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835209; x=1711440009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fndo0MEe/uD2EZQF5VsTSnetuecWQ7lAuCXwwSf7lcs=;
        b=g+wZobNjPGQY1dUCLJbYepw7Znd31EVu1pi8Xa6ybyVge7Hri/C9DHD1NuweUEHQYk
         HIb8Lnsp6DvX/RV3a/96EnJjN26JYDGKtNjPeMOWkmislG9hQ1963BVEpea09QGzpT1u
         u9kYrLEEzTNX08KeKrhdlhIvES8kC4iWZxrDrUIdAkSebrsZBWQfgNmSUhz1SYYUBnc1
         zplZYAGPH8AbUTQy6ruV8mJt7ranT2kczwmZOxeMhUoFanioX1rAMUY/BK3VAavu0CwW
         K/2ZuG6DdQUTMUroFeHPUQMG8IccGn/Oo/iJWNABRsnsJbGXm4WMUvZggj5JCvv93vAm
         U3Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWfMooIVqxTRYpByDfiZrvBG7Xg39R3ldGUa8vuED7n4Iau67obD2snhFbWn51UKpesNM8Q4y+WsmrsDAZcR63iQ3Kre1t36SPWMldPlQ==
X-Gm-Message-State: AOJu0YydzAG6yMiIo6IhdV1u2ZMi19lTCWl4vF3HY2tfcDQhm9RYhq6x
	08JK3UMyrtmEbgh2ZxD6JB96ukgKn5Zgh0ro9Wn9QqfEpXPCtckN
X-Google-Smtp-Source: AGHT+IFZbtU7rOQxkkj6cesJgK7vAzyFAtMiMK+nZ/sLlmWkv8FYDQnCfG7JqFhH5FkYWgLdW+bq5A==
X-Received: by 2002:a05:6a00:cd2:b0:6e7:1cd9:c032 with SMTP id b18-20020a056a000cd200b006e71cd9c032mr2488662pfv.6.1710835208039;
        Tue, 19 Mar 2024 01:00:08 -0700 (PDT)
Received: from wheely.local0.net (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b006e5c464c0a9sm9121283pff.23.2024.03.19.01.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 01:00:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v7 09/35] powerpc: Fix stack backtrace termination
Date: Tue, 19 Mar 2024 17:59:00 +1000
Message-ID: <20240319075926.2422707-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240319075926.2422707-1-npiggin@gmail.com>
References: <20240319075926.2422707-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The backtrace handler terminates when it sees a NULL caller address,
but the powerpc stack setup does not keep such a NULL caller frame
at the start of the stack.

This happens to work on pseries because the memory at 0 is mapped and
it contains 0 at the location of the return address pointer if it
were a stack frame. But this is fragile, and does not work with powernv
where address 0 contains firmware instructions.

Use the existing dummy frame on stack as the NULL caller, and create a
new frame on stack for the entry code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/cstart64.S | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
index e18ae9a22..80baabe8f 100644
--- a/powerpc/cstart64.S
+++ b/powerpc/cstart64.S
@@ -46,6 +46,21 @@ start:
 	add	r1, r1, r31
 	add	r2, r2, r31
 
+	/* Zero backpointers in initial stack frame so backtrace() stops */
+	li	r0,0
+	std	r0,0(r1)
+	std	r0,16(r1)
+
+	/*
+	 * Create entry frame of 64-bytes, same as the initial frame. A callee
+	 * may use the caller frame to store LR, and backtrace() termination
+	 * looks for return address == NULL, so the initial stack frame can't
+	 * be used to call C or else it could overwrite the zeroed LR save slot
+	 * and break backtrace termination.  This frame would be unnecessary if
+	 * backtrace looked for a zeroed frame address.
+	 */
+	stdu	r1,-64(r1)
+
 	/* save DTB pointer */
 	std	r3, 56(r1)
 
-- 
2.42.0

