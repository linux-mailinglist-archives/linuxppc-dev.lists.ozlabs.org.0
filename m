Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 239626EEDF1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 08:03:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5pFZ0MDhz3fRr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 16:03:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=cQk9NUL7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=cQk9NUL7;
	dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5p8q4Kmtz3cdj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 15:59:07 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-63b7096e2e4so5564656b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 22:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682488745; x=1685080745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUY2W+QV+3Sa9ryYHFPiF5vcCLQo2iN6UCM1NmViHb8=;
        b=cQk9NUL75STQb2ICpYeSz4arpeK4i/qfrzQWolhRVk4j+rzZQ/OlD/c0UrAjD45xzr
         Xhi+ahlUPCdnQTGb/Xo3UX0SMGkK2nrInktalw5JMBv2VBCUVPzVsKPd7aDTVsVm3bBb
         piFKNDfhXLk9Aml8OhiHua+xikmvLC8sXFMtBKIvlpFKu78Kwv5E8pKIYX093xdzet5c
         H5vQW0MEdaODQhd//2vCxBwim5qodLwvW+nnX88Z8kO5fHhcuw8FiB1aKm4wc9Nlqryq
         vUGy62ZXIg4DPeYFl9P309WdExX/1D7sMphltlqG106gY4wUEZEpncNO1yASv560hwb1
         0maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682488745; x=1685080745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QUY2W+QV+3Sa9ryYHFPiF5vcCLQo2iN6UCM1NmViHb8=;
        b=TJZXkcIn23cDt3utjSdOUCQ3OX2w8jGvrYlQk/h93+jGod42z2SKQOqDWPS3pDWcTz
         iHiS1cEnGn/NkNgJdwSSlpTw6al7UyP2aPnjIt8ts6zfcs+v9F+GdY9VwvdvOcNPN9L8
         2rmsB4ao56OhapnNM1ShuN9IXviHpyGu35ABWo3sIhFl00hO/eawBJYOA4Pgn8rjbFoL
         H/UbQMb9+qqWGc+aH76gY3RUzaVPOBFsTavIpQKAFnUINUPbiz8EpO3q46POUpWLpGRb
         ZxyTB8mhVLFowjLzuFguM4gtIzA10DzVbf/UmeGDLuTpUdDh1jMKSTVGcfcTxxqqPSlm
         JXeA==
X-Gm-Message-State: AAQBX9fd8h9MHypHBOCRcBGK6PJghkAKbBLBUN4VtdwL62Vz7OlSHfPB
	cQOALj6iqgq1NFnsXn+a7qYOZVwsQ6nkzg==
X-Google-Smtp-Source: AKy350bO6VULi9oAyldNNJKij0nqmobECj2Qd7VVwaYdcckkRYdiBKuE10GsRrkkPJXbxfSaHF4LgQ==
X-Received: by 2002:a05:6a00:2193:b0:62a:63e6:3282 with SMTP id h19-20020a056a00219300b0062a63e63282mr25079037pfi.11.1682488745056;
        Tue, 25 Apr 2023 22:59:05 -0700 (PDT)
Received: from wheely.local0.net ([203.221.203.54])
        by smtp.gmail.com with ESMTPSA id f25-20020aa782d9000000b0063a1e7d7439sm10300479pfn.69.2023.04.25.22.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 22:59:04 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/9] powerpc/boot: Seperate CPP flags from BOOTCFLAGS
Date: Wed, 26 Apr 2023 15:58:41 +1000
Message-Id: <20230426055848.402993-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426055848.402993-1-npiggin@gmail.com>
References: <20230426055848.402993-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add BOOTCPPFLAGS variable for the CPP options required by C and AS.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/boot/Makefile | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 84a5b630c739..bfeb7a9fef9c 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -32,13 +32,15 @@ else
     BOOTAR := $(AR)
 endif
 
+BOOTCPPFLAGS	:= -nostdinc $(LINUXINCLUDE)
+BOOTCPPFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
+
 BOOTCFLAGS    := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		 -fno-strict-aliasing -O2 -msoft-float -mno-altivec -mno-vsx \
 		 $(call cc-option,-mno-prefixed) $(call cc-option,-mno-pcrel) \
 		 $(call cc-option,-mno-mma) \
 		 $(call cc-option,-mno-spe) $(call cc-option,-mspe=no) \
-		 -pipe -fomit-frame-pointer -fno-builtin -fPIC -nostdinc \
-		 $(LINUXINCLUDE)
+		 -pipe -fomit-frame-pointer -fno-builtin -fPIC
 
 ifdef CONFIG_PPC64_BOOT_WRAPPER
 BOOTTARGETFLAGS	:= -m64
@@ -69,15 +71,13 @@ $(obj)/treeboot-iss4xx.o: BOOTTARGETFLAGS += -mcpu=405
 $(obj)/treeboot-currituck.o: BOOTTARGETFLAGS += -mcpu=405
 $(obj)/treeboot-akebono.o: BOOTTARGETFLAGS += -mcpu=405
 
-BOOTCFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
-
 ifdef CONFIG_CPU_BIG_ENDIAN
 BOOTTARGETFLAGS	+= -mbig-endian
 else
 BOOTTARGETFLAGS	+= -mlittle-endian
 endif
 
-BOOTAFLAGS	:= -D__ASSEMBLY__ $(BOOTTARGETFLAGS) $(BOOTCFLAGS) -nostdinc
+BOOTAFLAGS	:= -D__ASSEMBLY__ $(BOOTTARGETFLAGS) $(BOOTCFLAGS)
 
 BOOTARFLAGS	:= -crD
 
@@ -224,10 +224,10 @@ clean-files := $(zlib-) $(zlibheader-) $(zliblinuxheader-) \
 		empty.c zImage.coff.lds zImage.ps3.lds zImage.lds
 
 quiet_cmd_bootcc = BOOTCC  $@
-      cmd_bootcc = $(BOOTCC) -Wp,-MD,$(depfile) $(BOOTCFLAGS) -c -o $@ $<
+      cmd_bootcc = $(BOOTCC) -Wp,-MD,$(depfile) $(BOOTCPPFLAGS) $(BOOTCFLAGS) -c -o $@ $<
 
 quiet_cmd_bootas = BOOTAS  $@
-      cmd_bootas = $(BOOTCC) -Wp,-MD,$(depfile) $(BOOTAFLAGS) -c -o $@ $<
+      cmd_bootas = $(BOOTCC) -Wp,-MD,$(depfile) $(BOOTCPPFLAGS) $(BOOTAFLAGS) -c -o $@ $<
 
 quiet_cmd_bootar = BOOTAR  $@
       cmd_bootar = $(BOOTAR) $(BOOTARFLAGS) $@.$$$$ $(real-prereqs); mv $@.$$$$ $@
-- 
2.40.0

