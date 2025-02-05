Return-Path: <linuxppc-dev+bounces-5864-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4718DA28E54
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2025 15:11:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yp2Gd34D7z2ywR;
	Thu,  6 Feb 2025 01:11:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738764697;
	cv=none; b=HQDIOL93FgxJ8F61hkVhKkoT2C2g7Z7txyXSX/9cAJ1jGMKXf8MPtYUSL8TF/zEmLDKQAk0KjfqhFcpZWCSzAb1kLKLWwqLOlx+2Fry8jFVyEGXQN2ikETi9s4kBjLRWaXArneCmToKGaMabt55g5++bplmu2ESjyMLFMC52K4QPE72SlyS7biLrlVoJ005FdqIIIV/UPlT5wFLgd+PvtWke4o2LIxlcoWv14b04LM30Vaht2SL2M+ElJYQUICLf6yuUDCm5T+K0mYxdYuJimmCi0LeE1ssu+BMvSXQm36tyq2jXSXEjKzUBN+dmTY2tqsD65QBihyWAtJ851OdvNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738764697; c=relaxed/relaxed;
	bh=+3u9jwQp6DYXi+I+Qmy9Asm9KgUzeu1P0QKBZqRTHBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TYWRt6MP8hXmdDBAviAjwzvMoTqnmPXBRAe2KCM5KQNTRqRt4IXxEPT7//qPzWtKYZgB1wHvsZdLm9livK1UqMUTDhn44uKrqpJMcrAdbfK/yY8jlPfabpJ9GZNaPVTV2z+Mr4UUmBN0gxKUaqkahW/FisyuJW97U4Dk4Os5mH5BLi5XyfdWgGVdSzI4ugPKZqehvdgMQyhWOg9mRPbvhwsM9ZQozwDzN4UG2MzW4HNvLQDwfE+K8SbG9M2C+2nAONqDkn6oBDKpeJ9ZHhCcH6rrLOjf+774uOSx4Wluce38uouNjYF1zHLXmPg/Jqov+TKKZVdjZLVVP/mw/2rvqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tSEI9Az5; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tSEI9Az5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yp2Gc41yYz2yHL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2025 01:11:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C7B36A43694;
	Wed,  5 Feb 2025 14:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5DDC4CED1;
	Wed,  5 Feb 2025 14:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738764693;
	bh=FyH55BMYbGrv8HcLmuHvOdnASara61BhkuyQEwsCI7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tSEI9Az59mH6oVv6oCXN+7+HyrQqvG9C2IBrv7TNdEQ12dz89agDz61aEZ13v+T7w
	 YMK1jIvEbgeg2ITAHbHLZIhzVicW0q+VjNFPYn4FQhKKHXWgfy/LjVzXgpKeMSN0jE
	 KQ2IMbtQtaUiXkqNU4xY4gGornw3S5iA9fSSyAvE=
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
Subject: [PATCH 6.6 175/393] perf machine: Dont ignore _etext when not a text symbol
Date: Wed,  5 Feb 2025 14:41:34 +0100
Message-ID: <20250205134426.990638038@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250205134420.279368572@linuxfoundation.org>
References: <20250205134420.279368572@linuxfoundation.org>
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
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

6.6-stable review patch.  If anyone has any objections, please let me know.

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
index 7c6874804660e..e2a6facd1c4e2 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -1217,7 +1217,7 @@ static int machine__get_running_kernel_start(struct machine *machine,
 
 	err = kallsyms__get_symbol_start(filename, "_edata", &addr);
 	if (err)
-		err = kallsyms__get_function_start(filename, "_etext", &addr);
+		err = kallsyms__get_symbol_start(filename, "_etext", &addr);
 	if (!err)
 		*end = addr;
 
-- 
2.39.5




