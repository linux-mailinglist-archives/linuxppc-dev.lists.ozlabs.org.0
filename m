Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B9D67D9F4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 00:50:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2yC30zC3z3fHK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 10:50:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=e6ohvklU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3aq_tywckdja2b80ybc08805y.w86527eh99w-xyf52cdc.8j5uvc.8b0@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=e6ohvklU;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2xx000qgz3fJ3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 10:38:43 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id t13-20020a056902018d00b0074747131938so3598302ybh.12
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 15:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=snCBxLwh7jm6krd4EQPzPcciOFAFt0fWD1CpQDw1t+8=;
        b=e6ohvklUxI4ipjwUCogc5GWZzMwgpvonuMqEFAldtcrN5gwr7vxUrcVT0vO30kWL/u
         UTKdHnDRG6MmsGo21+eZky1ijnGvGJykYoL/kbFW9ydXTr28qfBvoBzw4x0iBjSVI/qy
         VTCRwVi0mxUxy0SzS4w3U/CgWKzSOIkd80PZW3EXNp2goqcaJGRQYStILOiyjyH57toU
         Ov2TmXZBqoiT6exgPN6QdRQYDvkEyTP7AI0uIu/zVKmHN2V4qhHd+ihEH4gbDypEXF5s
         B7IQpf7Q7r5YYT3Gs4h8bzZo9lqB4lzNuM0ur+i/xVRYO3M91t6R/XihIzHynFsRrdw4
         oOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=snCBxLwh7jm6krd4EQPzPcciOFAFt0fWD1CpQDw1t+8=;
        b=nAqKQrVTsa/TVEHAjMXgpFwFWCKcTD9d9f4gsulgOb5HtkCnLBnOnRCy1SzUYoXVXy
         bdJ823iM9hNETpBclzj4dcHyZUwvpSpufCQpX26Rd3LvDDT2Z3wJooGh4aswZMqv9wwq
         hz2pWgqECOS0WESIfc/9R3Bslr9j0mZ3D8LULYa7XXW6/VgyUBMCSNGfXS6v1raolSAH
         dCldVT3L+6gOb7skQrDEK0+o0zXthemo04DH3+lAlxXgl/ytAe/UiqH1wgNZ9QUoKb+E
         eyfk2zEGfnvHBAt8+8qOPOuqEMuHckbebKxgPCGO1HZFhp2FN8dLKvoPXxswuEi6atMv
         Nkzw==
X-Gm-Message-State: AO0yUKVL2LPa1x+vN3xN7DtNy3EBqYbz/rWA3blNjOqgj76FYwmC3wxO
	PhLiKoizDVAL/U2JKsGdMsA8cKP27nIe
X-Google-Smtp-Source: AK7set/8zwjdXupmXxmE3nxBHcDXM+9r4moQ67xxfCC3ARU9uYuzrlHsQS14Uo2BYtJ6Y5jtB3/pbR3UBgqM
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:b9b8:6de0:39b3:4cf7])
 (user=irogers job=sendgmr) by 2002:a0d:fb43:0:b0:506:5a29:80ce with SMTP id
 l64-20020a0dfb43000000b005065a2980cemr1081160ywf.254.1674776321949; Thu, 26
 Jan 2023 15:38:41 -0800 (PST)
Date: Thu, 26 Jan 2023 15:36:44 -0800
In-Reply-To: <20230126233645.200509-1-irogers@google.com>
Message-Id: <20230126233645.200509-15-irogers@google.com>
Mime-Version: 1.0
References: <20230126233645.200509-1-irogers@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Subject: [PATCH v5 14/15] tools build: Add test echo-cmd
From: Ian Rogers <irogers@google.com>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Kim Phillips <kim.phillips@amd.com>, 
	Florian Fischer <florian.fischer@muhq.space>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Xing Zhengjun <zhengjun.xing@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Kang Minchul <tegongkang@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sandipan Das <sandipan.das@amd.com>, Jing Zhang <renyu.zj@linux.alibaba.com>, 
	linuxppc-dev@lists.ozlabs.org, Kajol Jain <kjain@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Ian Rogers <irogers@google.com>, Perry Taylor <perry.taylor@intel.com>, Caleb Biggers <caleb.biggers@intel.com>, Stephane Eranian <eranian@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add quiet_cmd_test so that:
$(Q)$(call echo-cmd,test)

will print:
TEST   <path>

This is useful for executing compile-time tests similar to what
happens for fortify tests in the kernel's lib directory.
---
 tools/build/Makefile.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/build/Makefile.build b/tools/build/Makefile.build
index 715092fc6a23..89430338a3d9 100644
--- a/tools/build/Makefile.build
+++ b/tools/build/Makefile.build
@@ -53,6 +53,7 @@ build-file := $(dir)/Build
 
 quiet_cmd_flex  = FLEX    $@
 quiet_cmd_bison = BISON   $@
+quiet_cmd_test  = TEST    $@
 
 # Create directory unless it exists
 quiet_cmd_mkdir = MKDIR   $(dir $@)
-- 
2.39.1.456.gfc5497dd1b-goog

