Return-Path: <linuxppc-dev+bounces-5090-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 997AEA0A812
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jan 2025 10:56:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YW9kV45bxz30YL;
	Sun, 12 Jan 2025 20:55:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736675746;
	cv=none; b=iSHC2kjX4vQWHksFVG3QntynThP+j9Hi177UewyqHelwfzSlsHIQM0VvNT+YZP+gPen//IEOoemQ3yzk87rWpNuHQdp8KWl81ULB7Ur5ApMiGfAQkKJG+Cmdtm5xsCI31/wn54JbRwtT/rupSX3PPhnx4wi+gxdIS+1It+ig/g76hBbl+Rlm7a+L8oAjKh3ehZTbD9Fjzdy6TIvhmtull6AMGJ39qQYmPzdfasOlxVl4B7IDR8xVY2vCH0pNjcqVignSXhEdfq8sLrRrXY2nhjTevZTbfgsHl1zSTnKPyCfmUj3FenjjR35FAmqHqYN6ySpEyCjySvgm6PLD5hjfQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736675746; c=relaxed/relaxed;
	bh=TZOi2vhUk9IqOWLL4VjvE3yvErD9voRzbqxDd4bb0e4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=niXQcY54uYel8ZRFRYE+F6t0/brBZh9pTHkIuNcy35/ZD26LmxTJz7GWHHOfrntuGzYmD/dHZgc1f7nOFuNXfL3toH/MpsrPL2+qXHAsGNpPad0VtFwB1Df1wLdJSRt2sdFGX6RXNsxPelHsWLfFlMW/9O2ZMtkXvQMGM3fR/JL4Mpkj44Pm3j+YGWhBK457S41JI6IAfk/pY467tPGZcaNjcFCrg81zTS9SF8O/LfK5B2oz6Qe5mcwzDULbzb2TBpUbLOJHLUYhRszJw0XZBcpYHmNwT/MGy1Lk/kFlHMx0Jwe4GsQ/FjxU8KBc1G2I1NJC4Txjwa1lMXiA9bBFtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d5EumcDR; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gyt+igfz; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d5EumcDR;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gyt+igfz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YW9kT51PPz30WF
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 20:55:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736675742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TZOi2vhUk9IqOWLL4VjvE3yvErD9voRzbqxDd4bb0e4=;
	b=d5EumcDRbU9ib9Y/yVrZ7BKRoSsd7mJEDltvEq7l6XBiV6o7MXj+BvLCbkWQK0k8WEClKi
	GXDdZFVE4LiGjHzAHxn2Wo9nB2qRI/NJqjwSB2wCcmW4KLGGZhz/AKjEpv/KILICjIs7sc
	7xW5lBTFfsiYfY+SXaOVNoy6rPf05iY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736675743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TZOi2vhUk9IqOWLL4VjvE3yvErD9voRzbqxDd4bb0e4=;
	b=gyt+igfz9a2XidPQTx99SldJB/u4UGgXOt1tR7zNziQ0crzFgY15/uah8yf7W4Ry8fAJ7r
	c4SB49LhsNGRlQfRjkORubiVRIWfyHdS+PXcXh7vbbDQQmrcygpP15Q8EH3/zFrC5zP0Uo
	pPBH/2PCMqvcib1VDYQW/vr+Z39MXmY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-E8uCfZ5-MBSkTn5yt5Vx1Q-1; Sun, 12 Jan 2025 04:55:41 -0500
X-MC-Unique: E8uCfZ5-MBSkTn5yt5Vx1Q-1
X-Mimecast-MFC-AGG-ID: E8uCfZ5-MBSkTn5yt5Vx1Q
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa68b4b957fso351278966b.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 01:55:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736675740; x=1737280540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZOi2vhUk9IqOWLL4VjvE3yvErD9voRzbqxDd4bb0e4=;
        b=foeNvoGbRRb9qxZHyOMkIu/MmygzxL3jrqoHZIVppdbdwCxvDXjl6EYKZPO64KdT++
         QmNSREWxkdKqvAJgY6rLGYIe+sB1OYrlcr/INTO8LYUqJFOWLniG/gor6+8zQW+ogSME
         smRXe18E71RKfEHBUxQHPfSMX4DpOiwb5MVHDjr+UUFd3W4KKl7XmnhZxek2t8W8BiYn
         ib+lJSCKDDZZL7wL0xQfoq7OfRG0NiFy9R3kjMdvEo6Px1oNaFfqIrzcj6r4PWiyIwbL
         s0FcaKRHsFvmyEGFNyZo4AozZBszLRsnY//PRxLLTVUPgafQeLBleSgV41zTUXtj5zCJ
         jI6A==
X-Forwarded-Encrypted: i=1; AJvYcCWPL3iOGnuAyhB3PyJnobE0zQRd7vEzPiKZ68ieyrSbzbrxboRaO6DvDYyKNBBuwSjCbNq8tHpYjj1631w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz1Q0w/pUnzEE7F0sNd4OPwAyhHSeGUg/ukTXntSmWr5C2mtCLX
	AV/2wXIj6lryoVUx5YWoNirizuFuScCby/ayhGeX88oLVNSRpjZwPLjoDsIDdt24j/TDzcKlru5
	lm05/VZVEJeSE629MtkeS/UZ51okf8cjDws+367tdlznrt8OfFfcg7QIe60r731w=
X-Gm-Gg: ASbGncukXXFzzj6oi35Kj1F2vuPtFWyQn3/7M+zf8jn2zAsutwEfrmJQ9997mFy97k8
	Ovvk4ymHPD/IdmUBGEZ7e9azeCfPURW1C6fqoEjnSkeK37mKbf1dL+bXcwWHtM5aokkYWgVWsoA
	uxKFjkgaYEd6BRUEpqOCHlF7Bl9tXmPtIjAmXPe+uE5PapUJeSjWBaKhE7Vqt5Z92v1SGLP6GYw
	ZiCDXHDZDT1QkDIX4KVlJpSGHM62d7MDtkitOCJGEZ8u2MnEyb2zT4CGpg=
X-Received: by 2002:a17:906:f58d:b0:aab:f014:fc9a with SMTP id a640c23a62f3a-ab2ab703f01mr1331417966b.22.1736675739785;
        Sun, 12 Jan 2025 01:55:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYiuGhI+4msFAOUKvZ179BJ3utaua0uWFviKs7CY/tGCvPWvPtqZvorhRWNQWYuMTsu6u8Aw==
X-Received: by 2002:a17:906:f58d:b0:aab:f014:fc9a with SMTP id a640c23a62f3a-ab2ab703f01mr1331416766b.22.1736675739453;
        Sun, 12 Jan 2025 01:55:39 -0800 (PST)
Received: from [192.168.10.3] ([151.62.105.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2e8c753fdsm226853266b.184.2025.01.12.01.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 01:55:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: seanjc@google.com,
	linuxppc-dev@lists.ozlabs.org,
	regressions@lists.linux.dev,
	Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [PATCH 3/5] KVM: e500: track host-writability of pages
Date: Sun, 12 Jan 2025 10:55:25 +0100
Message-ID: <20250112095527.434998-4-pbonzini@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 2DVeKoQs3EH_lOUIVG2tKDFFUXdA0vw7Bk_p9i-Uc0Y_1736675740
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add the possibility of marking a page so that the UW and SW bits are
force-cleared.  This is stored in the private info so that it persists
across multiple calls to kvmppc_e500_setup_stlbe.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/powerpc/kvm/e500.h          |  2 ++
 arch/powerpc/kvm/e500_mmu_host.c | 15 +++++++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/e500.h b/arch/powerpc/kvm/e500.h
index 6d0d329cbb35..f9acf866c709 100644
--- a/arch/powerpc/kvm/e500.h
+++ b/arch/powerpc/kvm/e500.h
@@ -34,6 +34,8 @@ enum vcpu_ftr {
 #define E500_TLB_BITMAP		(1 << 30)
 /* TLB1 entry is mapped by host TLB0 */
 #define E500_TLB_TLB0		(1 << 29)
+/* entry is writable on the host */
+#define E500_TLB_WRITABLE	(1 << 28)
 /* bits [6-5] MAS2_X1 and MAS2_X0 and [4-0] bits for WIMGE */
 #define E500_TLB_MAS2_ATTR	(0x7f)
 
diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index c266c02f120f..b1be39639d4a 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -45,11 +45,14 @@ static inline unsigned int tlb1_max_shadow_size(void)
 	return host_tlb_params[1].entries - tlbcam_index - 1;
 }
 
-static inline u32 e500_shadow_mas3_attrib(u32 mas3, int usermode)
+static inline u32 e500_shadow_mas3_attrib(u32 mas3, bool writable, int usermode)
 {
 	/* Mask off reserved bits. */
 	mas3 &= MAS3_ATTRIB_MASK;
 
+	if (!writable)
+		mas3 &= ~(MAS3_UW|MAS3_SW);
+
 #ifndef CONFIG_KVM_BOOKE_HV
 	if (!usermode) {
 		/* Guest is in supervisor mode,
@@ -244,10 +247,13 @@ static inline int tlbe_is_writable(struct kvm_book3e_206_tlb_entry *tlbe)
 
 static inline void kvmppc_e500_ref_setup(struct tlbe_ref *ref,
 					 struct kvm_book3e_206_tlb_entry *gtlbe,
-					 kvm_pfn_t pfn, unsigned int wimg)
+					 kvm_pfn_t pfn, unsigned int wimg,
+					 bool writable)
 {
 	ref->pfn = pfn;
 	ref->flags = E500_TLB_VALID;
+	if (writable)
+		ref->flags |= E500_TLB_WRITABLE;
 
 	/* Use guest supplied MAS2_G and MAS2_E */
 	ref->flags |= (gtlbe->mas2 & MAS2_ATTRIB_MASK) | wimg;
@@ -303,6 +309,7 @@ static void kvmppc_e500_setup_stlbe(
 {
 	kvm_pfn_t pfn = ref->pfn;
 	u32 pr = vcpu->arch.shared->msr & MSR_PR;
+	bool writable = !!(ref->flags & E500_TLB_WRITABLE);
 
 	BUG_ON(!(ref->flags & E500_TLB_VALID));
 
@@ -310,7 +317,7 @@ static void kvmppc_e500_setup_stlbe(
 	stlbe->mas1 = MAS1_TSIZE(tsize) | get_tlb_sts(gtlbe) | MAS1_VALID;
 	stlbe->mas2 = (gvaddr & MAS2_EPN) | (ref->flags & E500_TLB_MAS2_ATTR);
 	stlbe->mas7_3 = ((u64)pfn << PAGE_SHIFT) |
-			e500_shadow_mas3_attrib(gtlbe->mas7_3, pr);
+			e500_shadow_mas3_attrib(gtlbe->mas7_3, writable, pr);
 }
 
 static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
@@ -487,7 +494,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	}
 	local_irq_restore(flags);
 
-	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
+	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg, true);
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
 				ref, gvaddr, stlbe);
 	writable = tlbe_is_writable(stlbe);
-- 
2.47.1


