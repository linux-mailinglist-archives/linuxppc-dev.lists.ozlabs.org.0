Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E48A81CB00
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 14:54:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=c/3u3VGz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SxTLS0CFlz3cYg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Dec 2023 00:54:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=c/3u3VGz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SxTH560dtz3cWN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Dec 2023 00:51:29 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-28b82dc11e6so1182366a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 05:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703253087; x=1703857887; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EawXcrWZcj4wjBdULRz+yh78MdJFfpIVMXufen8CLio=;
        b=c/3u3VGzgEj7bwIOumPkapOy3/TqR4W65mgMmy4gc/VcZGklygM5ZHlOG1wn/kEcmU
         ecbnDoSUKl1qZf1RBYlcU3sdesLp6qLf5L5j0sDlp6UJI10altqB/xWGBKih4a7RDtFF
         nKATcX9x/KBDOi8s1CWS828/vBuGf5Umxafu+z+LeuD6kr6yIYKMvbyuekOPFn07rUvy
         StOrynLqqGIBJOLzkqqYqxWm/nQXPczX4jeRA/i+tH4pDlUFg2mCUgOqdv3HJzqA/Pdp
         Pc8PL/78pw8MwX7AzBJu76JtIf7vbwkKa6vzimTYiNY/SBiT5Fsgs8hbUlAvoW5C7qdO
         76jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703253087; x=1703857887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EawXcrWZcj4wjBdULRz+yh78MdJFfpIVMXufen8CLio=;
        b=smNuF9KgR+/fk3Dv/vggsAHa+NzU+YXQgEeP8Bzq6iMRKXOynECO7f3ITaeS0VaMx0
         oQ0D/hCLf0qs/ns4rM9Uq8Dli8avVXgYVd7NNnwnXPOs2Q2uakaRbkN7SfRqfeae+pJq
         ErhOWdiwN3Uv5LlzIM+YxTGOtI/+1WGJy6q9e78QS5vu4fdtfCSsmst1czetafb9bnht
         eVHI2qQQaqtw2nRXa3BlD3noZNqMa8ufbbWP10UZ9tmRZLOAiuatj4yDEABzEEy2T5eV
         o4XbvafLMJKD2hQz6XgDap0HOlfORUP+SdNfG+1biYv5bYrelalfY6taD0+cha6qw1GZ
         Mj3g==
X-Gm-Message-State: AOJu0YxYjELFVTWe6I0sIUY4rOsvTjkPHqU3hLDIyhjFeVmNdbB0l2iA
	JJ0ua2LQWyeO1nx01kwYUPc=
X-Google-Smtp-Source: AGHT+IFxYHMd3mIJhG2htlTQipJ7HFZrRdouAmWJJ2UmxbUBkbfOshxr2F261fmorF3DjDY21EJ+3w==
X-Received: by 2002:a17:90a:158f:b0:28b:bf26:3ba8 with SMTP id m15-20020a17090a158f00b0028bbf263ba8mr829664pja.6.1703253087364;
        Fri, 22 Dec 2023 05:51:27 -0800 (PST)
Received: from wheely.local0.net ([203.220.145.68])
        by smtp.gmail.com with ESMTPSA id n12-20020a17090ac68c00b0028ae54d988esm3629280pjt.48.2023.12.22.05.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 05:51:26 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 3/9] arch-run: Clean up initrd cleanup
Date: Fri, 22 Dec 2023 23:50:42 +1000
Message-ID: <20231222135048.1924672-4-npiggin@gmail.com>
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

