Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 228085ADF58
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 08:04:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMFFy4QtJz3c1c
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 16:04:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FBpkdPn0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FBpkdPn0;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMFFJ632Yz2xGN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 16:03:47 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id t11-20020a17090a510b00b001fac77e9d1fso13847053pjh.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Sep 2022 23:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=7Bl8E9Pzjq26dy6/V3YEU0Ud/H6XU+AlFJj8KGbhPJg=;
        b=FBpkdPn0PgSgXUszaccknmGC3veuzOxVAPa0qDj4LE6byK6vqySv4qWZuCJRsa+S54
         7FJUEonWa4I753GC/M9LaiBrh4f6zFsNOqMB0i4STsxeFH0xy1HmapGbxgwbbqnz8P3O
         YxlHgDBQ8EF21oRbkZ4BN3VEQ3L3Kw7315L4h3fQxpgmKLXtRRy7Vj7GZv+1UkLBzSgp
         IH3DaGYhKwGRqG/6o3jJs2idJNV8GBa96XzscAKHR3AaBuQgcrxUSiElYJA/8q0d1KPd
         GkCW9TteMq/pfrCY8sqSLyBGXbIn8pQtBW8TcUajUFbcOFlOt6M5GGrOTJsKiXdoLoVg
         K4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=7Bl8E9Pzjq26dy6/V3YEU0Ud/H6XU+AlFJj8KGbhPJg=;
        b=NeWCdr5LtV8xT9n4YE6QsJtucpSw/eAz4JPSY3S+35QJk3m2ut8GhzuyJo3zPLuH2F
         gIeCMyPWFmefJkVdyiBiURo3pamk2qa7v3X159Mf0d2qCQm+nwgZTjURCmtkd+QOUYvb
         WFx5f967ro95wJgTYWZ1hrALNq8+q05ttDdD/ABhEdLmyyWRn1ZxrlRt87TD9e35yUKb
         qbKgDK8hje7J8Bi8j2xKCtxx410hJ5Qc3dyPBPJNAiaUmQLhh9EL8VQxAVYaXjPnV7oF
         z1DDstece7qDqrEsw4DQr31s7aD8/nrPvere94jGxK2Pjl0VlAE5cPJ87FPQDLn5acm7
         BZ3A==
X-Gm-Message-State: ACgBeo1DFKqm2N0GMMuAs7v0nZAE9qbfTTxosSSHmQXCj6CMgQXa3/72
	EVHWV70xUuxSRzvgqg14dECRvyG+GWY=
X-Google-Smtp-Source: AA6agR5OcXFmcdTgetwWkvc3sZIMxCniIgk7ZIqxrCJWebt27B02z8vNyReLmM6ysIdkloMl8j9fuA==
X-Received: by 2002:a17:90a:e7d1:b0:200:94fd:967a with SMTP id kb17-20020a17090ae7d100b0020094fd967amr2901453pjb.57.1662444225544;
        Mon, 05 Sep 2022 23:03:45 -0700 (PDT)
Received: from bobo.ibm.com ([124.170.18.239])
        by smtp.gmail.com with ESMTPSA id u126-20020a626084000000b005383988ec0fsm8934864pfb.162.2022.09.05.23.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 23:03:44 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/3] powerpc/64: interrupt soft-mask management fixes
Date: Tue,  6 Sep 2022 16:03:34 +1000
Message-Id: <20220906060337.3302557-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Sachin Sant <sachinp@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since last posting I've added more debugging and done some test code
that tires to irritate this on hardware (e.g., put DEC into the
MUST_HARD_MASK category, set_dec(1) in the hash fault handler, run
with perf, etc), and also trigger interrupts at various points stepping
through in the simulator.

I haven't been able to break it. Sachin reported he couldn't reproduce
the previous lockups he saw so possibly that was a red herring.

I'd like to try again to close this if possible, it's probably one of
the last major known uglinesses in the soft masking code.

Thanks,
Nick

Nicholas Piggin (3):
  powerpc/64/interrupt: Fix return to masked context after hard-mask irq
    becomes pending
  powerpc/64s: Fix irq state management in runlatch functions
  powerpc/64s/interrupt: masked handler debug check for previous hard
    disable

 arch/powerpc/include/asm/runlatch.h  |  6 ++---
 arch/powerpc/kernel/exceptions-64s.S | 10 ++++++++
 arch/powerpc/kernel/interrupt.c      | 10 --------
 arch/powerpc/kernel/interrupt_64.S   | 34 +++++++++++++++++++++++++---
 4 files changed, 43 insertions(+), 17 deletions(-)

-- 
2.37.2

