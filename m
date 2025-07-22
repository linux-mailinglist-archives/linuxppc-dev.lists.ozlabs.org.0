Return-Path: <linuxppc-dev+bounces-10364-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A98B0E60D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jul 2025 00:03:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bmrr53dH2z2xd6;
	Wed, 23 Jul 2025 08:03:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::831"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753221813;
	cv=none; b=heJjV7J8K0atOSA/AfBcIxPWqtawY4R9aY5D8x4KWtGyz2B+7yPdFZdHNz2DVu0/d7tP4+C+D1hLPv+mJjqpqy8BYyyygyQXHEANkbbNQCLgCQCuFexwGKkAyYOqB2iFUpbabuM31/Xeh9Cq3QfutXAXSOZ73yFP3a6Zxm4lJ7P1tH1gA1rQ3OBRpsXI/RrbBlExG9u7B+uIao8VAPlRly2CnzVpfI65MmDnXK37VIkhrMJHMVsk0+HBROb2hOQaU407gSMtMd1HRyAT6p3eFZElgnj05jerLy42wiQWEQS8nxgAyzQxUQLyi+neyiWGIMaHJTw5Nl2M4+gaoDWPdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753221813; c=relaxed/relaxed;
	bh=8gaRC/p4Q4aGxtDVDBYY4mEonX+wM6f6zjphXhzfSvI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eho2ZklNJGa/AzShXtio6mmHkviEwu8d3S3f28/e5nL0sLb0s+exx0sXa1qFgsT4mrkUBjFWV8k3ACyWTxZPVeJ8DO68kyfZdAE9t3boB/uC/z7/kexKMbmNgf9A7gp1c847pwqmJU8BsC7Fbh64AwsXQt0zvv83Ww5EoZr+GvHHM5oX6syGsXMnW29H7npAfurxOPpNSAThwIysdjogeYmti5iCXxo3YAr2Dskj7DkOyjz4UzlDtLcj/63hcKtuUqKhBPMj954uyxC4quTRFLSXgFfwoYGqoW+WW1h4F9omPIYfVFmxM6AXRQcy9I7nrN0wRk2P6PbK+guUHryD+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fOLmXeuD; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com; envelope-from=unixbhaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fOLmXeuD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com; envelope-from=unixbhaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bmrr41J70z2xRs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 08:03:31 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4ab82eb3417so62039911cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jul 2025 15:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753221808; x=1753826608; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8gaRC/p4Q4aGxtDVDBYY4mEonX+wM6f6zjphXhzfSvI=;
        b=fOLmXeuDGYwdy4ta89tSMgdgw/L//J+rUBrb1KtZNgg9aj/UfpnpN+ulhIVebTroxF
         /S0Zqvn/MI32jitaEEAVfra+Cf9DudpwqgVNaav3u7E2U1BBrAkIEQRYI3U49oIVuhQQ
         t5+bVKkCmzeBogKr0iMtds4YyQM+YH43ItgtbZxE02qm+EPezUXhvb3ModyZ89XGazJQ
         3MHlMha7c4ox6FneKY6pabFwid1SAN5leitTC0kX5glTAuMM+yF5lPbM8Dt8a0YRxJIf
         TDwkFamSdy4xqfUrSs0ydTSgdROxYqv/+XLZcBSz5aoIlncJXImlKZpUHh+YCfjLdH5d
         dO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753221808; x=1753826608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8gaRC/p4Q4aGxtDVDBYY4mEonX+wM6f6zjphXhzfSvI=;
        b=EoIvZKUhpEEug/2TROHovN2/08S0xls2dzYD+9snL/2AM7Ce6BUfqrxd4L9a9QRbHk
         ITyOT+1NScoaa8g1ze5tf++2Pxmq/gp7PC65e8iqb3HbSVGrFEH0aL+C1u+rBV9U85+K
         fuwcVDx6keOQilhFZD17lyeOG1GHLSLqq6n5QO2x7TVYiEbNgN4o9vMBB2vwGTbqLS6o
         eplqblvVZf0cW6WTdvBqhFwWLawduv9Br/tablGTjn7xPQTwLUqfs3+QdgzUX4ytraBu
         PzVDZnj8erTPRiezB7mXAC0C31X3+7z45ntlXsUG8HONHbmOlGvF9GSyTjKh6KqJS4Hi
         opzA==
X-Forwarded-Encrypted: i=1; AJvYcCW9fjEykqTXHsRrU41TzTgwm/W0BK+RQ0H89AGK2e7n8+uS+xIZZOANtCuoqsDYWe6Nut7AJZQBUEcyMWk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyrNRtDNVQqKz6VrLtz3Uvy+XUlsGj/HG/hPN2ezYtNwmEnZ+Ws
	T3nCquh9vUjwURPdq9LZW+UpDJyQzWBQ2TQOcpIqHvMOA/57cTpXNfpd
X-Gm-Gg: ASbGnctJPa97Rz8GS30gwv3PJTwTNGvl6vnTA8jJBpUWhqCz8FeZE1/vK+JSRFdB1RZ
	RVW03pKUEVIrJSB/COG31LGqKCfHwpWMAH0wCvsimhalcwS/+OaKtOlIqc3EeKjVMpfbUpsI57i
	V99xLshFFNgYP4jP/XlqZfBuF7PYoCzvqLsfj4b7pIHQ/NaAVEmfCPA5rmVEjqpUXAFE1RGOFbz
	nyahT6pTUxxevaxpJusOgB257HY+NPOKxvmHpdSoktJNkmsmcNC7SHbIKcU0jW+MLHxiMkEqDke
	aCZCidmm2L06Cvv3ztaUB66tvUnKMQXS5CAihbanfmxWlQpq2tNAZfQ4XRQn66ej9O4ARDjdN5t
	BMaOqV3erz/Jc6u5xCpu8qAREbG4BmeU=
X-Google-Smtp-Source: AGHT+IEpNRQJ6T5vzv/FNgL39gSRzTBG2YyecWT7w994rp7SG04PiWOJwSGopyCWX528hfAKFDRFNg==
X-Received: by 2002:ac8:7d46:0:b0:4a6:f532:431b with SMTP id d75a77b69052e-4ae6de559dcmr9515681cf.5.1753221808232;
        Tue, 22 Jul 2025 15:03:28 -0700 (PDT)
Received: from Gentoo.localdomain ([37.19.198.68])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4abb4980305sm59143691cf.6.2025.07.22.15.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 15:03:27 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	unixbhaskar@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arch:powerpc:tools This file was missing shebang line, so added it
Date: Wed, 23 Jul 2025 03:29:36 +0530
Message-ID: <20250722220043.14862-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.49.1
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This file was missing the shebang line, so added it.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 arch/powerpc/tools/head_check.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/tools/head_check.sh b/arch/powerpc/tools/head_check.sh
index 689907cda996..a9cd06958921 100644
--- a/arch/powerpc/tools/head_check.sh
+++ b/arch/powerpc/tools/head_check.sh
@@ -1,3 +1,4 @@
+#!/bin/sh
 # Copyright © 2016 IBM Corporation

 # This program is free software; you can redistribute it and/or
--
2.49.1


