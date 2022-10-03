Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D75CA5F2913
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Oct 2022 09:13:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MgsVz6XcQz3cBj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Oct 2022 18:13:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ZoFPb/Zv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ZoFPb/Zv;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MgsVM5nxlz2xjj
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Oct 2022 18:12:42 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 977E1B80E6A;
	Mon,  3 Oct 2022 07:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6087C433C1;
	Mon,  3 Oct 2022 07:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664781156;
	bh=k7V3V4Hsxr6o2tHSNWJzPqBi2nn7WhKBYo9GdwPlTpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZoFPb/ZvrcHTFtC3FqUhy9xII1oDGLScdZA8/96h6famgMTXybywLw8XpU6u6x6/K
	 mMbLpTGiwrQeoFCH3QaY5Rf9H0lhhwFbmTjM1L4MciIY4/jInQaS4gyTfdl372HpAx
	 0OlI1omhv+Vhg20X3TPu8LGGexw8fA/MhWW7Efa4=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.19 002/101] tools/perf: Fix out of bound access to cpu mask array
Date: Mon,  3 Oct 2022 09:09:58 +0200
Message-Id: <20221003070724.557522335@linuxfoundation.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221003070724.490989164@linuxfoundation.org>
References: <20221003070724.490989164@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>, Athira Jajeev <atrajeev@linux.vnet.ibm.com>, Nageswara R Sastry <rnsastry@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, Jiri Olsa <jolsa@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

[ Upstream commit cbd7bfc7fd99acdde58ec2b0bce990158fba1654 ]

The cpu mask init code in "record__mmap_cpu_mask_init" function access
"bits" array part of "struct mmap_cpu_mask".  The size of this array is
the value from cpu__max_cpu().cpu.  This array is used to contain the
cpumask value for each cpu. While setting bit for each cpu, it calls
"set_bit" function which access index in "bits" array.

If we provide a command line option to -C which is greater than the
number of CPU's present in the system, the set_bit could access an array
member which is out-of the array size. This is because currently, there
is no boundary check for the CPU. This will result in seg fault:

<<>>
  ./perf record -C 12341234 ls
  Perf can support 2048 CPUs. Consider raising MAX_NR_CPUS
  Segmentation fault (core dumped)
<<>>

Debugging with gdb, points to function flow as below:

<<>>
  set_bit
  record__mmap_cpu_mask_init
  record__init_thread_default_masks
  record__init_thread_masks
  cmd_record
<<>>

Fix this by adding boundary check for the array.

After the patch:

<<>>
./perf record -C 12341234 ls
  Perf can support 2048 CPUs. Consider raising MAX_NR_CPUS
  Failed to initialize parallel data streaming masks
<<>>

With this fix, if -C is given a non-exsiting CPU, perf
record will fail with:

<<>>
  ./perf record -C 50 ls
  Failed to initialize parallel data streaming masks
<<>>

Reported-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
Signed-off-by: Athira Jajeev <atrajeev@linux.vnet.ibm.com>
Tested-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Kajol Jain <kjain@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Link: https://lore.kernel.org/r/20220905141929.7171-2-atrajeev@linux.vnet.ibm.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Stable-dep-of: ca76d7d2812b ("perf record: Fix cpu mask bit setting for mixed mmaps")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/perf/builtin-record.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/tools/perf/builtin-record.c b/tools/perf/builtin-record.c
index 68c878b4e5e4..708880a1c83c 100644
--- a/tools/perf/builtin-record.c
+++ b/tools/perf/builtin-record.c
@@ -3335,16 +3335,22 @@ static struct option __record_options[] = {
 
 struct option *record_options = __record_options;
 
-static void record__mmap_cpu_mask_init(struct mmap_cpu_mask *mask, struct perf_cpu_map *cpus)
+static int record__mmap_cpu_mask_init(struct mmap_cpu_mask *mask, struct perf_cpu_map *cpus)
 {
 	struct perf_cpu cpu;
 	int idx;
 
 	if (cpu_map__is_dummy(cpus))
-		return;
+		return 0;
 
-	perf_cpu_map__for_each_cpu(cpu, idx, cpus)
+	perf_cpu_map__for_each_cpu(cpu, idx, cpus) {
+		/* Return ENODEV is input cpu is greater than max cpu */
+		if ((unsigned long)cpu.cpu > mask->nbits)
+			return -ENODEV;
 		set_bit(cpu.cpu, mask->bits);
+	}
+
+	return 0;
 }
 
 static int record__mmap_cpu_mask_init_spec(struct mmap_cpu_mask *mask, const char *mask_spec)
@@ -3356,7 +3362,9 @@ static int record__mmap_cpu_mask_init_spec(struct mmap_cpu_mask *mask, const cha
 		return -ENOMEM;
 
 	bitmap_zero(mask->bits, mask->nbits);
-	record__mmap_cpu_mask_init(mask, cpus);
+	if (record__mmap_cpu_mask_init(mask, cpus))
+		return -ENODEV;
+
 	perf_cpu_map__put(cpus);
 
 	return 0;
@@ -3438,7 +3446,12 @@ static int record__init_thread_masks_spec(struct record *rec, struct perf_cpu_ma
 		pr_err("Failed to allocate CPUs mask\n");
 		return ret;
 	}
-	record__mmap_cpu_mask_init(&cpus_mask, cpus);
+
+	ret = record__mmap_cpu_mask_init(&cpus_mask, cpus);
+	if (ret) {
+		pr_err("Failed to init cpu mask\n");
+		goto out_free_cpu_mask;
+	}
 
 	ret = record__thread_mask_alloc(&full_mask, cpu__max_cpu().cpu);
 	if (ret) {
@@ -3679,7 +3692,8 @@ static int record__init_thread_default_masks(struct record *rec, struct perf_cpu
 	if (ret)
 		return ret;
 
-	record__mmap_cpu_mask_init(&rec->thread_masks->maps, cpus);
+	if (record__mmap_cpu_mask_init(&rec->thread_masks->maps, cpus))
+		return -ENODEV;
 
 	rec->nr_threads = 1;
 
-- 
2.35.1



