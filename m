Return-Path: <linuxppc-dev+bounces-4915-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F6BA077BF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 14:39:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTQq41Rztz3byh;
	Fri, 10 Jan 2025 00:38:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736429920;
	cv=none; b=ho88SqfMd2efXrm90SyY/9ynkKCiaqsb8ds9ed5LfPRlGPdqIZ2CFa6vu85PfRc3dTHS7vyFUa0sFhi7UdAApvgUVuNJPtWOMrMrFqW4phaa2/8jt4PtgDZvZ9dACOzJgOUgyy7y61lnO/9+Yzhk2YKTDkjk3MtfWKisnPvVwmowDYHVp4Ka5fzGhRWqjdzGl4g9fZXHloxIhncuRhNvoHngSs44ClLj8FxHuGWpM1Ef76mCvhywLX73pqN3Gr7tnjjzBcav+QAwUCv8rzEpk0ZEC+Gbp87MXPfPpWBZNMBzqfMkmIDfcYQfWE0wIVDtW8SuOiP7c/YzHL9NrHageQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736429920; c=relaxed/relaxed;
	bh=Y4qkNvDxtryDJuaOhZabXXDqOZ28SJd16eOJBotltio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=ZqWxdCODd6LFe/Mz1vKCOwDcsugvkyweGX2TQvwrZVUaJ8xry0RytqK397yXvOmJTjMxA1oj5zLH+57FUap11T8pzFckyQQJWLDJAq019qP+TH3Qo+cGvusaUonGQvf4GS2I8m0IgmythjI3uCOAdjErN3x8mZNsq5QHDQX9n2JwHxxd1eBPBDe0B4RM+UFMQbxtCiS6269MUUA83XqcSIbzZckANcod0aDHTLNM7oukLAaV811E6cTzyobSf2NlTgKrsup40kZhB74SxK7RsqCktnj4yuZ9oz9ZZ+FEEzj8q/ZqiUwCjjloT2OVtl1Z7Hnl+IctboDTTw9yyq3/6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hQXZq8/H; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Yq/VgGT8; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hQXZq8/H;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Yq/VgGT8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTQq302cRz3bxR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 00:38:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736429915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4qkNvDxtryDJuaOhZabXXDqOZ28SJd16eOJBotltio=;
	b=hQXZq8/H2DYevavCbOOCNZROaE3BQqM60pM38u4Po+CLX+n+8XKQBPnxAx8GYgpMMwpnPc
	tf78PnfDRInJdnwZ4dB9RVg2GfBmAK1HHTVpUQls4s8AS/4aSi0WiuZtX3rl6Up7xy/ej1
	LYWUka9d9BSZ6+nUFHtQZW2vx21cZc8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736429916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4qkNvDxtryDJuaOhZabXXDqOZ28SJd16eOJBotltio=;
	b=Yq/VgGT8Pbnqj7uEy0Pagp01rTiCtStEROciJgHLaBYXgAONIwfwtgQ16ZrW6uQ8ujKdkx
	ahel0a3D6r8YHZfQixn5DzeEyfATPlpsRNHRskbRx9dKd7etvN4WEH8xW6QNrEuZBJNuJ+
	yALcowf8cDlSlv4jkRHQQ7NpL2Iqavo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-z9ehhnHxPaWRjx2yc3AgjA-1; Thu, 09 Jan 2025 08:38:32 -0500
X-MC-Unique: z9ehhnHxPaWRjx2yc3AgjA-1
X-Mimecast-MFC-AGG-ID: z9ehhnHxPaWRjx2yc3AgjA
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa622312962so71851866b.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jan 2025 05:38:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736429911; x=1737034711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4qkNvDxtryDJuaOhZabXXDqOZ28SJd16eOJBotltio=;
        b=gKyP2qRwWCTbxC/XqIKS/9M8yJJ1Jlzi74M//OD4OA+zMNdlqk5xlQ+42oCbPGyiOb
         GDsdkQwGSeayWlK9uZtG0V2+azXxO99HuKiE7daCOJc5lChAjCVK4GTqtHEXw89TB5ER
         m/r6Lohtsnuw8Co3vdWmjq06GihOXLb3kuLWXxzNQYQYnuS1g81AdBUzZYW94ZDBzAL/
         UvoCc1wd63AnVhHATNWD4m0FHnnyD5NZ85yZwOrWdE1SlwciXxJrQ+Nwq6mtmG2HdqD1
         IlhdaUTFAK5XvZuBEftnO2DiSEYk35SFh7zro24SM1T0baYftNug7F4L1vK0RSj/dhtE
         JdVg==
X-Forwarded-Encrypted: i=1; AJvYcCUJm+JlaUmaF+qFhraQqx81oEzkSFJ1UilOgm3FG2QNDVHU35QksIpfFThK/L+PK3IsjlPCHtmcsEE4/ck=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzJm5knGn6qtlklCUHTMlqrzKvDS1fmJPkOa1VV1m25rqYQGsIG
	QyYDLTvSMFzAMM5bEC/gsIipKlzbkDnKW8u4/uClraqks9z7KOmPc5gUKo7CN6eN5IfQ+2356kJ
	pKf4Dya9Hel6RgGlT6we9JmlLcwENspRUT9N7ohISOjLtMwyM+0QPBzML8ZMrW6Y=
X-Gm-Gg: ASbGnctWkU4sNPGo3IrhFKustKBxl3No+qHGxdVeCpJyNA1Pj2Y1axcOb1B5HS7D6cO
	21PctVLggFybtiWqUAlN8yfGBAXMkyRiTnm/FzcLzK6R4GDRdoRJz756glcKWBXnkUiTr6Xp2A1
	74151g2ELoIo6dJ6oh37dSixhWOmxzgUYueUWAKE431UUczb4knWAesVnRlIusFWhutmHyhcJXn
	qIBSOp8hTp4PhBECA6RbAbtIYuwdSk9AlXlkP7O+j2XO6AdFMqaOHG9PV6z
X-Received: by 2002:a17:907:97c6:b0:aaf:208:fd3f with SMTP id a640c23a62f3a-ab2ab558911mr610030966b.13.1736429911040;
        Thu, 09 Jan 2025 05:38:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcNnAC+O5NQsf3e6ZbNH5VgDVjtZpeWPQB3s6uy9MQKvp52Beiu2u+bl2BWL3zXg+RcIfN2Q==
X-Received: by 2002:a17:907:97c6:b0:aaf:208:fd3f with SMTP id a640c23a62f3a-ab2ab558911mr610029466b.13.1736429910681;
        Thu, 09 Jan 2025 05:38:30 -0800 (PST)
Received: from [192.168.10.47] ([151.62.105.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90d6838sm74386766b.55.2025.01.09.05.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:38:29 -0800 (PST)
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
	Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [PATCH 4/5] KVM: e500: map readonly host pages for read
Date: Thu,  9 Jan 2025 14:38:16 +0100
Message-ID: <20250109133817.314401-5-pbonzini@redhat.com>
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
X-Mimecast-MFC-PROC-ID: -oX3QYAaaXZd5F3oknOImXY7HQWDScnRu-Lb7MKkyO0_1736429911
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The new __kvm_faultin_pfn() function is upset by the fact that e500 KVM
ignores host page permissions - __kvm_faultin requires a "writable"
outgoing argument, but e500 KVM is nonchalantly passing NULL.

If the host page permissions do not include writability, the shadow
TLB entry is forcibly mapped read-only.

Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index e332a10fff00..7752b7f24c51 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -379,6 +379,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 			unsigned long slot_start, slot_end;
 
 			pfnmap = 1;
+			writable = vma->vm_flags & VM_WRITE;
 
 			start = vma->vm_pgoff;
 			end = start +
@@ -454,7 +455,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 
 	if (likely(!pfnmap)) {
 		tsize_pages = 1UL << (tsize + 10 - PAGE_SHIFT);
-		pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
+		pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &writable, &page);
 		if (is_error_noslot_pfn(pfn)) {
 			if (printk_ratelimit())
 				pr_err("%s: real page not found for gfn %lx\n",
@@ -499,7 +500,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 		}
 	}
 
-	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg, true);
+	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg, writable);
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
 				ref, gvaddr, stlbe);
 	writable = tlbe_is_writable(stlbe);
-- 
2.47.1


