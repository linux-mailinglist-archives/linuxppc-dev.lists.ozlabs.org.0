Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5894F3B0237
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:02:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8NlM06Mhz3ddg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:02:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=MMHFcRRm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MMHFcRRm; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8Nfj408yz308w
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:58:21 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id c8so2259176pfp.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TOgK6BlAze2BcucFCieXN1hKi5wN+ldytx7JCdHOUdg=;
 b=MMHFcRRmIE9RNoqPDXHnDQQn5ucROGkcLBEShz8o6YgvrvmqYtgphxHV0IWNR3cCLH
 e1VesQaAHz63UDg4Earjb+j8ivfGVxD+XKPMomsSz4VXd92mT9XGRumMrf/fjdXRDYSZ
 B15yfHfa+2bcZMGk03S2nGVwqMEF7oP5ZTXXjRBR3atKeWmI3+KEAJLyL/3ht3DgLxHs
 go6CVnRz+OvofjPKwxIC4/vKq9u+436EagpgPFmDzpM3V+YbwstOYjqbBgfXZnqndn5A
 a0B45G1MFGTabOI83B8lbwrsOaPI3g4rYUaW5ja8kWmZ0+rF7MrdcsrZ59IVsVMVzXaM
 Y/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TOgK6BlAze2BcucFCieXN1hKi5wN+ldytx7JCdHOUdg=;
 b=PeA40stige0m4nt3MalOVNkjrmN64KSJPfCBKYK4eJ5zMc5m3MQHo87S2jhONdKwuW
 pN9DOVrrH+U0zMbSjGC/WwIwhe0tVEBBKfgHBLEHnzv6K67D5ozkqZrhA+e1h6rcJc5J
 pUtC4bW/yx05/jzICLOJ5AXBO3jAX9Nfe6obKylEzg+eiSn935OFlw4ePbQfV4aWn+UU
 25q5/AUK7nKHOzuXVBcqolrxU4w4XvsSpJR17gMKQDtjpKvNtyY5V88WGNYwqTzrqH0t
 x0K2/tY/j0mak6mqhO0ZOmsWHRL63teB8Mc7AuzCyoWOQ478nGziCzeA0WNBWT7atxH8
 MajA==
X-Gm-Message-State: AOAM5338+Mvdq64h173T8qC05ugJCxA4ic7Yz1C9PrfldyyCp/W0glNo
 hM163FUTg08jhUSRCECqmos=
X-Google-Smtp-Source: ABdhPJwuAMoJs+c5XDRoWPfmNkv/W71tj/1vIHnEkXP+9d0D9ac9ZE7bx69VsLQbDmqvfQQq+EdUTA==
X-Received: by 2002:a62:ea1a:0:b029:2ec:9146:30be with SMTP id
 t26-20020a62ea1a0000b02902ec914630bemr3101893pfh.29.1624359498306; 
 Tue, 22 Jun 2021 03:58:18 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:58:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 09/43] KVM: PPC: Book3S HV: Don't always save PMU for
 guest capable of nesting
Date: Tue, 22 Jun 2021 20:57:02 +1000
Message-Id: <20210622105736.633352-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210622105736.633352-1-npiggin@gmail.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Revert the workaround added by commit 63279eeb7f93a ("KVM: PPC: Book3S
HV: Always save guest pmu for guest capable of nesting").

Nested capable guests running with the earlier commit ("KVM: PPC: Book3S
HV Nested: Indicate guest PMU in-use in VPA") will now indicate the PMU
in-use status of their guests, which means the parent does not need to
unconditionally save the PMU for nested capable guests.

This will cause the PMU to break for nested guests when running older
nested hypervisor guests under a kernel with this change. It's unclear
there's an easy way to avoid that, so this could wait for a release or
so for the fix to filter into stable kernels.

-134 cycles (8982) POWER9 virt-mode NULL hcall

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index ed713f49fbd5..1f30f98b09d1 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3901,8 +3901,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		vcpu->arch.vpa.dirty = 1;
 		save_pmu = lp->pmcregs_in_use;
 	}
-	/* Must save pmu if this guest is capable of running nested guests */
-	save_pmu |= nesting_enabled(vcpu->kvm);
 
 	kvmhv_save_guest_pmu(vcpu, save_pmu);
 #ifdef CONFIG_PPC_PSERIES
-- 
2.23.0

