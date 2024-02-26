Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 018178670C9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:25:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gTiScaFn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjxbH59nPz3vxv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 21:25:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gTiScaFn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjxKP3MJDz3vZc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 21:13:45 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6e53f19f407so12794b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 02:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708942424; x=1709547224; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYxWqQyihqZ/xKRwoD0QjakwL6RSMHUw8t/Bhqm9gTk=;
        b=gTiScaFnMbpglFsUHI9Z1KZoCQL3CY1jEboIjmEgBi6uZioEfB9NYWJW79X08KdJqL
         e844QfaW9oDO7SwxVLmXCF0LqsMxZiCYEyOQwMkTkk1XKk80ryrTyrmoyOi4YG3UZDpq
         XPCWN6pnm5RSTrCFTCzr4NdHZQ82i3oF05FDY77p9veIGVLOCS/UP8lezQbwdtJz2unx
         +Rq1U51EbwY22iPuu38SsgCaRaORl1vl2Cnzb/fPtgI151xT+kv7mkNJ72pIgn5/j8cF
         5aHpSpaVaFqsY58lG49/oC0nImtozakN5XBoQzJMhZv99FOBuhSAW95pI7W36xyfPADM
         mjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708942424; x=1709547224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYxWqQyihqZ/xKRwoD0QjakwL6RSMHUw8t/Bhqm9gTk=;
        b=bdAyffsqygj1nT50N7JAusf9v0LEzFXyJmIOyUUMyOxaxhx/aZub8C9JjLtfcUZd3b
         /5rmA4lUevE8lRhgdG6RQlt43+BpGW4IR7Y5A3kooUOBKnF1MJCz0pRyDKU7rDFla8sr
         /AL3UAKKD6tOZt54DFeuT1qv7Woxsupbd56GlaIWID9AklicAn+FRbrc2w3hDHfZYp2G
         e2ZKY25Vl1HYDFPz0Xl2xZ2dGDWR6gD9We7mMVeSP+kR3zsLpMpxIBQgzWzDsdb/Sa8H
         C34Yt2Ns0JDKnfKPqjNeOy0HXQdlSSPDJjO1wYfjFMrmrxrIF+DJSNDth9kExI0DDFGn
         2P1g==
X-Forwarded-Encrypted: i=1; AJvYcCUp4dX9ZwBNqGyi+ACMrZbQEYJ5oycxFEYNWFTh4oMApHhN69WLg2pKzrLuDOQ66EM59NvR8RHsuG4fV9LnPIaKrRCDqJm96PbWawUtKA==
X-Gm-Message-State: AOJu0YwRqmanZLuuHqvRUkYjPFLosSSsDprl9pMo3ghs23JeAvjFHvAT
	DA9xkosvflMoZrykuEEDVHkdCYtpzzEuNgVksFBblvbpkTeqM7xw
X-Google-Smtp-Source: AGHT+IF+aElZ5vCFE85E+S1Tlkgpap6+INIPVdRCZ/aeWMo6oorSbE8xMpmhMtAwtEdFoYVKCrmUlg==
X-Received: by 2002:aa7:8a54:0:b0:6e1:3dd3:3c89 with SMTP id n20-20020aa78a54000000b006e13dd33c89mr5073901pfa.11.1708942423783;
        Mon, 26 Feb 2024 02:13:43 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id x24-20020aa784d8000000b006e463414493sm3626693pfn.105.2024.02.26.02.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:13:43 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 17/32] arch-run: Fix handling multiple exit status messages
Date: Mon, 26 Feb 2024 20:12:03 +1000
Message-ID: <20240226101218.1472843-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240226101218.1472843-1-npiggin@gmail.com>
References: <20240226101218.1472843-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In SMP tests, it's possible for multiple CPUs to print an exit
message if they abort concurrently, confusing the harness:

  EXIT: STATUS=127

  EXIT: STATUS=127
  scripts/arch-run.bash: line 85: [: too many arguments
  scripts/arch-run.bash: line 93: return: too many arguments

lib/arch code should probably serialise this to prevent it, but
at the moment not all do. So make the parser handle this by
just looking at the first EXIT.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm@vger.kernel.org
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index 5c7e72036..4af670f1c 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -79,7 +79,7 @@ run_qemu_status ()
 	exec {stdout}>&-
 
 	if [ $ret -eq 1 ]; then
-		testret=$(grep '^EXIT: ' <<<"$lines" | sed 's/.*STATUS=\([0-9][0-9]*\).*/\1/')
+		testret=$(grep '^EXIT: ' <<<"$lines" | head -n1 | sed 's/.*STATUS=\([0-9][0-9]*\).*/\1/')
 		if [ "$testret" ]; then
 			if [ $testret -eq 1 ]; then
 				ret=0
-- 
2.42.0

