Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69645683315
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 17:56:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5rml2Jg6z3cdW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 03:56:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GvyuAwIE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GvyuAwIE;
	dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5rln6xCHz3bW2
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 03:55:48 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id k13so15764381plg.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 08:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vnlVaRgsae3nqVZuJIAVJLLNiUe7NfzgzUJTWm08nRs=;
        b=GvyuAwIEjOByHmmBVKf4dIz1HFngrLxwisUIOr6Ofax3/aPM+bKNPZOKXhqe9/UiiM
         fTvKeqhD1j9lSU6S+qpfVF/w0F+Uh6o0Ps02UAQlK+lv5jhuu7kO4WjppCiek8NXMTnt
         xi8J/xdVi4mf3ozWZJkUNkF+1/P/LqDajBAXqlpS6uxV2fC+YMgKP6PZbIwfMQhKvQ5T
         8PttI0JmAhMX2xadHE9MFciPKHP4lJxdDKU+6Qdq1H44iulK4o0pSWUIIosVbj6ZeF5J
         N/UYfoVnxx8n9ih1X76HVnJSzC+iNYMI/r6HsxJAPrtqH3w4THefj6HU+kLRhy/RMoel
         RxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnlVaRgsae3nqVZuJIAVJLLNiUe7NfzgzUJTWm08nRs=;
        b=1rHgKOjsmY7xr4eUqO8/LA+Yg+dBr/Bh4T6L9jeSTVtLkqQCKs4PfsBtYzE3aRyVXT
         ljnlHHItDKBxsLlQ9ITQA3tA5Cxxa7G7LU7NuaHLEThIsTvx/5dgOSKyKJUlzu9uFsjh
         oxEb9Y9BuvDc4dZKGJ+okVP02gPebTIuehoXH0JSDer96WWIuybHjmXbpAIKFn5NUlSW
         OUcjWxClCSVVVdTW0waoa18GSh5QMs0J2oUi1hA9HXVD4rb8iuToNTr9QzPVRpJfGq5k
         Z1HijVjnYLKo1pct5XhfaVD1gTpTp0hcj5l3VCB6lUrKMiMXII1vhEHQPvzWlqPt6BNd
         sYFw==
X-Gm-Message-State: AFqh2koz460Kys5aBD4rpxftf3JvrbP1TUjA12TfIIcWMCMnMHMD2Pbk
	H7oM5ZxUcBtipIaye/K7+1KBKEp2DX0=
X-Google-Smtp-Source: AMrXdXtCX5B7p5HXJ5SCnqbI6aQO3yLEYKdKPV8qhyYtRq1uvn6dy9B052cfV8kkQSMCAT2CCXhdUg==
X-Received: by 2002:a17:90a:528e:b0:229:eae4:bef9 with SMTP id w14-20020a17090a528e00b00229eae4bef9mr46149902pjh.43.1675184142206;
        Tue, 31 Jan 2023 08:55:42 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([203.194.37.234])
        by smtp.gmail.com with ESMTPSA id bk7-20020a17090b080700b00223f495dc28sm9029371pjb.14.2023.01.31.08.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 08:55:41 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/8] powerpc: improve copy_thread
Date: Wed,  1 Feb 2023 02:55:26 +1000
Message-Id: <20230131165534.601490-1-npiggin@gmail.com>
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

The way copy_thread works, particularly with kernel threads and kernel
created user threads is a bit muddled and confusing. This series tries
to straighten things out a bit.

Thanks,
Nick

Nicholas Piggin (8):
  powerpc: copy_thread remove unused pkey code
  powerpc: copy_thread make ret_from_fork register setup consistent
  powerpc: use switch frame for ret_from_kernel_thread parameters
  powerpc/64: ret_from_fork avoid restoring regs twice
  powerpc: copy_thread differentiate kthreads and user mode threads
  powerpc: differentiate kthread from user kernel thread start
  powerpc: copy_thread don't set _TIF_RESTOREALL
  powerpc: copy_thread don't set ppr in user interrupt frame regs

 arch/powerpc/kernel/entry_32.S     |  23 +++++-
 arch/powerpc/kernel/interrupt_64.S |  28 ++++++-
 arch/powerpc/kernel/process.c      | 121 ++++++++++++++++-------------
 3 files changed, 110 insertions(+), 62 deletions(-)

-- 
2.37.2

