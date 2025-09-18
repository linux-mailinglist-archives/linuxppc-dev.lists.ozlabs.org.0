Return-Path: <linuxppc-dev+bounces-12371-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A34B85602
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 16:54:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSJZ84Jdwz30QJ;
	Fri, 19 Sep 2025 00:54:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::549"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758204506;
	cv=none; b=N73vqNBKc+Y4HmvxQ/zipwweTqAbRIysLkuVUxZVQvnMooFNHMyRBWKYCES3i9zEaOOREgDTBySP/8jiwPI4gw987khPPwk6XAXBEW+P00/2EFg/PTcb0IZVEXk0PVhF87HwtpNOPkwDDmwjtlQeS7KiiiUsvzR3Mhch/C6gt7R2zK5aU8wTDU0fT82HwC1N5GZQlHEj6UIO97bUn0nccAexSNjd48Nr7XtNfHJQtFJ406bs/D+FaRkE1Rq5YDqSBqbDO3kQzGKmYKnhKzEPP3qRHB9598tdd6QWWcNivFTXBPFv+dM5P1+SB72/Ad7UBfqDg7YPlRMOfpahi2YycA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758204506; c=relaxed/relaxed;
	bh=DgRqLSSOT3PxiLx5xxJiQMGC6CiLApOU4Ty9j4Na8zg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=i4smtE/qaritNwtj1RnSsKyq960Rhe+wWjkwgWwzI1yurkTlVUgtymdn3wpweMsy7lNjDWHQTinyN/zfnk7jwCDJeVVT0Jus9qPlXxAi7H4QkjqLJvUoqyvXXaDtjVLS88prHYZgxb70zaTRAaRB5EbW9WRFlejEkGbWIFXJTqX359YA8QFnBkBHXqGREaesdJGT/2pubEaIIap+hL4lNNCT8iyRvlUwARR4ju1Ts/xwPZ9xMCb5U0F1uW/5pyOztk+ZifvhM+lIhlPJlBp4M42JYfKY1TujXstMdEotZxc4+3IGDOZipg5yo3v2YsksJIEtJiz7mqixV96X087uqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=yNpld7X5; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::549; helo=mail-ed1-x549.google.com; envelope-from=3vrlmaackdpyyzyplyqemmejc.amkjglsvnna-bctjgqrq.mxjyzq.mpe@flex--abarnas.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--abarnas.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=yNpld7X5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--abarnas.bounces.google.com (client-ip=2a00:1450:4864:20::549; helo=mail-ed1-x549.google.com; envelope-from=3vrlmaackdpyyzyplyqemmejc.amkjglsvnna-bctjgqrq.mxjyzq.mpe@flex--abarnas.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x549.google.com (mail-ed1-x549.google.com [IPv6:2a00:1450:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSHY52lLxz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 00:08:25 +1000 (AEST)
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-62806a204d9so1004408a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 07:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204502; x=1758809302; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DgRqLSSOT3PxiLx5xxJiQMGC6CiLApOU4Ty9j4Na8zg=;
        b=yNpld7X5yYftzFOtgiRnsH26ndkMGSulqzPNhb1UJGYWFOCQUMXcAkxee0CCxNNZzc
         NzoKSBXIuOmqZnmAG2j5FJw24Lxk6kJ4It7rWkIuTvWu3dwq+7fqGT4GVy7aqItZL807
         DxgIZX5m4wdvVp/p8xFotTJ6W8gtByvJEd6F6P9rMwoa8lrMHLLgkoew4C8e5KQCdBeO
         Wf41IZwDub/I11LGqijR5FBK8Pt/ASSqSKCyI6bKF+ttCDkHCSPVjch8vWEBXKyyeee1
         uHDKoKygAGBpfOTF1vaGgKD6QXJT35/14zTGeto0DCBeK/dVvasCJffbFMJ4VlA1i5sA
         2IpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204502; x=1758809302;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DgRqLSSOT3PxiLx5xxJiQMGC6CiLApOU4Ty9j4Na8zg=;
        b=Co71SvC3i3OEDR1vXqCaBxXkV4jaY1T77v7Im6usVQafW+LaTTwSqNi47srD/QR4UX
         akaEunz0jQkFrx3X3xMvYZYO/lME7/4r1tirRiBbbURVpM+BnYzst1i1cYVc8QddD1yF
         Tmy6ZDqb3U+Yjo0vXla6gwYcuJg81hCpgnjUxFP/2iqpC+cEn5hsqVxy/LV5PXzhqpjR
         C03ncavInTfe8hz2s4Lpx4ttAzR9YqnQm7gzT5qoBoA1FhQly1DPfFJnIGTjwAPnIS9R
         h8Rit6WlNTSz4xeDmYb6gH4kpiJk6uIpCTe9eGMZyhn4NJanM7ClZHDOLF62WxsPyQ7c
         G6Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWbbzD1ZJsTDZQ5yFIrXOnSh7pdP1R9y9Q+KBQviZtoqHpZVWmVhGalVWa8/BfqyQlNKmq3aLQRFn7OM/k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzk1CA+CBtsrP6vlwUpWlQuphw0y/wgxn+E7SEmc+WVaeEgXYlx
	VK7D4Sr7HCMXd+vnCZ85xV17XVjfzUKt03GfWoD1o7DpD3qtEXG+w/INsYfixlnPDbo8MnPaHhn
	FJADbfqizNA==
X-Google-Smtp-Source: AGHT+IHPVGSdrE8o17sF95aDg0BJq+Gm5S9XjEdsZl4DGTYeID7CtPhrC3cVgG3JYaHRggbIvqDrfyHMNHxp
X-Received: from edt23.prod.google.com ([2002:a05:6402:4557:b0:62b:a7ca:c421])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:848:b0:629:7973:e8b1
 with SMTP id 4fb4d7f45d1cf-62f83c32c0fmr5545831a12.7.1758204501828; Thu, 18
 Sep 2025 07:08:21 -0700 (PDT)
Date: Thu, 18 Sep 2025 14:08:16 +0000
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
Message-ID: <20250918140816.335916-3-abarnas@google.com>
Subject: [PATCH 2/2] powerpc: pseries: make cmm_subsys const
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
move the cmm_subsys to be a constant structure as well, placing it into
read-only memory which can not be modified at runtime.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 arch/powerpc/platforms/pseries/cmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/=
pseries/cmm.c
index 5e0a718d1be7..913642647fe9 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -375,7 +375,7 @@ static struct device_attribute *cmm_attrs[] =3D {
 static DEVICE_ULONG_ATTR(simulate_loan_target_kb, 0644,
 			 simulate_loan_target_kb);
=20
-static struct bus_type cmm_subsys =3D {
+static const struct bus_type cmm_subsys =3D {
 	.name =3D "cmm",
 	.dev_name =3D "cmm",
 };
--=20
2.51.0.470.ga7dc726c21-goog


