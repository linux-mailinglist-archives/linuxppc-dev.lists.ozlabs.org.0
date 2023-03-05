Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0825C6AB263
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 22:03:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVDgx5wzBz3fXK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 08:03:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Kyfi0rKd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=ubizjak@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Kyfi0rKd;
	dkim-atps=neutral
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVDXw60rPz3c8r
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 07:57:04 +1100 (AEDT)
Received: by mail-ed1-x52b.google.com with SMTP id da10so30868441edb.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Mar 2023 12:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGKYuc2vAADzU7zrublYEPfm3g/rR/f1WGM6/LkI/sI=;
        b=Kyfi0rKd//Upk3aCZ6+jEG9xTzcSdlW+B4Aq9cgOCJ266SK3vfnm1tkdI2RPt7pXRd
         /5aOeEcgds2MgdAfgu2vZ1D4O2oNH7M5sa2NOtN4h/AkNwUegzm7gLjpT0kO6pcW6qkN
         jUlWXb9vbFEAS8p5MHABZ051K4kPPEz7uW/XkPkwfrldKLKAK3VUxzQ76PP6WuUmbCo4
         W4owoRB/SZcwmYTEwgauoIzzd9uD4xjahT3Oy+xbDxewMszjPaqvxoA5P3DQ83osbq3B
         o/ohA5FKrX/NeY3inuy+snM+9n/GXWddpPIah/eoPJbvAxP7nmH97DSy2iKSgiLWiKT5
         xnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678049824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGKYuc2vAADzU7zrublYEPfm3g/rR/f1WGM6/LkI/sI=;
        b=E3j/Dr+EcpKCqU8eHNnDwPITm84qRMAwbqeB8+jfeTm/ZB/z5EZhHcnoctSHwJ1VYA
         WctTtMJR/1+at5CEv23UYsRNSuRP7UYEaoDtXoxvt51kZA7tT8bdrOFPVpedl/GBbP/q
         BqmJc5e4AIDhyxVHh2j9gJOhBa7jOTh1Hf9iSACusW7ciqwEiWlSIyrG/ap6robpUoM7
         7RXnTWBPq65z/1HPxxRkiIC3tv7ou3103267qNXoeSdvkkJOpuQ7AeZj0r+AEphvUTPk
         4lAVhYSbwG8rUqqPS047dC1tInZth8kbjGjDeANBGTFsD7hXBuaswUwauyPsKaJ7SbTM
         mHUg==
X-Gm-Message-State: AO0yUKWVgY8jyXPHltBCfWQ2/oYQuW4biUipFcSNvAblL6xcaqABjUzO
	2mTOeCzK1ATh9H6rbta5+4g=
X-Google-Smtp-Source: AK7set8Lt+GpLOMrecu3JmpD5k2zZkktGUUIlGi4aPXwTlL56+J+rJ7Pb8VCnD8RZciPK4neeAqKzA==
X-Received: by 2002:aa7:c408:0:b0:4bb:f229:9431 with SMTP id j8-20020aa7c408000000b004bbf2299431mr8871097edq.19.1678049824164;
        Sun, 05 Mar 2023 12:57:04 -0800 (PST)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id ay24-20020a170906d29800b0090953b9da51sm3615436ejb.194.2023.03.05.12.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 12:57:03 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 07/10] locking/x86: Wire up local_try_cmpxchg
Date: Sun,  5 Mar 2023 21:56:25 +0100
Message-Id: <20230305205628.27385-8-ubizjak@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230305205628.27385-1-ubizjak@gmail.com>
References: <20230305205628.27385-1-ubizjak@gmail.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Uros Bizjak <ubizjak@gmail.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement target specific support for local_try_cmpxchg.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/x86/include/asm/local.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/include/asm/local.h b/arch/x86/include/asm/local.h
index 349a47acaa4a..4bcc72906524 100644
--- a/arch/x86/include/asm/local.h
+++ b/arch/x86/include/asm/local.h
@@ -122,6 +122,8 @@ static inline long local_sub_return(long i, local_t *l)
 
 #define local_cmpxchg(l, o, n) \
 	(cmpxchg_local(&((l)->a.counter), (o), (n)))
+#define local_try_cmpxchg(l, po, n) \
+	(try_cmpxchg_local(&((l)->a.counter), (po), (n)))
 /* Always has a lock prefix */
 #define local_xchg(l, n) (xchg(&((l)->a.counter), (n)))
 
-- 
2.39.2

