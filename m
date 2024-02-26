Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D382186703A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:14:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l4iRJRQp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjxKf4bkVz3vbg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 21:13:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l4iRJRQp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjxJ76Gqwz3bT8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 21:12:39 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6e08dd0fa0bso2451480b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 02:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708942357; x=1709547157; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeVEas1ZLpqr2asMqS0auNiXWMhirPfualOJ/EV9PjE=;
        b=l4iRJRQpUAuLkXASGSJ+rJGdC+0Qr8iS94hEfHDAJeptuS8+JOcKuCbsPh41Ikkqcr
         nEYy0zbC1leRnXjplPrLszIsVt5AfXw7JjL//fNxThl1u9Trv3Ko8vjW/PHN2v8juWZX
         n2SNtZ8YMxgD5Esyk4JjgCkXbODXOJhbA+F7+HJCRftJ2SxYUZSQQzB2pE1vZwmoOPyI
         wQc2gk/UfoJ33v71q71/OvGGikjrf20zo6/5QLXD2PsFsoZ5AA5b8yhWVKarv6xZelH7
         lZ/cFmvvRpZZ9wdanOTj9V4/ONVdahC/XeTgR7EvTC53r7zuykmfFDGKYgHC9v0P5ZVk
         q7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708942357; x=1709547157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TeVEas1ZLpqr2asMqS0auNiXWMhirPfualOJ/EV9PjE=;
        b=BomyN0b2qO4cPTqaI5guSWymacDqa3ySoGmB9qKHh+5dBvCEm1KV1MBdMlxiN2D+IK
         2JZpDt8KEd6qTlFMOGt2SM3Oj0rjLOXD+BSw2bLLf5m8dxfRTWpbbaf6/4RJgEQ68q/+
         S79olChDGMg0q3l06P9eB4QWYpIrVX2JjIQgHzyz3KxUrU/vHl5bNWKS5Rzw+uo7ouwK
         5Ins85pAlE9E01x8r88Jh2Dt4aNO+52LkeEG3llzFWQ6JFTp3/daQDwyxi57BLClFYR0
         kl3AJfsQAh9OqB7/TcVUJEdUNUBjfau8mHIXhRSzeGVwxzZkssBZ6WOPxACwlJdsJ5Qj
         treg==
X-Forwarded-Encrypted: i=1; AJvYcCVbO8ZWmOqFG3zyBgGVKidif96Q6Je86ZpT+B81IXTbKbKyrXsfh4PKEK8xP2dyhDgr4rKjV0E83F35JSEukB7a2Sp/Dj9bo3YdUwhj+A==
X-Gm-Message-State: AOJu0YxXV4UIkR7WUOZt3/aeHnm72dZ1Gvs/A8qtU6lobBEqSs7ZDtmw
	8uMtSuWckizQFB60+b9bEL4T63VYNZVSuW7B5XiWjy4E/TAHxwZe07AdBbUW
X-Google-Smtp-Source: AGHT+IFZb8KSXVwaYaL5+k/TtLqr++IQfWJzFlxrLVPvDhupsY+JsnD/JLPMimtgjw99ZNSYaPwMNw==
X-Received: by 2002:a05:6a20:daa8:b0:1a0:eb43:421b with SMTP id iy40-20020a056a20daa800b001a0eb43421bmr6637119pzb.28.1708942356894;
        Mon, 26 Feb 2024 02:12:36 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id x24-20020aa784d8000000b006e463414493sm3626693pfn.105.2024.02.26.02.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:12:36 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 01/32] powerpc: Fix KVM caps on POWER9 hosts
Date: Mon, 26 Feb 2024 20:11:47 +1000
Message-ID: <20240226101218.1472843-2-npiggin@gmail.com>
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

KVM does not like to run on POWER9 hosts without cap-ccf-assist=off.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/run | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/powerpc/run b/powerpc/run
index e469f1eb3..5cdb94194 100755
--- a/powerpc/run
+++ b/powerpc/run
@@ -24,6 +24,8 @@ M+=",accel=$ACCEL$ACCEL_PROPS"
 
 if [[ "$ACCEL" == "tcg" ]] ; then
 	M+=",cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off"
+elif [[ "$ACCEL" == "kvm" ]] ; then
+	M+=",cap-ccf-assist=off"
 fi
 
 command="$qemu -nodefaults $M -bios $FIRMWARE"
-- 
2.42.0

