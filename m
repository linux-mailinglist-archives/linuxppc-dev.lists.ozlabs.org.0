Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C746AB25D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 22:01:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVDdn5Zbnz3f8m
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 08:01:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XQpvMIoV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=ubizjak@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XQpvMIoV;
	dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVDXt63XLz30QS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 07:57:02 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id f13so30776132edz.6
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Mar 2023 12:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INU9jJ8LcpbE/5gpRgMDZ5idqPx3BDVeD3nCNohGOeo=;
        b=XQpvMIoVY1hfPz50zOJm8ImET2/qnDz8SzbExbEMhUpoAodDU9gmRVk+gVHTjV41Qg
         fsT4F1FRmF7A4S+XdrFIPtysZCRa/bTQR+mMVthHRql0ddWfAaVTRndhUu4LdjaH5a/h
         8KlHG0B61wz2981K4TkkdR2V4hn2+MJRKkT7gP/CSVcvH9wb87scRgrWmAfF44CyLv0C
         7KQ7gdJyK4GAYKjVQrHW+G411c1hcshd/R81Awwd24z4tDzJctUfj7n2uU8/Xl1RWLms
         kVMS9xMW8nxmto2+YnnTqTHjSpJ0KGd7UBOnX+ozZ0yXsIGoN96WVnz3t7OZeXCDkIHx
         zcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678049819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INU9jJ8LcpbE/5gpRgMDZ5idqPx3BDVeD3nCNohGOeo=;
        b=iub3qRIvbiBGkwkYhtX5PRDcRXHVQJQjutDAtNlQ1ZQgIaBbL0LRSaiVWkT5VVz7nI
         h4eTjXJhqLxoCwhfvP/Kq2M2tEvrIg1Wcg8g8iEV2nt1MTA5RX+cWuLBLrVAfdDaxAUW
         m8eQzCzlNQYOqRU1QPb2DeGAkkfauir1ZdA9HxexyDpOTFGY3NCTaXi3H2D+aFwcPiCm
         /POr6XAP9BI+BdLibQuJeocmdBsA+A/FPRbAwPZhTNCggnlYUJaq+K2bxMtd54BVV7YU
         XhhuwPaentJv1iMKcM3YTljuMmaipBYTl8aw2/yYUMjpnquExYoNOmG+FTliUMI6GDXl
         WiuQ==
X-Gm-Message-State: AO0yUKWec0a72yZfUUTzB45ZDVJhgCtCRcUFla9q2weyIOPYT+zQoQbz
	nZa5VESdgNlHpGyKi8L/ACQ=
X-Google-Smtp-Source: AK7set8kiCd/dK0DxHq2OpPRZXV2eyPLGAkRkDs+9TZ48CcB6LDL0aHpg5qt4ZJLjrVLWS/LXgLw5A==
X-Received: by 2002:a05:6402:184a:b0:4a2:588f:b3c5 with SMTP id v10-20020a056402184a00b004a2588fb3c5mr8020962edy.21.1678049819467;
        Sun, 05 Mar 2023 12:56:59 -0800 (PST)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id ay24-20020a170906d29800b0090953b9da51sm3615436ejb.194.2023.03.05.12.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 12:56:59 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 04/10] locking/loongarch: Wire up local_try_cmpxchg
Date: Sun,  5 Mar 2023 21:56:22 +0100
Message-Id: <20230305205628.27385-5-ubizjak@gmail.com>
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
Cc: WANG Xuerui <kernel@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>, Uros Bizjak <ubizjak@gmail.com>, Jun Yi <yijun@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement target specific support for local_try_cmpxchg.

Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Jun Yi <yijun@loongson.cn>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/loongarch/include/asm/local.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/include/asm/local.h b/arch/loongarch/include/asm/local.h
index 65fbbae9fc4d..dff6bcbe4821 100644
--- a/arch/loongarch/include/asm/local.h
+++ b/arch/loongarch/include/asm/local.h
@@ -58,6 +58,8 @@ static inline long local_sub_return(long i, local_t *l)
 
 #define local_cmpxchg(l, o, n) \
 	((long)cmpxchg_local(&((l)->a.counter), (o), (n)))
+#define local_try_cmpxchg(l, po, n) \
+	(try_cmpxchg_local(&((l)->a.counter), (po), (n)))
 #define local_xchg(l, n) (atomic_long_xchg((&(l)->a), (n)))
 
 /**
-- 
2.39.2

