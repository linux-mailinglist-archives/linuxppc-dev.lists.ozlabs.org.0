Return-Path: <linuxppc-dev+bounces-12369-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA751B855EA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 16:53:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSJY92dqLz2yGM;
	Fri, 19 Sep 2025 00:53:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::34a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758205000;
	cv=none; b=XbAEoFyoMPvOsV/OwWUFcQda2sf+ehHP+HjzzJkZCWs1CQaQzgNc7Ve8iaN7e5CBxPMUEY2bq6F7osuiNZsl/OtTIi721kp00E9Bo1ViSSXQHgueL2VcF/hsZIprt+ZNyZTWPNVZSyKyRNRPYmoyU9h70hXUzEjjnKa+Agd/A2alQUdvuE7mahK4+7QHUJhG/jAw+12So7/vMLPcN2mAuIVXOQyEx3l2W4ijgHf4pPu/4DcckjEZ5Ky27TMs/iSap56oLX/sWwnO20uWjja5r8KyedeBDV7pgPxAih/efNDyQyqDIy9QlUO1eiyLzWzUxpiQkSxjFrv06LzNalfLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758205000; c=relaxed/relaxed;
	bh=4VpmXSIu+qpJvsDpO1PV+NUaPdBqqdiEw/vU8U+iM14=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LvFeDlwBb2kpAL9Sh31Dx5Wk8+hvJQl9H4Huukn3QDj0oB/+Iqy9WRiw9ggFwTVZjfUR8f0SBJuzohHE67Z0K4Uqvoekyr1Caye5qeHxfdm4oy4sIr0bHxO4RzTV+eNMecUAFP0DsCnLa4dEyC4YHrMUROEdKGnZS/Qjuap2CRDIb4LMTvFsip//1WRewxW4GNkTvDJ3me8DM03t/YSx87fXGt8vCjI9fgAi7dmOADuPZGNdHw3/3K3mualbv3k/QkQjEQRXeexhdtC+9i2MOjEwRo8fvhGFrRf2AJBqezQjl+Dk6UcfA4e/VgpPYEfiqdN0y9MZRlaILSUroA3dsA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=K1Q+b1cU; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::34a; helo=mail-wm1-x34a.google.com; envelope-from=3rbtmaackdoklmlcyldrzzrwp.nzxwtyfiaan-opgwtded.zkwlmd.zcr@flex--abarnas.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--abarnas.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=K1Q+b1cU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--abarnas.bounces.google.com (client-ip=2a00:1450:4864:20::34a; helo=mail-wm1-x34a.google.com; envelope-from=3rbtmaackdoklmlcyldrzzrwp.nzxwtyfiaan-opgwtded.zkwlmd.zcr@flex--abarnas.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSHkb37Qnz2xnh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 00:16:38 +1000 (AEST)
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45b98de0e34so10505025e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 07:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204996; x=1758809796; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4VpmXSIu+qpJvsDpO1PV+NUaPdBqqdiEw/vU8U+iM14=;
        b=K1Q+b1cUyKomKYEgP4MacM+YcIffEPeWnL7D/2Kl19yhMYOGdYYV5nKyrshWa7ZgtU
         KQAQcbn57r/KO9WKIYnYr3ctBCQdZZQ6HeJevi4cNXpkRtO9+ZGvHVrmKPPrCNnNIZOs
         CkscWBFVmvnXhUpIcf/cwg1FHc6t/TWyY2blm7Wg3yWo/MZZBq67lzxgELVv9QMj4UsG
         gUrmXI4cH3IA3WxxF0HxduBJNKhlGJVsEPoK99i3OgkcHw1+LMZ+caTYXtEmCkVLRlOz
         fWNU8ieuJp9dARnf7OuueMs19AxqA1Y53SsxT/e7U21PU1hSIBc3UTIATZBHXFxNktEb
         17/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204996; x=1758809796;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4VpmXSIu+qpJvsDpO1PV+NUaPdBqqdiEw/vU8U+iM14=;
        b=qoyqqfrrvx0rY0OQRTfNx3DPZzloZ1zVicdLz3FYlylpP5nE9zP8t6+P830FrM6Mw7
         sOMfjHEgM8QQ+x0yfHpJ0hYfNoUs4a6110S5mvUNp2/XWGoqt1v/0aGZ6mfaGQH/GR0+
         GtV8b5BbZmthIXZCJxKePcARP5d5uxsZjqAKANN9OoezRojZE4alnoxvj9kU5S3WrWYY
         24woul3ObcygE+1ofMLjWVmpLEOjSA3AzvX94SEHgnHu+PuAe2hTq0XIWN/tqYVvbJta
         9WlPbe/+EwGYyB4gz+0ACIpTtgjHS6Gb7DfkA7o/LBgEzsG8Xf32CGEHWU7hS/SssBoX
         DtdA==
X-Forwarded-Encrypted: i=1; AJvYcCXUY8hAOX38fc5Psx0NEVWm5i8w/0bba+iHOQGT9l+Ez9mZKNg8PDHxBs3FJZ20xOHu3sSqfhcm0mkKYqg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywy/r3bzucJsH4H1l8el1uorSs7C9YCeguKq2gkIy9PoITcu2bh
	BPUjnhzknsrfERy9uZ4ye8NX/b5ouW2oNomci8sT7+jRUjl8BolMyzW9atv+O15epxWUacSJdbI
	ncgIon+IIcg==
X-Google-Smtp-Source: AGHT+IFG/CG36IeKleqVuSqLctsPfpA2xFgjVVKw4opNjMh9ri6iTo2cGwDFZ3VXvHE8Jmqqc1cSa0C77UST
X-Received: from wmoi20.prod.google.com ([2002:a05:600c:4814:b0:459:d8e5:ae9d])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e93:b0:45f:2d21:cb36
 with SMTP id 5b1f17b1804b1-462074c576amr50115025e9.35.1758204996093; Thu, 18
 Sep 2025 07:16:36 -0700 (PDT)
Date: Thu, 18 Sep 2025 14:16:33 +0000
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
Message-ID: <20250918141633.339803-1-abarnas@google.com>
Subject: [PATCH] powerpc: cell: make spu_subsys const
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
move the spu_subsys to be a constant structure as well, placing it into
read-only memory which can not be modified at runtime.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 arch/powerpc/platforms/cell/spu_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/cell/spu_base.c b/arch/powerpc/platform=
s/cell/spu_base.c
index 2c07387201d0..733b512992c0 100644
--- a/arch/powerpc/platforms/cell/spu_base.c
+++ b/arch/powerpc/platforms/cell/spu_base.c
@@ -464,7 +464,7 @@ void spu_init_channels(struct spu *spu)
 }
 EXPORT_SYMBOL_GPL(spu_init_channels);
=20
-static struct bus_type spu_subsys =3D {
+static const struct bus_type spu_subsys =3D {
 	.name =3D "spu",
 	.dev_name =3D "spu",
 };
--=20
2.51.0.470.ga7dc726c21-goog


