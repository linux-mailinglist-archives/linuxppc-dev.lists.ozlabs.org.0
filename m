Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDF4867070
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:18:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OB6HqdW2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjxQm1ccxz3cRd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 21:18:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OB6HqdW2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjxJd48WTz3c1C
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 21:13:05 +1100 (AEDT)
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-5a09c79bb2dso117847eaf.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 02:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708942382; x=1709547182; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHtxMXAWIAgt1+JKe/+QGMJfuAT62NDiAlCOd/8IJBY=;
        b=OB6HqdW2fLIsZnt00PQ42ImJ5QGdU2fAstzfgEBU/7i7wHyvDTCYSWBgfMZF716vVW
         U8bbhFUgtDoXqQeEqFQq6DpJ7Y7fUKBgqewaE8VhgnPyQynlCGVTq9Q+1f/sy8ej82Pc
         thfaLXUmfZCh9kSF6D0XI7rt70oKXcrAxF7V3Wquj/eb4ULz0vhs98vIlajAFOru03zx
         8RVCB0UMCiKI4MNtHy9jWiIyY4KPjbTTxTY7bRTc4oV/6b4u08Ri9Fj+ktKcBa5vtKK0
         yUPFqAeCVo44k7AfVXZjN+PRa+La+xRYLlfAFtel+evipSanyDxXrgtP6KxLZzU42+vN
         OGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708942382; x=1709547182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHtxMXAWIAgt1+JKe/+QGMJfuAT62NDiAlCOd/8IJBY=;
        b=tIoNzEjUkO5Vq7YfXj0DFRSjl6xncWBLPh0cZj+Hn4QsFV8xnCVZOEq8w9Oe22NCIl
         I/Q1tdh+YEfC/BSfODWEriJoPOMVEVnwWKc/MWxGDykrnmMStDnPmtSCYoQZBrPk19gk
         AAKiQ8D2RZk+jQi/GHSrXWgHdBy6YloETyUPGdjJwod1dA4GdG1WHbRkDI38U/C4CKS0
         /+uMefp93yv0nWquGaJKv5uq0Wy41A3Y/GH12jyVt7d0l2JpdmF249L9ytvZixxAq0M+
         E6dH7/W/MutqHCzZeninTVRc0ipav3NGttxLYgBZN1/gAYQCPH8RHNvEMQV9BS6naArc
         9ZDA==
X-Forwarded-Encrypted: i=1; AJvYcCXJBNjV18W/EYB7+ge1EGLAOSwD/FwwJPKA7lyYlfxLzP/ki1KHqPh6V8MZgKvucwol+qROwVJ3W0hd+g4LxfjDxKJ/pvkiY+tNxUx0lQ==
X-Gm-Message-State: AOJu0YxLcI9tY+VZF4Mi0YSJlCBCVpuNDPtEy0z0mZWq2PMhkjQbgSb1
	MROc9baPRf0WBXG1TA2be415sGBbp4ue5crmHgVZbAmLE/yZ7h7V
X-Google-Smtp-Source: AGHT+IHpT3x1k7Yl76sIU5S73lOzJzohSvxtXrbwREKBxSypGoBzMraHbv9rKz6vrQH1xspLTi3+0g==
X-Received: by 2002:a05:6358:6422:b0:178:6211:871 with SMTP id f34-20020a056358642200b0017862110871mr9628406rwh.0.1708942382645;
        Mon, 26 Feb 2024 02:13:02 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id x24-20020aa784d8000000b006e463414493sm3626693pfn.105.2024.02.26.02.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:13:02 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 07/32] powerpc/sprs: Don't fail changed SPRs that are used by the test harness
Date: Mon, 26 Feb 2024 20:11:53 +1000
Message-ID: <20240226101218.1472843-8-npiggin@gmail.com>
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

SPRs annotated with SPR_HARNESS can change between consecutive reads
because the test harness code has changed them. Avoid failing the
test in this case.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/sprs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/powerpc/sprs.c b/powerpc/sprs.c
index 8253ea971..44edd0d7b 100644
--- a/powerpc/sprs.c
+++ b/powerpc/sprs.c
@@ -563,7 +563,7 @@ int main(int argc, char **argv)
 			if (before[i] >> 32)
 				pass = false;
 		}
-		if (!(sprs[i].type & SPR_ASYNC) && (before[i] != after[i]))
+		if (!(sprs[i].type & (SPR_HARNESS|SPR_ASYNC)) && (before[i] != after[i]))
 			pass = false;
 
 		if (sprs[i].width == 32 && !(before[i] >> 32) && !(after[i] >> 32))
-- 
2.42.0

