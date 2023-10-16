Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5EB7CA873
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 14:48:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Im9GQTEd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8H2y2ldZz3vqB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 23:48:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Im9GQTEd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c36; helo=mail-oo1-xc36.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8Gym17ZKz3fCg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 23:44:32 +1100 (AEDT)
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-57b68556d6dso2499151eaf.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 05:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697460269; x=1698065069; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrpQ/NYc53eOlcMLNjra1LpVolMH1LrpZK5UvQKufpY=;
        b=Im9GQTEdXUNn4e6eKCmXEQ+MGrW3OgnspxahqG5TA+PRLWt4u/qF1HvaG+TxzT1+7Y
         Zqqaex/GPZqRcUaluDgxYhSCLCTc6bDqJ00uZJHgPGfkvTSP5JkGPWjZK5iKoiaE/mrF
         qLx+qoQuP/TlaQYIIJ2MsEzIfPGfoTg3sAKgl07+z4xMVcCd7SZD8R7FXe7Z4qJpUD6l
         IK1tQ3F4P9G5qGNFWyXCK8kFYG9NXR5xVJBUK/gYApnO08eutk50ziGbrOt2jmZm/Awy
         P4a3MuRdZKMd8lseqa4Q8FI3YZfH8ZqFB/6WtXoQ04/VIG4rELHsp4B5/05nLQ/cqqP7
         yJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697460269; x=1698065069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrpQ/NYc53eOlcMLNjra1LpVolMH1LrpZK5UvQKufpY=;
        b=aBk6Syy3q0xAeFiIpwe6/P3nsSfXGHVEeG167J0Ks3RU1wL1rJ4TjhDdIWsejDR2ws
         vS1fhy2Y+mBV7r5EB0o9yWO8Yx1Gu0U/XgKA4uq1hNBABU1ibvlud25eQz+/NVwpcDc4
         y1QfzoxlOjiQ81ZaTjAVKg5O2Q+JJnrKA84SzIKbFLamV1MPj3eJMns0616QNybpuprw
         Arb9d6o4E8HRDPEb8o/9Bl1Fl0HjddZg7s2ekLt5hT3RVOSwiR0GyI3FmUSB9s0cMrhS
         ja21pZGs/RHg7o7MlwAp8+w9PIVg54qvaj9BGH3ImqEQzdQu1ahIK5SvE8EIERu0OiIe
         n5ww==
X-Gm-Message-State: AOJu0YxSeHP0KeZrt09+ya8u/xvSjcmEUv1m1TGEQWnwtzg0XOi+MvHa
	VG58B5aVgSclq8NMvs9y0yJ/olqsQXo=
X-Google-Smtp-Source: AGHT+IHnQE07nBCjGhyVsdRjIZ9XFOH87Yb/VB2M7YLZ8+lIBaUK1ojAoWkT5MyCPjJEVV+9kznBhg==
X-Received: by 2002:a05:6358:7e49:b0:145:707f:ebe1 with SMTP id p9-20020a0563587e4900b00145707febe1mr39459416rwm.12.1697460268803;
        Mon, 16 Oct 2023 05:44:28 -0700 (PDT)
Received: from wheely.local0.net (193-116-200-79.tpgi.com.au. [193.116.200.79])
        by smtp.gmail.com with ESMTPSA id t123-20020a625f81000000b0068c10187dc3sm6298850pfb.168.2023.10.16.05.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 05:44:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/6] powerpc/qspinlock: Propagate sleepy if previous waiter is preempted
Date: Mon, 16 Oct 2023 22:43:04 +1000
Message-ID: <20231016124305.139923-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016124305.139923-1-npiggin@gmail.com>
References: <20231016124305.139923-1-npiggin@gmail.com>
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
Cc: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, "Nysal Jan K . A" <nysal@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The sleepy (aka lock-owner-is-preempted) condition is propagated down
the queue by each waiter. If a waiter becomes preempted, it can no
longer propagate sleepy. To allow subsequent waiters to yield to the
lock owner, also check the lock owner in this case.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 6bb627e90a32..c68c2bd7b853 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -384,7 +384,11 @@ static __always_inline bool yield_to_prev(struct qspinlock *lock, struct qnode *
 	if (!pv_yield_propagate_owner)
 		goto yield_prev;
 
-	if (node->sleepy) {
+	/*
+	 * If the previous waiter was preempted it might not be able to
+	 * propagate sleepy to us, so check the lock in that case too.
+	 */
+	if (node->sleepy || vcpu_is_preempted(prev_cpu)) {
 		u32 val = READ_ONCE(lock->val);
 
 		if (val & _Q_LOCKED_VAL) {
-- 
2.42.0

