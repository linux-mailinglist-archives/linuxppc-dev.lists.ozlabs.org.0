Return-Path: <linuxppc-dev+bounces-12496-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0792FB8EEEB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 06:21:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVVLM3gKpz30Ng;
	Mon, 22 Sep 2025 14:21:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::529"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758501908;
	cv=none; b=CIV/3nzXikScUV1dThVvT/yo1S9V3odPj29YB1ITsIZ6Z1kK+pra+n2rmVpRbhoPdqMiGI/2s7w+8PVBGyoi8+H9g3Re6LjHLtrFf8HSwlh/N+rbPPmwTNj+rIVIg0/vl/j4P8SdKk0lh6O3YQoD3MfUrDycZZvwVnJAUSimsI18COn9+mkJqZywgTzYYilhNVz9phaiZvjc4zvz0YuFPaPM3gVV6S6B3gRXIWR4WxviEn9KBrxYnXBKule/NHGJlH7rIhcNskxOqKmm6l1ivbWolPToGOmPrpwMhdp1sqQ6I/+NA/b6NFi+dtglBNMRZyUtUS4sDDrd/gF58MYVLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758501908; c=relaxed/relaxed;
	bh=+4TpF34W3PHvsBrekGwm1rvuPQAafzFCgW5mxOcoS+s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ahHTxjzvZEDKbH6O7ohMEKiz3Mb+I8N3FYbzQaezR95KRMBWr0+J5eX+8mq/PKZslwQ/yaZFW6Qq7iMs3ul6XyyDQUTTYmyXUW52XDi5xxsUbEoEs40fm6JAf8hoHXdjONK1dDEyl5+ktQaI+sGf70OxZa4lmWyl0hi3pBQ/T7MUNwtcJcRL1Lvj3VnU8wNRA6GEzRoW4sguo0WLa3MHWZWpjCSZsk3yr4wT+z3tElVrTNBTpoULqZZSsywGYgm7IiUEMGsDsUqfe/e+uPLcXpz0SIF14RE1D87td1sT3l74kdnxYEICr52H/EQb2DZJei0jyDBcum9QWnRMkvQsCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K3ecqX2V; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=krishnagopi487@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K3ecqX2V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=krishnagopi487@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVPXM30bqz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Sep 2025 10:45:06 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b550eff972eso2159070a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Sep 2025 17:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758501904; x=1759106704; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+4TpF34W3PHvsBrekGwm1rvuPQAafzFCgW5mxOcoS+s=;
        b=K3ecqX2Vak2GgI4PHaaxlIlOX6B7LHVbELjN7wO9lbabsYx5Eu5eS3D4OOcE4QnYeQ
         cp/hDXMMzn3+pKfPJJFRTnctjpbLmoYEnvd/VXMLe1dcfdfYOvVQar4u2A0/jrVUHFLz
         HGgyHyk8bQjGJzuDxoGy/rR/QU9jo7TN2CPECIMopnUcqpJCoIjWIYoUCq4pj8r+1BtC
         /VFJM8Hotyk4/jjnu7AchanhgTssXbZWs4agxESH/ZoDGDfkIFhlca2uITAu4g4dkarQ
         5DZbCyZREfs/zMdLBu7m2RWRVabkC1YN9S3v1sSBqa39SsErIrvFT20BNvO1hmCSp624
         cyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758501904; x=1759106704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+4TpF34W3PHvsBrekGwm1rvuPQAafzFCgW5mxOcoS+s=;
        b=aXNdW/Npar+uiBsaV3UGQvevkQyB44FoOwzuH3ycLrpIbwjAQCRTOQW0JkhLA2Rrk8
         knePzjNNDSNMMl8z8wKWKWacs+XkCcPrZ/0nuk9/kovUZSpF/0wbAQZ87cLPStCrIFva
         9g287sHp13/yzADUOiryPfO0zOcxiulofQJFI1+umuw/Q+bXFk3jHagZ0bOWve9lZ02A
         LZsBKiUBzvJjVwQGEQXcVWdnNHjEVADUr8kbdjODXAFUznd9/GCu2235xDI/uqWa3Rf2
         J/tOHVOfmI9l9bYj+LOjAwv4PmgaQNFKHzU5h050k6Q7eH74UFRbUk3H4XM5W7QLzz0D
         CtcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh/Pn8Z1XUjcyAFMh4qy/4Pe+2rTfiI2ESB6wVQic59dZx9sB65Vp0urUlPlNWBadQV1fT2gW7SE5t220=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx6iP5JkAd1jlQ24LomiHX3u8I7zwPxvhW30TeosKdKVaunwHGy
	72WmX4p49jClIjmNtG6juT+ecR8vwsB1KmZauDgAk4cZVMHJCUQfJxLz
X-Gm-Gg: ASbGncsZMV+CsOFvgn/dKMCTB1x1oAxWVZIvgOL3h3ZSvCCb8jPtGHp1OyBHoncQ7tm
	T49BIaDrwa5Y0GSSK6UI1ll85YET7R7enS0rSIwab63icyszshCJed8RqmdUAle2BcGTsJWvT8c
	+zzZCor44eJmAA5IWywEX0UvHrDVN81EiYsINKMgz0dCh5gLNFoW9Zxej2X4jJyhz1Fd1iLl/hZ
	AtM7cOyDlMUSFuefDOVdQNM2nbWIJBSGfOJuDWYZHvMR0UjGxWFsQrkAbTw9BAW4nmrhYMFgdVW
	2fX2Egdfbk58VJUy6B20YwOZ9oLjparHq7/khJUZu+4yDNSKOsK8OxoImnH0AFIRhmDn1Qw5IlQ
	HWUDDbWNX2vIozMRnGJJEAZthTs8WacmMS+Wjoz0UUeMNsksE+14Z
X-Google-Smtp-Source: AGHT+IGeGCeJGDQO792G7blZZbjio2dz2UzvLzPbvR3uVFdQj+v9IaRb+EMqbWNhfxxc4quvxfrw7A==
X-Received: by 2002:a17:902:cf4c:b0:267:776b:a315 with SMTP id d9443c01a7336-269ba508205mr140392845ad.32.1758501903638;
        Sun, 21 Sep 2025 17:45:03 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f0da42fdesm6769810b3a.66.2025.09.21.17.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 17:45:03 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	shuah@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	krishnagopi487@gmail.com
Subject: [PATCH RESEND] selftests/powerpc/pmu/: Add check_extended_reg_test to .gitignore
Date: Mon, 22 Sep 2025 06:11:23 +0530
Message-ID: <20250922004439.2395-1-krishnagopi487@gmail.com>
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
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add the check_extended_reg_test binary to .gitignore to avoid accidentally
staging the build artifact.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore b/tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore
index f93b4c7c3a8a..ea29228334e8 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore
@@ -1,5 +1,6 @@
 bhrb_filter_map_test
 bhrb_no_crash_wo_pmu_test
+check_extended_reg_test
 intr_regs_no_crash_wo_pmu_test
 mmcr0_cc56run_test
 mmcr0_exceptionbits_test
-- 
2.43.0


