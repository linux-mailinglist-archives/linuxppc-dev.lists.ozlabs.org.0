Return-Path: <linuxppc-dev+bounces-13559-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C74C20CB2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 16:00:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cy6jQ3NzCz3c8W;
	Fri, 31 Oct 2025 02:00:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::430"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761836410;
	cv=none; b=YGI/y4JyS7JnxaSnBnjesvbVzTpo54ZfgRGvNphzG84h6qknB7uzaAP+Wy4OO57oZQX0FOiUmYxCuCBvuShuPEx1rdyQh9isMn3UkimB374O4l6esKA4xpOieFySMAN/oD7braPAfXViGDCKge72j0LNT2bB1fRHd/8W9USh7zfQLeVV5ycTrxA1E23ZeHVOsBpwezHf1hCj6pqYZMvmVeOQhN3IWsZ4Yj4HhlP8ws7snRQfS7NXd4kIG5lL1RXbTIPt32ccmWlZUeAbEbCG/3IYthIUqrwmtfuiXfuw3xtANHiKWxZzBpfv/nr1WbYtV55NKu9+kd5cF97fyY+jLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761836410; c=relaxed/relaxed;
	bh=3Bgu2avYEn43xS3eBnsMDr+KNl9k/69kVSCAEV85+hE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jov+gIeiS9abkTnA6ZCECqTV5L2S0om0mQTVQBBQ75FDCB8C7t7GnOpd0qtBt2eHP2FymobU7cTlGsB7+IWo0yKGCjvnxGxkFMRqwi1GzZYfAm3DsL2TNLXTib5FYlc8/pj0j+pxXSTQd+cHOwecx1jxXVDG0Hq7y6DyAnLHV/R/MlRpBoOoZ61wAnsiljXD6OYt/nRCGAcv6H2sa+zVOEWtQr12g+VUYedfdkNMu9HjJErFNw058lfouRFzpV3hy8CWx1j+k1dimk96W6P777xyyU/VSJiuYe8oolDAxAL8pkOszEn+P3ztWXKSyPRqLc5Q5xYCI5vfr7yUBr3hQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lO1YsvBX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lO1YsvBX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cy6jP4lNSz3bfV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 02:00:09 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-781010ff051so1030604b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 08:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761836407; x=1762441207; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Bgu2avYEn43xS3eBnsMDr+KNl9k/69kVSCAEV85+hE=;
        b=lO1YsvBXxUJPl0le1i01jXnEv5dLGP2wZ4QomWdZoIRVg2Q83/6TOIVwtGMaoRYB1Q
         kUG8C8TGJSFmjdvyBjt6o/S1eVY5e/rfHlKi4tT0uQSK/GXs4DFazQuyZ31gcIvHh0+Q
         CrCpolFjVDeXjFUJDKJpyrqCQHgOMnBSVF15WJjSfK2fxSQNg79FnE535q1H6Yjk4g9u
         qqoIrGwrHVWIlAvHgrBN+m/dgYfVERLWJ93S1YLpIKllhBB837z7jCuRoAQ8qrUEdSAo
         e4SeCsSGPJ0lCGuqZyFE0H7R91z8+J8J1pEYFM9CUjor+LbLJhfyzspR/BtQYTZPhJjC
         hsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761836407; x=1762441207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Bgu2avYEn43xS3eBnsMDr+KNl9k/69kVSCAEV85+hE=;
        b=L/buiWZJYeLFRyLO/gdAZs+UY3txs9WuHfqmeThu2Xag5Dyu5e+1EFteDkxBwIiQRY
         Z2bCQBMMTpmvgSEc0FcBYSlCxPcPBofbGG9NtiNtRP/LecfBObFPtpb6Y7q5v4GSy9O3
         aL1pTJSos9vRwBZISgNaksC8PfQAGY4c7yLMqHyKm9vKAO8NmcpRwmrH7j0soqSN1qyh
         kUAWbsbap2j+nZr0wYXYPyjVse8vlSlor42+xQyf0Jq+/Xcvht1bSXBWf1DJkSU3/VgW
         9EpBjzXtNXCYSh5UasAnI9jBBkYJZqe0rRhbtS0L7qcU6akBky9A08g/2JQ7pjRFG2xZ
         wlGg==
X-Gm-Message-State: AOJu0YwD+IDmga6StxbL7dv0N9eWXoKOfpYaKiin/65NrpkYkBzl+v1Q
	sHxNhCHlEqRQIZ0FPWYeV+fJefdGW4HJHCmZEpsqEdTJ0KbjqOUgaizOYQUq2E+Y
X-Gm-Gg: ASbGncupxPOH0HIoXKS8n+n+qdYzMuOzv69A7/NWHzIW7511RT0z64KL7KMRRAu8HCg
	lQTpp3pDMh06nrBS3W8Dif7MokgLuCcPDw6NXw/d5cgzLqA73UOQtJksuXsMTYOx+oZE+ao+wWT
	aPyr5r6Jgxu2QSyETFD1ffdqmcNKXbSpJhk69ayexsreISWtLJkRX9N22G13NHfAhp5OGybiFWq
	x0DzcRXJo/1ObejHZV+XS6nAUwVy8yqvI2s1e8vfJu70G2Dn3DZKh6VgHOwWaQrLB6ILqY+gftS
	0dydpWFAbDwEagvxzfXDgscsVdI6GfMoK+efCupiilFK8q7WXj+Hxw6McMdD1MXf+X80i+IGlB9
	0oKftXl7zlqluhYt+iE5mkJxS6Vn52ONtT7cxiTKbTN1Fd5cuocU7MwpbLE+1Z11uRaHoXA==
X-Google-Smtp-Source: AGHT+IEY74BGg6PdtyMZ8GS2m9LX3gM9x3XFD7Hy9Aaeoz0QzZFV9i2xQ2yAS0d47CH++1nxnkiaOg==
X-Received: by 2002:a05:6a20:918f:b0:2fd:5bf0:706c with SMTP id adf61e73a8af0-34653e276b4mr10736974637.58.1761836407135;
        Thu, 30 Oct 2025 08:00:07 -0700 (PDT)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41404987esm18594112b3a.36.2025.10.30.08.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 08:00:06 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Mackerras <paulus@ozlabs.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.ibm.com>,
	Pavithra Prakash <pavrampu@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v2 03/11] powerpc/64s/ptdump: Fix kernel_hash_pagetable dump for ISA v3.00 HPTE format
Date: Thu, 30 Oct 2025 20:27:28 +0530
Message-ID: <4c2bb9e5b3cfbc0dd80b61b67cdd3ccfc632684c.1761834163.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1761834163.git.ritesh.list@gmail.com>
References: <cover.1761834163.git.ritesh.list@gmail.com>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

HPTE format was changed since Power9 (ISA 3.0) onwards. While dumping
kernel hash page tables, nothing gets printed on powernv P9+. This patch
utilizes the helpers added in the patch tagged as fixes, to convert new
format to old format and dump the hptes. This fix is only needed for
native_find() (powernv), since pseries continues to work fine with the
old format.

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Donet Tom <donettom@linux.ibm.com>
Cc: <linuxppc-dev@lists.ozlabs.org>
Fixes: 6b243fcfb5f1e ("powerpc/64: Simplify adaptation to new ISA v3.00 HPTE format")
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/ptdump/hashpagetable.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/mm/ptdump/hashpagetable.c b/arch/powerpc/mm/ptdump/hashpagetable.c
index a6baa6166d94..671d0dc00c6d 100644
--- a/arch/powerpc/mm/ptdump/hashpagetable.c
+++ b/arch/powerpc/mm/ptdump/hashpagetable.c
@@ -216,6 +216,8 @@ static int native_find(unsigned long ea, int psize, bool primary, u64 *v, u64
 	vpn  = hpt_vpn(ea, vsid, ssize);
 	hash = hpt_hash(vpn, shift, ssize);
 	want_v = hpte_encode_avpn(vpn, psize, ssize);
+	if (cpu_has_feature(CPU_FTR_ARCH_300))
+		want_v = hpte_old_to_new_v(want_v);
 
 	/* to check in the secondary hash table, we invert the hash */
 	if (!primary)
@@ -229,6 +231,10 @@ static int native_find(unsigned long ea, int psize, bool primary, u64 *v, u64
 			/* HPTE matches */
 			*v = be64_to_cpu(hptep->v);
 			*r = be64_to_cpu(hptep->r);
+			if (cpu_has_feature(CPU_FTR_ARCH_300)) {
+				*v = hpte_new_to_old_v(*v, *r);
+				*r = hpte_new_to_old_r(*r);
+			}
 			return 0;
 		}
 		++hpte_group;
-- 
2.51.0


