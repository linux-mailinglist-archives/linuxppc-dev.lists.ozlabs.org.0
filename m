Return-Path: <linuxppc-dev+bounces-4911-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 533DAA077B4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 14:38:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTQpx62htz3bXH;
	Fri, 10 Jan 2025 00:38:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736429913;
	cv=none; b=g+FHV/LsRaj2pPb1IGqdPLQUpVu7TQqLxnK6QwewUuNhEa83x3nJ6sFj1minzVec/el42S4GMN+yiA8jZkdAxs+GQUDoCCx7GuC7DnyIW8kuO1FuSNEUE5tesd3qpFYm3QCWh5+fpoKJ5BTGqul4jDMyMzsITJFK9gYFQyeuLCWmc1gUugETaz40K27Vkdu2t8MJ23UryljviON37dPewvhRux2XW5WWeKJ3OVtrG8Kgbr6uEQ3Z2ivxN0ZmQHd51Nlj2WRDL2adyn95f5dWFUJ3niWz1DtqtNKsc1Vmync0qTDMzL70SZJToQIU5jOmuizTbQEJGLbekNsAMzZVAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736429913; c=relaxed/relaxed;
	bh=+qIG/0LvnjXMgyU8eqBX8hgYV7UmJPw6Xa2UEwpxHJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=GjZZO0tGgGre2B9MWnK/K9co/m4mXU8NJKLnUD3oYiBL4rgvUbkV7DjQXumfZUUTGZmlFuWH26hwcyMOZw0ybm/MK7fFzrp7khvJ6cQ0RcK392piEUb0YmE+UBQOHgcVm/6se22pDUBx1+65QBeRilJeUostnDQTU2PLfi5GoK9X0sNj/vr2XjMiPW/lHRh0W4Q1fKqMWK4CsD3IOVb9W1neKS8Is0UuemNXXynDzvp8Dx6mzJvbA9Y3H6Zznhctm1RQf6dOOG3Lml2ssHqY1ynqZLaOs+zEhAmu8Vadu/ZupMbw8p9+8HFWb2RZ6ErFrq77cWHLXpJl5/xSiXZK9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hWStQvYz; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hWStQvYz; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hWStQvYz;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hWStQvYz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTQpw2RF3z3bWP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 00:38:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736429905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+qIG/0LvnjXMgyU8eqBX8hgYV7UmJPw6Xa2UEwpxHJA=;
	b=hWStQvYzQLOm0ON9nJJDWMAvd34plyYfpnF+7JVYE8HxwZbIDwyvG3uxst+H8Z4C7PlUuy
	q7Z0hnot79fmv+4doC4AO2CundLTFeh6EJcythPRWCQNdXFScyF0vDOgFSFEOQVUPwl4Dk
	4DMls4QP1lSomgkThYPwHIP+PhAg04Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736429905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+qIG/0LvnjXMgyU8eqBX8hgYV7UmJPw6Xa2UEwpxHJA=;
	b=hWStQvYzQLOm0ON9nJJDWMAvd34plyYfpnF+7JVYE8HxwZbIDwyvG3uxst+H8Z4C7PlUuy
	q7Z0hnot79fmv+4doC4AO2CundLTFeh6EJcythPRWCQNdXFScyF0vDOgFSFEOQVUPwl4Dk
	4DMls4QP1lSomgkThYPwHIP+PhAg04Q=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-a4HE2fEjPhaXIsIOtGFsFA-1; Thu, 09 Jan 2025 08:38:24 -0500
X-MC-Unique: a4HE2fEjPhaXIsIOtGFsFA-1
X-Mimecast-MFC-AGG-ID: a4HE2fEjPhaXIsIOtGFsFA
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa66bc3b46dso77375166b.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jan 2025 05:38:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736429903; x=1737034703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+qIG/0LvnjXMgyU8eqBX8hgYV7UmJPw6Xa2UEwpxHJA=;
        b=KI1PTg/Qd6GYkxdQSaNc7s9esa9ugSEHz6qjr4FnczNpkE69MOBr0IidBKrz/1cy0x
         YbsT5R/U7IUvVkyQ3NF3bIJhNJQtvngMVKqW7KXPPG/YAuU1uEF8Sw/1INpmw6YYI5q1
         +zLdjH6LhngN6U3SU3kaTgvkeoC3bn/PsFG6AB8AR6mtP7TyHI1/4dzXX0MQEr/tikpy
         UQXMnQyjhWFDGP8qbG49V6aI/bvjZjxGJIRl1zKuEg8ly4ixRMS1ie3h/8JkY3+Lyou7
         XC9v9YdaT2g2GNC8hNDg5rvjn1lCYhsdF2co8J9AXHG/8U8KEPoLBiHTaDp7epXjZfSP
         nnLA==
X-Forwarded-Encrypted: i=1; AJvYcCWtYN7WxSsEd+V2BAcTzmEx5Rd4jcKBsp/m2YEL3oHO8Dl0ggBKv9N4fOeZUYUdXPOunn14KjgAnKs1UUY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyP7uRzRZ51Gl+2p/2nAhYPNEBdRvbbJs3jtdWHlSeU/zMjm2kX
	baZW7LkVMQ7rld8HjnvILoxKtsYGO7UAL0JcntRI1MM6mQsrQOLesd5vXl/FxIDHTjnbN5Ht1Yg
	aDzm05eIMQIPxE1XgTpF6GhkEOh7F3wk0krpxXFylSGOVgY7899bIslW7+sVc5+0=
X-Gm-Gg: ASbGnct6G+Hlt4U1km8C+n4QuQkczljlmx197aU9SleX5g2rQ+qO80PXSir2voaaOyX
	tXla/zf1NjsUMKknXOki+O3v1rgnRv7vJePr3urFiHzjDHohGgBCRudlEAvGKwSiSCRYB5m3T1H
	K9geMhYFvUxcWhxj2RDWxJ2TgycfyQRdpyNQBe9AoAQUZRyvW3tUsXCeC2LJmlx/YwmbA6AwrL9
	QItdv2CcpSQ+x4JsBm/IH3rrE/i/o5MzSYkmPB1eO30WamTaw/qX2b3ODTi
X-Received: by 2002:a05:6402:3549:b0:5d0:e73c:b7f0 with SMTP id 4fb4d7f45d1cf-5d972e70945mr15040457a12.28.1736429902456;
        Thu, 09 Jan 2025 05:38:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsGUykWSOpesU6tHxPGZnO3JxPfRRnO6klBd/fYEFfPEHAwQWWT0oVTu7t2r5Sxoacsy+c3Q==
X-Received: by 2002:a05:6402:3549:b0:5d0:e73c:b7f0 with SMTP id 4fb4d7f45d1cf-5d972e70945mr15040371a12.28.1736429901823;
        Thu, 09 Jan 2025 05:38:21 -0800 (PST)
Received: from [192.168.10.47] ([151.62.105.73])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c366sm624477a12.17.2025.01.09.05.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:38:21 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: oliver.upton@linux.dev,
	Will Deacon <will@kernel.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	seanjc@google.com,
	linuxppc-dev@lists.ozlabs.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH 1/5] KVM: e500: retry if no memslot is found
Date: Thu,  9 Jan 2025 14:38:13 +0100
Message-ID: <20250109133817.314401-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109133817.314401-1-pbonzini@redhat.com>
References: <20250109133817.314401-1-pbonzini@redhat.com>
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
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P2yMnJ0hlAom4M9RMfyyoZBBAUoe7JDxgFOnKnyJRuI_1736429903
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Avoid a NULL pointer dereference if the memslot table changes between the
exit and the call to kvmppc_e500_shadow_map().

Cc: stable@vger.kernel.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index e5a145b578a4..732335444d68 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -349,6 +349,11 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	 * pointer through from the first lookup.
 	 */
 	slot = gfn_to_memslot(vcpu_e500->vcpu.kvm, gfn);
+	if (!slot) {
+		ret = -EAGAIN;
+		goto out;
+	}
+
 	hva = gfn_to_hva_memslot(slot, gfn);
 
 	if (tlbsel == 1) {
-- 
2.47.1


