Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BE65E98E0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 07:43:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbWrp6zxRz3bmW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 15:43:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HRvWwlMi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HRvWwlMi;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbWrM2xbkz2xZp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 15:43:15 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id q9-20020a17090a178900b0020265d92ae3so11298340pja.5
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Sep 2022 22:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=ofigAa9NvTAwmWDLqAKevaPcrWQb6cU0KX0iFBvDK2k=;
        b=HRvWwlMiTbkSjyvjiLcLZU2vR2apH3NSLNwTavFpODHCFXCp3q3+88wvFIHTbPLrJ8
         ac+fEs99e5nOPpJTqFtbVoy6CmL1uxmnHLGXbJQb0D8nyL4t2qZUx1FwFHfkdBkNqLW5
         uW1lBeyKWsLKcxiIjMQADDMBmzc6gvSnhZyt54v1CN0hZZWr7yYVvZK/rOC4bm1nnzA+
         ZsrQe+y0SDbqBxU8jGP4gjtbsPavDK4EnC1UzOD/xqJ6AOHEpHsjrrCoK5h4j1HiSOUF
         mSvdDfzszGAmjOqM+1N5Ha85aQd3drGqbXwJYjArV4upCtRXEGtgcDVEhiWasb5J91W+
         w5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=ofigAa9NvTAwmWDLqAKevaPcrWQb6cU0KX0iFBvDK2k=;
        b=ceKEcaBVBkSFlME6NfNYIeDHeWLft/dnr1gAm2N784HAcASJVPvkMjd/9Lvz7G4Npo
         DtNnJixVyq+H4RwNLQXerXQn2WGnaoyB9+1icpwb5xOl+SiLmIVrZLA+bB5Llj+UdEt3
         HnW34OihckLLKgZv1Se9mXN3M9gvpaphwggaEbNGdTifBWFRIXxiSHBGnN9XV5wJj346
         lXTdXHXBMF2bs1mDNGU1Q6bYajozgSy7BNQksUxrbSWIuT+3/YoYaJtFdffBkHJElN/y
         lpFncFh6k/b79v+T31zyoWf4C3nYjYARjSFd2bmPJMI4JqZijrNNhO8LSNzp0aQxG2u1
         wIlg==
X-Gm-Message-State: ACrzQf20jSGpLYbz90fmaXO6RG/XegzOgkDmOyiKDUd6aXwJA28pTLPb
	WZodDtl26Qu5wsJSUvHspwHwr0KRyoXb0A==
X-Google-Smtp-Source: AMsMyM5ApcvtDkA0YdnCnkh+QmuK4uUMbfTvkIf2F42cnmb2Yd3TwMJ4LHWGcGtnrTw1qMDLKDssfw==
X-Received: by 2002:a17:90b:1e0b:b0:205:bce5:467f with SMTP id pg11-20020a17090b1e0b00b00205bce5467fmr2988232pjb.24.1664170991729;
        Sun, 25 Sep 2022 22:43:11 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (203-219-181-119.static.tpgi.com.au. [203.219.181.119])
        by smtp.gmail.com with ESMTPSA id o90-20020a17090a0a6300b002001c9bf22esm5676553pjo.8.2022.09.25.22.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 22:43:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/7] powerpc/64: interrupt soft-mask and context fixes
Date: Mon, 26 Sep 2022 15:42:58 +1000
Message-Id: <20220926054305.2671436-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No real changes since last posting, I just pulled fixes from several
series together and rearranged them and updated changelogs slightly.

Thanks,
Nick

Nicholas Piggin (7):
  powerpc/64/interrupt: Fix false warning in context tracking due to
    idle state
  powerpc/64: mark irqs hard disabled in boot paca
  powerpc/64/interrupt: Fix return to masked context after hard-mask irq
    becomes pending
  powerpc/64s: Fix irq state management in runlatch functions
  powerpc/64s/interrupt: masked handler debug check for previous hard
    disable
  powerpc/64/interrupt: avoid BUG/WARN recursion in interrupt entry
  powerpc/64/irq: tidy soft-masked irq replay and improve documentation

 arch/powerpc/include/asm/interrupt.h | 36 ++++++-----
 arch/powerpc/include/asm/runlatch.h  |  6 +-
 arch/powerpc/kernel/exceptions-64s.S | 10 +++
 arch/powerpc/kernel/interrupt.c      | 10 ---
 arch/powerpc/kernel/interrupt_64.S   | 34 +++++++++-
 arch/powerpc/kernel/irq_64.c         | 93 ++++++++++++++++++----------
 arch/powerpc/kernel/setup_64.c       |  4 +-
 7 files changed, 129 insertions(+), 64 deletions(-)

-- 
2.37.2

