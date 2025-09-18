Return-Path: <linuxppc-dev+bounces-12370-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66539B855FC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 16:54:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSJYt2qqhz2yqR;
	Fri, 19 Sep 2025 00:54:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::34a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758204507;
	cv=none; b=WGs9JwdrgvhJwumpqre7vTN8N2KgdsclfqaowW6Qn48+rzZYtZhvnyI9D5uCMmkpWD0kqu/sIcAdvzUNVRTu5fW+GMKAEN6GpUx8aKyuSi9sezPY4IjFga+WB9FuQob4YU4/bmbL3XYj42O7tiFpLK1T3QAnCHcXQHf409qoUaGmo5HQIF1k9LLUXw+nup2qU2N4HFUVnHtOovUtPjQyuf+dNkbHUA0IOXkoz6ASnEC14i7lB2kaxwvuNYjyRBXIsFCz7u20/UslGOmtrAou+OIlSRDOGuLThY02T2lrQEpHWZo5rfZ/7W9TQ3BYHOcRyM/qGRODv7LT7M75X4PIwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758204507; c=relaxed/relaxed;
	bh=QUFEtRr9W91r6F85WMRrAmbGHvzTF7sa9TKGHakTKgA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KJa4FjgFH9mkTUQ5IsjQs/iR/s3glCpCSQuiboePhV0HTXRx2+R+5/Gx4wDo642JZ7ZuNzUChI6OJk3Zs9gMdIMHrJiRZ+5jDzQn7ZG68kSKWnZPxATje5esMVPkOmGdYSBoz39AMMJTWZbWamaVIMx63wBrCIGoqBJguCM0eo39vBBhGjfCgti9CjJXxSHhnqa48+6NLWwR1yv4rxqP33Jb6igBI7Ar9AHvuXF0Rkm/ur7/EGUrg9Gic7ZEMwldGOt2nDg+4PAYbReypgrFyq/yZZDpLGDseBoZUkbCiR05PPTuQK5f202F4N9eBBNTa5bFSDZPskyFHkQRclWGdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=gToa+1tc; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::34a; helo=mail-wm1-x34a.google.com; envelope-from=3vblmaackdpuxyxokxpdlldib.zljifkrummz-absifpqp.lwixyp.lod@flex--abarnas.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--abarnas.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=gToa+1tc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--abarnas.bounces.google.com (client-ip=2a00:1450:4864:20::34a; helo=mail-wm1-x34a.google.com; envelope-from=3vblmaackdpuxyxokxpdlldib.zljifkrummz-absifpqp.lwixyp.lod@flex--abarnas.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSHY46VhVz2xnr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 00:08:24 +1000 (AEST)
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45f2f15003aso6534975e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 07:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204500; x=1758809300; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QUFEtRr9W91r6F85WMRrAmbGHvzTF7sa9TKGHakTKgA=;
        b=gToa+1tc+9sLSklR4NTEjXQetuf16PGD7Gt+YuOjG1lT3sMlXG7siNkK1dE5fIIvMG
         jFSs0h3iIrFbECbKjzfvSlUjdpCqfOB6It1fDl3z5IzZ01HEkSmd5R4uzGEDuTgVSYr1
         orcjHPqMXlR4zWQsrXOXJBunYL6OPNtP0th1B9vEf6bxRyOicPJ8pVTdpG/Eh50M0ADT
         JJv0M1mWAqjngA+th3cZBL5iM1mvfFU40UgSQ11RCe44yA4uToWk1fEYQANbsF3FDSta
         HyVbyWsr62CAYl/dd5sbmzVVpE3FYu46eSW15Ozi5UXM58Cf9FTkjhekY4O7unLqd5XO
         BQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204500; x=1758809300;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QUFEtRr9W91r6F85WMRrAmbGHvzTF7sa9TKGHakTKgA=;
        b=w4g+6MAdtc6aLCmSQQDDsNoLSvNwE5li0TqSRQEMGAdvSRDapdwKvQL11EMa1vLlWA
         eyrXoK9Yh7IR/F0O+mQF207updOoqHojrXW6XluEsrj9RMCurmbAKRmF9JkrpQkSf4st
         EGOvchwnzFvK251f+jl1k4fUFtTx11SN5we8QPt78MeRe7prwBRqufgf6EmKzZncXWMw
         bF3BdgEsGT10b/GdmOrQlhz/BNqmRA2JPxIMLgGbMYZHoMLGWxzwjrNZXUeXQZghkCnF
         iH/gbxhlbe2gaD1xrC14POIgWSWdtSSI9Q8f9XPfiKY8mcb1B0w++sU32yDNVz7/YTpP
         KOxA==
X-Forwarded-Encrypted: i=1; AJvYcCUDy5FulYjFv17XQHhCfhCGCb+jq2YHJZNsB8j+Q24sM0me7J0vU4XynXMaTDIhNBN2R8JHbT332uYkngQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw2e+vVP9QrvPaY6SmivkF3tGne6iF3c2blFBFIVJXQbCVGZOLR
	SzGAQ3RsuwiXQBD+v+qSXlHAdZaOR0qusAj2xHI79JXwFwjG4Y8aZpECAX3dpQLzvj6BExFJfka
	iJLJonXMnNA==
X-Google-Smtp-Source: AGHT+IGZDVm+OjJD6pDYCr4LcAR30jCSUr9yC+URoZtgIUA/r6LEJ5AHEpAIi6hdDt5PyOcQbxPbX0y6XYv6
X-Received: from wmqe13.prod.google.com ([2002:a05:600c:4e4d:b0:45c:b618:4985])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4487:b0:465:a51d:ab
 with SMTP id 5b1f17b1804b1-465a51d15d3mr17853305e9.15.1758204500688; Thu, 18
 Sep 2025 07:08:20 -0700 (PDT)
Date: Thu, 18 Sep 2025 14:08:15 +0000
In-Reply-To: <20250918140816.335916-1-abarnas@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
References: <20250918140816.335916-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.470.ga7dc726c21-goog
Message-ID: <20250918140816.335916-2-abarnas@google.com>
Subject: [PATCH 1/2] powerpc: pseries: make suspend_subsys const
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Because driver core can properly handle constant struct bus_type,
move the suspend_subsys to be a constant structure as well, placing it into
read-only memory which can not be modified at runtime.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 arch/powerpc/platforms/pseries/suspend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/suspend.c b/arch/powerpc/platfo=
rms/pseries/suspend.c
index 382003dfdb9a..c51db63d3e88 100644
--- a/arch/powerpc/platforms/pseries/suspend.c
+++ b/arch/powerpc/platforms/pseries/suspend.c
@@ -126,7 +126,7 @@ static ssize_t show_hibernate(struct device *dev,
=20
 static DEVICE_ATTR(hibernate, 0644, show_hibernate, store_hibernate);
=20
-static struct bus_type suspend_subsys =3D {
+static const struct bus_type suspend_subsys =3D {
 	.name =3D "power",
 	.dev_name =3D "power",
 };
--=20
2.51.0.470.ga7dc726c21-goog


