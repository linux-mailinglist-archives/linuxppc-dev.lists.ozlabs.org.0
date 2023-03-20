Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FBD6C0B17
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 08:06:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pg5Pc6mbwz3ccw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 18:06:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gS7qrRrq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gS7qrRrq;
	dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pg5Lj3S0fz3bYW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 18:03:57 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id iw3so11448120plb.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 00:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679295835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIWY2LmAYAKCX0X90e1eTyFfSUAt3YEGtck6kHvirNk=;
        b=gS7qrRrqDq9qaoQtkXcKK7pK215yAtZn8WaF9oNZmAozAsFFIthRfko3R60iN1xLvF
         nSxnb2hTRNoDhYtW4OfnEgEaUQEc4hzOUP0/Wa3RSMWDulBoymhgYS228uVW2Bf0mzZV
         urboUDVMhQ7v+hboL3TjcMqnTnxA2TayOf2aOzpxGbT9+zSW8zo8TIAdicRRHcc/Xwy8
         IlXx1LleYUdU3Tu7rzoO2VDhNWoEdFCT1ix+Ab7uk3cH3zAzLaXUVl1PgrtdD4kJxKpg
         4e/CYZZNCaxbR0ilPDzZFFNMPitKEGtnlOkfGxS7ggi77SS2sMSWMq/QWtKasmuVrX+R
         tmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679295835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dIWY2LmAYAKCX0X90e1eTyFfSUAt3YEGtck6kHvirNk=;
        b=PX4l4FOrFHr24iu3XVdux0h4vQUAvCfSdNNDVocvEmSAYCY3GMop8Us35Kp94DKIba
         SQkU58gNMcu647wdWgieNRbrUFPjg0THO1tnWatb7Q3Ii4oerKuWca5DUaMsAjDL1xoo
         h6GLaRG2aoTtoEuy7EvGVQAdl421lfrrucq2y3cNGkM9ZPqeH4jnGDc250ld2I4SDfFR
         r0gou5riWe8FRF+eUVcUt86SceGmds8tMPqaeCb/pmuPIpgEXs/6ajVw89PZPJLaqrjQ
         dXs5l2Up311JcJxc9GuhGMGTu/Qj4ODyML0R0VFXdKigjOSwTzPO/fkdj1/xwcYqO5Gx
         sXtA==
X-Gm-Message-State: AO0yUKW1bOZ48h3VFDYh7Dx9/L1MvhAzLm39ChXaAdMta2mpHCYHKI4Z
	rZ56FnYYvpqs+hJf3XwMTdo=
X-Google-Smtp-Source: AK7set80VvNHpr7RdDIyXTdK5iNN0SrMj76F2SEmfeacDKttsSBDoOBYBQjHltZXByAun+9uYVs7Uw==
X-Received: by 2002:a05:6a20:cd5d:b0:d5:1863:fe5f with SMTP id hn29-20020a056a20cd5d00b000d51863fe5fmr10506331pzb.2.1679295835154;
        Mon, 20 Mar 2023 00:03:55 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (121-44-69-75.tpgi.com.au. [121.44.69.75])
        by smtp.gmail.com with ESMTPSA id r17-20020a632b11000000b0050f7f783ff0sm1039414pgr.76.2023.03.20.00.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 00:03:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v2 02/10] powerpc: add local variant of SPR test
Date: Mon, 20 Mar 2023 17:03:31 +1000
Message-Id: <20230320070339.915172-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230320070339.915172-1-npiggin@gmail.com>
References: <20230320070339.915172-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds the non-migration variant of the SPR test to the matrix,
which can be simpler to run and debug.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/unittests.cfg | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index 1e74948..3e41598 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -68,5 +68,9 @@ groups = h_cede_tm
 
 [sprs]
 file = sprs.elf
+groups = sprs
+
+[sprs-migration]
+file = sprs.elf
 extra_params = -append '-w'
 groups = migration
-- 
2.37.2

