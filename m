Return-Path: <linuxppc-dev+bounces-17145-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMAlKeSQnmnTWAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17145-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 07:04:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCB61923C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 07:04:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLPDV3jSgz3dVp;
	Wed, 25 Feb 2026 17:04:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771999450;
	cv=none; b=B1KB58PxGO5bnegTB8JSjP1mTFhlbEYh6JTn6XnI21BBctjs8k2vBgMZvuMo2uruSKQgJv0QOidKfBRuDopeH0O2pBhGec+h2mM/5mT3j5fhcrgo6wiEd+DvPJSdEPN+zQleWz4nxdlam7cPqmQ/u8S0Z6TvtUsFGwh//Cwu8ZMlEWmFQr32X1R/ZJl4VvMv0SKdCM/yRttRFqQl/NU1dH8v34odWOAo5uNQBIDULc4hme7hEg4Gl6WWJm/Yx7lq8PEKn5HG/KA6DRdBFeZdm/kejaw18KKzsVijPIBVMbMpYLl/4lajMjhgk2W9uVGmDWOBJTq22Fkyd34HSlLeng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771999450; c=relaxed/relaxed;
	bh=Ijh1gRZ/vz98nkJ2ibune9S4XQ/SnjSEuxpGe+HaeR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=lWqcNSNFG4CZu7T4qe4KlPIiml6K2sEEtiIZ0bOejBHaOLATYjvpisgvNckA/JpU+K0DTfvcfvx3j+lBcGPGQ697uMv7vnZnpuAVS9/VSU5RWr7TzxC7JcWjr1IBeu3h60GWRN2Ld8INGIDYocqcaGkdr0g3Osh5s1XxBPtOmO1Tn9exuzGGprR5sjwu9KgkBEYcCMgz80GU4RiSyhU50A3/+tUwNDtAxKjU72yjNdemRDoTKBW7i1kDLo/TvT5R8zhXxvnzrZ085purG58TSiKO5teWNXH662XBvLBZsF61J+vprws23ApqVdw8Fw9KejEAn3S+jgokFc/46OEocg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CMKxrTxw; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CMKxrTxw; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CMKxrTxw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CMKxrTxw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLPDT3vfSz3dVl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 17:04:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771999446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ijh1gRZ/vz98nkJ2ibune9S4XQ/SnjSEuxpGe+HaeR0=;
	b=CMKxrTxwVeCJagOzChuIcM7CHqS2wJ5tkxQkwsRc3td6gxO6FPBHXtpuBzEQXMXjO15HPF
	O2ZkkDjWA/VxBMiu9QGE2yyQB/wuEgMa2mS7ribW/yZ3qfMkSUqpGLbDADr4VUq4FqdBAk
	U9B+17sXfsXYWu9Wa5IXr0IBu5bk5MQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771999446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ijh1gRZ/vz98nkJ2ibune9S4XQ/SnjSEuxpGe+HaeR0=;
	b=CMKxrTxwVeCJagOzChuIcM7CHqS2wJ5tkxQkwsRc3td6gxO6FPBHXtpuBzEQXMXjO15HPF
	O2ZkkDjWA/VxBMiu9QGE2yyQB/wuEgMa2mS7ribW/yZ3qfMkSUqpGLbDADr4VUq4FqdBAk
	U9B+17sXfsXYWu9Wa5IXr0IBu5bk5MQ=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-h5CoimxxMzeQ1fvrBHbLEw-1; Wed, 25 Feb 2026 01:04:03 -0500
X-MC-Unique: h5CoimxxMzeQ1fvrBHbLEw-1
X-Mimecast-MFC-AGG-ID: h5CoimxxMzeQ1fvrBHbLEw_1771999442
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aae3810558so11468595ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 22:04:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771999442; x=1772604242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ijh1gRZ/vz98nkJ2ibune9S4XQ/SnjSEuxpGe+HaeR0=;
        b=B+w5bC2vgyqxSF/WPV5TsVCvI1DJ1DedD55HcgnTj/sOLORxFVM+blHL+PEwiHpuKx
         M6Xr2dauzFH9UqVuI9nQxa4RZcZQKitLg9xXTAvYu2gLOI7Y77oduP5aPSlGCGtSQeTR
         TWV3ffUvnRCmbbz3i9FbQR+j5W+VvaA5j76VbI/u3d1vqak16iIn1A2z+CFKpZ7U5nJV
         h/B2afPMUvykFS6+hHQsjiZLOLffrK2Mi98LwB7uddOSM5Y/HKnc5CqgLCGtvxUPTvwf
         WCk/n3aXb7OcpSAF0JQgFDqggKeVYSdNPJZPt78ZM2f3QygvxeuFeUy+ZOqojGx4fvPS
         qbfA==
X-Forwarded-Encrypted: i=1; AJvYcCUtwJgrW4EgCjF49DsoSiTKEEjM4tvUbIn3rGlc0TDKt2uzqp9s/I/fenhYo4Om/3LwYBKckhxhOljE50g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyz+LhWu2Tr2qTR0juwAJPBL/2zahGulrzMeimnZzIXu/hT4+G/
	PHLawvdDCZcUH2J3QPkfBMJD2521y/M/9DFnl9oexar/UAaMVM6DkbRBjcCBiqKu4F+3++gohy2
	7XfXIKFCWbPx5j5A0dGC66BubIgOEN4NoWMncSTa0dTiO1PzeQMvE/ekZ9zZYqpwfDFk=
X-Gm-Gg: ATEYQzzxi+Oz60/InoBM0z+0/v5MHqO4Ri8EmB6oin0+BFNsN+Tgv6Dku1I07z+U7yY
	Zp0pjApf3nI5BM8JbxXo21Ib7iY87lm3nU/ndWsl59ehSh3UpW8jAF3JqB5K4TsylfVJSU8Wsm/
	LpUNN3xmXBOXQ62+zOxnO2UgcVhvkCIDIshGWYtfQ5DhslvcnHyN8qkhvak9OwJFSlobhmsPQb8
	TKZlEjxTGnhclgqahsAedllgW8V2gFTUrVpfGiI5RUgmkpf72hLdGqW6/mU/NP/D7zN74yxnBCy
	8YpG1WDmtjVQ8+PaJevEiHtcSq4JVBOAY9qQ+HXrjh2jABFKLdNalWabM0bxIr0bLfiXr00MdLT
	G+n0qkO0AED5R
X-Received: by 2002:a17:902:e787:b0:29b:e512:752e with SMTP id d9443c01a7336-2ad74556edbmr127353845ad.47.1771999442356;
        Tue, 24 Feb 2026 22:04:02 -0800 (PST)
X-Received: by 2002:a17:902:e787:b0:29b:e512:752e with SMTP id d9443c01a7336-2ad74556edbmr127353515ad.47.1771999441818;
        Tue, 24 Feb 2026 22:04:01 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e3507csm127703285ad.8.2026.02.24.22.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:04:01 -0800 (PST)
From: Coiby Xu <coxu@redhat.com>
To: kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 2/3] crash: Align the declaration of crash_load_dm_crypt_keys with CONFIG_CRASH_DM_CRYPT
Date: Wed, 25 Feb 2026 14:03:45 +0800
Message-ID: <20260225060347.718905-3-coxu@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225060347.718905-1-coxu@redhat.com>
References: <20260225060347.718905-1-coxu@redhat.com>
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
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pg1ovSPU5k-UqydjbOnPfuKtIjeuYQVKRNazMkNEMHk_1771999442
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17145-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[coxu@redhat.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kexec@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:devicetree@vger.kernel.org,m:lkp@intel.com,m:akpm@linux-foundation.org,m:bhe@redhat.com,m:vgoyal@redhat.com,m:dyoung@redhat.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[coxu@redhat.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: DDCB61923C8
X-Rspamd-Action: no action

This will prevent a compiling failure when CONFIG_CRASH_DUMP is enabled
but CONFIG_CRASH_DM_CRYPT is disabled,

       arch/powerpc/kexec/elf_64.c: In function 'elf64_load':
    >> arch/powerpc/kexec/elf_64.c:82:23: error: implicit declaration of function 'crash_load_dm_crypt_keys' [-Werror=implicit-function-declaration]
          82 |                 ret = crash_load_dm_crypt_keys(image);
             |                       ^~~~~~~~~~~~~~~~~~~~~~~~
       cc1: some warnings being treated as errors

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202602120648.RgQALnnI-lkp@intel.com/
Signed-off-by: Coiby Xu <coxu@redhat.com>
---
 include/linux/crash_core.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index d35726d6a415..c1dee3f971a9 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -34,13 +34,6 @@ static inline void arch_kexec_protect_crashkres(void) { }
 static inline void arch_kexec_unprotect_crashkres(void) { }
 #endif
 
-#ifdef CONFIG_CRASH_DM_CRYPT
-int crash_load_dm_crypt_keys(struct kimage *image);
-ssize_t dm_crypt_keys_read(char *buf, size_t count, u64 *ppos);
-#else
-static inline int crash_load_dm_crypt_keys(struct kimage *image) {return 0; }
-#endif
-
 #ifndef arch_crash_handle_hotplug_event
 static inline void arch_crash_handle_hotplug_event(struct kimage *image, void *arg) { }
 #endif
@@ -96,4 +89,11 @@ static inline void crash_save_cpu(struct pt_regs *regs, int cpu) {};
 static inline int kimage_crash_copy_vmcoreinfo(struct kimage *image) { return 0; };
 #endif /* CONFIG_CRASH_DUMP*/
 
+#ifdef CONFIG_CRASH_DM_CRYPT
+int crash_load_dm_crypt_keys(struct kimage *image);
+ssize_t dm_crypt_keys_read(char *buf, size_t count, u64 *ppos);
+#else
+static inline int crash_load_dm_crypt_keys(struct kimage *image) {return 0; }
+#endif
+
 #endif /* LINUX_CRASH_CORE_H */
-- 
2.53.0


