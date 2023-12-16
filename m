Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 681738159A5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 14:54:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WeEaCQul;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsndS0nK9z3vrF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 00:54:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WeEaCQul;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnPV18VJz3cP8
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:44:14 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6d9d209c9bbso1387547a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734251; x=1703339051; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6mA8Da/KVG0j3mfhNeKOZZt/rV+ImlF7ZhUN6TmsOA=;
        b=WeEaCQulWhCBWcgUEhSBmtjqN7H63kseBfPnnnUxkh87V+UMw553HWiN5ADQ8SOPT5
         qCH7FtWDLpi8cXIszPHLc1CBu49G9ruOEsJ2ww9vtAPIFcId75MgyQ71pAPvwVNI02u8
         1yyoVcp+0CyFpi8HewtpUld+RgZLWCbsd6CeDbeDTkjKVA8OKK6o5VHXdeI8J1K5Th9J
         3qM+Y/aeA0L0q2gTlScyVxqMgvVIV3Jbl7X9G1QNdsCo55qhTRyZodMESKThblsH07Lp
         Po/j+m9El/YgqDf2qgPKujANhg3UIQMLuvJoP/KscNI8aJfxfWPCE9wvC+R3t08fvp3P
         Tpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734251; x=1703339051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6mA8Da/KVG0j3mfhNeKOZZt/rV+ImlF7ZhUN6TmsOA=;
        b=DDrdA9Px7RPy3S6jAysGq0d1K6jpkUu8L+xBxJ35N35fzNdRWfGlT8qDvEx5tFhG9/
         olblz3016XBulBIwiVkky9IqJ9cjuqp9OYfZ1UAMc6HXlT/WWZDzpNnX5Wuqck6sD3eT
         JSzMGp0kZzT5ZYBFuSWLFcfG8kQ8iMfewQ74dp3V5QDTBD1/pCGEsHfeWyfULcQTNjBU
         vxn+8VWuPljT2SjENwvb/SrHdrcoFErUBB26nuHznBvwXk76vdfocdyFyF2bVg/JNoXA
         GmpJWJh8Ow6nSU8PVSQi63RR3fMduinU7qTmcGQoNmG4XU+3e9R2JUcfOUQ8YHPL+Fop
         bX+w==
X-Gm-Message-State: AOJu0Yw5N0WKtmu3vkY4DJeNpZU62pBrgTuRGIQGzfqdB+2i7e0vUpN9
	5p637xyM8XJfmcc0gP0sczc=
X-Google-Smtp-Source: AGHT+IEjYPcOHlmBgkrPnRtHPBF70ADKtRCD+zMFo2pxOXd6wfI8f9wseEgJGq4OIsCpDjMTpcAN9w==
X-Received: by 2002:a05:6808:118c:b0:3b9:d5ae:5d53 with SMTP id j12-20020a056808118c00b003b9d5ae5d53mr16252673oil.41.1702734251428;
        Sat, 16 Dec 2023 05:44:11 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:44:11 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 13/29] powerpc: Make interrupt handler error more readable
Date: Sat, 16 Dec 2023 23:42:40 +1000
Message-ID: <20231216134257.1743345-14-npiggin@gmail.com>
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

Installing the same handler twice reports a shifted trap vector
address which is hard to decipher. Print the unshifed address.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/processor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
index aaf45b68..b4cd5b4c 100644
--- a/lib/powerpc/processor.c
+++ b/lib/powerpc/processor.c
@@ -26,7 +26,7 @@ void handle_exception(int trap, void (*func)(struct pt_regs *, void *),
 	trap >>= 8;
 
 	if (func && handlers[trap].func) {
-		printf("exception handler installed twice %#x\n", trap);
+		printf("exception handler installed twice %#x\n", trap << 5);
 		abort();
 	}
 	handlers[trap].func = func;
-- 
2.42.0

