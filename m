Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F8B904AEE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 07:32:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RPJEvZPq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzZ1v2wcjz3vgK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 15:32:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RPJEvZPq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzYr21PLQz3fqF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 15:24:18 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1f7028196f2so25118415ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 22:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718169857; x=1718774657; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+0ku7WxXf8a4yF3c/GUIfqXl1O0gtCpT9pSJtDXNTg=;
        b=RPJEvZPqqasVUGMUT5mvJKDVCCdWdqWzXumluDtfdJ6gRdJICvVjyCF/KSX3RGMKbO
         50lFgjCY1SqxdzbSqe+AtoVLihNE+3rGbU6vSGCgz9EUlcJij39hmN+bzx+Y5uHez24U
         s2lnsDGg7/cO1fysl+tMVuP8zYHpESA6mGzGilxXL7njAShrEvWW99gyY3EKTdbzPYHg
         2y/moPyqkk0tEcNGYQNjMxgx4O0qgC0cuXjUMOjacEnP04ddmcHfV4q4eFkQZNIXmhoI
         kz4TtJunH/NSSvQUH/axBYssBp+XN5oTLV3rkdnHTff28NlKwAp5X/5+PPGjTFeyCqmj
         yGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718169857; x=1718774657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+0ku7WxXf8a4yF3c/GUIfqXl1O0gtCpT9pSJtDXNTg=;
        b=nLRWxhVZKV9DDwjbPS97T0RoBkNvluRP6TLeZAE3XJuGwHjOmaPpbKBdmK3RKP+ByV
         MpgOBg63r9BL/17fU/rwSaNnIbY8JxT8luIpypJgJjJBwWOIwOhH/9DZYomly0r4F2ka
         ew5g25V27DhrA0SxzwJcCnr1M25HT4WY/cY6gJhmkqY8LM9RDkJW8hbkpgPnpMAz4gXB
         /C+QJjRGdyq6wQaOyOietLDCK/UCJwH8habKC3Cs9cK87dG/3YssTALt/86hfotfHrAG
         NLLdJlhcPJkjsMzzg1v9zWg5abiI9gd7uCpC1b0LXLorc/FIkkjKOrznt6Z4c8DAoF+e
         z+Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXqn0A8P3CvS4fvHLCc3ohlT60Cw9HsPJhOES3D9dhKtevp5poYqN/fW2YEZTU66pAUNbXzLGXh7ckksQK9NpYyK9tLvCV0Ts6SvJLEZg==
X-Gm-Message-State: AOJu0Ywt7KPBRjPRlCuZ0op0APvwmxNaVhs99VZf5MaJuXnqmPBOfJce
	AeE3j2Qknxz2WtQEG/0mxLQnPIwdHaXu9BWJxF38hbcKVJ+ZSfFs
X-Google-Smtp-Source: AGHT+IGCLL/DTPwhOwjk642AnhNGlQKNEEILHB9BJlkhVGPvbyRYZRdbWL10EC7mbPbpB1nAF0YMiw==
X-Received: by 2002:a17:902:82cb:b0:1f7:210d:cbc with SMTP id d9443c01a7336-1f83b7df5b7mr6622685ad.56.1718169857338;
        Tue, 11 Jun 2024 22:24:17 -0700 (PDT)
Received: from wheely.local0.net (220-235-199-47.tpgi.com.au. [220.235.199.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd75f711sm112170705ad.11.2024.06.11.22.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 22:24:17 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v10 12/15] scripts/arch-run.bash: Fix run_panic() success exit status
Date: Wed, 12 Jun 2024 15:23:17 +1000
Message-ID: <20240612052322.218726-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240612052322.218726-1-npiggin@gmail.com>
References: <20240612052322.218726-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

run_qemu_status() looks for "EXIT: STATUS=%d" if the harness command
returned 1, to determine the final status of the test. In the case of
panic tests, QEMU should terminate before successful exit status is
known, so the run_panic() command must produce the "EXIT: STATUS" line.

With this change, running a panic test returns 0 on success (panic),
and the run_test.sh unit test correctly displays it as PASS rather than
FAIL.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index 8643bab3b..9bf2f0bbd 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -378,6 +378,7 @@ run_panic ()
 	else
 		# some QEMU versions report multiple panic events
 		echo "PASS: guest panicked"
+		echo "EXIT: STATUS=1"
 		ret=1
 	fi
 
-- 
2.45.1

