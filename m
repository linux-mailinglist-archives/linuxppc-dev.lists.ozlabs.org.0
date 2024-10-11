Return-Path: <linuxppc-dev+bounces-2121-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D99A999A704
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 16:56:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ8pN62Jtz3bww;
	Sat, 12 Oct 2024 01:56:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728658588;
	cv=none; b=TXaXo9Kl0CQnUxMAXNT6ji1Q1GAt9w2mOw/o97n8sBaFyEain+ueDY4W4HnsGh+XgmkcfBsOKpS+n3RhaQk6iKQqicaro5xr26iCou5a8CPeVNTk0YfvxxQvzpu2PKB0F4kQ6yIQ8GYznYoh9i+snMCSdBoWIPo7+TUXkmrOM+ZDKg4UIHQoGcczC/PzM/FyABmFBa0TxYC9+qzZx3VmUsSpLRqmHxLDV87IVOfLLdsUI4AtuE1+REumWn6Z5NN2XGMMMdYYsJV3Xjtymem/tUirbk3LvPs9vN0nUbqWZVCGbzeCGVjwM4cyY9SyBZoYmRMtn8tDHydWZ/v0fXywfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728658588; c=relaxed/relaxed;
	bh=nF9Cu1yFnAPbe7jbcVtURgq11ehq1BMyC9tPOtmnXf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rmk+3aYMuVEbtU4mtPKQbhhaF6C42CH3TwjKvFwKiD8N2Cy/UVPMzWYWz67vWas0ZizVewvRJo/ewV79dA5klgi6vWtgrmYGIyvb3yMjsUp3glMBLamry2LTg+DStFj/33BXVkRm2Kh0SjzVilbNVw65NiWNULkk6vjaI81g+RoAiKfSAUlo0zXYjmRQHXyzNgmD8aeGh20s0xJBlSP9UUnbfZsPVoAMGkznhbwOyNnn6zSaf9nK1/dGiAutwhTB9EiOfOxhKO+MYH0Kj0O7Jl4IkXWFxuyI2js3t8euJD2AyXVcs+7hPZ0XFdZMi9RHc/qovQLZpBOsbsew7J+T2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BMyTBqYu; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BMyTBqYu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ8pM3MrJz3bgf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 01:56:26 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-71df04d3cd1so1848769b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 07:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728658581; x=1729263381; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nF9Cu1yFnAPbe7jbcVtURgq11ehq1BMyC9tPOtmnXf4=;
        b=BMyTBqYuis+ckHj7FArei+Yl89gqWbSVIvqpi8Tm36WVZyihQbFTRWiWk8Dt2QSCo4
         QKtdK82ldK3cnyN/G/wyceF1kD/YUgK2i/7xK4kF1WGIgZzboeipYkW+4dvX7J6/tGmz
         xBQ3Ki9YrJHuC5PV98Zle0FF/cJIaR5enAAlKeTRkRA98mrRFgvCeaqg69uSpnq1d5hO
         XkRAFdA3Sd77ddeDVPnJ1uuKui28knrsMonxPmElR9bWCD5p7RVNRiFb+L4vnTqWkOz5
         u8Ux9PNpon0f0Mh36aQDHxqeayBoblZgnnNOSUHimWodVezCqBF/5qSm4ejFemyTh+pD
         oI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728658581; x=1729263381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nF9Cu1yFnAPbe7jbcVtURgq11ehq1BMyC9tPOtmnXf4=;
        b=g6Ov1+N1xtmr2AV5yCdRB+SFLOvah91ngVGgX3DyxVOg/Ut3WgdeRMG9+aH1Bchq7E
         Xz6pH3Qivcw0+qoeoJDk+b89mT49cg8JaUzlasTDMZwz9H01OTDVwlASvjHPsLu0YdCk
         H+Odp/sPnl7bDp3HkD3AlKibmwfMpPoh434CqO10MpLARZKSph5YB/3xA+m8AVwqkX5B
         UbDbtlNdl8wrkCYhjPeFTihdv//tehahT+7m1Px5tbII7bPm25IZI8twTWpM9C5uQ+B7
         C7nCVThB/O3Ax1qRgSchvsuieCbfqV6x6MIHKU2ZFPAxPATbNlMmagngnJXvBviP4wXj
         LdbQ==
X-Gm-Message-State: AOJu0Yy4Bkgb5lP8QeaU6ZDBk0IYrLF+tr6/4GG21OeKJqUbKzgXESMD
	WjF66W0Se7a6NlUPc/5Dt3AsPR1KMd+1oEI0P4+w/du2rAc94gwM
X-Google-Smtp-Source: AGHT+IEXGk4fmDBJI2QlMnEoAr5L68GZy2LrPDTs+tXSqId4T0CHY5gRz/s/XHjy78yvizjoCrCv3w==
X-Received: by 2002:a05:6a00:1954:b0:71e:13ac:d835 with SMTP id d2e1a72fcca58-71e37e4ff69mr5482147b3a.11.1728658581305;
        Fri, 11 Oct 2024 07:56:21 -0700 (PDT)
Received: from dw-tp.. ([171.76.85.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2a9e979bsm2674320b3a.2.2024.10.11.07.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 07:56:20 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linux-mm@kvack.org
Cc: linuxppc-dev@lists.ozlabs.org,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Zi Yan <ziy@nvidia.com>,
	David Hildenbrand <david@redhat.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Sachin P Bappalige <sachinpb@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC v3 -next] cma: Enforce non-zero pageblock_order during cma_init_reserved_mem()
Date: Fri, 11 Oct 2024 20:26:09 +0530
Message-ID: <054b416302486c2d3fdd5924b624477929100bf6.1728656994.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

cma_init_reserved_mem() checks base and size alignment with
CMA_MIN_ALIGNMENT_BYTES. However, some users might call this during
early boot when pageblock_order is 0. That means if base and size does
not have pageblock_order alignment, it can cause functional failures
during cma activate area.

So let's enforce pageblock_order to be non-zero during
cma_init_reserved_mem().

Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
v2 -> v3: Separated the series into 2 as discussed in v2.
[v2]: https://lore.kernel.org/linuxppc-dev/cover.1728585512.git.ritesh.list@gmail.com/

 mm/cma.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/cma.c b/mm/cma.c
index 3e9724716bad..36d753e7a0bf 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -182,6 +182,15 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
 	if (!size || !memblock_is_region_reserved(base, size))
 		return -EINVAL;

+	/*
+	 * CMA uses CMA_MIN_ALIGNMENT_BYTES as alignment requirement which
+	 * needs pageblock_order to be initialized. Let's enforce it.
+	 */
+	if (!pageblock_order) {
+		pr_err("pageblock_order not yet initialized. Called during early boot?\n");
+		return -EINVAL;
+	}
+
 	/* ensure minimal alignment required by mm core */
 	if (!IS_ALIGNED(base | size, CMA_MIN_ALIGNMENT_BYTES))
 		return -EINVAL;
--
2.46.0


