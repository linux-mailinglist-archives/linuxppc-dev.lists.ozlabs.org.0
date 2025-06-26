Return-Path: <linuxppc-dev+bounces-9832-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40941AEA2AB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 17:33:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSjPm4Lj2z3bgV;
	Fri, 27 Jun 2025 01:33:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750951996;
	cv=none; b=ksxOcX+pdkuwc07+PfPFTSAn/Vl7M2n/Upg/JvGD4/lGQLYbNC1UlqOFQwlKeup/h/GbEvQInwOwEN3i8wxgyflFiywlZnGL2ERjgGSlARzTpSonhhGI4RabdvSgwd7bdjfJKeAWQ4WUQZQoyPsRxC15MXyPFrj4PajHjjOHi4oQfFGCSvLe3xmdSrrrbnqOqmtIWEfYPCVd6IeH+cqgfm3246TzBu6l/Y6HnFSM5ex2vwYUd1lqEq+lSl7KUFO4e018wLtmHf+wTMg9TlmZNg8Ps/YRnN5WupiggkDM5RBFCe1MxWzHErmYcyhu3xvLke7WzZX0eZG5x/6hd+2Z3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750951996; c=relaxed/relaxed;
	bh=wSxJD4SCtsi5mR6YtVjdi0UPNRveg1OSTrY+9IeINk8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A+muuqd0WNXg5JF/RYDz5nw5rxz6vLEBA/maJ3UT7oBMo9TFwZbR+nP5XxjuMfHadpezSK+j4Doezq8GgOt+S38FE1xR4oSHb9UYXo4LHeFtzLvbbHuVrlGYIOI1XboPKqZ+afWRAm1xQh+8om36gttAhwShfejW25tscGVupEFi+ikagI+EYW9LmUgY2s3wO2sHLUmfqROyggo3RFR+5zPgjQXJ3Zk43MiChOPPOyXCMr8tmYB5Cm6k9pypD0TQYptnU0uxhOuSuQMQ/3vfXK9iVgKCoM6dy6Os9W1IBX9drYixLBNbgxeyj8qDC8dZdH/HkovQiOgQMfme97y8XA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=apTz7nwj; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=apTz7nwj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSjPl48Y0z3bb2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 01:33:15 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so1218841e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 08:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951992; x=1751556792; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSxJD4SCtsi5mR6YtVjdi0UPNRveg1OSTrY+9IeINk8=;
        b=apTz7nwj+zSHSi6/npLGpI4MgFDw0r58A4oaYmlomW8FMxAmsn4Xxtf9jxWx1YTGPD
         xNLLkLbh2S+TYEu09XNUxkvbMFT9DuswwBht2WHBZcmSF7StSk0DPZX+zC/t6DPUO/wb
         fh8zhDOKDXFn2L/H5/sEd93mdgaPpTKRVC7y6WjkH0DtzmNr2luYfT4Q2QjabJ7WC9bX
         hJ88xXlbhLVjtVREshxKvPBKcQREILM9ED79NiZvasog0RZWhbGmWFIyRHKJfkIGPtbD
         kpIs+tOPCNE4totRpGh6FiIuaOM2tY1F2N8+9JFdBh32m8rE+nawTO6VX++14sd3vfNy
         CIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951992; x=1751556792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wSxJD4SCtsi5mR6YtVjdi0UPNRveg1OSTrY+9IeINk8=;
        b=Mlkjk4nvkk/TgmYmk0dkWtzJdTOwrCdkXA7RGq+4jHuAiuMLqjeXJ8AnoJ4h94bq/P
         iRCG1Nw9/Lj7Ox7bD095C6r+Bd6Dd1M/U7CXlqVXCXypstyBALJ6r6Y8Q8J2dZvmS4Ng
         Il5rWw2IXlfCzd+F7yP0p7iVMaGTVgCLw3xSEssY0bcEAiBGT8OlFgxRzehz/9LZXFWx
         1ZLxe9Jt1V2Z1AQiMjyFQZ8P1Ty8vep6hEpticMXm3z10uu/ZDi2//a3oLuhung9paS1
         53DT4TitKn/3sk36vuCxim6G9SXKJ9BuOjwFrPz6FEAFFZ8xjrpmMttuyuwYv8J3m5HK
         Bg1A==
X-Forwarded-Encrypted: i=1; AJvYcCWFS5/pKtBcxrZq3x4dk+u4288lMNHqkPly5Mwakr8pK+J0Cc6Y5Go0ldu66Sr8+VPm24x1uiX94D3+DTc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxyEQq7KonqS+4wBdZU5jU8BbosyIpfCbD+OC6ST0udnLL4DVfH
	I54Ykou3e/RmzWOg68XRj6zgwxQfl2D6KOf+0MCMyFv5koh75XVBaota
X-Gm-Gg: ASbGnctvto2rsaqiuNiISruQ7DNrT88ThaY66//QzoeTiqfpPYc7JMryOEdXkTEdRHw
	OlCBPlD3sMFs65NTJbe2Vtu3CKI/PzY+9k6bSb/o58N6dGcuyvD6Uv5m4bC6tRmxR5dSSVBFZz9
	boaJslw5oJvPPx1u8Hzo3h+rYetHUPx3z5/+3qcEdanx/YPC42IZd9hQJDt8yjzb0KlSS4Ys22b
	E0C+AMiDKFBFVY692oAFatsm0o0IBoFi2Ty1lhzbYASkIONof9wRdvQwXEnRash/UPCzRrGa0Jj
	hRS2yZbHDrx7KyHHPn7kwdhoviBJgjNuc1siAuFDnwlUq37uY9qoSWE7T1/LVAzkVELB5SKJh+H
	Bs+sZ381SLHiYS6HSAdUrHnhCLQtwrA==
X-Google-Smtp-Source: AGHT+IFoZkRuIIumANr6hYYRzr1inmKBevr4v8neJa1j+iQaqRjcvodg6bFFAhrpbTZKPBtQIm3EXA==
X-Received: by 2002:a05:6512:15a1:b0:553:2882:d79b with SMTP id 2adb3069b0e04-554fdd1b90dmr3161154e87.32.1750951992214;
        Thu, 26 Jun 2025 08:33:12 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:33:10 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
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
	akpm@linux-foundation.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: arnd@arndb.de,
	rppt@kernel.org,
	geert@linux-m68k.org,
	mcgrof@kernel.org,
	guoweikang.kernel@gmail.com,
	tiwei.btw@antgroup.com,
	kevin.brodsky@arm.com,
	benjamin.berg@intel.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	snovitoll@gmail.com
Subject: [PATCH v2 10/11] kasan/riscv: call kasan_init_generic in kasan_init
Date: Thu, 26 Jun 2025 20:31:46 +0500
Message-Id: <20250626153147.145312-11-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626153147.145312-1-snovitoll@gmail.com>
References: <20250626153147.145312-1-snovitoll@gmail.com>
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
 arch/riscv/mm/kasan_init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index 41c635d6aca..ba2709b1eec 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -530,6 +530,7 @@ void __init kasan_init(void)
 
 	memset(kasan_early_shadow_page, KASAN_SHADOW_INIT, PAGE_SIZE);
 	init_task.kasan_depth = 0;
+	kasan_init_generic();
 
 	csr_write(CSR_SATP, PFN_DOWN(__pa(swapper_pg_dir)) | satp_mode);
 	local_flush_tlb_all();
-- 
2.34.1


