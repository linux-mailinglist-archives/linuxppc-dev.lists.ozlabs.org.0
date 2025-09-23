Return-Path: <linuxppc-dev+bounces-12538-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 765D9B963FF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Sep 2025 16:29:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cWMnT6xglz2yqg;
	Wed, 24 Sep 2025 00:29:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758634374;
	cv=none; b=orIQJyvqCCPyqqs8OvxrFP3YTtvoFSLFInqtCOUM9Zqu9cfK7uhpMuACo9ThE1/IrqQpyJHSxXSDlm69OhAQbw/8mdQEz8k+Nqo4Rr/zuj0uq+Jr6PCAVBm20VTZcM+6v1A3woZlDk7Y42w1FjyBdDm38h5Zt+uS+jjH/+/V9rpuxb1uaBuLr6xqVx6HXNMRXyvs6bEc0Ox4SwLyl3OaS9ulZpNGNN3wL/A4rQsIm3pBIXOSrslDUdzyWvHm6R48BQh0BvhEXyzPVlUGGcuWE2bk2WsQvVy+eBmMFNxjh6WPGno05EiRjSWOIJb8p9L2K/Gp7m5pRD+OXVbmdDgmbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758634374; c=relaxed/relaxed;
	bh=YdNQB1ZGXvQWh3XKMx+CaBgdTFkZKFEai7KtP6jM1KU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XInS2IH3tuU2pvkvZfpwMCc6jQqqxy5dhbB8DcT2UwkZJ75tJqB13Z82+x4SBnXG3ZAVdYQg5MT7Ig+k0p2hxmj/17vSaVabweQQ4Ouk2VvzAl9FzlZF+g+t0yIE+LHFhGRweBwQ73SMidWl+VnLJnFdCqNnHBXsTnzdgxpqSjziSXI3jCVRMFqrI90GFU0vavHSSEgQrShl99amz1khrY4Ozpu+DFH//k8MgyW1ws9N4SBZ/W3Vp9Eyqcvbud8Xel+d1f6wlmAwHRr1KIjyk62jifcgi3z7jz+JZvTsSaRQwC1IJV3JcO/puzFy1DSdxKMvMncQzw8IGLSyANH5qg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UDbPObI3; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=lgs201920130244@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UDbPObI3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=lgs201920130244@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cWLWm4hfTz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 23:32:51 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-77f318e12a6so1556800b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 06:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758634369; x=1759239169; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YdNQB1ZGXvQWh3XKMx+CaBgdTFkZKFEai7KtP6jM1KU=;
        b=UDbPObI30K5tq/o0z8s/Gwrd+Rn5TCDosGfcah3tWsQBn5AHislOqqRg9K2yXOFvLF
         JGv3cZ503G/FOFSXJ5xCXY6xHoffMenMmFqsiYC3pMYsu///fji0WBAAWUYMhH6Jqe9I
         r4HVOw/Vm8GsLLm2aXLZu22ae9AntRqeZ9Et40Ur8N6/6hYk5Hra5TKT1x3HNRV6nYyC
         XRwHqMEidCQZD5GFBnrp4gMu59OPlpEISx9JpWEgUC7x2OVgu6Ft99BFEpJReyFlZRRv
         dfnix77bcw1hXNDl73bOOJQSqhJiq6iyGTY420uJpg59LYPOAIUvz0g/CRBPIafezWW9
         TR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758634369; x=1759239169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YdNQB1ZGXvQWh3XKMx+CaBgdTFkZKFEai7KtP6jM1KU=;
        b=P2S9ERN8dHIDXrR4w8QPebNTEPMxOP5cMJ1wYfkOhWlQ0SW6/1JNP3QyGQsrbPpqN7
         pw33yQeVKeIcpw2Du7bEUApljquP8qAhPYeteddWZLfZghwL2iAS5U/yMVCR2zC1wT6C
         gSNjaq4PCcNHtVDH/3D+FTro1vtWJZkTmB4629GCRox4rFaQ9i5rgbYCQJibOvJ2C+tS
         DFrC6AJ8ii0hDRZ4FTKpnfvLchJAAmCAfSXSZDRVE7c3fxOjX0G81bsrVTl0Y4UoRbKU
         CMUrfTOZ4QLV33O/jgjhvDceunR36IoSrBjHz+9ogEHbHkst6+zL0BrJDdciE9mICNQF
         ++pg==
X-Forwarded-Encrypted: i=1; AJvYcCXUkdqixtYtwpYVS10sC8lAhexOAbmI1AA7jKt/w/1wxLuY2Qyl2KX38sFqJxaufjj8RDCl9ZtfhRReMn0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwKizt9LkviapeZJttqbGD8ATbrNR6N4n34A6K3IO+eIDYhKxt0
	CRuM/IkpiF5gCy/tJf4vOmWXrZuHLdv+7h59rBER/BC8o1e1Yc1Pif0Q
X-Gm-Gg: ASbGncu+s5Sb/FhD/3GRPCbmrcTXwELU7zwflxHuo5NzgW2YSi4uCltUPllGZlr8lj/
	VN9vxLMCq3hlwTTKGlHbVsR0e+dcTgbQAqt0vN59GyG4GconfxDT642ba316FFqUEImaWK23XoS
	BFoQ/ILhA5vvFc2zuNxMAb+SluZs38Q0UnMKjdfKaBmGsuNas6s5wRljKOx13+i7Jbi7XfoxqPM
	S33LDL6Lbfj+1s2R+kxmwP47pXGvcN3bVt3xtwmSE+3weUWB8+KieVGUUynXmLuiMR58d+fYLbI
	hhQAGYsgr399E0M6I+lEILP6A0D9FX2bMms21vr3mrvXlxSwXeucl7kXhaB4vS8uPqQ9VxaZEoY
	wS74kHgtr+Bxa2A==
X-Google-Smtp-Source: AGHT+IE6W4t4zmOFnWhJK8hWF/RIwTsnYRvhbOlZb0wiZzpWRN5aDrdCT9aya8IOqH6p/Q/J1JKHJA==
X-Received: by 2002:a05:6a00:2da8:b0:77f:2f8b:7667 with SMTP id d2e1a72fcca58-77f5362ea1fmr3223982b3a.0.1758634369100;
        Tue, 23 Sep 2025 06:32:49 -0700 (PDT)
Received: from lgs.. ([36.255.193.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2d435616sm7364041b3a.5.2025.09.23.06.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 06:32:48 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	"Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v3] powerpc/smp: Add check for kcalloc() failure in parse_thread_groups()
Date: Tue, 23 Sep 2025 21:32:35 +0800
Message-ID: <20250923133235.1862108-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: YES
X-Spam-Status: Yes, score=3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Report: 
	*  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
	* -0.0 SPF_PASS SPF: sender matches SPF record
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
	*      envelope-from domain
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	*  0.3 FROM_LOCAL_HEX From: localpart has long hexadecimal sequence
	*  0.0 FROM_LOCAL_DIGITS From: localpart has long digit sequence
	*  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
	*      digit
	*      [lgs201920130244(at)gmail.com]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      [lgs201920130244(at)gmail.com]
	*  3.6 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
	*      [36.255.193.30 listed in zen.spamhaus.org]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [2607:f8b0:4864:20:0:0:0:42a listed in]
	[list.dnswl.org]
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

As kcalloc() may fail, check its return value to avoid a NULL pointer
dereference when passing it to of_property_read_u32_array().

Fixes: 790a1662d3a26 ("powerpc/smp: Parse ibm,thread-groups with multiple properties")
Cc: stable@vger.kernel.org
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
changelog:
v3:
- Move Signed-off-by above the '---' separator.
- No code changes.
changelog:
v2:
- Return -ENOMEM directly on allocation failure.
---
 arch/powerpc/kernel/smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 5ac7084eebc0..cfccb9389760 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -822,6 +822,8 @@ static int parse_thread_groups(struct device_node *dn,
 
 	count = of_property_count_u32_elems(dn, "ibm,thread-groups");
 	thread_group_array = kcalloc(count, sizeof(u32), GFP_KERNEL);
+	if (!thread_group_array)
+		return -ENOMEM;
 	ret = of_property_read_u32_array(dn, "ibm,thread-groups",
 					 thread_group_array, count);
 	if (ret)
-- 
2.43.0


