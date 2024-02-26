Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FA8867041
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:14:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O0An0Kls;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjxLb5h4dz3vdp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 21:14:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O0An0Kls;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjxJD0CD1z3cML
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 21:12:43 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6e08dd0fa0bso2451553b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 02:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708942361; x=1709547161; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iA5QeHI5caSGHGuItQ55ZINMqdlUnn71FtpS3lmpHgA=;
        b=O0An0KlsYkbd2hhYuQ6rmeJol3eZbUis/od/Q5PPHWbbPs5mQagd5oWFJbSn2yOEXk
         JBInmQC8TdKNX+h6xRbR1x/eykdwBiQUDurZF4/jCQo3cST48J45qyVP1C1Q2ylZmCXl
         xMRGEEb3ThkigX3baeYIvIUM0d+ok0PZfdFNl+u3HPtocoMiJlzT2Hu/LirrUfTNptxE
         ndqsUQ1mOn4GZ1XBZJVHJqceubXEXe3MC2cfkPbXiAKzdqREAO+vVFlVwJX96mo3JK64
         KLboCp6Gtq6CHIkZ9HAyptCU/6N82FHGIf3GtK6Q3U4AKnt2Dzsug9qiWf4tXyq9Z1EA
         B+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708942361; x=1709547161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iA5QeHI5caSGHGuItQ55ZINMqdlUnn71FtpS3lmpHgA=;
        b=GebbQ10KuCREiLrksFH1tj0wHIK/mT/YJDS2jjMr2/ww9oIOYIxfb5veJ3fUX3WaYN
         HQrXG9yjjdYaUsaB/fawQGqtnpfg8gUJOb2K+2nTyQgu8a+Gol1bvayefm6AaBGEExB8
         gey4jqWljhUgoim4xIwtfkas4JRRM5OvTpNTG79mWEqArnfwMwgHwZ/XLKaF4lg49XJI
         WqQI78we+tLXiHj/Mmvdkm8diGIVZxBJ3qoqGu2vpKtLDsFF9TP1RF1UIJ/6/cV6dfqi
         Tc7CpBqztuzvPexw+6P9Ud8J8pUcfufU2ozTHObEicMit1HGKsDTLzva5TPl8iBVrmSv
         jvQg==
X-Forwarded-Encrypted: i=1; AJvYcCUM7QIpZrfqslhvHfVQrJBpWml2S1P4kgPtL/DZVIBWb8G6qo5B7LAso7FDI2wjfCyGdo3OTgb3716C4RCG5c8T4h6t8b8YQ9iDrDRyXg==
X-Gm-Message-State: AOJu0Yz7R5jMAabyFG76xko1ubsOHm8EXwAR0+ayD1U8TnixKjfKfW/p
	M2gpjFfusPpPkBmnbzXxxvtoSbJk+NkmMrNeaQxyKj/VB7xKO6FS
X-Google-Smtp-Source: AGHT+IGea8jhnynoirPKFsw6HLNHiZ8K4M5CZzg+/RSFPO2uI1VkHczFNVypYy/tQuf5IclRbmsu9w==
X-Received: by 2002:a05:6a20:b91b:b0:1a1:5:e883 with SMTP id fe27-20020a056a20b91b00b001a10005e883mr1818540pzb.22.1708942361339;
        Mon, 26 Feb 2024 02:12:41 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id x24-20020aa784d8000000b006e463414493sm3626693pfn.105.2024.02.26.02.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:12:41 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 02/32] powerpc: Fix pseries getchar return value
Date: Mon, 26 Feb 2024 20:11:48 +1000
Message-ID: <20240226101218.1472843-3-npiggin@gmail.com>
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

getchar() didn't get the shift value correct and never returned the
first character. This never really mattered since it was only ever
used for press-a-key-to-continue prompts. but it tripped me up when
debugging a QEMU console output problem.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/hcall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/powerpc/hcall.c b/lib/powerpc/hcall.c
index 711cb1b0f..b4d39ac65 100644
--- a/lib/powerpc/hcall.c
+++ b/lib/powerpc/hcall.c
@@ -43,5 +43,5 @@ int __getchar(void)
 	asm volatile (" sc 1 "  : "+r"(r3), "+r"(r4), "=r"(r5)
 				: "r"(r3),  "r"(r4));
 
-	return r3 == H_SUCCESS && r4 > 0 ? r5 >> 48 : -1;
+	return r3 == H_SUCCESS && r4 > 0 ? r5 >> 56 : -1;
 }
-- 
2.42.0

