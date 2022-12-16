Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DCB64EB15
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 13:00:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYSND15fVz3c3W
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 23:00:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fyekQLQM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fyekQLQM;
	dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYSMK4xZkz3bTF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 22:59:39 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id 82so1648351pgc.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 03:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rYcXFMOZFPJ8pKyYwiLdsKPfd5is36mEQmL4sytDQS8=;
        b=fyekQLQMhWtCQSabYfBagYhmm75TjQnfoy/Yf3c+eThE6Jykk4fqaPzGtWfeA7VHrk
         JJMBwj4/i2lRW+mZfZUU2xQ/V+V67+JacaIZrfVie1V3TIgBx3TdM8ebdpH1mreHi7mc
         /AjudfVdvoFzdRDlUjuak+wY182On5NxryPN/HIT+w4ZapHlCVrjXxrI1SX6/cX+91nt
         +CAygoteF4negQdXbjNOvyC/4XepwXMRsfdw1BrpZrfkQFycJ6/3JFjbIbLPl08kab4L
         Bmce0qcoC3PcbRaZDPfNCt8SJbPJ7dJzFGZNffUe0DA+r21KkSsF57M7EZTxKljdslVn
         cqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rYcXFMOZFPJ8pKyYwiLdsKPfd5is36mEQmL4sytDQS8=;
        b=6bTOOeyPCMcVPgfNPNY1Qc/6BqnS+QvUz1kqBmr0QxEElppAS5Fn9Ko8T6JhWzsZVw
         To3I58cwFfnnVure11K+FH8oV3HIXAMLOi5BokIc/kQuEhQ8JJLhWiqafb/xxMklC8Ps
         2PRQpVv06ukTkmmCsvoVgYhpqBj+JtQ8W3gmc9t9n7WPdacagTB5xkYdzs/I64hbmsR/
         t2ShVzJ1/7oWVISpIqTOW43Tl2uJNVJBjzkplfkOCmHCraDBmfIL9Z0csY8V8YImWBjf
         /F4TABanbkYbKgDdrRQfDRUKPbihnW++RXBoGXt3OvSbYp/O2F2t+/WVUGTbDcFiKgHd
         lSZQ==
X-Gm-Message-State: ANoB5pnysMZ523vxVLmCZwczvOc7h1Drj/LWbzQINDU7XfxLaxyr5c78
	ZxDUMaJC32w7g7DErtM16OBNAWR38dzXow==
X-Google-Smtp-Source: AA0mqf5sQPIeZKGZubU4WkMO/2MhxGT8ER/Y1SSdE2w3nI4Gc066q1YClVe+lsPK3BSbhUITUSHGlw==
X-Received: by 2002:aa7:920e:0:b0:566:900d:a1de with SMTP id 14-20020aa7920e000000b00566900da1demr30953619pfo.26.1671191976935;
        Fri, 16 Dec 2022 03:59:36 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-236-36.tpgi.com.au. [115.64.236.36])
        by smtp.gmail.com with ESMTPSA id g22-20020a625216000000b0057ef155103asm1289438pfb.155.2022.12.16.03.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 03:59:36 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/4] powerpc: Misc early boot fixes
Date: Fri, 16 Dec 2022 21:59:26 +1000
Message-Id: <20221216115930.2667772-1-npiggin@gmail.com>
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

The first patch is a fix for a commit that's in powerpc next which
is a pretty harmless dump_stack(). Except that we had some bugs with
doing stack unwinding that early when the boot CPU is not zero so
that ended up crashing badly.

First patch should be relatively safe and solve that problem, but
only needed if you're testing with stress_hpt. Second patch is a
relatively minimal fix that should close most of the large window
where we're running with the wrong task_cpu, but I would not call
it trivial because it could cause some weird breakage or expose
another bug. Third patch closes the rest of the window and makes
the paca allocation a lot better, but it has more possibility for
regressions. Last patch is independent of the rest and should be
quite straightforward.

Thanks,
Nick

Nicholas Piggin (4):
  powerpc/64s: Fix stress_hpt memblock alloc alignment
  powerpc/64: Fix task_cpu in early boot when booting non-zero cpuid
  powerpc/64: Move paca allocation to early_setup()
  powerpc: Skip stack validation checking alternate stacks if they are
    not allocated

 arch/powerpc/include/asm/paca.h       |  1 -
 arch/powerpc/include/asm/smp.h        |  1 +
 arch/powerpc/kernel/process.c         | 11 +++++++++++
 arch/powerpc/kernel/prom.c            | 12 ++----------
 arch/powerpc/kernel/setup-common.c    |  4 ++++
 arch/powerpc/kernel/setup_64.c        | 14 ++++++++------
 arch/powerpc/mm/book3s64/hash_utils.c |  3 ++-
 7 files changed, 28 insertions(+), 18 deletions(-)

-- 
2.37.2

