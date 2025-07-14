Return-Path: <linuxppc-dev+bounces-10236-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E39FB03444
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jul 2025 03:57:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bgQSK1yclz3bmC;
	Mon, 14 Jul 2025 11:57:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::532"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752458257;
	cv=none; b=ge0775Va14lKsV8xJx79k0Bfc+/vwdM6vbJCnnq9/zNUVMzxmeuijv13F1t7QEPNYAJOKXskgTIlrB5ifAJUJS3UYIYHAaKG8zf3bD/Ktda3qHns2v9Yqe/iLC+1sLl42w82QW3Qll8VdsoO45w3cOlBKfFl4lTmH0GZSMc+g7onxE5euc2RKGEd/eGv0ek7St3A2pQFXaicNhNwVNWWueMCVb7xfczmfq+nAF6J/RxzSlBXRdeQj0ZPOzZ76PoBxFmTui0AOJP1wFj5Zq8TNuwbIfb47hpehmHO2/gvjQ/Z5RLSbvdG1Jk93FW5DD0oRcViYNqlAMukNrlMcNw1MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752458257; c=relaxed/relaxed;
	bh=iSUx2XgUMsGQsj10m/9SoX9P5P+4nF9nfb9/i8DE2zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cbnvF9lwQ3e6+hEwV+93fc0StgTRHrupHWkwf1S/coHYW+mEwJErivpl3kayEZ5tiLO4nuXYxsc1qgPmXJog2fa/suBI1a0oKyqSqs+Jy2wRaN2MeYQ2m69MFNMkn/MxrnBMm52IWO81ELN7Elza5G6RzBVuzbOkZnfbunuC7VyhbKH4F4imjnMjyezsIxsF7ZJyB0HscUFHtMc4Q9nHNScbcqgt9P+DjI+Y4dS14deF6C5c7VnK0vjv6Vp9WRvhgB+e4z3muzHYNzYlfC3oi32CCjnw9CYPqtyPHEnN9+656oIvY0L0UNLKQWYudNZuiE6xeNzXHqbXItq8dND1mQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YfEGenZd; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YfEGenZd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bgQSJ08Zwz3blg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jul 2025 11:57:35 +1000 (AEST)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-60c3aafae23so10158633a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 18:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752458252; x=1753063052; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSUx2XgUMsGQsj10m/9SoX9P5P+4nF9nfb9/i8DE2zc=;
        b=YfEGenZdKZkByBC3yGhw7dy073s+7R4mpiE/jb2wDs0BdF1MkMyQCP9JRbGWmwMw71
         zEUASRuSqYnuTgBJ2aIHfmgTnx65FtRhPSeP6Z7bgvsxcOkhkLK5xiyR+kC4nksdi9XR
         WgkX/+iIzh0YTImCDATLaD+x7tJIZawdNzvJB+hvpCW0cJvbepVrxPEz6sr9gr3Uk8f9
         1P76yCgu9MsG5Czgy4Xr2F08AJlV+Va0oj/tIk/41wirOX4DOspLcwn6x3NunEQ5yaXE
         XvRy3ax3T5X2kxoP4X6J5V/1OhkHQVxCLCoK7y5RHjGbZBeuQ5kjmxL3SLCZR4qDyv0e
         s18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752458252; x=1753063052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSUx2XgUMsGQsj10m/9SoX9P5P+4nF9nfb9/i8DE2zc=;
        b=Br1krbe4xoFOjf5PXUUHzK3Joz3kRdMYwWPtgwjDbkJymUKBi66WaG2bnYup0YxiKI
         I9cprGIb5GxIHzBxu8Y3338SvHFTTU5AMoow0Pab8hmSEPRIhihOjcheh0bbxJOugQ8t
         LLhNwWFmIY7PPB41rv2ykrRZ1ov7ZFyuTBj9fEedn5iQ9GqENqRRsqonSa9JZp82KlnX
         7VEwXo05m3F0kUg6m7BD5Gg7H0/8CmM2UnPypQ0bxNAngQXT5q2lL38ikrskccf4yXnO
         kK8g7P0FKoiepwKp8zX/Ki81Vy+ke6xjthG0drBNvrq2OIJYeDNJuq1K00wEkauEhesw
         JU/A==
X-Forwarded-Encrypted: i=1; AJvYcCV7+XFt1B4grd2PZu4NL9OeOEXpvV4x83xmBMrPuIU7jlSi4Hiy4EumCjSluxdwcW9JyFU4Iap/Yx0C83w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyF69e99aONclRFYvoZ8YjjtZS+j33/smnDAMtaFvvTFGRZQwUO
	z04VOwuNjm3eb2UI2X+gCgPee46LrlB9JJ8ovPrDcKDMdPa8nl8yI82s
X-Gm-Gg: ASbGncuCFW9Vv6tekafFjMjpTJu1kKWQFfBeVPxQig19oE+6DpqhDsILnugxh3EarAo
	c03ibgSBCcs9doMzFLB787J7UFM63sW5QKTglUEcdMJ+EU7dM/8RcA88WuNjUrGfwcCCJpwp35v
	r3lS+lmWFM4OlxgvcOkbL7lQaGZuC2FpI21Hwz8l0Pjtww0syh26RWypw6w3Ir5r4q3xsjtmV/L
	WBIiLKzOPkpPID/utOSfbYAVRdEy84CNSUleWUdCYNy4sDMs1kjevrpq5IcwlAvm9+nY04J1xic
	23ptcctRBK4AuOhPk8/goem4wWSbt66BCR0w/2rGVAlFO0OVxZYp/b2iC5nuCMYIR2jxVpwJ2gD
	TU4ugPXgPoXepSGdV+tVk+A==
X-Google-Smtp-Source: AGHT+IFa6svVjL9+AuRkaH2jgR8aBmJ4UX+oCB50F4KPWSBsF/RKWL0tGAWDm4/rqm8K87yCWsE0Qw==
X-Received: by 2002:a17:907:6d1f:b0:ae6:f7b5:70b4 with SMTP id a640c23a62f3a-ae6f7b570dfmr1450290666b.16.1752458251864;
        Sun, 13 Jul 2025 18:57:31 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82dedd3sm734161566b.150.2025.07.13.18.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 18:57:31 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id B2806420A81A; Mon, 14 Jul 2025 08:57:26 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Richard Cochran <richardcochran@gmail.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nathan Lynch <nathanl@linux.ibm.com>
Subject: [PATCH v2 3/3] Documentation: ioctl-number: Correct full path to papr-physical-attestation.h
Date: Mon, 14 Jul 2025 08:57:10 +0700
Message-ID: <20250714015711.14525-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714015711.14525-1-bagasdotme@gmail.com>
References: <20250714015711.14525-1-bagasdotme@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1882; i=bagasdotme@gmail.com; h=from:subject; bh=tXjeutRppXmvBhfxh8YB3OK5XDbxuYC5z68U92vFtas=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBklSTl6Dp0rCm97Xc+uSnTQllRb980lXb5uonTy+zO3D P8uU93bUcrCIMbFICumyDIpka/p9C4jkQvtax1h5rAygQxh4OIUgIn0PWb4X8t4eUWfhOdLpiXa 1rFbbz01nnHVffehXxVzg9iEYlOY7jH8lbff8Ye5363l3zzvNRcyOdOsX4S1Tt/zbPbGB4mzepa wsQEA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit 03c9d1a5a30d93 ("Documentation: Fix description format for
powerpc RTAS ioctls") fixes Sphinx warning by chopping arch/ path
component of papr-physical-attestation.h to fit existing "Include File"
column. Now that the column has been widened just enough for that
header file, add back its arch/ path component.

Fixes: 03c9d1a5a30d ("Documentation: Fix description format for powerpc RTAS ioctls")
Reviewed-by: Haren Myneni <haren@linux.ibm.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index a7f729eb0c3694..24c7f480e31057 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -369,7 +369,7 @@ Code  Seq#    Include File                                             Comments
                                                                        <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB2  06-07  arch/powerpc/include/uapi/asm/papr-platform-dump.h        powerpc/pseries Platform Dump API
                                                                        <mailto:linuxppc-dev@lists.ozlabs.org>
-0xB2  08     powerpc/include/uapi/asm/papr-physical-attestation.h      powerpc/pseries Physical Attestation API
+0xB2  08     arch/powerpc/include/uapi/asm/papr-physical-attestation.h powerpc/pseries Physical Attestation API
                                                                        <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB3  00     linux/mmc/ioctl.h
 0xB4  00-0F  linux/gpio.h                                              <mailto:linux-gpio@vger.kernel.org>
-- 
An old man doll... just what I always wanted! - Clara


