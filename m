Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A03799436AD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 21:45:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gZBV4glP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZ2d24PBCz3dBX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 05:45:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gZBV4glP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZ2cM0hxLz3cHS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 05:44:50 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D68F62604;
	Wed, 31 Jul 2024 19:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50466C4AF0B;
	Wed, 31 Jul 2024 19:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722455088;
	bh=n6OG3JGP8rbsblq6dHGstLE8UuPnfTGxS/ia+xm6fOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZBV4glP0RQl+VzMgxITBM4Z2+GWhzHJtekg9XdWla4Rnoq6ikLt30nZ24m4BpvvR
	 npl8jt3iKDxwHJP/mHKWAZJOJeyuyztLydv1bpultBPLSXo13Hri8+5o7cDOr3E/Aw
	 o2qw3PPdkXI4oC1U/7NCDrzdwjYlgowJ2ZRS+hjetFMIbtxuw6r9+LlZrI1Vy5+PV9
	 093ZqPh8Kydjx4bEXCgvrGuVFaQatp8VwXXbq5WwejpIAY94lKU9FVohZXNO07iz8j
	 58MAimThD0JoqqCZfPNcjrzao9a7i4lzlOutQDWaTvveBNPAtVg7UNHoKtoXScjVq5
	 qQMSltnHtlyTw==
Date: Wed, 31 Jul 2024 16:44:45 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Subject: Re: [PATCH] perf vendor events power10: Update JSON/events
Message-ID: <ZqqULZ5pSojnixUh@x1>
References: <20240723052154.96202-1-kjain@linux.ibm.com>
 <CAP-5=fWsQbA-h=_Y_q7z1E7GjCkHE3w-9h-OXu4jLBM3Fag6ag@mail.gmail.com>
 <ZqOt9G9e-AIN6hY-@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZqOt9G9e-AIN6hY-@x1>
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
Cc: maddy@linux.ibm.com, Kajol Jain <kjain@linux.ibm.com>, linux-kernel@vger.kernel.org, akanksha@linux.ibm.com, linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 26, 2024 at 11:08:55AM -0300, Arnaldo Carvalho de Melo wrote:
> On Tue, Jul 23, 2024 at 09:02:23AM -0700, Ian Rogers wrote:
> > On Mon, Jul 22, 2024 at 10:27 PM Kajol Jain <kjain@linux.ibm.com> wrote:
> > >
> > > Update JSON/events for power10 platform with additional events.
> > > Also move PM_VECTOR_LD_CMPL event from others.json to
> > > frontend.json file.
> > >
> > > Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> > 
> > Reviewed-by: Ian Rogers <irogers@google.com>
> 
> Thanks, applied to tmp.perf-tools-next,

This seems to be causing this:

Exception processing pmu-events/arch/powerpc/power10/others.json
Traceback (most recent call last):
  File "pmu-events/jevents.py", line 1309, in <module>
    main()
  File "pmu-events/jevents.py", line 1291, in main
    ftw(arch_path, [], preprocess_one_file)
  File "pmu-events/jevents.py", line 1241, in ftw
    ftw(item.path, parents + [item.name], action)
  File "pmu-events/jevents.py", line 1239, in ftw
    action(parents, item)
  File "pmu-events/jevents.py", line 623, in preprocess_one_file
    for event in read_json_events(item.path, topic):
  File "pmu-events/jevents.py", line 440, in read_json_events
    events = json.load(open(path), object_hook=JsonEvent)
  File "/usr/lib/python3.6/json/__init__.py", line 296, in load
  CC      /tmp/build/perf/bench/evlist-open-close.o
    return loads(fp.read(),
  File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
    return codecs.ascii_decode(input, self.errors)[0]
UnicodeDecodeError: 'ascii' codec can't decode byte 0xe2 in position 9231: ordinal not in range(128)
pmu-events/Build:35: recipe for target '/tmp/build/perf/pmu-events/pmu-events.c' failed
make[3]: *** [/tmp/build/perf/pmu-events/pmu-events.c] Error 1
make[3]: *** Deleting file '/tmp/build/perf/pmu-events/pmu-events.c'
Makefile.perf:763: recipe for target '/tmp/build/perf/pmu-events/pmu-events-in.o' failed
make[2]: *** [/tmp/build/perf/pmu-events/pmu-events-in.o] Error 2
make[2]: *** Waiting for unfinished jobs....
  CC      /tmp/build/perf/tests/hists_cumulate.o
  CC      /tmp/build/perf/arch/powerpc/util/event.o
  CC      /tmp/build/perf/bench/breakpoint.o
  CC      /tmp/build/perf/builtin-data.o


This happened in the past, I'm now trying to figure this out :-\

This was in:

toolsbuilder@five:~$ cat dm.log/ubuntu:18.04-x-powerpc


So 32-bit powerpc, ubuntu 18.04

- Arnaldo
