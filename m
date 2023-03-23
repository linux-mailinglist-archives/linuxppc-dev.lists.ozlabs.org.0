Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCDA6C693A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 14:12:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj5N35Plbz3f98
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 00:12:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rWLRPOUF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rWLRPOUF;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj5M925Pkz3cMh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 00:11:17 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 62007626A9;
	Thu, 23 Mar 2023 13:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F7DCC433EF;
	Thu, 23 Mar 2023 13:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679577074;
	bh=/OLefhFZ4sSoFTXhUzU6IaDDgb/f3Tybtx2GNklSFZk=;
	h=Date:From:To:Cc:Subject:From;
	b=rWLRPOUFKadadg9y9Kg4aDNA6PX2eyrslleiTSZd8Rl5a+9bAFVMsuLgeDg9I8lSn
	 nFVrfMFfHNMFzOtW6Dn0AF/FxudZs20bErVZ6Ya62L5K2rnkth6rcF5MohGU2rpGir
	 0RKcqhwRySwxc2LXv7JW4XvwrIAtctgmdKslZ7tGHSWIIirCJ2vzl7BgCpbw8yHeTF
	 U9BgvtDM/EjFikFXXAuQ4qo4L39x7X9u+S7lE9zryn0NgG8SD2cPQAsvU+646ZyyI+
	 N/UrMv/RsDStFMphC+/DjFtaOZE+LYOQT4TEXBVxPDrguuF7vUPgNZwRS53wJGoLyf
	 Pq+dE+zAL5RSw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id F13B64052D; Thu, 23 Mar 2023 10:11:11 -0300 (-03)
Date: Thu, 23 Mar 2023 10:11:11 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Subject: perf tools power9 JSON files build breakage on ubuntu 18.04 cross
 build
Message-ID: <ZBxP77deq7ikTxwG@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Url: http://acmel.wordpress.com
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
Cc: Ian Rogers <irogers@google.com>, Heiko Carstens <hca@linux.ibm.com>, Thomas Richter <tmricht@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Exception processing pmu-events/arch/powerpc/power9/other.json
Traceback (most recent call last):
  File "pmu-events/jevents.py", line 997, in <module>
    main()
  File "pmu-events/jevents.py", line 979, in main
    ftw(arch_path, [], preprocess_one_file)
  File "pmu-events/jevents.py", line 935, in ftw
    ftw(item.path, parents + [item.name], action)
  File "pmu-events/jevents.py", line 933, in ftw
    action(parents, item)
  File "pmu-events/jevents.py", line 514, in preprocess_one_file
    for event in read_json_events(item.path, topic):
  File "pmu-events/jevents.py", line 388, in read_json_events
    events = json.load(open(path), object_hook=JsonEvent)
  File "/usr/lib/python3.6/json/__init__.py", line 296, in load
    return loads(fp.read(),
  File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
    return codecs.ascii_decode(input, self.errors)[0]
UnicodeDecodeError: 'ascii' codec can't decode byte 0xc2 in position 55090: ordinal not in range(128)
  CC      /tmp/build/perf/tests/expr.o
pmu-events/Build:35: recipe for target '/tmp/build/perf/pmu-events/pmu-events.c' failed
make[3]: *** [/tmp/build/perf/pmu-events/pmu-events.c] Error 1
make[3]: *** Deleting file '/tmp/build/perf/pmu-events/pmu-events.c'
Makefile.perf:679: recipe for target '/tmp/build/perf/pmu-events/pmu-events-in.o' failed
make[2]: *** [/tmp/build/perf/pmu-events/pmu-events-in.o] Error 2
make[2]: *** Waiting for unfinished jobs....


Now jevents is an opt-out feature so I'm noticing these problems.

A similar fix for s390 was accepted today:


https://lore.kernel.org/r/20230323122532.2305847-1-tmricht@linux.ibm.com
https://lore.kernel.org/r/ZBwkl77/I31AQk12@osiris
-- 

- Arnaldo
