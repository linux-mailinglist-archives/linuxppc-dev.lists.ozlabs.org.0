Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEA6688CA8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 02:41:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7JKG5mstz3f7h
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 12:41:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=q2Lfvwgb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3dwbcywckdhawfcusfguccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=q2Lfvwgb;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7JJL5L5zz3bfj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 12:40:32 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id u186-20020a2560c3000000b007c8e2cf3668so3483375ybb.14
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Feb 2023 17:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MyChsJPTVsY2fOwG/RI8qO+kUTadsY5ao3Rn6oLubwI=;
        b=q2Lfvwgba5mI01dB8lALvFJm9eJ5L6qh+bqk0DX7YFrZLVCPPEc4ohuNsRgVz/DWoa
         45p4NxjS5Tc1u5rhYtkOxutMSFfev883SPN6LLMTF+pVdMycr5bePuiA4UIRHQz5bmMG
         zRiiSUVv2IaBHwMxrZbglAbdEKlQmmqfuwY5AFdTVPB9cpJ0EZxRn/4K85quJOTCZpi5
         HE78n6XyxSyGucpzxCPCE77mwn66EGwiwRzQEtgwgENOIvH68rrdkfdOIYL+WWSM3dAE
         t4gePGaLe1+Ey+the2P/FX3skvPyNc0yYktf4Ltxq559JXe8PAfMYwDOsSj+u3GdckiS
         ay/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MyChsJPTVsY2fOwG/RI8qO+kUTadsY5ao3Rn6oLubwI=;
        b=LXGOJC0J1iDUry+tp2Kftxj1IUBQ8r5SCNIlh/5s/ut1afeGJNn9S2ASk6xaNKdRIS
         6D+xo++Mt8sKRz2O0RvbkpGgE3oUTxKxY+vPd3nmKtu8X1nHPGiQKxiPLZZvwQ7HDOLf
         dKrMvcrFvIeJqXZvjzd9UJOxdASfkvq07tSoHIpHGgv68coN/Ae51Sx7dnxP3C3S3hTx
         YgHQc8cztizNMmKtQpZhYZG+sKvAeOymBibmFUHw667kdDIrosGHMJBe88DRgBzfzkn6
         rjX5mJ0DtffO0JJQX0ayHm45eGaSvVp6ElmHKevAuPNdecPZYxspbpMoRE5+2/HnxXMk
         DacQ==
X-Gm-Message-State: AO0yUKXsYIHDz/7dpYkLTilj0/4NcRpMiJWrzx2hRrfen+h3arbq7PSS
	BxqBNwSNZTZvdgiK0dMqyx9BzxxCsPDf
X-Google-Smtp-Source: AK7set+0if6+qdzHg851jcAQ62KbEMrh7klQns415GjdzZzFFKMRMIpJ8w8d4/avuCsLvwLct18dnu+GKXDH
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:3bb5:4c1f:1143:605])
 (user=irogers job=sendgmr) by 2002:a25:d749:0:b0:833:79ab:566a with SMTP id
 o70-20020a25d749000000b0083379ab566amr906826ybg.27.1675388429315; Thu, 02 Feb
 2023 17:40:29 -0800 (PST)
Date: Thu,  2 Feb 2023 17:40:14 -0800
Message-Id: <20230203014014.75720-1-irogers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Subject: [PATCH v1] perf pmu: Fix aarch64 build
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

ARM64 overrides a weak function but a previous change had broken the
build.

Fixes: 8cefeb8bd336 ("perf pmu-events: Introduce pmu_metrics_table")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/arm64/util/pmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/arch/arm64/util/pmu.c b/tools/perf/arch/arm64/util/pmu.c
index 2779840d8896..fa143acb4c8d 100644
--- a/tools/perf/arch/arm64/util/pmu.c
+++ b/tools/perf/arch/arm64/util/pmu.c
@@ -22,6 +22,8 @@ static struct perf_pmu *pmu__find_core_pmu(void)
 			return NULL;
 
 		return pmu;
+	}
+	return NULL;
 }
 
 const struct pmu_metrics_table *pmu_metrics_table__find(void)
-- 
2.39.1.519.gcb327c4b5f-goog

