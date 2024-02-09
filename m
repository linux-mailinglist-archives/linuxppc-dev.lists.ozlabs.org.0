Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C03E084F096
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 08:04:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VoP2ytoP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWPwN4t9tz3dT6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 18:04:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VoP2ytoP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWPtH0bX0z3cQT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 18:02:14 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1da0cd9c0e5so5128585ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Feb 2024 23:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707462132; x=1708066932; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZWJe/FfY+0lZ+B78melC7fte3uc1Gnzj5kPj86WV+c=;
        b=VoP2ytoPOk1XNZb/bG4pN1OxlzpDiZO/rnrdV9dDE1r/H6cfPDt6NoBgZGxEpdi0Kz
         QQMstRbXjGoptICCYf5d9m8AZBAts9+tC/KNpvn6FHQC4dXyrjYgpjHmf4VewEQkGkBX
         4sGxd/LPzG75QiTYcjr1vKqE4iBdVB5jZh37xmRzN5DE1VBdvz6gTmNDcjV19UF9nb7N
         hK1bdfHGKb0CPzgSfDJIQm1KYuxLTr2AdT3i0H1o0v0kVTopAGP3QrZ7bP3A7dG0She3
         CoiWxb9Btz27TkZz5LToCINMdbgZdHqC8YRdjTYXwK6jVnAqSaAINUXI08nRrJViLUv7
         MVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707462132; x=1708066932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZWJe/FfY+0lZ+B78melC7fte3uc1Gnzj5kPj86WV+c=;
        b=D3zZksRofEeKBRO+pyMpU13uUcGyL/+ur35lShbF8zFevyh63OYJttimiK186ImWso
         cEjCF7BCiem/sINQio+LiPQ12NpsfuPyEQCLun2KpauoKhVVnSa27zKC07JyLeoabAkY
         qpnTlAyJJXwRO4DZj2RflrOErE1Z6uAEkwGlj73Xx8cmAxj+OrkGHK9xeGS+QPy6ucCv
         tyhtnCXm41v73DK8FSHWDQvKu2ByT5urjA+9WdpLpdJFPLuViBbx008Ua0yONyZqktrF
         2r23rj3xDK3ibYfO6OJ0WbD2GmMS3nx0tXAqsRep3pu9LbYXMezVKYH3riT9oJg+Ncpx
         pOSw==
X-Gm-Message-State: AOJu0YzRRdTdVnFcnjk8To9qbkDNn1lKfGZYmzbyUFte4r6LLHpxw4nS
	HbZVL0Wdv9rOS/WILT1D//UInevEF3wqOLamPX6q4Z+GUycJ/HmL
X-Google-Smtp-Source: AGHT+IHOeahmko/f+RwAZAHEJWia2rOHYMfGMz4gCsHP+DywjdnF57Ty4tjhGRk1+lg6vAvd2PgMDA==
X-Received: by 2002:a17:903:22cb:b0:1d9:efc7:1c4e with SMTP id y11-20020a17090322cb00b001d9efc71c4emr251590plg.6.1707462132399;
        Thu, 08 Feb 2024 23:02:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUjW0aiDCaCLLFfVUVr5+bjGqa7mzeF+p3ViNkQqbgtcj0Il6d+i/6lELOrZwAv2VLO/QuGkDOmTrZv2VMUIMsKQgyI4X6EJsrbFOqX3EwTBCt77J+G785rbh7UEFgzoGo0MeZTvVYFPZD7/1PJ01abi+YorczJW6k6akDxzxMXt9g2gLdOpy3QIpkuiqBIzAePfI7P128W0t4bkitbTsDbBr98gnEpsMuMgQjuH3Si8ur0dF4cnkyVF7dvAjGhMkLgFQmtXBD6lNkbOeef8ggdt/eBtk2c1xZjUn0zCW6G0TMxpZ+4JWMsZF63nPB1q8lKpmVddNx821u3QU0boOD2tlS8wYCQA3O9JUIEQCCb6Qnpm08pHAbnTmgBswHd5imYUiTh9O2eDynpgwF0mNiaOsqavbRC6Jul2MLacr+aprWRyUDanMygM30mw97u0KHVMszGF2zkWJ9/DGlFbxg4mH+LAJXvpwXsmpY+KkbPjxFdxOPeMt3Fc2yK1BQrEDsG6HaRcQ++jE20RCJF/GmJiLzdCsPsWr8F+BeQeiIe7Yj2y2RZ956a
Received: from wheely.local0.net ([1.146.102.26])
        by smtp.gmail.com with ESMTPSA id r10-20020a170903410a00b001d7284b9461sm839285pld.128.2024.02.08.23.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 23:02:11 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v3 2/8] arch-run: Clean up initrd cleanup
Date: Fri,  9 Feb 2024 17:01:35 +1000
Message-ID: <20240209070141.421569-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240209070141.421569-1-npiggin@gmail.com>
References: <20240209070141.421569-1-npiggin@gmail.com>
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
index 11d47a85..1e903e83 100644
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
+		unset KVM_UNIT_TESTS_ENV_OLD
+	fi
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

