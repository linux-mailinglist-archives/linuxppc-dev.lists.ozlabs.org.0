Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D2E81CAFD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 14:52:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SJr1yzaj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SxTJV6Yjnz3d9T
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Dec 2023 00:52:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SJr1yzaj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SxTGp6Snjz2yDM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Dec 2023 00:51:14 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-28bd423fa08so983323a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 05:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703253072; x=1703857872; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GbTP9pyEfLW8+fO86ti39WKj5aM3Ikce3+WhF/QSJE=;
        b=SJr1yzajGt1ciJjoTEeZHSB3zQx1tPHXuauJfMif9vJQECoIPun5XBdgzmtww0Plzw
         Zy4xJTJxd+IPvNlYoZ5see3fGD6RVMbt3N9Z/OkPTWOEZinp/1uGezY52GsMXmRcUKgg
         NTu4sFKPlVGUWK1sJa35LfM/7PEEGu0Nvky2QsSnBKsW/w91IALMesROgoIcRC9Da5p6
         3JDZtMFxDbGbC0ckO63ko2eA6d31Gb92wWB0Z55700cWM0I3bJSN8WoT96Hpt550EEk9
         OzECtLSDiEaW0TilKSHGuUc8LVVUbIvGE+stHh+cu9gIhHkuq5aJeTiYomaa3PIaIET8
         a9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703253072; x=1703857872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GbTP9pyEfLW8+fO86ti39WKj5aM3Ikce3+WhF/QSJE=;
        b=PHinM6amzdqBQoG2OTodLGGDWey65RajHzOcsP9q47bKYEY9FIC+rZ646+gEarOJ7R
         wI/P9dI0+KWmWwVfawptLmOuTdMuKDE54qV7syPdcgBzq/IKz1ScDD6rBpbCKgUDsHT5
         mqmycLtgkMM2hsT8YpK1Q3XGNZehqaASoDFzEYcEjTRJPRqwX1s2nUqkH8AfrZnMPW0P
         dwk2QmsosAKOxsyUXHIcRZOvovcQyaLmq6EffcHUWdRLo2NJPkIjJ2W+agyEdr5ZBu2p
         MA2mO0HU1K/cma3pHjIBe00ynNX88hY+3/ws32QAfXW4+xu+DT4AVRJnYXVb37NBd3Mo
         xVwg==
X-Gm-Message-State: AOJu0YzXcNImtBAVCYaypQxJA5WTifZqLXVvPLBr4IFBhTu1u/wN4P+/
	0kJaslksOSvOVD2lalkZNI8=
X-Google-Smtp-Source: AGHT+IGJI92l6o3kvWR/9nnc+3uwUDhIQTyXexnYVp7D+d/n+yWUp/xYOOZ+9JgltI8VuCq6hAiw9g==
X-Received: by 2002:a17:90b:e8b:b0:28c:27:dc87 with SMTP id fv11-20020a17090b0e8b00b0028c0027dc87mr840659pjb.49.1703253072589;
        Fri, 22 Dec 2023 05:51:12 -0800 (PST)
Received: from wheely.local0.net ([203.220.145.68])
        by smtp.gmail.com with ESMTPSA id n12-20020a17090ac68c00b0028ae54d988esm3629280pjt.48.2023.12.22.05.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 05:51:11 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 1/9] s390x: clean lib/auxinfo.o
Date: Fri, 22 Dec 2023 23:50:40 +1000
Message-ID: <20231222135048.1924672-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231222135048.1924672-1-npiggin@gmail.com>
References: <20231222135048.1924672-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 s390x/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/s390x/Makefile b/s390x/Makefile
index f79fd009..95ef9533 100644
--- a/s390x/Makefile
+++ b/s390x/Makefile
@@ -227,7 +227,7 @@ $(snippet_asmlib): $$(patsubst %.o,%.S,$$@) $(asm-offsets)
 
 
 arch_clean: asm_offsets_clean
-	$(RM) $(TEST_DIR)/*.{o,elf,bin,lds} $(SNIPPET_DIR)/*/*.{o,elf,*bin,*obj,hdr,lds} $(SNIPPET_DIR)/asm/.*.d $(TEST_DIR)/.*.d lib/s390x/.*.d $(comm-key)
+	$(RM) $(TEST_DIR)/*.{o,elf,bin,lds} $(SNIPPET_DIR)/*/*.{o,elf,*bin,*obj,hdr,lds} $(SNIPPET_DIR)/asm/.*.d $(TEST_DIR)/.*.d lib/s390x/.*.d lib/auxinfo.o $(comm-key)
 
 generated-files = $(asm-offsets)
 $(tests:.elf=.o) $(asmlib) $(cflatobjs): $(generated-files)
-- 
2.42.0

