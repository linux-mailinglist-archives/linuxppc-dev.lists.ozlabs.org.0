Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D608468B5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 07:59:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l9AerU/x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TR68K2sdgz3cJ0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 17:59:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l9AerU/x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TR66q5nnFz3c89
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Feb 2024 17:58:11 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d93b525959so17393165ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Feb 2024 22:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706857089; x=1707461889; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISYOFWMJ8Ya9qR54XDhg0pvkVFnzxzaLNa6Ru0XuDgY=;
        b=l9AerU/xr1OWSp0mu6ucWntW6+MF8KktYA/1fOehPrA2ELD9Iz0UxEnDcIsVemQWCP
         RKYDHYS8/LjKznzvU6l7NEkHbH1KS/JnhLvYjFKOeoFmS8VT91dCOZBgznzbMz0MBrbh
         uJc6FheW8bVZ3vdbB8siIq+YY3EBNlYgBu7UX3jGuGjLO93ZzeO9ljZaIZZReRJDXh7e
         fiodSHcfA8GTKxKMAiKL+ldCOplKFfp2h+c/2gVcg4NqXROPF8JqRiPF+cC3Ua80oCH9
         o/ClpvLQ58u2+K+bjT4ihS+XBGYpmfB2AexUMNB2JBAnPyofFZ+YRq007N6yIkZ2iIcG
         usvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706857089; x=1707461889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISYOFWMJ8Ya9qR54XDhg0pvkVFnzxzaLNa6Ru0XuDgY=;
        b=cs5jciVJ7LAWFVYbKUfexoz3P2QDmY2pQQ16q+D3+UJgRUtXWXvGhNeqalYymhgEyE
         ykI6OUs1lfPA7j9EvI3J0jG4GQF3CkruEPYv/o5XFPsqUvhQWu2P1DzixHcKaGXBeTwJ
         pVvI8Xa42EWw5tr5VGuHdzOzaetEFMdoAX6nSqPOOnNMJvwvzflKUZDcIbSjH1QQriIg
         K1Cv2mGdfAimdiKxZkZPg8M7msNV6Ad1m2yKiorWpcW8Uszcu2D9ir8TiwwGN+SKYK6m
         iG53O63r7rK8S1+1UEmPRkYq+p6OFU2zRYZKcEiYL9lVaaoCNrXbptPM56tdw7ssCUrT
         S3xQ==
X-Gm-Message-State: AOJu0Yz4lSG2F7Y9WiUVxj8h62V6lXUdCCQTudH3r61/5c4auQvmEmWt
	ZUd1MuhYWBQ+NxZThuGRwYe1H3RIe9MK4RKQiuSZ9yzhQgnFJ+ND
X-Google-Smtp-Source: AGHT+IHuRTzUNEDoBrt5G53jiaYXfJZtXJVA0vZJoFpKTVNkOajG1pLBiy86JSnIBL/sauMLQIgPVg==
X-Received: by 2002:a17:902:c20b:b0:1d9:30e3:ea84 with SMTP id 11-20020a170902c20b00b001d930e3ea84mr1670212pll.2.1706857089045;
        Thu, 01 Feb 2024 22:58:09 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWjZNe27ib/vYkFoWq6/PqYfbalOs5zAPw9skB+ZgcK8jg9IvDXE9J+CmHt9/N5zRNbuarqznq7Q4qopRSOqZX2cn9N8IgrYYggfQalfDEBinpojSGVWOT/EUIfWj16iA7eMjjbF9xT/aeq1KFiH2OriigGgcx/JOmtm/bu/PB4qwkshtB8p/24b9LK/rvjJ41vh1YFLdy13VZGXmTAgSqseL5L2VuWBtBaGkypdBLoRkYX2ODngQHJ1LN7EXIzX/ToWEwUbOsvUzQTdXEd26i5jE2nHMk6k1YUOPq4uEUj3WVbE9EdmpS52VgYk0FqSiry4mg+XLFagmWYk7cJDMr37edC1DZbObWmmZsb5HBPOTFs5UYkR+wZ1f8hF83cM4b28GvJiZm6Irid1eoOsd0ThO6B9s/31Z7jYPgg5YzzBggQrhRnvihG5vRvumkQNDNelKznW16NnTC6/ktXq9qy1yXpuoRkjqKCDvxb68MO3ZFcGim9OZPwXv2fOMaV0AVd1R2NojYBw3M=
Received: from wheely.local0.net ([1.146.53.155])
        by smtp.gmail.com with ESMTPSA id d18-20020a170903209200b001d948adc19fsm905734plc.46.2024.02.01.22.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 22:58:08 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v2 1/9] (arm|powerpc|s390x): Makefile: Fix .aux.o generation
Date: Fri,  2 Feb 2024 16:57:32 +1000
Message-ID: <20240202065740.68643-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240202065740.68643-1-npiggin@gmail.com>
References: <20240202065740.68643-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Using all prerequisites for the source file results in the build
dying on the second time around with:

gcc: fatal error: cannot specify ‘-o’ with ‘-c’, ‘-S’ or ‘-E’ with multiple files

This is due to auxinfo.h becoming a prerequisite after the first
build recorded the dependency.

Use the first prerequisite for this recipe.

Fixes: f2372f2d49135 ("(arm|powerpc|s390x): Makefile: add `%.aux.o` target")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arm/Makefile.common     | 2 +-
 powerpc/Makefile.common | 2 +-
 s390x/Makefile          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arm/Makefile.common b/arm/Makefile.common
index 54cb4a63..c2ee568c 100644
--- a/arm/Makefile.common
+++ b/arm/Makefile.common
@@ -71,7 +71,7 @@ FLATLIBS = $(libcflat) $(LIBFDT_archive) $(libeabi)
 
 ifeq ($(CONFIG_EFI),y)
 %.aux.o: $(SRCDIR)/lib/auxinfo.c
-	$(CC) $(CFLAGS) -c -o $@ $^ \
+	$(CC) $(CFLAGS) -c -o $@ $< \
 		-DPROGNAME=\"$(@:.aux.o=.efi)\" -DAUXFLAGS=$(AUXFLAGS)
 
 %.so: EFI_LDFLAGS += -defsym=EFI_SUBSYSTEM=0xa --no-undefined
diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index 483ff648..eb88398d 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -48,7 +48,7 @@ cflatobjs += lib/powerpc/smp.o
 OBJDIRS += lib/powerpc
 
 %.aux.o: $(SRCDIR)/lib/auxinfo.c
-	$(CC) $(CFLAGS) -c -o $@ $^ -DPROGNAME=\"$(@:.aux.o=.elf)\"
+	$(CC) $(CFLAGS) -c -o $@ $< -DPROGNAME=\"$(@:.aux.o=.elf)\"
 
 FLATLIBS = $(libcflat) $(LIBFDT_archive)
 %.elf: CFLAGS += $(arch_CFLAGS)
diff --git a/s390x/Makefile b/s390x/Makefile
index e64521e0..b72f7578 100644
--- a/s390x/Makefile
+++ b/s390x/Makefile
@@ -177,7 +177,7 @@ lds-autodepend-flags = -MMD -MF $(dir $*).$(notdir $*).d -MT $@
 	$(CPP) $(lds-autodepend-flags) $(CPPFLAGS) -P -C -o $@ $<
 
 %.aux.o: $(SRCDIR)/lib/auxinfo.c
-	$(CC) $(CFLAGS) -c -o $@ $^ -DPROGNAME=\"$(@:.aux.o=.elf)\"
+	$(CC) $(CFLAGS) -c -o $@ $< -DPROGNAME=\"$(@:.aux.o=.elf)\"
 
 .SECONDEXPANSION:
 %.elf: $(FLATLIBS) $(asmlib) $(SRCDIR)/s390x/flat.lds $$(snippets-obj) $$(snippet-hdr-obj) %.o %.aux.o
-- 
2.42.0

