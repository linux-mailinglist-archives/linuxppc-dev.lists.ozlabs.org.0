Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3902F85CEC6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 04:30:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eyEBSh03;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfhcT19FZz3vXF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 14:30:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eyEBSh03;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfhZF6KMmz3cDT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 14:28:37 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5ce9555d42eso111314a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 19:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708486115; x=1709090915; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FLaKcAirk3CTYgyOfE+aKJ+UIKz3IbgFgbToFNpwyg=;
        b=eyEBSh03tJltdIF2eWKx/AkUtbY/8hh4apEpDRQhDeFLUXQ8Vr5PLBkJc9gUWD3h2g
         q2yvl4t0zQMTCqzaIOV/SKe7XUy72Bt9qri70Mibki7WydrW22eYvxFdaR/c1d1t5PEa
         KCfjIqsL/xdUrfYi1kZUbHOC+gyRuyDJgJSylzg8jvrBZovJWB0EPA7RjeIO4DThdECc
         iDhkthHlq98Zgs1MXYbX7mD+P1JqfkSfrfO2JRVKto2/dqhyG13tu+yRYaBifNafa6wc
         nYGdY6lLUyR1oTGtrpnx1PRuPGWj97s+TfWdNK1FqcT727xqQLakEznumYMOAv/LKewu
         1Pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486115; x=1709090915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5FLaKcAirk3CTYgyOfE+aKJ+UIKz3IbgFgbToFNpwyg=;
        b=fPEMkgMES6dd2U1qZD+S67Pb4g2r5qt20kv1D4CkR2BoGqD9eixOtWwr6P97mpVyCQ
         ucguIQ0Z+mmbF93gFin7JH/61Mv8Elb+JQoH2LH6+WAOPwV2mkiNjAQ84WeQ/Nt+nrYI
         /93/4RhbVvmy/SyuK5hJ2btqmNEpIWUYZSEFLe/WVCbFv0tsunTdIJ0GQSkeVOJwLnqw
         MBlrRSIxQ+j6YjPg7Hj1Nc8uJ0ihGpfxhEoyNHZyXWA1aQFqWX2QDyrR9Q40RuuIwa9W
         BK2h+CME3WqK9pQsoNUyc7LPMe5sWxL4KygoNxKUxFOSsjvMrB/tu5Ux70+bnXsutnt1
         89sA==
X-Forwarded-Encrypted: i=1; AJvYcCVO1yxZpmmPgFXRz2DL4TyLC2ZIKPe8YNpzOFnKzVFvWT1xJxs/pDwo03Xkehdm8dxwKgloHK5N0BXu11Y+ZjhfZ0phuZ6i6qheSILyOw==
X-Gm-Message-State: AOJu0YzoiohYfNiYNS8Fkh8z7e6YmLcl3XQpHrXRH4O36HmGCZ9AxlMb
	Il4bQOB3HtebDaiTKzRQIr7/fgJClZ2Hm9dmm4gctGNBb8w9f5ak
X-Google-Smtp-Source: AGHT+IG+5kUDxEEdP+IqiK5SZK+gSM7uxbwCRRCoyT5fAJOZNRoAtH8MrNNdmRsQBrctGqSWy5fX0Q==
X-Received: by 2002:a05:6a20:d498:b0:1a0:7e2f:ad44 with SMTP id im24-20020a056a20d49800b001a07e2fad44mr19469432pzb.31.1708486114991;
        Tue, 20 Feb 2024 19:28:34 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id q7-20020a170902b10700b001dc214f7353sm1246457plr.249.2024.02.20.19.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 19:28:34 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v5 2/8] arch-run: Clean up initrd cleanup
Date: Wed, 21 Feb 2024 13:27:51 +1000
Message-ID: <20240221032757.454524-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240221032757.454524-1-npiggin@gmail.com>
References: <20240221032757.454524-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rather than put a big script into the trap handler, have it call
a function.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index 11d47a85c..c1dd67abe 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -269,10 +269,21 @@ search_qemu_binary ()
 	export PATH=$save_path
 }
 
+initrd_cleanup ()
+{
+	rm -f $KVM_UNIT_TESTS_ENV
+	if [ "$KVM_UNIT_TESTS_ENV_OLD" ]; then
+		export KVM_UNIT_TESTS_ENV="$KVM_UNIT_TESTS_ENV_OLD"
+	else
+		unset KVM_UNIT_TESTS_ENV
+	fi
+	unset KVM_UNIT_TESTS_ENV_OLD
+}
+
 initrd_create ()
 {
 	if [ "$ENVIRON_DEFAULT" = "yes" ]; then
-		trap_exit_push 'rm -f $KVM_UNIT_TESTS_ENV; [ "$KVM_UNIT_TESTS_ENV_OLD" ] && export KVM_UNIT_TESTS_ENV="$KVM_UNIT_TESTS_ENV_OLD" || unset KVM_UNIT_TESTS_ENV; unset KVM_UNIT_TESTS_ENV_OLD'
+		trap_exit_push 'initrd_cleanup'
 		[ -f "$KVM_UNIT_TESTS_ENV" ] && export KVM_UNIT_TESTS_ENV_OLD="$KVM_UNIT_TESTS_ENV"
 		export KVM_UNIT_TESTS_ENV=$(mktemp)
 		env_params
-- 
2.42.0

