Return-Path: <linuxppc-dev+bounces-1640-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F816988409
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2024 14:18:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFTyT35nBz3bZ6;
	Fri, 27 Sep 2024 22:18:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727430745;
	cv=none; b=NICDQZFMR72xePCxJEq94kqzdCh7JxqJpNK1UPtT+GAZz1QTRH9R5+Dh2rwAG6IwBZ6Gwee40UXWyftNRS/foXKzNDh/vBsGaD1bsy6wAfBi5hc7Vi5LA0cY0uCaywCle4PW4gsdjAHtWiLmsnleqFQDgpv+MuRlYpt2JveODsw2cJzJYY5xNvHOyZtBszosTQ9v4/EfrBd8jgPBcclavDzJQfisI9s3qrJtDkQK0e1BDjdg6L6ASgImzBj0JvyTpmgB8tObGuHlveB5tSlWZ4QorPvPR7QlRTv4dSkRlCYH3YZv/4LAusWw85ZDDPvE3x5VDh28rR1ZA9YVFfLRPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727430745; c=relaxed/relaxed;
	bh=376iBOeZUuX7OjmvgZ+CVlpPHnHLOYHzUjijev9CODQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GfzTPAtlQvoug8D7GjHrijmbpSuK2g83OT+y7+Ve5X5HgFHJYHspvSdhxN/peOZYJfkfGFAJzlUcmg6ybzWRQUP1W4dVHdkRzDOcgyoSD6k1zswH/RIkeH4/GmAcjO3vSCo7yZM+6kTagVj2r2qALq8L6SFFRbtTDg5VGGyDD3r8jGWRO5e330Cflj2VLQQK6JORjbmcFt7dIFeS/uPotdvzTLFR1kSK+zOJ9cKR2BfvqnSSaxAC3oqzUtwZ9p/XsX2Au+egJtRqhBBH+6nv+cjTZWWl0bXcNRWvof5to0re9ndA3UWu8ibzVAnPXLmFhVVLjEuZNaHpt3TwDdsj6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b5V7HQnC; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CgwX9D91; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=lbulwahn@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b5V7HQnC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CgwX9D91;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=lbulwahn@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFQk04B5Vz304B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 19:52:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727430737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=376iBOeZUuX7OjmvgZ+CVlpPHnHLOYHzUjijev9CODQ=;
	b=b5V7HQnCeDjfnOKXiQLy8qIjfbsAKggxWxYtblwoneCV5Sln+HZiJBCzXp4xLfMV6E1Auy
	NPjDfH01bsLdfniFjlN5nnXXx6Co4PsILjb4/QjNLky/JsyllB2sHeLnyR5AD/5TKNYlv2
	34wr9Zrk+ZnhHfNdQeNI1hh5zjxv0ZQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727430738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=376iBOeZUuX7OjmvgZ+CVlpPHnHLOYHzUjijev9CODQ=;
	b=CgwX9D91TC0Z2UUzmk+BWMqLi1rD9SDrg39JmY0WBdDNSBolqMygydo2GKYJG1P58CIeZ7
	X9I/2ggtyrHyz2nRoUUjI+tGgj38CFvkZKhN2ibHAmLkeGVPeX0C36Sejk2ZOMWDBZhYq0
	iX5vV2zxb4I6thEdMOpfamI+YudG4bM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-UCBA234rP8-EEXMX1QVTSg-1; Fri, 27 Sep 2024 05:52:15 -0400
X-MC-Unique: UCBA234rP8-EEXMX1QVTSg-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7acdd745756so356132585a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 02:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727430735; x=1728035535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=376iBOeZUuX7OjmvgZ+CVlpPHnHLOYHzUjijev9CODQ=;
        b=KI0CaePBaCQB90JcgKVHKQYostdv7yXeTkKGJi1X+Qu0ssxjEph0wKTSXh6T1ZFtI9
         hX813cOfUJ1W4DEk0BdiBnA+5Hs6csMYAgcn1mVJoe0Q0iv5NwqRrRzWX0OTXmCA5PHr
         Do6/RP9flVDNgTdb1SvblTEFVpQv37wWeunN5nPJDo/qF0NDJsxUg/BnERvteR4Ug7NI
         cvf6xM0L5sjvHA1NbSyws9z52S+XRCspF562I4ZOyDarZxrdBYBbxjW3Hfw6zj+Z2G8M
         eF2Z6XOik4xRHVne0N7eTO0ImjVMOO+9XiVf2ARQP2dZNu3hiRVu2eqjmZh8yeD3+NmM
         B4sA==
X-Forwarded-Encrypted: i=1; AJvYcCUjT6aXRWTNjxRyNzKG+pkOq/bq3Xt6ma1jMWe8bfhX5s/rJ6wgSo99XNPo1wE3wyAi7FY28SWw7E43nns=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzVjb0pvFBt4cfqv0c4a3d18klRb5hnecoTckB4uwmcyLNIMzqZ
	RamuPqkVfvkuP9lARDYfp0xOlNxegUgXUg7MXrmzLvWC9hwAiE7Qr/mPNqpzOCkEVJ2gnZI3GDe
	5eTMtbSLqXAJn/zN8epfgykrtaxX56YqX0ylXHGAKcvFIF7z5TN1sSxINMQ+dqpM=
X-Received: by 2002:a05:620a:3196:b0:7a9:9ec7:63d1 with SMTP id af79cd13be357-7ae3782e3b3mr378552885a.18.1727430735017;
        Fri, 27 Sep 2024 02:52:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcRCGQ3J5pp0phB8xmBJPL/cN9jReho1pvo3oym0cfHErzgl2Eu/dJWBypCa1n5PpNPoUe3w==
X-Received: by 2002:a05:620a:3196:b0:7a9:9ec7:63d1 with SMTP id af79cd13be357-7ae3782e3b3mr378549485a.18.1727430734574;
        Fri, 27 Sep 2024 02:52:14 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae377d5db7sm69557385a.28.2024.09.27.02.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 02:52:13 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Scott Wood <oss@buserror.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Paul Gortmaker <paul.gortmaker@windriver.com>,
	linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] powerpc: remove dead config options for MPC85xx platform support
Date: Fri, 27 Sep 2024 11:52:03 +0200
Message-ID: <20240927095203.392365-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.46.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 384e338a9187 ("powerpc: drop MPC8540_ADS and MPC8560_ADS platform
support") and commit b751ed04bc5e ("powerpc: drop MPC85xx_CDS platform
support") removes the platform support for MPC8540_ADS, MPC8560_ADS and
MPC85xx_CDS in the source tree, but misses to remove the config options in
the Kconfig file. Hence, these three config options are without any effect
since then.

Drop these three dead config options.

Fixes: 384e338a9187 ("powerpc: drop MPC8540_ADS and MPC8560_ADS platform support")
Fixes: b751ed04bc5e ("powerpc: drop MPC85xx_CDS platform support")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/powerpc/platforms/85xx/Kconfig | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/Kconfig b/arch/powerpc/platforms/85xx/Kconfig
index 9315a3b69d6d..604c1b4b6d45 100644
--- a/arch/powerpc/platforms/85xx/Kconfig
+++ b/arch/powerpc/platforms/85xx/Kconfig
@@ -40,27 +40,6 @@ config BSC9132_QDS
 	  and dual StarCore SC3850 DSP cores.
 	  Manufacturer : Freescale Semiconductor, Inc
 
-config MPC8540_ADS
-	bool "Freescale MPC8540 ADS"
-	select DEFAULT_UIMAGE
-	help
-	  This option enables support for the MPC 8540 ADS board
-
-config MPC8560_ADS
-	bool "Freescale MPC8560 ADS"
-	select DEFAULT_UIMAGE
-	select CPM2
-	help
-	  This option enables support for the MPC 8560 ADS board
-
-config MPC85xx_CDS
-	bool "Freescale MPC85xx CDS"
-	select DEFAULT_UIMAGE
-	select PPC_I8259
-	select HAVE_RAPIDIO
-	help
-	  This option enables support for the MPC85xx CDS board
-
 config MPC85xx_MDS
 	bool "Freescale MPC8568 MDS / MPC8569 MDS / P1021 MDS"
 	select DEFAULT_UIMAGE
-- 
2.46.1


