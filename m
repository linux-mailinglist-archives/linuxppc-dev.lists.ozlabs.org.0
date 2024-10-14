Return-Path: <linuxppc-dev+bounces-2238-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C43A899D5AB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 19:38:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XS4GH3VKMz3c20;
	Tue, 15 Oct 2024 04:38:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728927527;
	cv=none; b=PjoC/lZ7BwRlrZW9GUo0DLPK7QIEcrkCtKoTz6f7bdelFCik2GCEOupT6/vIXK1pcG65+kYv0R70oJbttU+Ga60B1U1Z0V6K4SKw3e/uk52utsRFRrHoZpO+MR9wWH6xdlNYqf8YlNyx4+pvdbZ51CXY+fpEPVpsi0SBrsNiGrXZPzT9BT3SjzjbC4PvSfUS2a70yvgZNy04/GvwZ+MnDKjZOt8aoL/cEBjM1HS2r9iud3iZo+2hwjVsuf+9Sa+lpG+Y170uKVVX/Vkj8UjHdQFoPcCidqmJptPRA9PR/97Y2iQI4XXH6+nUzxftEHTCiHWYyLhRjARVTqJNUCc20w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728927527; c=relaxed/relaxed;
	bh=/L4p0nIt1oR33mhPM0DQ7ujeCnUY4xMuTMr8Nw448w4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DO+4bMw6+7MH03CoBYKoJpG8FosRjUMYXFt5pCiyYCi3XKme9XhAYxiify4nDJzldXyHuqAZfk3IZogB8EkejUnukWNXhb8jUWMdyOakL3oBLnUde7R9YrPD3PKPrNJ7nHuqD00lFGTYtDC50mWfGxNFKmCteWZm5Up12w+PVTAzlJjy1uOwKNWPd6C8J7FJ+nsIcI35Q6I/cAF80W471953hqS7QY2yoRu8VIxD6Q+u9JKxEEE/7PlrsHDcicKqTkF/JYjA/Z0OuJxJZQxIknHB0Rbvy0cCGYn5oNnSl81VgAj2Bwjys3u5zcY7hLAk5FwJ5umCyUjcxma7z8zlog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LuKrQw1j; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LuKrQw1j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XS4GF5ptcz3c1D
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 04:38:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3896FA41E59;
	Mon, 14 Oct 2024 17:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF80C4CEC3;
	Mon, 14 Oct 2024 17:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728927522;
	bh=h3AfZDau91v/BeVAnuirS8TjaRO6qVmsdirabWbcECg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LuKrQw1j2XgaIHbLmWq9Ozp6w8vi7gRxJN51BkRIoG4dekTDoeEgXvnatxizpvL2Y
	 RpcxPiyvPzBQocZQceBwV10qff6gWEsIAmiUWmkYSscBBSBIGc8wBnUkfedHfjwz+S
	 2VQPd7Lef2Vzi/owZZL/IHaIij6oGRG79icyS2YgUn3TAkYIKcdbC4qvr1qDzTFq8p
	 Sl2VjFBnX8zeqZ7hP0HnXvoCVHojBeJVPjH/IlIUiOxI8jb2LtakNrqp/GWrS0/C6Z
	 AsyhGbtMnv3SEYUVc0ZwHTsnKqnKONOCg+uE6IoU97+h/SBhSJ+cHb8pjyrqDXSUge
	 jWMoVQoGD7Lxw==
Date: Mon, 14 Oct 2024 10:38:40 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
	irogers@google.com, linux-perf-users@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, akanksha@linux.ibm.com,
	maddy@linux.ibm.com, kjain@linux.ibm.com,
	disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Subject: Re: [PATCH] tools/perf/tests: Fix compilation error with strncpy in
 tests/tool_pmu
Message-ID: <Zw1XIGML32VaxE0t@google.com>
References: <20241013173742.71882-1-atrajeev@linux.vnet.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241013173742.71882-1-atrajeev@linux.vnet.ibm.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Oct 13, 2024 at 11:07:42PM +0530, Athira Rajeev wrote:
> perf fails to compile on systems with GCC version11
> as below:

I have one more build failure on 32 bit systems.  I'll carry this as
well.

Thanks,
Namhyung

---8<---
From 2e2c7ca3691d223d94ea383a6b688e35579d14d5 Mon Sep 17 00:00:00 2001
From: Namhyung Kim <namhyung@kernel.org>
Date: Mon, 14 Oct 2024 10:34:17 -0700
Subject: [PATCH] perf tools: Fix compiler error in util/tool_pmu.c

  util/tool_pmu.c: In function 'evsel__tool_pmu_read':
  util/tool_pmu.c:419:55: error: passing argument 2 of 'tool_pmu__read_event' from incompatible pointer type [-Werror=incompatible-pointer-types]
    419 |                         if (!tool_pmu__read_event(ev, &val)) {
        |                                                       ^~~~
        |                                                       |
        |                                                       long unsigned int *
  util/tool_pmu.c:335:56: note: expected 'u64 *' {aka 'long long unsigned int *'} but argument is of type 'long unsigned int *'
    335 | bool tool_pmu__read_event(enum tool_pmu_event ev, u64 *result)
        |                                                   ~~~~~^~~~~~

Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 tools/perf/util/tool_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/tool_pmu.c b/tools/perf/util/tool_pmu.c
index ea9d50f0252023dc..bd1cee643eb506df 100644
--- a/tools/perf/util/tool_pmu.c
+++ b/tools/perf/util/tool_pmu.c
@@ -394,7 +394,7 @@ bool tool_pmu__read_event(enum tool_pmu_event ev, u64 *result)
 int evsel__tool_pmu_read(struct evsel *evsel, int cpu_map_idx, int thread)
 {
 	__u64 *start_time, cur_time, delta_start;
-	unsigned long val;
+	u64 val;
 	int fd, err = 0;
 	struct perf_counts_values *count, *old_count = NULL;
 	bool adjust = false;
-- 
2.47.0.rc1.288.g06298d1525-goog


