Return-Path: <linuxppc-dev+bounces-5869-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF704A29021
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2025 15:32:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yp2km437cz301n;
	Thu,  6 Feb 2025 01:32:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738765952;
	cv=none; b=hW+CGnlLoWtF8dRJLE/Bp0BLEzr113lmUwX/jJ3ziaZkMwVJv8U/HXG37dWL2zVlIkEK9f7bsRpJWpZsWqRC5P3l/MF2GDv4+E19qKVVnLARqe0llbUCaa4XnxS9AHYQ5UFLnW3ejKKRl3Dw3Lf29Kje1KdXOuT7FexMVGxRX+tVXFPtvAfHZxpaz0JFWm93/03GXuQsqCZRY6csFnVpgnywUHnd+gpwS1nr97uOms0+zAeARCn8guakZ6Q2/NNJtI5r7d6oDaL+9h3Mz8olpP+Hpas3ZslkJ9Sv3Oc9VRc71X2ytB+w3AV1DtCVV279YFpz0g5oL436HL6SD7UTNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738765952; c=relaxed/relaxed;
	bh=DLWeFdsIBCDsf+zlj+hs/bqANgug7c5/K20RtzlHSeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EjEkPxKsj1CePJQSwL/3QVoYG/nhuICzjUW2kNezgZYZKazCQaDDlbVmE64h1vlkqdQtONk458iDRuT7L2k58GE6pja/SKk0RpRa7ASTVMx3cve1FUhGPbr2/YqdlH6BWh6dYajcqY2FEleOHv7HnjAB1AED1HZkVlLjepg0WaoMfz41VjCKDVcFLzeP6TTrjxr6SGoclg/iPvyDBixrxMblbRNfOzUaDn47twcgNSyiXjKkw3ytk/8NpioLzgRTz00Ex6bUh4qruijB6xHm2GIyy7mgqxKtAUHPtNBngkZ6sLGp2Zk7X4Nbjh3CTKhbItjmvV7oLvPIHfN0LOuE2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=kfHFbtYO; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=kfHFbtYO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yp2kl4ScNz2xjd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2025 01:32:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 051CF5C5C32;
	Wed,  5 Feb 2025 14:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D8FC4CED1;
	Wed,  5 Feb 2025 14:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738765949;
	bh=sgg1ktQLV5/V2rSwnYMaMJmvjkWDMlls7oM0dhDcbhA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kfHFbtYOA3WDuH9jfQ14Ql1+E0q9FZW66bR3nF0pjyYx9ZItcCUrV29O5gRJQ00eS
	 ro07cHxikyK3KTcciH7tcml4Zaz4lPbvk/GTtrDQUMUrUIP5uxe+zjXGhwyldzTQIQ
	 XEK8V/R4KVyZPs9EZW5udwsWymsil9tXgZL5+8U8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Song Liu <songliubraving@fb.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.12 270/590] perf machine: Dont ignore _etext when not a text symbol
Date: Wed,  5 Feb 2025 14:40:25 +0100
Message-ID: <20250205134505.603797915@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250205134455.220373560@linuxfoundation.org>
References: <20250205134455.220373560@linuxfoundation.org>
User-Agent: quilt/0.68
X-stable: review
X-Patchwork-Hint: ignore
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

6.12-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Christophe Leroy <christophe.leroy@csgroup.eu>

[ Upstream commit 7a93786c306296f15e728b1dbd949a319e4e3d19 ]

Depending on how vmlinux.lds is written, _etext might be the very first
data symbol instead of the very last text symbol.

Don't require it to be a text symbol, accept any symbol type.

Comitter notes:

See the first Link for further discussion, but it all boils down to
this:

 ---
  # grep -e _stext -e _etext -e _edata /proc/kallsyms
  c0000000 T _stext
  c08b8000 D _etext

  So there is no _edata and _etext is not text

  $ ppc-linux-objdump -x vmlinux | grep -e _stext -e _etext -e _edata
  c0000000 g       .head.text	00000000 _stext
  c08b8000 g       .rodata	00000000 _etext
  c1378000 g       .sbss	00000000 _edata
 ---

Fixes: ed9adb2035b5be58 ("perf machine: Read also the end of the kernel")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Ian Rogers <irogers@google.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Song Liu <songliubraving@fb.com>
Link: https://lore.kernel.org/r/b3ee1994d95257cb7f2de037c5030ba7d1bed404.1736327613.git.christophe.leroy@csgroup.eu
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/perf/util/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 27d5345d2b307..9be2f4479f525 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -1003,7 +1003,7 @@ static int machine__get_running_kernel_start(struct machine *machine,
 
 	err = kallsyms__get_symbol_start(filename, "_edata", &addr);
 	if (err)
-		err = kallsyms__get_function_start(filename, "_etext", &addr);
+		err = kallsyms__get_symbol_start(filename, "_etext", &addr);
 	if (!err)
 		*end = addr;
 
-- 
2.39.5




