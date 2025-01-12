Return-Path: <linuxppc-dev+bounces-5087-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1616FA0A80A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jan 2025 10:55:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YW9kR1NsBz30TS;
	Sun, 12 Jan 2025 20:55:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736675743;
	cv=none; b=W/WPicyIeKOT9DD8eEXN1IfEmMjjs01mfUDHBTXzXhAUq+fyZABdy/8nr9qQcu0VqyS9hZ0D1Pv34DZT6KfmFySccTwntKBrEl3M3tyKurIWTnBIo4RddH4jhRE9UDGMWegU95mFVdUZBBL1KHEo1p7WF7yRj8mIoV6E0BjKhZW00ygV0tVuN8nhQrD+jCt5nVsRPw93J2AlDxVRJYawlvpXQP++1SCKTWPo3lcFguGfcsZqlwHr+/D7ywi+7j8/AvOQhldEf03H6UhuWPCWDYOPpDKf3UQVqFo6IztlS9WfMS6GrzLTMJzki9Go8G9kP1SNIiuDt7VRMhVzXKpppw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736675743; c=relaxed/relaxed;
	bh=q2g0sdh+W5glSkagx457PsA9cI+PMduPyER5qBCP9uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=WP2trYyRAOUHJqmi6QZNZA2SA5YQjLKSJ0pm3WX4weQVp7gRMlnXg24Ro+eMUpMDVy9tjTWmWCFsO7GakmlLp7HmkTAful6f483f//56FMVAE7j5EXNjgWMccGpFGLrTYH7FlW/oU3bVYPYKiJAb5ewj92y2W/tFMqyKQKaLJzLNwssP4by9PeIdDRo8PVkxh9MtYw0dCKehUyfc1KUaZaJ5rooN2Fp1arnPVZdv6DVOIejmrifNiMRiUhkTz/5PgJb38akQR9LKJgo2oZx73kdU7qiP9xvzXJ34xeo1XNkw3Xx/RE1hA3PjyzuPPWsojiQGdFSiuGrBjaQ1AV2SLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ezRwKMZD; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F2CMsX6y; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ezRwKMZD;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F2CMsX6y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YW9kP5hz5z30Nc
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 20:55:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736675736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q2g0sdh+W5glSkagx457PsA9cI+PMduPyER5qBCP9uo=;
	b=ezRwKMZDRvHAfPbfncukSSv+enR1w+2pCFlYCriBXgmgAhII2pHtXsfv8twCsYCNGzYQuM
	WH/ic5kgFBI87/Mjg3naGnY/dSUzEhRFPWrgSLIZ4iI7oXqtftDXviVFDJ0qGR7UvjJe66
	3xJJm423+wOZNKrwwUaok1v17kejQE0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736675737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q2g0sdh+W5glSkagx457PsA9cI+PMduPyER5qBCP9uo=;
	b=F2CMsX6yPzXcMr7TSBG0Rs7kxV/NKEUGgJ1lsIm9/7x6z92uARMD9lxvaqc6Io8nVQe6fD
	wFlfH01vovrXg7/8F+ITdfj1y7el0UdTwmdobb6pxaCHKFi4Kwq5/ruZ8YmzZ2UVfpqMwQ
	ZaXJKiMUNCKGOk2QCzR9lnwvNSPp0wk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-xUhoulpbOKuCNAknSU6azQ-1; Sun, 12 Jan 2025 04:55:34 -0500
X-MC-Unique: xUhoulpbOKuCNAknSU6azQ-1
X-Mimecast-MFC-AGG-ID: xUhoulpbOKuCNAknSU6azQ
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa683e90dd3so271385166b.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 01:55:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736675733; x=1737280533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2g0sdh+W5glSkagx457PsA9cI+PMduPyER5qBCP9uo=;
        b=PCFTNThFd+mgC2b+ZYFidMuEHWY91JE/ZT0dQ8XoQRlm71uRIGunTRne02Wx4YFRdi
         X2pvUfUoFUKHz0X3WBPe6AGSI61lj1PvDMKpD04/c8MRIPzPqoMcoV7WXV3//gMDr0wl
         n6Wsy0/9RMb3v4j4oK1B5tur+B+DG7oEIHfbzDG4f/Tq9rEOpcaGECizfOLyINWTxGiU
         Z1vRwadW5hCvM2QlSw4KJItRHLn4sHNzduQgkf74kDv1NJj0qhBec92p5g4QbgQ7hbxg
         ePfIYmDVwbGVbdlLW5UQcpLhMu2dfFgLwstW8jSkaGvFt5e/NqosQDOCrKrhAm1Y2ejx
         TwUA==
X-Forwarded-Encrypted: i=1; AJvYcCXm41VCXAkZC8zXLky/WDHVuo/xu9//WvUPYfbjSVtM0ZMilq9zaPZhx8JwEGy5HtoFA+Lw/OvkyF6ZoMU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy98+aFRr5q5/yeLJE6bBl3z3qrLkxWPEYrbN0Wo5BxAyX6hc7j
	lVKl1TiGiCpo7bT0iJDDx+1iANXIHMRoAKHwDIl6F4bWI5uz6RF4dfTTPNOVkEzbsgYkBUfxR2h
	RxiKlXQucfQjf8rHpw0ODTgUSQZqHRG09H7ujt0YTJxWoNgC/mItQKqu2MLh4nXM=
X-Gm-Gg: ASbGnctoaBMKQ7NsgZMRamicygethdgmjVwOGFOmjXYzHats6xkw3JYKhHV9qYyNfjK
	EreviU6InruY02fnaSrgtRjuybyEfFez7k40XaXgS/rjKQ8EGEyvdh9beTZwjjDVlBrIHuZhPq9
	/A6ppfs1VwlPfYs283PUSY3Cf22hPU7sErVEYdSjSEkiETAarE9KUvxyOPv1jCdVc1VuZhy3srY
	ZVEEDiv83X+v9EQBrfMgWH/+QnsNmZUvOZ4/8gP4w2jJ/Rf56Zm5uvwcOM=
X-Received: by 2002:a17:907:d1b:b0:aac:23f4:f971 with SMTP id a640c23a62f3a-ab2ab70a173mr1753854766b.33.1736675733514;
        Sun, 12 Jan 2025 01:55:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxwq3cSzmX3Sr/t/JxywDCCAqRMgXJsypEs7qUCiLJx2f+d/bQof+BQSWZDWOMCFQMp6aY9A==
X-Received: by 2002:a17:907:d1b:b0:aac:23f4:f971 with SMTP id a640c23a62f3a-ab2ab70a173mr1753853166b.33.1736675733170;
        Sun, 12 Jan 2025 01:55:33 -0800 (PST)
Received: from [192.168.10.3] ([151.62.105.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95647absm352956366b.118.2025.01.12.01.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 01:55:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: seanjc@google.com,
	linuxppc-dev@lists.ozlabs.org,
	regressions@lists.linux.dev,
	Christian Zigotzky <chzigotzky@xenosoft.de>,
	stable@vger.kernel.org
Subject: [PATCH 1/5] KVM: e500: always restore irqs
Date: Sun, 12 Jan 2025 10:55:23 +0100
Message-ID: <20250112095527.434998-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250112095527.434998-1-pbonzini@redhat.com>
References: <20250112095527.434998-1-pbonzini@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 5huagGUethHiDhvpk7kkBFgcrjqAo5NaPRvndLhDMZA_1736675734
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

If find_linux_pte fails, IRQs will not be restored.  This is unlikely
to happen in practice since it would have been reported as hanging
hosts, but it should of course be fixed anyway.

Cc: stable@vger.kernel.org
Reported-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index e5a145b578a4..6824e8139801 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -479,7 +479,6 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 		if (pte_present(pte)) {
 			wimg = (pte_val(pte) >> PTE_WIMGE_SHIFT) &
 				MAS2_WIMGE_MASK;
-			local_irq_restore(flags);
 		} else {
 			local_irq_restore(flags);
 			pr_err_ratelimited("%s: pte not present: gfn %lx,pfn %lx\n",
@@ -488,8 +487,9 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 			goto out;
 		}
 	}
+	local_irq_restore(flags);
+
 	writable = kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
-
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
 				ref, gvaddr, stlbe);
 
-- 
2.47.1


