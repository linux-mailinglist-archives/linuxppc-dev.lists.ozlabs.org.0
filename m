Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3B54213C0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:13:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNQk20k9pz3fF7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:13:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IqCkpfAb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=IqCkpfAb; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQSq3S6gz3bbF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:01:47 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id
 cs11-20020a17090af50b00b0019fe3df3dddso246219pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BSpAfqkgDPepZQ3GfNve5U7U5lObdzccs8al+a/vxj0=;
 b=IqCkpfAb746JTjXXOlrU9/9XyZ4v5/VseeUrceuibJEaNgm38bLE/QJzcDgX+Z+vpW
 EfsuTtW6qMhx/+zfMB3Dn7+FDGPe8CxYFVzcppylROPglw322XQAmYHc+ScHArFgFU3F
 Ve5kOplnwKdqR/YxFuP4jfFddEuZqKzM62+iXLAhSQOZaZvrxKV04Ji16tO0TSUT8f50
 1UjjSTBaA54EI2pOQii8/Coo/BAltJlEi0UdK++n9oKTXfcrFuTGp2wBtaiAlSPsHjx9
 duxaxbtVtxD4ngVn/cSB5trDFNkvlTp4J2EOMXJFEvVNMDfjke1w8h5Cj8Bb/Ed4pJ7I
 c+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BSpAfqkgDPepZQ3GfNve5U7U5lObdzccs8al+a/vxj0=;
 b=I/AqQaAQBLf+w0amUc9DO/jnYjizO/roUBcgz1SZXllTapffoWfkbF0Ju4o2oDZOog
 dFVKAY4jaMIaXERqZ1hG2HCnomRi94jmCl3TWcpDybZKHB9C4EsaNcjoplfKc6amJJfO
 fXWabw/Utr0zswHSFVyTzlCNR6qnY0bHqr2VGaKYfMYt6jK8QgXRw1a22A/TMKKeqVfm
 5wJvXDf4GEHphz1GXD/GB8Uezmudr0ICWLV6ycEbtWToWuygcMx4bU7yArkztXdGpULW
 9RQuhrgdmUQCsvx+cZmAzk4TNM0FyzQ+MPQLRjYYu1FdW3mXg+mM202VXmkiSnDEkLrX
 CTMg==
X-Gm-Message-State: AOAM5304cqr0t78e2Nkm5KUtlBcDpVP0FGPGVwkz1EI4+5XxhHCJ4Nfd
 1fByje4e8yybMy2WfgU6RpxBLLEgnQ0=
X-Google-Smtp-Source: ABdhPJy7cR2TZgBjVDra3SULaeyL51sytbKil2sKTuW6jFcSH9HYTe/YDMGM7AUNc0n6mmrOs2JYeA==
X-Received: by 2002:a17:903:2283:b0:13e:acd8:86c2 with SMTP id
 b3-20020a170903228300b0013eacd886c2mr427722plh.78.1633363305523; 
 Mon, 04 Oct 2021 09:01:45 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:01:45 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 18/52] KVM: PPC: Book3S HV P9: Move SPRG restore to
 restore_p9_host_os_sprs
Date: Tue,  5 Oct 2021 02:00:15 +1000
Message-Id: <20211004160049.1338837-19-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211004160049.1338837-1-npiggin@gmail.com>
References: <20211004160049.1338837-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move the SPR update into its relevant helper function. This will
help with SPR scheduling improvements in later changes.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 1c5b81bd02c1..fca89ed2244f 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4093,6 +4093,8 @@ static void save_p9_host_os_sprs(struct p9_host_os_sprs *host_os_sprs)
 static void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
 				    struct p9_host_os_sprs *host_os_sprs)
 {
+	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
+
 	mtspr(SPRN_PSPB, 0);
 	mtspr(SPRN_UAMOR, 0);
 
@@ -4293,8 +4295,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	timer_rearm_host_dec(tb);
 
-	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
-
 	kvmppc_subcore_exit_guest();
 
 	return trap;
-- 
2.23.0

