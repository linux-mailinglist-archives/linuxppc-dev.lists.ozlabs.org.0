Return-Path: <linuxppc-dev+bounces-4670-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 734F8A01786
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jan 2025 01:29:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YQdTm1C4tz30CD;
	Sun,  5 Jan 2025 11:29:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736001557;
	cv=none; b=Gw3DMydkwxrs2nnz2SXK69KP42tXpgtvTGKPnB9WTl2vEWXBvXDoOetViGXbUN+d/wjPmQa3xgMWWDX4DrLxkTGjKVpBcIZxo036L+dbejhpK0aQ0ulAlCm1skkUH77WNoX12tecSZNFioJIHV4/0r+detK7CZ2Xe0OXhTnbrZwS/bKJRbD1zWqoXwbjjC7xk4SUaglR3seCN+M6xZB07VwpqzXrekJFLj+l5EUMoCPqXOm7oJpDxZHag0+bMvTSaRoVuR4N5NJ2jIW/iKB+PNOzCrZ4Jc94SMffvEEi8lnMXJzpn8l9AFJKurNRx43a1sTsNSckEaWZdrcsk9ocaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736001557; c=relaxed/relaxed;
	bh=lItEO8+vDf3ne2QEFaUdlfKMhS1868rwBEwl+2/8wc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EfUOcFM4knQiPov9ujRDf8p29DJ9am703ZqxsLG6po4VdWocOhYVOyYwlcM+OLurrikPjNWwKKUKTFecOnsKSBX094bGXNDb2amaWHr7GCiGICe2/EUCPfy9pbeWtHIgLg3LGw1Gq/6KcwevGSsRQ72xnsxGMw8EX3eZPp4ggyS2lpLUiXhcckaCQdI6vJLYR7oh3rFDsJll7bGnfYRF0eicZo7ZhHBfmqUuuGov8WKoLdjWjQ5ZE7isb82pskeiX+sf3PtdA1tvL18cC4w/Dc1XmF7EYseQO5NZ5sBtdK+8x1BSmxDNlJgmyiTXWA9EuxuqTqa2pAAsr2006nVxrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=tigApzsK; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=tigApzsK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YQNPJ72Tnz2y8c
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jan 2025 01:39:16 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2166f1e589cso224184765ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 Jan 2025 06:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736001555; x=1736606355; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lItEO8+vDf3ne2QEFaUdlfKMhS1868rwBEwl+2/8wc8=;
        b=tigApzsKbEXbNdBxnJd/6rPCUZEWRYk1htSqkQOmf7n//18iuYi+lsC7QtnunzcSJ/
         RmGO6Aa90Am87r5XFRV9EoMoxGXEHxcbDDy3RRNq+8BfrCC72k2rxFvW0gvwrQ6qnjHk
         iN3CMlzGhhWrX3di98TXn39iPax8RaTX6jgfy7Ocs+bygKegclGQNJvbOsYeQAxPoPCm
         YZvUEiz9QGw6/Veo57aON4PrboM061vFLhRhVMeoidXW4LQ3n8TImwGN+nkN8CgKJRnM
         IhG6OZEzLIOjT9ai/hsJV4oyekkIwbqbpPijyLw2KVHaj7e8FXcraQnVw2tFkCINr9Xt
         SPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736001555; x=1736606355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lItEO8+vDf3ne2QEFaUdlfKMhS1868rwBEwl+2/8wc8=;
        b=rTbChj5+DVPJgOdbBaNtyjZfK2heXrleZlAFSeQDDGZDDnA3aoxAv4CheRm2b0LKOv
         SDAvxjE3q86rLktkght/4j84mvaEbX+bzG0MR7T3V/e21ofReVO05SmLafsYtunwyp7S
         xY4yUqNZKX92NSZLagvgMkwRFJ98Urx1qg9awoPjuWTWsbdYlb4MsM2JoPvSzyDUMwxY
         oeejtIpxMKAcPFZBYwN8XpR9pt13QaR8/s0HPoRmyao7cXE7BLKqcBNssyguWmaSsU44
         PYZ5at4hMaP4sFmQyTBrcCk29N7Wj6F7GAx1WnopAGlfe1+D/rk8jn4ux0nolbgRfVpP
         c5hA==
X-Forwarded-Encrypted: i=1; AJvYcCXIN4Zpz4kmF4McPbBcjSFNnIJuNJYvkEvwjFf+SsgQVEb2qKt9SKLZJhDalpLWH2Fn2pO2NCLSD35j76E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyhMagdMQos6Ps89+R6p7sAIa9R2+N00jgaf2PBoNs72I4zn50N
	1jcaTinVIhZK8EXJ4gkT92eivvG8YmjGuEs3VLZgdWJS4j54DoRTaS4jb0SYGIM=
X-Gm-Gg: ASbGncuyFTLmuxFykvqlMECcL6z6WNVkTNMfYQDc1Jlc7wfPcwVyQE0KhpNSTbMSavm
	3jUITH79AvD1a0aJFgkboC8tStdBuSPtpWQ0bsg1ikkrChCck3cE3nlZgetIjL1ux1kiIAZAlzK
	FE+mlMjvCot9M8RK7HvFSb0/cw6+JC9idSK+0j4eXCCGSa2S3JZan87jn+d0NTLCwl2H2ji8yfh
	QJXSDcfwfRAzBR3QVbcmWSgLaVkFvL9YV67F2/LHdxc+Cu6gpY8CQXSlywtfO0=
X-Google-Smtp-Source: AGHT+IE6l143okZ4K2hLdktIIklrvNPqE32MSRd/SLQaBZqLFpJB0ZcbHN/hLV+Lk0+UAUXZGQQd2Q==
X-Received: by 2002:a05:6a00:4098:b0:725:c8ea:b30a with SMTP id d2e1a72fcca58-72abde2ab0emr75955118b3a.14.1736001555483;
        Sat, 04 Jan 2025 06:39:15 -0800 (PST)
Received: from localhost ([2400:4050:b783:b00:4952:3c52:120a:27e9])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72aad8f90b9sm28017661b3a.131.2025.01.04.06.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jan 2025 06:39:15 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 04 Jan 2025 23:38:38 +0900
Subject: [PATCH v2 5/5] crash: Remove KEXEC_CORE_NOTE_NAME
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250104-elf-v2-5-77dc2e06db4e@daynix.com>
References: <20250104-elf-v2-0-77dc2e06db4e@daynix.com>
In-Reply-To: <20250104-elf-v2-0-77dc2e06db4e@daynix.com>
To: Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
 Dave Martin <Dave.Martin@arm.com>, Baoquan He <bhe@redhat.com>, 
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 kexec@lists.infradead.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Now KEXEC_CORE_NOTE_NAME is only used at one place and it does not seem
to provide any value anymore. Replace the remaining usage with the
literal and remove the macro.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/s390/kernel/crash_dump.c | 2 +-
 include/linux/kexec.h         | 2 --
 include/linux/vmcore_info.h   | 1 -
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/s390/kernel/crash_dump.c b/arch/s390/kernel/crash_dump.c
index cd0c93a8fb8b..4a9817489e35 100644
--- a/arch/s390/kernel/crash_dump.c
+++ b/arch/s390/kernel/crash_dump.c
@@ -253,7 +253,7 @@ static const char *nt_name(Elf64_Word type)
 	const char *name = "LINUX";
 
 	if (type == NT_PRPSINFO || type == NT_PRSTATUS || type == NT_PRFPREG)
-		name = KEXEC_CORE_NOTE_NAME;
+		name = "CORE";
 	return name;
 }
 
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index f0e9f8eda7a3..c840431eadda 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -68,8 +68,6 @@ extern note_buf_t __percpu *crash_notes;
 #define KEXEC_CRASH_MEM_ALIGN PAGE_SIZE
 #endif
 
-#define KEXEC_CORE_NOTE_NAME	CRASH_CORE_NOTE_NAME
-
 /*
  * This structure is used to hold the arguments that are used when loading
  * kernel binaries.
diff --git a/include/linux/vmcore_info.h b/include/linux/vmcore_info.h
index 1672801fd98c..37e003ae5262 100644
--- a/include/linux/vmcore_info.h
+++ b/include/linux/vmcore_info.h
@@ -6,7 +6,6 @@
 #include <linux/elfcore.h>
 #include <linux/elf.h>
 
-#define CRASH_CORE_NOTE_NAME	   "CORE"
 #define CRASH_CORE_NOTE_HEAD_BYTES ALIGN(sizeof(struct elf_note), 4)
 #define CRASH_CORE_NOTE_NAME_BYTES ALIGN(sizeof(NN_PRSTATUS), 4)
 #define CRASH_CORE_NOTE_DESC_BYTES ALIGN(sizeof(struct elf_prstatus), 4)

-- 
2.47.1


