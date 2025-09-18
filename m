Return-Path: <linuxppc-dev+bounces-12374-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FCDB85632
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 16:57:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSJdR42L2z30RJ;
	Fri, 19 Sep 2025 00:57:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::34a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758196131;
	cv=none; b=BvdtXPCOMHgxu+eMsem52YgVw5JrY5tpVDBb4gKEA9g7hgPcGkwM9w0icMr7JKMPRVWoT+RmHhu1ZUnCfOaeoEc61Toc9b1WcuIAkBlw6Otbqb3XQhtTAT1fd6BxcSKr4NYhYBGS43joeqmAnY837lotv2JNvCNEXT/cdc0YzSDFULpoyjXQiWvY/jNy8EEOvKgttRFuvCNHaw3VAPdiufyf2YK6L9jAo9YW00bExmFtchkjPDyh7QKrFSR+0YrPe0s6iqRQGpVng+88TLC+yAjq2C9Sa6Gx8SwpMwZ4Rns2SWck7tA9WmMCXV4fKpb20hvVH6sfUrD4iz5qw5zF0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758196131; c=relaxed/relaxed;
	bh=gjTjhC0GXxWOKnWXxPiVFKHc+WCcUAZ7VMt/DJBDKtg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=k0UW3tDRnC35iHZMFecE6Em0LYmLdfs8Cismhqw0m9vMTrajC1tbYLX2AxOD39J0TgTJBuDsiW5FXQJtxdVPOyR4SjYPk+aKIwqCVxSLjLU+DX/Xj40irunbhR2eOFsiHY7wK66uo6MQiqTmGfJoe/J7LwQz4F1tBMj9knoVe1/k2aO0TR+LD39WaEp6iVNI9bmPSRcEo+TzZDuZiQubFzeZcQacEKcPGnX670Bb6kpltFodxV7+gda6hte2gTZ12Q/zlrO24JaBaQNWx1RL4fiQWcg5e5gCdGbbfmpkFHWeXc4rgyz497Y55ffuQWZw0RIe5f2yM27pE6ldFSlAYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=SFCx93Uo; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::34a; helo=mail-wm1-x34a.google.com; envelope-from=3m_hlaackdpocdctpcuiqqing.eqonkpwzrre-fgxnkuvu.q1ncdu.qti@flex--abarnas.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--abarnas.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=SFCx93Uo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--abarnas.bounces.google.com (client-ip=2a00:1450:4864:20::34a; helo=mail-wm1-x34a.google.com; envelope-from=3m_hlaackdpocdctpcuiqqing.eqonkpwzrre-fgxnkuvu.q1ncdu.qti@flex--abarnas.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSDS14lccz2xlR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 21:48:48 +1000 (AEST)
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45f2c41c819so5485555e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 04:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758196124; x=1758800924; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gjTjhC0GXxWOKnWXxPiVFKHc+WCcUAZ7VMt/DJBDKtg=;
        b=SFCx93UotJtENUOIt0m/DnfZCNf9RrfWweSSYNFXQq79/2Rf95ChlgxTdHmnjUykPs
         te3MHup+MCI4KWTJR5Oeie0pq3ugLvHXQd8nc/+JZnIBFXmapvzXNcI2bTiRcvyFip1g
         yKzdMQaThd/5oEvBFsoK52Yxr57EeVRQ+6bBEgGyWZUal1NrfFCMEw7vemgoijry9XMj
         RyhZcYJ3rdxp68fJQwr4qiLJ7ru7cCJEQlIl/v7HxByoInWN7kFmFnFTLKLoNgFZeG5v
         lXq9Sf0E/7y6dTxpF95HRlb6MhhzKaUBPK5FikyMjplLNmmakbDEfI90kRq2zOFfYIWA
         Vy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758196124; x=1758800924;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjTjhC0GXxWOKnWXxPiVFKHc+WCcUAZ7VMt/DJBDKtg=;
        b=Gw+yamoigzps0772I4yPg/0HE1jPheQJJ6KQhGFX4ddlilVQPsX2ub4AeUbjqyGNRI
         dgyMjX5CCc0tn7h8OcLyIPy99b31jMzvgWzrTWejIoAoVxVPDmDpiA5MVXqOsF6h3Fh6
         CYAczTwVcjzvTdPpiHZ+kcdjcQGn0ipNqUJ10iMuvenKILIcdp34iYYQh2hshMTV4LIr
         C3KFcyR5VCa8aw9BoFQ1upb0Ygub8bcljknxtV/oP1wcwXhOJ0aMVBYpKmfdY3jv/Gt7
         PdjpB38q6pPoZv1TVikT6p68RepW68KeXGNr5HKUrBqOBnd30cx43w4BAdM7yKGCcj0F
         TSQA==
X-Forwarded-Encrypted: i=1; AJvYcCV6jHnzSLJ+W2q9BBL11U7GXcvnWqFnkl3Kv1Wyy5/G/UZQrcK1leTPW96zS+icBRkfMzmmFQlfn0veFME=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw2caxPHP7nZGXk0ESXNLL7Sckh5l76SOKNDndi8a4CPNdtDHUE
	xaYP6Ojt6leDo11su7e1szXJ540im4jimiigBJs0IsHORLV4ROc2jwLIpmuiiJtoPkN6oz8C4tT
	lq+t2UDN+jQ==
X-Google-Smtp-Source: AGHT+IEFRqfe/nIo/PJ9WsmrZAu5LFESQ/y9pacPFCfYMGNYUfu2hTf1tc2+XxV1ebQiySb1OZphgejnjUUp
X-Received: from wmmu8.prod.google.com ([2002:a05:600c:c8:b0:45b:890a:14d1])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:350d:b0:45d:d2cd:de36
 with SMTP id 5b1f17b1804b1-46202a0e76emr44220295e9.12.1758196123627; Thu, 18
 Sep 2025 04:48:43 -0700 (PDT)
Date: Thu, 18 Sep 2025 11:48:40 +0000
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
X-Mailer: git-send-email 2.51.0.470.ga7dc726c21-goog
Message-ID: <20250918114840.53581-1-abarnas@google.com>
Subject: [PATCH] arch: powerpc: ps3: Make ps3_system_bus_type const
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Geoff Levand <geoff@infradead.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Because driver core can properly handle constant struct bus_type,
move the ps3_system_bus_type to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 arch/powerpc/platforms/ps3/system-bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/ps3/system-bus.c b/arch/powerpc/platfor=
ms/ps3/system-bus.c
index afbaabf182d0..c5b880c411ef 100644
--- a/arch/powerpc/platforms/ps3/system-bus.c
+++ b/arch/powerpc/platforms/ps3/system-bus.c
@@ -465,7 +465,7 @@ static struct attribute *ps3_system_bus_dev_attrs[] =3D=
 {
 };
 ATTRIBUTE_GROUPS(ps3_system_bus_dev);
=20
-static struct bus_type ps3_system_bus_type =3D {
+static const struct bus_type ps3_system_bus_type =3D {
 	.name =3D "ps3_system_bus",
 	.match =3D ps3_system_bus_match,
 	.uevent =3D ps3_system_bus_uevent,
--=20
2.51.0.470.ga7dc726c21-goog


