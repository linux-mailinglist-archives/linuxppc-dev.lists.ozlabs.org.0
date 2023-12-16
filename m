Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7D381598C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 14:46:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F2oQsink;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsnSF6ck4z3dLH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 00:46:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F2oQsink;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnNl57sbz3bx1
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:43:35 +1100 (AEDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1f060e059a3so1277512fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734207; x=1703339007; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EawXcrWZcj4wjBdULRz+yh78MdJFfpIVMXufen8CLio=;
        b=F2oQsinkQ6qbUeonFsLkf83Abj4xwE1iGhKWCEY/B+SsoRDeKJyJJ/jNEFIzQpj23L
         PJyhmQ4PtKAphaThzza1ZXtVN+m5hE4uh3m0kQD/ZKjc1GTDSIVYhf5fwsSG2JsP2MoJ
         Q5RIrWN/qQQ7Wu+UbvzpZXRNbBL5RAFFrQkiVThmt/yq9BCi8+61y4v1p2rPQiXzLsle
         V+Cj+/nQepsA0zFxJyvcytrOM7DTiPO/2A8Ol1yEVNBmZkrtHZjagHnmL/8vlc15cFCp
         2HibYa6QOFJSUIUGfSmzW8LKuHXm3vXme0lvNZVks2vggRBRVsRERe46LUzKuh9pXo96
         w3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734207; x=1703339007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EawXcrWZcj4wjBdULRz+yh78MdJFfpIVMXufen8CLio=;
        b=fUQaz3szlXhZsXYRlyw5wzM/kaDWq6igPDvXQdZcByY3844M8sSNGbIsfahwT3HRWi
         zrYK1kgEC0b1k98wu+eG3+TtVXV1QbrmF3J2b7enG9oRqH8339uTl/v3iA6uKwiN4egO
         H7RyIsSHcRFZbeGAbtng9M69XLLLC6vgNVTep7Umn5mP2sP3rvf0zXiuqvWNWFrDFZhG
         dbEfXXkep2G9ELcNV8wmk0cw+mVbvKmfpJCKagib5eg0WMGfJzoXO7usaD9Tvq2YbI2P
         ISD8diI9slkzOJ5BGT2XB4EG9fmi9+SFgyI8apr0pxROBPs0pC/V2CB4+UFEAiZvvG2s
         LE+Q==
X-Gm-Message-State: AOJu0YwqNVy0gpvWEmN02TaEdkWNOy73/qrU8vaMwM2A7Gb4qgpBkN4L
	piH3WZTz0dvhGh89FIP7wMs=
X-Google-Smtp-Source: AGHT+IEU9zGI2gfEYPclbe2FjAKlC/SIgONOnT1Zp9UynRcy6B6WBDpTyRY1h43A8d+uXhZfJbB1VA==
X-Received: by 2002:a05:6870:55d3:b0:203:83cd:c18c with SMTP id qk19-20020a05687055d300b0020383cdc18cmr1949251oac.40.1702734206762;
        Sat, 16 Dec 2023 05:43:26 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:43:26 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 02/29] arch-run: Clean up initrd cleanup
Date: Sat, 16 Dec 2023 23:42:29 +1000
Message-ID: <20231216134257.1743345-3-npiggin@gmail.com>
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

Rather than put a big script into the trap handler, have it call
a function.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index f22ead6f..cc7da7c5 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -271,10 +271,20 @@ search_qemu_binary ()
 	export PATH=$save_path
 }
 
+initrd_cleanup ()
+{
+	if [ "$KVM_UNIT_TESTS_ENV_OLD" ]; then
+		export KVM_UNIT_TESTS_ENV="$KVM_UNIT_TESTS_ENV_OLD"
+	else
+		unset KVM_UNIT_TESTS_ENV
+		unset KVM_UNIT_TESTS_ENV_OLD
+	fi
+}
+
 initrd_create ()
 {
 	if [ "$ENVIRON_DEFAULT" = "yes" ]; then
-		trap_exit_push 'rm -f $KVM_UNIT_TESTS_ENV; [ "$KVM_UNIT_TESTS_ENV_OLD" ] && export KVM_UNIT_TESTS_ENV="$KVM_UNIT_TESTS_ENV_OLD" || unset KVM_UNIT_TESTS_ENV; unset KVM_UNIT_TESTS_ENV_OLD'
+		trap_exit_push 'rm -f $KVM_UNIT_TESTS_ENV; initrd_cleanup'
 		[ -f "$KVM_UNIT_TESTS_ENV" ] && export KVM_UNIT_TESTS_ENV_OLD="$KVM_UNIT_TESTS_ENV"
 		export KVM_UNIT_TESTS_ENV=$(mktemp)
 		env_params
-- 
2.42.0

