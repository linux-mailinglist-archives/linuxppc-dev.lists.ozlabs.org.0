Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 393E8814AAB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 15:40:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X+DXRh1D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsBhM6cq4z3dL8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 01:40:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X+DXRh1D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsBgW6NZdz3cGL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 01:39:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B41462644;
	Fri, 15 Dec 2023 14:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE582C433CD;
	Fri, 15 Dec 2023 14:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702651156;
	bh=33M2vrx6UPW+NCsp4u79rR82ThY+lOzFqm0TWaDJXow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X+DXRh1DWtI+q7hVxZNcvDsLlFZdABe82o2h2+N0caAE5TjidRJslXbGduvFqTD1+
	 ydFoWVGky/X9Jwh8AjqClszt4107m38AvlirUsJrxNrbjG9mrFZLArb+zMUZDkS1JR
	 UfzufmJk4qk7k0IB6/d19frP246gSreon3JrrdoIt9QVREEXUq3fchwpgKCH6ERA+t
	 Oc/SHP4dl8iRESX5Fq8W4YF3gk92ljskoxyTJjl+9D6do6niWskreixC03f0dRVeRf
	 0aN8O04w3P8hWcw3/E/QhulG58ce89sSsZFU6Qp2xlWkBKyg3oBM2AI2Hwyj7J34vV
	 cVIt+g1AZ2n8w==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 03C32403EF; Fri, 15 Dec 2023 11:39:13 -0300 (-03)
Date: Fri, 15 Dec 2023 11:39:13 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Jing Zhang <renyu.zj@linux.alibaba.com>
Subject: perf tools arch Arm CMN PMU JSON files build breakage on ubuntu
 18.04 cross build
Message-ID: <ZXxlERShV-TIGVit@kernel.org>
References: <ZBxP77deq7ikTxwG@kernel.org>
 <a21aa4e1-506a-916c-03bd-39d7403c7941@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a21aa4e1-506a-916c-03bd-39d7403c7941@linux.ibm.com>
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
Cc: Ian Rogers <irogers@google.com>, kajoljain <kjain@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Thomas Richter <tmricht@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Mon, Mar 27, 2023 at 09:52:11AM +0530, kajoljain escreveu:
> On 3/23/23 18:41, Arnaldo Carvalho de Melo wrote:
> > Exception processing pmu-events/arch/powerpc/power9/other.json
> > Traceback (most recent call last):
> >   File "pmu-events/jevents.py", line 997, in <module>
> >     main()
> >   File "pmu-events/jevents.py", line 979, in main
> >     ftw(arch_path, [], preprocess_one_file)
> >   File "pmu-events/jevents.py", line 935, in ftw
> >     ftw(item.path, parents + [item.name], action)
> >   File "pmu-events/jevents.py", line 933, in ftw
> >     action(parents, item)
> >   File "pmu-events/jevents.py", line 514, in preprocess_one_file
> >     for event in read_json_events(item.path, topic):
> >   File "pmu-events/jevents.py", line 388, in read_json_events
> >     events = json.load(open(path), object_hook=JsonEvent)
> >   File "/usr/lib/python3.6/json/__init__.py", line 296, in load
> >     return loads(fp.read(),
> >   File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
> >     return codecs.ascii_decode(input, self.errors)[0]
> > UnicodeDecodeError: 'ascii' codec can't decode byte 0xc2 in position 55090: ordinal not in range(128)
> >   CC      /tmp/build/perf/tests/expr.o
> > pmu-events/Build:35: recipe for target '/tmp/build/perf/pmu-events/pmu-events.c' failed
> > make[3]: *** [/tmp/build/perf/pmu-events/pmu-events.c] Error 1
> > make[3]: *** Deleting file '/tmp/build/perf/pmu-events/pmu-events.c'
> > Makefile.perf:679: recipe for target '/tmp/build/perf/pmu-events/pmu-events-in.o' failed
> > make[2]: *** [/tmp/build/perf/pmu-events/pmu-events-in.o] Error 2
> > make[2]: *** Waiting for unfinished jobs....

> > Now jevents is an opt-out feature so I'm noticing these problems.
 
>     Thanks for raising it. I will check this issue.

Now I'm seeing this on:

Exception processing pmu-events/arch/arm64/arm/cmn/sys/cmn.json
Traceback (most recent call last):
  File "pmu-events/jevents.py", line 1285, in <module>
    main()
  File "pmu-events/jevents.py", line 1267, in main
    ftw(arch_path, [], preprocess_one_file)
  File "pmu-events/jevents.py", line 1217, in ftw
    ftw(item.path, parents + [item.name], action)
  File "pmu-events/jevents.py", line 1217, in ftw
    ftw(item.path, parents + [item.name], action)
  File "pmu-events/jevents.py", line 1217, in ftw
    ftw(item.path, parents + [item.name], action)
  File "pmu-events/jevents.py", line 1215, in ftw
    action(parents, item)
  File "pmu-events/jevents.py", line 599, in preprocess_one_file
    for event in read_json_events(item.path, topic):
  File "pmu-events/jevents.py", line 416, in read_json_events
    events = json.load(open(path), object_hook=JsonEvent)
  File "/usr/lib/python3.6/json/__init__.py", line 296, in load
    return loads(fp.read(),
  File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
    return codecs.ascii_decode(input, self.errors)[0]
UnicodeDecodeError: 'ascii' codec can't decode byte 0xe2 in position 3071: ordinal not in range(128)

