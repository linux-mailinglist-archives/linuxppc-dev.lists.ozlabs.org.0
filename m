Return-Path: <linuxppc-dev+bounces-6307-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F549A3926A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2025 06:12:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yxnh360BMz30Bd;
	Tue, 18 Feb 2025 16:12:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::344"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739854096;
	cv=none; b=D+pJz5Dl809VN1bP45cP1I7jOvHFabvLZM8LvJ7lgyhtJlT8z8HRzhJ/QyLn7tlPn10ViYNWaDQ1X8ngL2HP7OitJzuCrJJ5ef36If+86rtUOG6QG/qeZZiPUohcLqqiAb8xX2rpdCG6xjbxoo7zkurdcTSU9vKDNnnsDg8Rmf4rc+Y34CXHdDRsydxzO1NsnYQfBVy75grrk/9klH4Y5bdJpIH5lJ2/DKu9PVf4LH4lKQ69L/J/EWPvRNv/JzKKXKZu4xCLd1EthBJ7p9PUPzDBGBONFbRmyGGRbGt5gPxp6AJWt8v7L7wUsrA7QNwcFwoEmmNha4wsaTV087RmDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739854096; c=relaxed/relaxed;
	bh=IoMFj5Vm67d64jXv8v17k6H1QwlCU/79a/V71c8lTts=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aa0zNZDChWoAVJyn/pbi2l8P3rSl9UwEwMGKzNGjAZzCjX5Q79H9V1py/KB9Zq63Q13i7EUJavOGdKm4+k2qlEl7VNRukIlVzteQEOvSj3aYodx1T9Hi/s3kc7RzHonb13KxWUEqNGiOTWKI13oM1a64qhQAsuIZeG+Mycn40KZU20+8Ols2lXxBDEnci/n7vVIhAYzVKWx7B+yjyKYsv39QGyadXBTRs0vwXLkox1iWJqbNqpoTfiNZNa08PP2fVa6iBtZYDbr1Ez3VgSiOpS28edVz8e05paP6EjkO2ug5Zj9WVGVwXg7SlZcar5O+lDZKgeMgEGLpMEHPq8NrEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Nm/E5AW+; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com; envelope-from=shung-hsi.yu@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Nm/E5AW+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com; envelope-from=shung-hsi.yu@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yxn8b2LkPz301x
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 15:48:13 +1100 (AEDT)
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-439950a45daso620575e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 20:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739854090; x=1740458890; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IoMFj5Vm67d64jXv8v17k6H1QwlCU/79a/V71c8lTts=;
        b=Nm/E5AW+g/LCZyQROQD9cLfqiG+2llYECpvzM7PrNMS4JJSwiCpFfklfaObtd8I7k5
         QpampbjWKJwDpt54kIY8J89Cy+VLMthHfv/iR8nhRTD+lDsvgYE5yYFGaa7Ur86FJ7PW
         bbN846qAu58gzg6ua1ZDC04i7oH3xJE+YXysWYdPDzL8naPtqQZlJXT4B6tj+eIjZw59
         ZJinNSoKJ8Tqds2bWviXulDyoKYFAWxD36LkU8RTcIwufVYVvTX4/SGm2dnTCmz5nyFY
         vvKka2BrZy1TWS0OF8rm67UO8qKMC1sZUT+zQNUHZyPc494MbyxtEE/wgY6/3DwJuj6Z
         Bchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739854090; x=1740458890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IoMFj5Vm67d64jXv8v17k6H1QwlCU/79a/V71c8lTts=;
        b=cd08FANTP8Z+hC3Lax1AOeYnbV+RdNz/b0/GYpszqtDb+WFyKpted++ruAR4L+/u53
         IDUBo39oFzdj7DJ5kVxg+TLYDvXnrDO6ArEMRkCiFBWXLjpT4i3eXc/j9IM3OkAOKKFn
         A6FD7Kkh63jHRVJlg+wZAOGnxwVbSf0HO4JqTa+FCQXH+KpBmOaWqeCQC86jtYRtdprS
         zjyTVwpycSH7r0i68bUkcC5IqUjHszKVXJ92aCfJnPSYcZ/vqjB5ICQ9cOI6rlQRyJpJ
         dOfgcekGQVJQDMy1pDQyMOJMNVztmsa4LbbrxhVDF58IXjHYgjaNrP1yurX2SHlWDWiA
         zRJA==
X-Gm-Message-State: AOJu0YxHSETZjjN9qaDE3Uo1Mvg09xiC1aC5fwBVH1MnSlzD2VWRfPTW
	A8CLFismlbxBGHmyBTy4/5SpSyQ5qq1nscodfGhGpWfnWRdJjPKhi/PrqUTQEnxQqXHkXPw7mbQ
	+lEkudIRe
X-Gm-Gg: ASbGnctLou3iDFFCAVRU/b1JOnh/RGHwmVGDH8dyQ/wJaNgKs6NPsowozBsCEpRhBWV
	GmloDk9VJZICuYxUIEYhg5wdYRbrUGkA5YUM53NeRrWBsHz2wmyD95VqFYPkjabK23z5f/DVe0t
	uSQjHSaMBlVQFViEESmH+zV+YAx0uONcf0+LSvFXFW11zXbMdCCppVfH2+giJGXOmIp5kdyFOQ2
	9auDCZtDdtDw16vNURPy1NzlbCZShJ0sLV1minMMWTDrpaI3ufnsPAIJM/jlaQl2J6PzMonEHQS
	K/uZFBKoL0+x6J38
X-Google-Smtp-Source: AGHT+IFv29p+3UIr5LNNK4VzmfCWlyKJ0cYxloF+ZcpQRwkOOdASTb7wqpLFPX1JBPccUl/8XIHVaw==
X-Received: by 2002:a5d:64c6:0:b0:38d:e3e2:27e5 with SMTP id ffacd0b85a97d-38f33f37467mr8604249f8f.5.1739854089691;
        Mon, 17 Feb 2025 20:48:09 -0800 (PST)
Received: from localhost ([2401:e180:8d00:54ae:3b1e:ed6a:2e2:626a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-220d5349510sm78786815ad.13.2025.02.17.20.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 20:48:09 -0800 (PST)
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Segher Boessenkool <segher@kernel.crashing.org>,
	Vitaly Chikunov <vt@altlinux.org>,
	=?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
	Abhishek Dubey <dubeyabhishek777@gmail.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>
Subject: [PATCH 1/1] powerpc: use __clang__ instead of CONFIG_CC_IS_CLANG
Date: Tue, 18 Feb 2025 12:48:01 +0800
Message-ID: <20250218044802.17302-1-shung-hsi.yu@suse.com>
X-Mailer: git-send-email 2.48.1
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Due to include chain (below), powerpc's asm-compat.h is part of UAPI,
thus it should use the __clang__ macro to directly detect whether Clang
is used rather then relying on the kernel config setting. The later is
unreliable because the userspace tools that uses UAPI may be compile
with a different compiler than the one used for the kernel, leading to
incorrect constrain selection (see link for an example of such).

  include/uapi/linux/ptrace.h
  arch/powerpc/include/asm/ptrace.h
  arch/powerpc/include/asm/paca.h
  arch/powerpc/include/asm/atomic.h
  arch/powerpc/include/asm/asm-compat.h

Link: https://github.com/iovisor/bcc/issues/5172
Signed-off-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
---
 arch/powerpc/include/asm/asm-compat.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/asm-compat.h b/arch/powerpc/include/asm/asm-compat.h
index f48e644900a2..34f8740909a9 100644
--- a/arch/powerpc/include/asm/asm-compat.h
+++ b/arch/powerpc/include/asm/asm-compat.h
@@ -37,7 +37,7 @@
 #define STDX_BE	stringify_in_c(stdbrx)
 #endif
 
-#ifdef CONFIG_CC_IS_CLANG
+#ifdef __clang__
 #define DS_FORM_CONSTRAINT "Z<>"
 #else
 #define DS_FORM_CONSTRAINT "YZ<>"
-- 
2.48.1


