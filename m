Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D958159A9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 14:57:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q4Xf2EzA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsnhG6J6zz3dLG
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 00:57:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q4Xf2EzA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnPk18yLz3cWn
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:44:26 +1100 (AEDT)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6d9f069e9b0so1396392a34.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734263; x=1703339063; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRUnkU+g7qRtG9MV7NCG/L4yfLCIdw5pgzKA9HKUSKU=;
        b=Q4Xf2EzAc+7DBStXehbW5ssNiLwUgTu/+ULCJPehNAKXoH03fKVA4A9eeMQek78QPY
         lCZ5BS1Jr9fvf1k7EDYwAzq7DyWr0culk9znCkUYMSP2YUpZBq99Ljim6dsxU9pv5ew+
         a1bRai7U7pk3bVZgsgRyqmfxiTSbYQASK8Ae7msyzqYP2pwB54Ie2HYrGtQjY0jeS3Je
         fJeuAKOvbZkU6MwmLucJCKnPH2JhS7vdL3B6OjWzNVtGe6LDzvEwfllWuIkhjO3+8RlK
         7SJlGi7dxNvHbpZZHVtQUP4R0fXyuPh3IZRjfQ6fby4I5fzSYhoHIKx5/kLY1RXcsc8R
         SsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734263; x=1703339063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRUnkU+g7qRtG9MV7NCG/L4yfLCIdw5pgzKA9HKUSKU=;
        b=u9jg5e8UVroqVGgw45Yh8plF/OXevfiBY2XOY5f2tkZJcbdepqmvD5eCp2n0kbDGr8
         dl5OifVz+BVHguk4xf/Ti2/UPLSypCIC05czwvzGbtm5hT2G8D0Bes2IrKcHlLnTQroD
         +EPLmz5BwtAD1IfQRTSaq9sNkq0UfCs+zSyJQsh65X4uNKycVSbwOHT5PYnN1m1zn759
         Lc8EDfvx8X8cE6868g+CgMxxTrg8Eyt7oNsRxK2pfOrEj0oVUHK8j4Znq4Hn6wa8qpOy
         5JucKNCr3P4hRVwSGnaKi1wPRqDoaGyxqHcLfnh5jW1VcSRfmY3PYhEkXjaXoblNcK9K
         aPdw==
X-Gm-Message-State: AOJu0YyyrJA1aUaKiZ7u4PlfLJBmCFJNqV+IjbxX/aR8cHYZOsv23IDD
	UYvHeuMSETq3vJcwmReFJIA=
X-Google-Smtp-Source: AGHT+IFal2Q0T3a8RPC2sdfwbSB1Hzulx2S6zDy81QrBYbZwS1rlFsrVCGPsN4M43mq4C0EJYqZ1gA==
X-Received: by 2002:a05:6830:1499:b0:6d9:e7db:7b60 with SMTP id s25-20020a056830149900b006d9e7db7b60mr14145763otq.12.1702734263452;
        Sat, 16 Dec 2023 05:44:23 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:44:23 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 16/29] powerpc: Set .got section alignment to 256 bytes
Date: Sat, 16 Dec 2023 23:42:43 +1000
Message-ID: <20231216134257.1743345-17-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231216134257.1743345-1-npiggin@gmail.com>
References: <20231216134257.1743345-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Modern powerpc64 toolchains require the .got section have alignment of
256 bytes. Incorrect alignment ends up causing the .data section ELF
load address to move by 8 bytes from its file offset, relative to
previous sections. This is not a problem for the QEMU bios loader used
by the pseries machine, but it is a problem for the powernv machine
using skiboot as the bios and the test programs as a kernel, because the
skiboot ELF loader is crippled:

  * Note that we execute the kernel in-place, we don't actually
  * obey the load informations in the headers. This is expected
  * to work for the Linux Kernel because it's a fairly dumb ELF
  * but it will not work for any ELF binary.

This causes all references to data to be incorrect. Aligning the .got
to 256 bytes prevents this offset skew and allows the skiboot "flat"
loader to work. [I don't know why the .got alignment can cause this
difference in linking.]

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/flat.lds | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/powerpc/flat.lds b/powerpc/flat.lds
index 5eed368d..e07b91c1 100644
--- a/powerpc/flat.lds
+++ b/powerpc/flat.lds
@@ -41,8 +41,7 @@ SECTIONS
     /*
      * tocptr is tocbase + 32K, allowing toc offsets to be +-32K
      */
-    tocptr = . + 32K;
-    .got : { *(.toc) *(.got) }
+    .got : ALIGN(256) { tocptr = . + 32K; *(.toc .got) }
     . = ALIGN(64K);
     edata = .;
     . += 64K;
-- 
2.42.0

