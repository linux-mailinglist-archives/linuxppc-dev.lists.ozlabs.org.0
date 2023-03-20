Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F506C0B12
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 08:04:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pg5Mc6prpz3cLs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 18:04:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=br0PJSuZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=br0PJSuZ;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pg5Lg1CtCz3bYW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 18:03:53 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id a16so6811205pjs.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 00:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679295829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jy2VIL6bO5mZL/jdQbdNJj46CrpgZXPfvqfmWbmTMCI=;
        b=br0PJSuZlPOccgICcjx18go83jGLL24VtJuBAN9/0RH/Rm8SZFwOLu3af50MsNfvlt
         7SApp9Iim5yiOoF37GobP10xFVt+el3zBwyf0J33Ge4COuOZnMxQrnSlCiZX0g7AKieI
         FTuM1TEUNbEFqYxRh2PcmEkx3SNZtOjTza/sJNlxCihSvgVVtSXwCI1oIsZB+OPprg31
         ozKPFxOb9XG/c0XSbdypM/oR9Sg+/AI8MePoxYljPqbhq0aKKrE7ccN0+NPx9MrjWWGx
         Pjm9UN0pLQjl033u3Ekr3kH8HKasS6shKVWOnGLRsNjoFZwkEzb3GgB5LeQ3w4u6gRWL
         bxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679295829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jy2VIL6bO5mZL/jdQbdNJj46CrpgZXPfvqfmWbmTMCI=;
        b=rYHg3k6imYYswa57GsQQPo+45mmg6kFFHjIkEO3PdUQainV4ogR89ZHT5uPTs8QhhM
         2d7oo26I4cxEWkSnRt2G/jSmJeq5RQ9uaB4kMAAeqztySjAVOFOQhT70EkzOrHjwxArQ
         gZ5MspmMmtzcO6USvt4t5AIzIwpUrloyLEAWkuFnxyFvZURoEPLL/isPzxdobHVslwNl
         2nBLhmPn5I1rADyjPt9l+epSQXadmVSnB6+PbeoBR+BZPQg9UCy3RPEAm+3P3ShJZSVr
         4wqlxapf2XOVcCoF9sVm3zyev7QTp02MFQCNGq8lIAw0+9KX3EIAr3SWkYot81g9d092
         lGGw==
X-Gm-Message-State: AO0yUKVxVs08kdYXJ/0h6F6D6PIPTE1qRPk5TwFWVeHaVQ3XccjCeGg7
	ytZwQg/dWMtmyeVDWMpc+T4=
X-Google-Smtp-Source: AK7set/+F9V5sauPXaabvZ8Ik7b8VKDFs76M/jrzI5sGy6du3TGnnwmv+jolDmE/yLpibkbH0giFUA==
X-Received: by 2002:a05:6a20:4c2:b0:cc:d7ec:b7c with SMTP id 2-20020a056a2004c200b000ccd7ec0b7cmr15059453pzd.4.1679295828954;
        Mon, 20 Mar 2023 00:03:48 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (121-44-69-75.tpgi.com.au. [121.44.69.75])
        by smtp.gmail.com with ESMTPSA id r17-20020a632b11000000b0050f7f783ff0sm1039414pgr.76.2023.03.20.00.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 00:03:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v2 00/10] powerpc: updates, P10, PNV support
Date: Mon, 20 Mar 2023 17:03:29 +1000
Message-Id: <20230320070339.915172-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since v1 series, I fixed the sleep API and implementation in patch 2
as noted by Thomas. Added usleep and msleep variants to match [um]delay
we already have.

Also some minor tidy ups and fixes mainly with reporting format in the
sprs test rework.

And added PowerNV support to the harness with the 3 new patches at the
end because it didn't turn out to be too hard. We could parse the dt to
get a console UART directly for a really minimal firmware, but it is
better for us to have a test harness like this that can also be used for
skiboot testing.

Thanks,
Nick

Nicholas Piggin (10):
  MAINTAINERS: Update powerpc list
  powerpc: add local variant of SPR test
  powerpc: abstract H_CEDE calls into a sleep functions
  powerpc: Add ISA v3.1 (POWER10) support to SPR test
  powerpc: Indirect SPR accessor functions
  powerpc/sprs: Specify SPRs with data rather than code
  powerpc/spapr_vpa: Add basic VPA tests
  powerpc: Discover runtime load address dynamically
  powerpc: Support powernv machine with QEMU TCG
  powerpc/sprs: Test hypervisor registers on powernv machine

 MAINTAINERS                 |   2 +-
 lib/linux/compiler.h        |   2 +
 lib/powerpc/asm/handlers.h  |   2 +-
 lib/powerpc/asm/hcall.h     |   1 +
 lib/powerpc/asm/ppc_asm.h   |   6 +
 lib/powerpc/asm/processor.h |  21 ++
 lib/powerpc/handlers.c      |  10 +-
 lib/powerpc/hcall.c         |   4 +-
 lib/powerpc/io.c            |  33 +-
 lib/powerpc/io.h            |   6 +
 lib/powerpc/processor.c     |  52 +++
 lib/powerpc/setup.c         |  10 +-
 lib/ppc64/asm/opal.h        |  11 +
 lib/ppc64/asm/vpa.h         |  62 ++++
 lib/ppc64/opal-calls.S      |  46 +++
 lib/ppc64/opal.c            |  67 ++++
 powerpc/Makefile.ppc64      |   4 +-
 powerpc/cstart64.S          |  26 +-
 powerpc/run                 |  30 +-
 powerpc/spapr_vpa.c         |  90 +++++
 powerpc/sprs.c              | 641 ++++++++++++++++++++++++++----------
 powerpc/tm.c                |  20 +-
 powerpc/unittests.cfg       |   4 +
 23 files changed, 925 insertions(+), 225 deletions(-)
 create mode 100644 lib/ppc64/asm/opal.h
 create mode 100644 lib/ppc64/asm/vpa.h
 create mode 100644 lib/ppc64/opal-calls.S
 create mode 100644 lib/ppc64/opal.c
 create mode 100644 powerpc/spapr_vpa.c

-- 
2.37.2

