Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A50AE6DB8DA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 06:29:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ptj1x3B5Rz3cLf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 14:29:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=D346j511;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=D346j511;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ptj160RGlz3bWC
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Apr 2023 14:28:57 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id ke16so411163plb.6
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Apr 2023 21:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680928134; x=1683520134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q50aU1v6yjni7d2uLBSPz0XLaQn4jFeo7juuh25KIlk=;
        b=D346j511kmV4uIsEYEHYKYzgQU7tQrEz3CZQcMGr5l8SIVoTeAf/gpe3D1uFIw2PKP
         vGA0tHjKOwn1joM0tzf2WVbZY5Ws5zn1yMvE6ioyLKE+nlTt3e0FDVERFc188cJIENRV
         Z2+cyaVxYODfFGPM5XDHqedZRA5yhqXRbkOb7UhVRSIBgqKwORMk5rrbNde7WUgbnak3
         tDqYfn4Jxv9/9QWix9CwZODQsLpFg0BIESgHKXTSQdLX5140Dcc2/rC7/RsRU/yCbZVY
         aQC7mAvFWbVj0IJlOBhIy/bDF7NyUdUudNeX/0e9BlxPGPfYB7zujUgYBeGtR/ZJS+H4
         NaBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680928134; x=1683520134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q50aU1v6yjni7d2uLBSPz0XLaQn4jFeo7juuh25KIlk=;
        b=7Wzy23ui9h4JfNHsPFgsUGuki6KLGX+zAg+yaSi0Ac0S3lQkby7UwJW8YcJpKiGW+4
         sPZ1i5/ZvGA0aWzpv9fcgGAhA3ZCRv7JNLz5fNLFJKtu1gqvTmfQ8KLsB5veuKN4Vrix
         VuAhpYLdI6TThZeD6cAGfcOCXJ+QVn6NVyePYywo/O/JFpOzn2mEAkjWFt9PDrg88dVI
         lWenyimc7rHMf67KZS16/Se8kxiXGHNGh18XoPEmhejvecs/LnLdjeS7Bi+su8gn2IUc
         7C5eXbpB/y2/rTlcVrF7z/YS0VWi9V0YQocDJS6uu5yajVQxASPXUYDoi1acWF70z95f
         s10Q==
X-Gm-Message-State: AAQBX9fEN6eO2TCioluAGHxJmhl7fvFvMdv9XI7jmg//o0mBrBsNiyY8
	QzIyCDpa45Y3/DVSS5bPEMOIkjyK4M8J/A==
X-Google-Smtp-Source: AKy350a1u9griyJsoa3KV6NO+pUKkZAdm+QMoh4e0wi7WtqRMyrKKgb1g3Fg10L6Ab7AgDVaQ87lTg==
X-Received: by 2002:a17:902:f547:b0:1a0:6721:6cdb with SMTP id h7-20020a170902f54700b001a067216cdbmr1050013plf.40.1680928133895;
        Fri, 07 Apr 2023 21:28:53 -0700 (PDT)
Received: from wheely.local0.net ([203.59.189.25])
        by smtp.gmail.com with ESMTPSA id k16-20020a170902761000b0019aa8149cc9sm3658915pll.35.2023.04.07.21.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 21:28:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH] KVM: PPC: Update MAINTAINERS
Date: Sat,  8 Apr 2023 14:28:39 +1000
Message-Id: <20230408042839.869361-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael is maintaining KVM PPC with the powerpc tree at the moment,
just doesn't necessarily have time to be across all of KVM. But I
think that's okay, from mechanics of how patches flow upstream he is
maintainer. And it probably makes a bit more sense to people who need
to look at the MAINTAINERS file if we have some contacts there.

So add mpe as KVM PPC maintainer and I am a reviewer. Split out the
subarchs that don't get much attention.

Thanks,
Nick
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90abe83c02f3..c6283280683e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11292,8 +11292,15 @@ F:	arch/mips/include/uapi/asm/kvm*
 F:	arch/mips/kvm/
 
 KERNEL VIRTUAL MACHINE FOR POWERPC (KVM/powerpc)
+M:	Michael Ellerman <mpe@ellerman.id.au>
+R:	Nicholas Piggin <npiggin@gmail.com>
 L:	linuxppc-dev@lists.ozlabs.org
+L:	kvm@vger.kernel.org
+S:	Maintained (Book3S 64-bit HV)
+S:	Odd fixes (Book3S 64-bit PR)
+S:	Orphan (Book3E and 32-bit)
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
+S:	Maintained
 F:	arch/powerpc/include/asm/kvm*
 F:	arch/powerpc/include/uapi/asm/kvm*
 F:	arch/powerpc/kernel/kvm*
-- 
2.40.0

