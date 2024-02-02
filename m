Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA778468C5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 08:01:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X1m3l87e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TR6B61D3kz3cjm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 18:01:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X1m3l87e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TR6791PxCz3cG0
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Feb 2024 17:58:29 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d95d67ff45so8672015ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Feb 2024 22:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706857106; x=1707461906; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EawXcrWZcj4wjBdULRz+yh78MdJFfpIVMXufen8CLio=;
        b=X1m3l87eS1iRxXm3JzIh/3FMF4VdMC/muyKhe/0M9EZhDE5pnSacRvFjIx+femKHNZ
         a8ECnwo6iRFwVe41y/P1EnqmSA6b1yIF7kQqi4uortR80mn+6CmoTUDTK2d+xa7q4aFr
         27En0S76N6ff8QwP27SfSJCtJPKQ+l3wJ69psk9mc0QgVtVQgvGGwPQmjYJ5nLrsj+K/
         L01F0po2VmvcA+niyOMdvMUlfhYFCNJOb6bxFAmCPqJFSXYLk5i2ekI/oYS47VMJackx
         XiZvmYb2CDwMvwYFDt8d5mWk3yNzodL7/QGgEVcI/caQKK6oeESbJhaWwlY9d5iqbY7z
         rbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706857106; x=1707461906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EawXcrWZcj4wjBdULRz+yh78MdJFfpIVMXufen8CLio=;
        b=qvbyrrywNr/kkkMSZ170jJuL+w4w0i6Q2r7Uhe4ma16hGeBFBRt2GqcDuS5fllJ9aI
         FDDTJqexc074cEvfySoiQ94WEai+GFr4HFYUam2L7fBGDTkWe90iLomaDv064SyEA4B3
         23SrVX5hPisWXhcXqGcsjo8rcc8njyoR+cn7tbh9BV4IbbZZJyygfPs/zaVAVM/b1n6d
         9DZUYiBIrkNSRAukc2BoAWSJT1I7/hu687GINUGSeDZ/w6XyTZ/85ULRA0hR2I+ywPzt
         yWrEEVCTwB2miDAQs27av32v+vbaNvsv/87q2wJnO5Yk2sxGnV0boVJMwSWrFqMhtWz5
         cBiQ==
X-Gm-Message-State: AOJu0YyFOUpc0H8KbtphYWoL+z8pNb/HenFSLdOxMyMugrAMKWM6K4zr
	uLb1KHKaov5037rUWVaU966FiZ8sh1fDt8yffZpB+5NLt8UH7rBU
X-Google-Smtp-Source: AGHT+IGl/XMjvd9Klgg2/FWxCwJMxKc63HwstNQDO2ClYm/78uC2k5jJZCUW+UiCZN8A2rtA+7mFiQ==
X-Received: by 2002:a17:903:445:b0:1d9:5ef2:abdd with SMTP id iw5-20020a170903044500b001d95ef2abddmr1116146plb.0.1706857106567;
        Thu, 01 Feb 2024 22:58:26 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW/IOgMZYUZthoBpoNRMf/oli+krs0I7QalTXQLhmUUWWhn4KTEGdDr/tD4cxALPr5YanOFmAHpezVtwao2TQzO+RlJR3Ey/l7/3QH/K3g+wJhke1+8D7EBboNPM5WoqME9ClFM8Tb2qCEIYjo+bDj+JytizB/Z/HHC2r1N33PYMUgH67boLyOHJbDw9bZpjApoN82XPi+TIHolN046l5iX1K13QrymhO+WP1rEnsSa9hFW05dJESbK9n9XsLx0/+71n2h46K26UvtQ2Tvhi4CxxSgx61auRLuHt8a4ivXCW09clAuX2orO6qQmVgmRP6m0MuduJ7wcFMpF4m/Yyx8XgB+x2QC4G9sG0uUxRP61DypLkLC/HukTiuGgrKuWO8070olj+6YNjeeQFlx6mz0z7Ta+qF2P+x5aggZgJT35GSJypgDz0pyEIOTAPK75Tgu99P65NQ0dXD3u4iLw7/cZe08vmV/GqS8qWhRhxtJKwMQsq18X2q834tfjJ55jslSnq+Pu+viz/94=
Received: from wheely.local0.net ([1.146.53.155])
        by smtp.gmail.com with ESMTPSA id d18-20020a170903209200b001d948adc19fsm905734plc.46.2024.02.01.22.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 22:58:26 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v2 3/9] arch-run: Clean up initrd cleanup
Date: Fri,  2 Feb 2024 16:57:34 +1000
Message-ID: <20240202065740.68643-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240202065740.68643-1-npiggin@gmail.com>
References: <20240202065740.68643-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
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

