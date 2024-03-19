Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3AB87F8D9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:06:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jvXzeiFt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPRw1Rjnz3vmG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:06:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jvXzeiFt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPK373kLz3dRp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 19:00:07 +1100 (AEDT)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6e67451b084so2921172a34.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835204; x=1711440004; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Een3HCEHuSXtESOmVVoN9fReFwtOgW3Iul9yQ4dmcnU=;
        b=jvXzeiFtgOfTiATeMoxythPpUWmaF/AyhOb+NJSRne4t/vDT4rFtVt/Ny8kAKndj8x
         bI/w3AbvLsNyWWyWnSlMy6749nlU1zZECpsSLNzrns2x5hj4KNXiGiGXwmvDpCkl+1EU
         GsbPGrib4OPhjOspLH9cs6cNz+NTIZmE+AK/cGhHpRR09miPzfuogn9d/eVdFNVZHO/Y
         tHLePtGbxMplz4JeKxWS1+gTFdN9AnpbXv3iF31sBfGs+okBlP8TgmUGtpN7hhxF6SHe
         +AVLKkajGHNrWcSb4mDpuRpMAN5q2EIC+eX9aDfywZgskN63Kd/tAJAH7MC3VcbVKrF1
         X8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835204; x=1711440004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Een3HCEHuSXtESOmVVoN9fReFwtOgW3Iul9yQ4dmcnU=;
        b=aQPFwIEkXB9fTIM9GHszaOjKXLBy2+m5sDRyscVvH2b8VdHLFt8M5afwi1yitZgROx
         xLa226+vKpx4RM4qB67SHJWkHdRkdpvWeSKGb1QHCu2tnUN6DzbT7o54OrMyNJCExtZL
         YPa17Vn2CK3sB7EZv0PnT+JEka4RnbeVbCRaReZGe3MsTW6eBrpYm9eZHWJBvVpnTvlu
         NkCMFbf8aPX/x+6BIHqVzzLN3Wjg+gZo7oV/95uvmm7axqgjTxNDQ+WHZUPEQZ3kSWoz
         RjglUDLqYsnDpUiBjAs4XujO9mbz86I09RU/nbQrV9Wel5JfLjx7HW/QG+6ByqtbTHqZ
         0TYg==
X-Forwarded-Encrypted: i=1; AJvYcCVgi3L42OT8cVAWBlpECmIWExc3Zwtoyt3aw+FxspQApIu2jhE9Cu/Ggt6JLLzhYppNxD9bZOCac2IpICAWkoqK3lklGczyITkaLxidqQ==
X-Gm-Message-State: AOJu0YzL7vpQhMtOKcCjDAzZs8lPWCXsuVORNMnRnDt38Y9QEv/Ykeuv
	/4FGq64R+gnQimAuadUmZh0KhdTtcyf3me8guQ3xP6naWid67cpu4Wl+g19+CYU=
X-Google-Smtp-Source: AGHT+IE6pXL3TbQuF53EpPTbvzqyaweI3wiT6cAyH+5pKuELD5LZX4DmnMUsiZUZa3mX+J/Y3Z8pRQ==
X-Received: by 2002:a05:6870:b6a6:b0:222:342a:10fd with SMTP id cy38-20020a056870b6a600b00222342a10fdmr17760520oab.5.1710835204416;
        Tue, 19 Mar 2024 01:00:04 -0700 (PDT)
Received: from wheely.local0.net (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b006e5c464c0a9sm9121283pff.23.2024.03.19.01.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 01:00:04 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v7 08/35] powerpc: Fix KVM caps on POWER9 hosts
Date: Tue, 19 Mar 2024 17:58:59 +1000
Message-ID: <20240319075926.2422707-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240319075926.2422707-1-npiggin@gmail.com>
References: <20240319075926.2422707-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KVM does not like to run on POWER9 hosts without cap-ccf-assist=off.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/run | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/powerpc/run b/powerpc/run
index e469f1eb3..5cdb94194 100755
--- a/powerpc/run
+++ b/powerpc/run
@@ -24,6 +24,8 @@ M+=",accel=$ACCEL$ACCEL_PROPS"
 
 if [[ "$ACCEL" == "tcg" ]] ; then
 	M+=",cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off"
+elif [[ "$ACCEL" == "kvm" ]] ; then
+	M+=",cap-ccf-assist=off"
 fi
 
 command="$qemu -nodefaults $M -bios $FIRMWARE"
-- 
2.42.0

