Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1204B815991
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 14:48:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Dbn+Up77;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsnVw5LKnz3vkC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 00:48:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Dbn+Up77;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnNy014Mz3cJW
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:43:45 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3b9ef61b6b8so1359607b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734223; x=1703339023; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JpfFN7ncIBGdqptU1/FlLtsZ9ai1Z65NxzA1SGKGTcY=;
        b=Dbn+Up77UL7j1+btFKwjKd0N2gxSOYOLtumFE/53Jtxr+fQFOiABMVTM5lg1500SVq
         Med7YHyTPH6Q5Ea5P/dtR7AcjLbwoMwWh4yhm24RXFOJU6X38xzcQoSHDdrVORV+9euD
         w/GhwJyVVnYjyD6gQn5X9D31VE02KQ+D/S+QeOw4cVEAmj4Kq/hxMJ3cd1qj17lpKcUq
         /sghQ/3Nfg5V5mr0cIGGYxCQ9oBqQ5x9VvPhJpakq47/Rg2QYyf3KEGW+qthcqceBdQ/
         v5CpxUeEhMLe69F0BNYIZDJEo+eeGXtUVtFwPD3t1CPvPPIgeX0x2gEeZSoPgH0Nz2js
         1OOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734223; x=1703339023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JpfFN7ncIBGdqptU1/FlLtsZ9ai1Z65NxzA1SGKGTcY=;
        b=WRTcIxW7m6vUpFmnWgqutKr5VXNSgn9HhMCCHhuokOOlfrEFlHut+mmzoU9w5yCo8j
         HNPl/8RgqibN2vhz/SNSrmEWGWKxYufOjF4AmfT4zA++cjeqcYA0EfumLu/64d3GgrN3
         CG6fOSYrvw5u3Ym2SrlDt3oqQpZ9h/ghVCJ+0w02/Ev8JSbRjBWsIkwKtCUba2bm9NPP
         /6ywP8iSL8s7wNsil22g4RdI9mLa2OQSqyMQLDN8sNg9Q8vL87wHflp2b68wuYagKAEs
         jCgW8rTuZ1bj06m5H8/T0EiuKig/59TRRbeKNOONfVQnkLd9zVimmwUsBbqJtsw7qtGX
         r8oQ==
X-Gm-Message-State: AOJu0YwwLYjtfkdKMy8XUWyWiukJoIho5iKA4Psfr2te/tdzYNup2mAK
	0e4aaCGOidbselPRNBqkNys=
X-Google-Smtp-Source: AGHT+IEkJDNpkM5EzOkYJcQ3oxV5ZV3nPBZfSSeW1HAIQIfme0McmXAezwp9oz3Ir5CrRRUmZSL72A==
X-Received: by 2002:a05:6808:384f:b0:3ba:175:f190 with SMTP id ej15-20020a056808384f00b003ba0175f190mr21493280oib.53.1702734222737;
        Sat, 16 Dec 2023 05:43:42 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:43:42 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 06/29] powerpc: Quiet QEMU TCG pseries capability warnings
Date: Sat, 16 Dec 2023 23:42:33 +1000
Message-ID: <20231216134257.1743345-7-npiggin@gmail.com>
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

Quieten this console spam.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/run | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/powerpc/run b/powerpc/run
index b353169f..e469f1eb 100755
--- a/powerpc/run
+++ b/powerpc/run
@@ -21,6 +21,11 @@ fi
 
 M='-machine pseries'
 M+=",accel=$ACCEL$ACCEL_PROPS"
+
+if [[ "$ACCEL" == "tcg" ]] ; then
+	M+=",cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off"
+fi
+
 command="$qemu -nodefaults $M -bios $FIRMWARE"
 command+=" -display none -serial stdio -kernel"
 command="$(migration_cmd) $(timeout_cmd) $command"
-- 
2.42.0

