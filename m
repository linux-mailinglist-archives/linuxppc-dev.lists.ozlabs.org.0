Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C891E84F215
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 10:14:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hpBk81/m;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWSpL51xwz3cTp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 20:14:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hpBk81/m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWSm353PBz3cSM
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 20:12:03 +1100 (AEDT)
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-363da712713so2073795ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Feb 2024 01:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707469920; x=1708074720; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yS+ul2b/NpaGNmT4nHQYQeP0IrroORjWUgFq1DiJtuk=;
        b=hpBk81/mMBAUM5/kkvqy6rDsyoO062XORQ28qyYHn3sClrX3zLfrHxPJ8L0WEsOblz
         9PiczM2xJ6SF+UgD6z3WDGsAfNnKa2/iYC7WClPUxMvtgAUyGOLk1bXUUySZGS9xjtrt
         JUzKqitQfKpsb5us704D6pHM4/yBSDSKEiNGyVaZaJPnXhdnqwas6KfMGhy9FBbhcvLk
         zi2AeidZUH0kDJtZRtZGU1/jxK0gpQ0RIsHhL7ffEcWQPv2Sd5lISGUvtJOtOR9mYpQi
         DDPNowPQ587YKr1/7CRz9SKEoYHEfsAMwodKo9LF1vdhX48ch3fucEUgoXi5vgGXR4Bu
         vIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707469920; x=1708074720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yS+ul2b/NpaGNmT4nHQYQeP0IrroORjWUgFq1DiJtuk=;
        b=WRUPuYfC//0h+qviUH4/LYXEnPrkOC5MrdAkpRDiOGz/Y6ndC+FTEHSbaawfTKwGy6
         fYZvsP9xg6BRCracBdtd2r73GT4tgB08wwxgGWjtMhlznrqkwWusvZ0XaozbcvhyXeeW
         V45+6Ri+POxpMQOhvNzUg/aCYe+PnkO+0RrK8obWnclMgJ3TPzhExMsr2+Vx20WRKf9U
         ngmSfcjuJVJOU/zWyVZ4E8VF3c+yvuviOprboomYPI3WAlYnN4/52Ynwb/fm+iAtalzz
         RZ5oaATuQkIU2pioPaUNYQ+pvTp7YKtG7p0PoB1Dup1vdezFrbir0cv7AuxzPoaudkmt
         jzZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXke4tzsnsT5+NhMVdg5DQ6jN5na/VqeExi1NLMtq4KDjtDo+37lpJtEvfJ6nej1B0AvcLiWUhMsCYdZt+tkLGZYvXkSXX+LC0PuPEWsw==
X-Gm-Message-State: AOJu0YycbhdBlr8CC940dj9rBkiTMfUErlijQ8TBuXcC1rO33ZZfdViq
	9PTWA8zcbbT9anP9VS4q/KZweXPC+CWcnj/DQxdEZQ6OckZZgol7
X-Google-Smtp-Source: AGHT+IFRG49LrsMALjwaw/QQGV3P6t7iqzINaidenzf+7nkJ/oR5JUoQayo972KhNecT03FbRR4u3A==
X-Received: by 2002:a05:6e02:12a6:b0:363:c5c9:deb4 with SMTP id f6-20020a056e0212a600b00363c5c9deb4mr1134765ilr.14.1707469920181;
        Fri, 09 Feb 2024 01:12:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWDopPltMDOD/Zc+PObLBIP1nne3PAHsVM6zRZWO1HpORlibOckT/gTcQ19PG5LdBYjTnCRcjHTqOD87qjEXIJ1Cw7vJKBTxRxvlbtduv1eAO8QEC3zvdE/JG45h1/hySgdnu4sHEuXGV6jdeujTVLoH6eqLOSPODhCWZI/0SPP3ZkdBudUiSkYqEz1CH99b0O99Nhv5N9EuQELW/E6kWEb6PyvGtdAXrgaVAXE/TeAkLARmmyO0zgbKZglUUiiDGXR28i7Prujn5UHTgY96rYxQNCAhONw7ZbmBCGszMHcWZlZ2hqwhT/hzy/4gSW65TNy5kHI8BBZUl11FY31xxTtnsGu5DOcr/0dGsTqplINJ0f00gj+4/Qf/JWNCKfUWmeheIRgqAZM/KeBUcgdkSTFXIItBmlR7IQSTajuDXKUEEqzQJANuFk2VqKEAoJ+hJhIzPltXqVq2CgQBb28tG4SNO6NsoSINmz0faIh18GbVw52Y1je6CsC9xx/zd8vtsYtwnRkF9tDoHCe77ZgebF4irBc+bEu3Iq91jwtK3kjmKiFN6wxQBWX
Received: from wheely.local0.net ([118.208.150.76])
        by smtp.gmail.com with ESMTPSA id cb1-20020a056a02070100b005c1ce3c960bsm1101742pgb.50.2024.02.09.01.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 01:11:59 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v4 2/8] arch-run: Clean up initrd cleanup
Date: Fri,  9 Feb 2024 19:11:28 +1000
Message-ID: <20240209091134.600228-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240209091134.600228-1-npiggin@gmail.com>
References: <20240209091134.600228-1-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index 11d47a85..c1dd67ab 100644
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

