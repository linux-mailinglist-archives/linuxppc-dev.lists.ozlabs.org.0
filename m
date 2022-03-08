Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D944D19E6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 14:59:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCcQL1LR9z3cj6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 00:59:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XHFPMSNj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=XHFPMSNj; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCcDz23SCz3bcV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 00:51:31 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id w37so16526333pga.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Mar 2022 05:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XMpjG/Zg568qe80KQMcu1cKJaU0aNO3Zr9xyl0y3Vjg=;
 b=XHFPMSNjxpYN6FEu+nyC/uVx7HMfcMbHtiFbOIgHn6Lt2G6Oo1boeKNCdutqQ3oHKV
 5OAo4RVpZnwmd+MP0ZBVRxtDMG3uvvNantPU0twGoxEmBAX2piCTOFMozwMOuOc4tdh5
 iIDoYBeaKkT5uACk16c2qSshsfSzoOI1u33AHGHtqiOTVLTr/ZB6dS4V95Vl8yGQ73v0
 sgkK8A5KSuHBLji7/SqaIW2Hj/CaXsxIVm1dRpibd7u235iiLMg6kMrmFvggFrrPp9Td
 +wD8olNp6pJ4RirrUYsFKvmkftX8QaNH956lWyZApqernm8eyHHruZOrHdE2hm1UK1hR
 CSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XMpjG/Zg568qe80KQMcu1cKJaU0aNO3Zr9xyl0y3Vjg=;
 b=QrFDNS/lZY1FIhfV0V49POrGu78/HJheZYbC2oxWfqz2LlbRFxyeGHWhack5gKKQ1h
 4jdYQhQ4ZHL8+9UeddDMyTVTXp2wQD3BR5N0hE9Ktci7oVjym9dftOEFGwv9OSRx+RpN
 aN65u/AkQZz7QdfV8wG/HeFvHtr6uxPzJdKXJtYQl5n8WAas3Wlv6d66kilbDKw4Y4rO
 /btnpFdK9mpPU2xxs/fbsLfSsOmv/7gICuvAAUt8LsLSDaqQloaU0cTOZ5JyWMQZAgtd
 lMV8kt0dEvaviqUzGBI3ILqBaakB6WaCIAf/nNo+j58wAhGBNc0MPEi4OtNIwMxyB4I/
 z6yg==
X-Gm-Message-State: AOAM532GoQ3Ux6qUX/oOGhhedEoLZ4+qavJd4e7D+wjcJGBoBZ0zbxBI
 jElUmlv4VOuZ3cSawBaJGM1U0t6MzYI=
X-Google-Smtp-Source: ABdhPJwn2ILd8Pf4hm+Cp3FhEhggdjXqWEOHDzts7Eb0/Ce8o08AEmhmMD6tskWWQ7YUNsmDYyBQ2g==
X-Received: by 2002:a05:6a00:2815:b0:4f6:ecc6:1173 with SMTP id
 bl21-20020a056a00281500b004f6ecc61173mr13955211pfb.74.1646747490659; 
 Tue, 08 Mar 2022 05:51:30 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (61-68-211-196.tpgi.com.au. [61.68.211.196])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a056a00150e00b004f741b5c071sm541737pfu.86.2022.03.08.05.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 05:51:30 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 13/14] powerpc/rtas: enture rtas_call is called with MMU
 enabled
Date: Tue,  8 Mar 2022 23:50:46 +1000
Message-Id: <20220308135047.478297-14-npiggin@gmail.com>
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

rtas_call must not be called with the MMU disabled because in case
of rtas error, log_error is called which requires MMU enabled. Add
a test and warning for this.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/rtas.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 1fc22138e3ab..adf4892aeecd 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -479,6 +479,11 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 	if (!rtas.entry || token == RTAS_UNKNOWN_SERVICE)
 		return -1;
 
+	if ((mfmsr() & (MSR_IR|MSR_DR)) != (MSR_IR|MSR_DR)) {
+		WARN_ON_ONCE(1);
+		return -1;
+	}
+
 	s = lock_rtas();
 
 	/* We use the global rtas args buffer */
-- 
2.23.0

