Return-Path: <linuxppc-dev+bounces-9756-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32510AE8564
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 15:59:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS3NW5cmbz3bft;
	Wed, 25 Jun 2025 23:59:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::235"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750845212;
	cv=none; b=b43E3zCqW2WzWbYMXvzwpRFNxgITaO3jyyOrFvvLBok/nx10T4fCfSAOLWIN/KGAMnnE/toFDFALNn1EyNzZ1Dyg0pzQDFL0re4GeI9ytmYUUObFOghe5ghsANWcNgJh/wHp3JYIqLiiEUCroOijoev2Jn9BWxHAc7/eTxP+r0MM43ppXjb8o70iwYHv4s2K5k1hJbCRluBYpBkJ67Q893hlFmAWggOOaLwRAn0I1TYMYGxNd+kmrpurYjmP5BjrIxW2WDoSdrOoQoI4Mcy4K+/Lp7gCv+CMODq7RVpXwbBhqlYI5BAm3LA8hwuBoXOb4Reoh6FJqEJl3xfjiI7jJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750845212; c=relaxed/relaxed;
	bh=iNdRW1IbQwaJLK3IU9ZGilulsvtFwP6FJhql802bOZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WMchfv2t1tM3s9lFEpbSh6HLIVatNUmC2BDNDcY8s9JjXYs9y7sZ5Zs3XrI3BJS0GmZNsUlObFxmVMFOyN9//qz3X63KM53uLYbXfyc96PYI9a07Q8QPDtfun1vlJkaQvMZNE1INrkGenpLAJgnLy1bBck6ZDRcq7nTIAmJav0QrraTFWlMCDvxkFarv0WJuw+TBNWGqkwzuglSdM1771XMeT8bJ/HYKVRz2xnHvlNMPp8BLimiPFrMRP7H5bES5RUQydQ6zIsZFWyG6YhMQpzkP6ei9sNM6uvC+NTfQQSyGCJeIqo3O0JDfadaabISQQLEWqsG9CuiXg937yZ8kCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fcl/BQne; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fcl/BQne;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRxwC1vqVz2yKq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 19:53:31 +1000 (AEST)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-32b43846e8cso12551711fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 02:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750845208; x=1751450008; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNdRW1IbQwaJLK3IU9ZGilulsvtFwP6FJhql802bOZE=;
        b=Fcl/BQneZeRff+wsauu6SLF9xdlPhWy8ycli0ISHk6br66yWJIXsiRmepA8kS4CGSJ
         Yr1mKylSFMrbVa9aVXmPFQBtihe+XM1GSXHbU1JFqoVeNWmHo8fvBlX/L+TGRB0grrrr
         KDYmRO8woJlr3LngkT6PANo5yTD+B+Wp3zYHa4fZuShjQ4LFHZjE2lr3+6I1Ifry7taX
         FwdFWsucAPYjVQnwPI8MoBcNawCQhEKAV0UWBUwJDS1eEse4e78FJlg91LfPAVQMApIL
         BSqYdp5r9GGq44MFNktIk80EZV4HC9ApqBk43TgI594BVp6TPWHjIWG2+vSHmCJCFpVt
         UQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845208; x=1751450008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNdRW1IbQwaJLK3IU9ZGilulsvtFwP6FJhql802bOZE=;
        b=NSdicDV3zCpi5QhpKaQlRRBinuWd41jfr8mwvObdkuZhl7y1Szxd/T8Jn/lHcmxoOS
         EjAp4o0dkcHxf8mWhCxyhtHzKH1heDKrOx4FzHctAhlWWcmon5uj0eB5nHxznQSVh+Bm
         GpgaiQCRhHwAsD0C9LETyRGtxWlDCZbBB1Nre9kCj8305Tr8nuPUTf8M2YNqtsagkLx7
         2Ki07T3GgzHkmRLgmB8USwBj8snZo0i1mYtNikKwuMBZ/tzrLJPEvgKKuwKBPJcv2EBZ
         dNWwFrZzvjTwsIBkXkWAOIOJyEcogeFtCKo63rYXcf5bVTuIoHGlOaLH8ue+bfRG/bcf
         RFuw==
X-Forwarded-Encrypted: i=1; AJvYcCX7mZpfhAcGBX07mtXSNf9R3eK7L2qm1e8HaizqQ+e79gr+mtQULenAFrss9JQclUQjCnvID0u32wB7Xpw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwZm5HWTztYeZZ/XEPTxcH8LkhCMwHUONwcOW7XVr2fgK9p2Ozb
	6skN43/Ga8SFuOPa1RZda6F7oY/AzVv/iwO8nibjl9WDzCwtC2YbADrI
X-Gm-Gg: ASbGncsHqqUrclfgyTXQnxlzBTMYz9Wg8hxXwdjPwsqtwAthHh/Atnu6TEyG9yXMi1F
	mQWq6Wf1RAbUXUQksaRuDnwB34XROgiDjMhHD806qGtQjAHg04Yc9GiHmt85R6+rmkk/nUsBwVR
	9TagW1eWi9HzclhLJidDhbS3nTuarCl4dWWE5f49yJI7WF1crFKZqYlAXXiSk51KtY6mlwxYxd+
	2Xn5z17B31Ux4LUI5S1XvLVEXqsSpFBMYesT+r8/AgnQnlMNnI99L0gcIgl28cShf50+G8yGZBH
	WANAE7p06EB0RpzW+UVZSLlWyPEOt9lRV1AnngnIesQW8ljtWO78qAa9mzEAPhWSBlxOKj8XMYE
	/arVFUPbmX9tkuNCiqPo49wQrmuLNrg==
X-Google-Smtp-Source: AGHT+IEEyG7BglU4Us5Yezwlbfk1A7iCiSut02wYI0QnYJbbPrBalxPgrrZo+Iohs0E8JQ9l3Ex35w==
X-Received: by 2002:a05:651c:31cf:b0:32b:33c7:e0c9 with SMTP id 38308e7fff4ca-32cc64b7c27mr7419481fa.16.1750845207836;
        Wed, 25 Jun 2025 02:53:27 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980a36c0sm19311851fa.62.2025.06.25.02.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:53:27 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	akpm@linux-foundation.org
Cc: guoweikang.kernel@gmail.com,
	geert@linux-m68k.org,
	rppt@kernel.org,
	tiwei.btw@antgroup.com,
	richard.weiyang@gmail.com,
	benjamin.berg@intel.com,
	kevin.brodsky@arm.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH 7/9] kasan/x86: call kasan_init_generic in kasan_init
Date: Wed, 25 Jun 2025 14:52:22 +0500
Message-Id: <20250625095224.118679-8-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625095224.118679-1-snovitoll@gmail.com>
References: <20250625095224.118679-1-snovitoll@gmail.com>
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

Call kasan_init_generic() which enables the static flag
to mark generic KASAN initialized, otherwise it's an inline stub.
Also prints the banner from the single place.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/x86/mm/kasan_init_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
index 0539efd0d21..998b6010d6d 100644
--- a/arch/x86/mm/kasan_init_64.c
+++ b/arch/x86/mm/kasan_init_64.c
@@ -451,5 +451,5 @@ void __init kasan_init(void)
 	__flush_tlb_all();
 
 	init_task.kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized\n");
+	kasan_init_generic();
 }
-- 
2.34.1


