Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FCB6284BB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 17:13:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9vVc3dd2z3bb2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 03:13:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GUx7Fxoh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GUx7Fxoh;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9vSn2qbCz3cJF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 03:11:37 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso11087003pjc.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 08:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYVe9VYwgB4+meWyJBvYBlpNZu3XcDPYt6dNK5s35qE=;
        b=GUx7Fxoh+2cDZBTWeSpfzyWogR0GeDTRRVL5fvFGY0v37gpP6Z8wiNa0MEfcpwU8Tw
         pw76BmQOwZ1uBy90dKdwQmnotaj73hOLuasmlyjvO/oTDDExrv7cPSat7byuq+OpBRDS
         wTBAC+4Y1MJ4S2nywd+p7ShtvnqJxpreuHbJMNQZj69Veq3PLnx4FOdxH8rEIad201ku
         asI75t56fYwtHToNofCkukqKGRaGo49SJVhdTA6j2IJFbB7TJiFHp+rN16dKKZwTw3Qj
         EMo6Vgk1NeJJyVorndh1DmZpJ1ivFhRZlimDU9yvJC0jIflajqCJwRAz3mrGQQLh7EIr
         aekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYVe9VYwgB4+meWyJBvYBlpNZu3XcDPYt6dNK5s35qE=;
        b=Svdo3L73w0SLQGBoRraSK8A8jYOmrwDcyXOp02FGJgWR8uwZ44bfz+uvbK24p8ByyR
         cOlCi6ZeBRTgEnlB40qXobq5wOde3vO1K2m2RUy/PNjTWRaaUZdJD4EBtysUeqbablQx
         w476Q32+mq22cxUY+hRdDmLh5ensr2PSgp3YZ20AOJ+nvXY5xoINM4gnrum9jevvvs7x
         tk59/BBljZT63N+0S7rH8Fdwd2EYtiSSp5cE8OV5LVqAZOi2WMjL8i/YFtafRwuCImzF
         71u/2AfrrVYVYtCqHlNWsnqnPrzmw4bbz1RyVlbgpffNMcs1DzDIrArUOeJOFdh8oc4C
         Cixg==
X-Gm-Message-State: ANoB5pmhikSdLN//O0MQD1Si1Q2vtRwXn8ydSJW+EnISmiIBouNHZimV
	V/l58xFWiftblY9J27llX5WerJmN75hwtw==
X-Google-Smtp-Source: AA0mqf6hbEZPA9K7mUHkmTnvUBXG+phz6pYXnX15wbPlQSuOD7FHnVS4jyrXZK2bSRAg5t0h2qMyfQ==
X-Received: by 2002:a17:902:7895:b0:182:fce5:fde0 with SMTP id q21-20020a170902789500b00182fce5fde0mr14551551pll.132.1668442292892;
        Mon, 14 Nov 2022 08:11:32 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-22-7.tpgi.com.au. [27.32.22.7])
        by smtp.gmail.com with ESMTPSA id e2-20020a170902d38200b00186e2b3e12fsm7635883pld.261.2022.11.14.08.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 08:11:32 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 1/4] powerpc/qspinlock: Avoid cmpxchg pattern in lock stealing
Date: Tue, 15 Nov 2022 02:11:16 +1000
Message-Id: <20221114161119.2883620-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221114161119.2883620-1-npiggin@gmail.com>
References: <20221114161119.2883620-1-npiggin@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Using a cmpxchg-style trylock in the lock stealing code opens the
possibility for failures due to the lock word changing, even if it
could have been stolen.

Instead, use the stealing trylock which will do the right thing
and succeed unless the lwarx finds it locked or mustq.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 36afdfde41aa..ff718f27cbc9 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -497,7 +497,7 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 
 		if (unlikely(!(val & _Q_LOCKED_VAL))) {
 			spin_end();
-			if (trylock_with_tail_cpu(lock, val))
+			if (__queued_spin_trylock_steal(lock))
 				return true;
 			spin_begin();
 		} else {
-- 
2.37.2

