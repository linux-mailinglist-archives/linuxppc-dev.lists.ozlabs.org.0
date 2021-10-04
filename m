Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 529EE421369
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:02:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNQTC25txz3c9W
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:02:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aiYXGzNB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=aiYXGzNB; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQS30BLJz2yHy
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:01:06 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id a73so14037464pge.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c8V1scHTGZcm2Dn3vb3tzVwF9hzvzB4+HDzAd0pKgKw=;
 b=aiYXGzNBVlPfTv7k54hzq91r1IvHTkus8O/D3LEmDMQcpLt/EImKfx3ggtcXpdHyTC
 tMmYWtx7jtVbFoAFG5ogXVlbmgiTtWrj0DLnSJO0KkZjooSzN4T4bXd8XIC5bUvkoASj
 8fMtU6Zd8YfVLsn3/n3hnV5FreDIB562ug3zNTMDOwIrQPnaf9FQxjh9aUpFKBTM0ugQ
 8itwHaIwK28bcEUUVC3JJhYj1UB0LitCXI6DXi6xryv74IuM1OAd0LJfo+mY8LqsB4xs
 Tloxj6IYt/wgkzZDEuKxkxe2Ih0SSJ7ONdnR3F8kq49sHrd7NwhzBAyp01NF63fnQMGQ
 vvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c8V1scHTGZcm2Dn3vb3tzVwF9hzvzB4+HDzAd0pKgKw=;
 b=qxvWyk6nPdJLldfDCsdorTUxGtGA13bFfxMhNFTbpLUJubrsURJagA/CGzbcYEOnfW
 80+AtYXOC2wCn/jtpAUonmEcIqq7M35Ugtu4vPFvB2F4W00QN/lCc/fAc6AysC2EWPOx
 192aZaye5Iyvp5OvVC5Tm2Hu4+3HF9G4835CY75oy49y3i94l/J8u68W1dkeAVlmkSbI
 N/rLFSKPVCKaZE/lIGp/PLLooWo7ojn6TVtmMKbJyAYYIUNBL1f8eVgHZAaA9yhNBE02
 i08a+mGln/ceLQsDeUmLfjyGOLpdpPaga1W046U2gkED6T5UYzIG7fQBaMqyo9SbmS8d
 2nbA==
X-Gm-Message-State: AOAM533GR4skNxMjdrL+Pf/u+FgNGGOa99JXzqFxoLiDeyujnGxvYHJV
 PQZ+m2aYa/uUUSz0fskc47YxcLL2aFI=
X-Google-Smtp-Source: ABdhPJxoovPXW4e7e+wAXmLw3EOYbGp5mJiVzkhts8KFSfnO0+5VqkumX0lXYQvuezeZiW4bDhYQOQ==
X-Received: by 2002:a63:200a:: with SMTP id g10mr11295120pgg.242.1633363264562; 
 Mon, 04 Oct 2021 09:01:04 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:01:04 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 01/52] powerpc/64s: Remove WORT SPR from POWER9/10 (take 2)
Date: Tue,  5 Oct 2021 01:59:58 +1000
Message-Id: <20211004160049.1338837-2-npiggin@gmail.com>
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

This removes a missed remnant of the WORT SPR.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/powernv/idle.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index e3ffdc8e8567..86e787502e42 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -589,7 +589,6 @@ struct p9_sprs {
 	u64 purr;
 	u64 spurr;
 	u64 dscr;
-	u64 wort;
 	u64 ciabr;
 
 	u64 mmcra;
-- 
2.23.0

