Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29756944E98
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 16:56:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W8V3pXiP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZX9S0b7Vz3dSv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 00:56:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W8V3pXiP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZX8m4LVRz30Vy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2024 00:56:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 86DAACE1A0F;
	Thu,  1 Aug 2024 14:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C121C32786;
	Thu,  1 Aug 2024 14:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722524164;
	bh=SG3RYJhX3+jiM/X52pwZqY4Sh+L93Ivw4rMUMnZXjVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W8V3pXiPGedzN8ETgDuURnhyKs0g5HAmzvhEkbZI6oriOoncq6/Angg8c6Z45J7X0
	 6ru52lpcT/I3qePAKAkE5Eg/B1SuLuGqLlBbGDUQvYucloDH/5k2RF67P466n7nmk9
	 ulhEz1DAW4vbL7V8gPjEKVLPZY0gmieGq3jen+a9TDBdOHeze9hi176IRrcvUpv/1F
	 q3aUrqEpYw8p2EyPU3eICJ4YvuIP0uXCrOHTAssGKdsRoLWWSC4nTWztrDkkct4xTa
	 MDumtLCc0kuzPrEEUQdWtsLY78qLS84v2Vf3P6yAjsjVSYCK1juUcjuO2t8393vg9e
	 CTRgZ5ALRWU6g==
Date: Thu, 1 Aug 2024 11:56:01 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: kajoljain <kjain@linux.ibm.com>
Subject: Re: [PATCH] perf vendor events power10: Update JSON/events
Message-ID: <ZquiAS74kQQ-TCtv@x1>
References: <20240723052154.96202-1-kjain@linux.ibm.com>
 <CAP-5=fWsQbA-h=_Y_q7z1E7GjCkHE3w-9h-OXu4jLBM3Fag6ag@mail.gmail.com>
 <ZqOt9G9e-AIN6hY-@x1>
 <ZqqULZ5pSojnixUh@x1>
 <ZqqbO54hbW5Tzk9Y@x1>
 <ac3ce4aa-146b-4be9-9edc-1533d0b7dc98@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac3ce4aa-146b-4be9-9edc-1533d0b7dc98@linux.ibm.com>
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
Cc: Ian Rogers <irogers@google.com>, maddy@linux.ibm.com, linux-kernel@vger.kernel.org, akanksha@linux.ibm.com, linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 01, 2024 at 01:03:44PM +0530, kajoljain wrote:
> 
> 
> On 8/1/24 01:44, Arnaldo Carvalho de Melo wrote:
> > On Wed, Jul 31, 2024 at 04:44:49PM -0300, Arnaldo Carvalho de Melo wrote:
> >> On Fri, Jul 26, 2024 at 11:08:55AM -0300, Arnaldo Carvalho de Melo wrote:
> >>> On Tue, Jul 23, 2024 at 09:02:23AM -0700, Ian Rogers wrote:
> >>>> On Mon, Jul 22, 2024 at 10:27 PM Kajol Jain <kjain@linux.ibm.com> wrote:
> >>>>>
> >>>>> Update JSON/events for power10 platform with additional events.
> >>>>> Also move PM_VECTOR_LD_CMPL event from others.json to
> >>>>> frontend.json file.
> >>>>>
> >>>>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> >>>>
> >>>> Reviewed-by: Ian Rogers <irogers@google.com>
> >>>
> >>> Thanks, applied to tmp.perf-tools-next,
> >>
> >> This seems to be causing this:
> >>
> >> Exception processing pmu-events/arch/powerpc/power10/others.json
> >> Traceback (most recent call last):
> >>   File "pmu-events/jevents.py", line 1309, in <module>
> >>     main()
> >>   File "pmu-events/jevents.py", line 1291, in main
> >>     ftw(arch_path, [], preprocess_one_file)
> >>   File "pmu-events/jevents.py", line 1241, in ftw
> >>     ftw(item.path, parents + [item.name], action)
> >>   File "pmu-events/jevents.py", line 1239, in ftw
> >>     action(parents, item)
> >>   File "pmu-events/jevents.py", line 623, in preprocess_one_file
> >>     for event in read_json_events(item.path, topic):
> >>   File "pmu-events/jevents.py", line 440, in read_json_events
> >>     events = json.load(open(path), object_hook=JsonEvent)
> >>   File "/usr/lib/python3.6/json/__init__.py", line 296, in load
> >>   CC      /tmp/build/perf/bench/evlist-open-close.o
> >>     return loads(fp.read(),
> >>   File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
> >>     return codecs.ascii_decode(input, self.errors)[0]
> >> UnicodeDecodeError: 'ascii' codec can't decode byte 0xe2 in position 9231: ordinal not in range(128)
> >> pmu-events/Build:35: recipe for target '/tmp/build/perf/pmu-events/pmu-events.c' failed
> >> make[3]: *** [/tmp/build/perf/pmu-events/pmu-events.c] Error 1
> >> make[3]: *** Deleting file '/tmp/build/perf/pmu-events/pmu-events.c'
> >> Makefile.perf:763: recipe for target '/tmp/build/perf/pmu-events/pmu-events-in.o' failed
> >> make[2]: *** [/tmp/build/perf/pmu-events/pmu-events-in.o] Error 2
> >> make[2]: *** Waiting for unfinished jobs....
> >>   CC      /tmp/build/perf/tests/hists_cumulate.o
> >>   CC      /tmp/build/perf/arch/powerpc/util/event.o
> >>   CC      /tmp/build/perf/bench/breakpoint.o
> >>   CC      /tmp/build/perf/builtin-data.o
> >>
> >>
> >> This happened in the past, I'm now trying to figure this out :-\
> >>
> >> This was in:
> >>
> >> toolsbuilder@five:~$ cat dm.log/ubuntu:18.04-x-powerpc
> >>
> >>
> >> So 32-bit powerpc, ubuntu 18.04
> > 
> > This did the trick, so I fixed it in my repo, please ack, just replacing
> > ’ with ' :-\
> > 
> > - Arnaldo
> > 
> 
> Hi Arnaldo,
>   Thanks for fixing it. I will make sure in next series of patches, we
> are also checking for this combination to avoid ascii issue.
> 
> Change looks fine to me.

Thanks for checking,

- Arnaldo
 
> Thanks,
> Kajol Jain
> 
> > 
> > diff --git a/tools/perf/pmu-events/arch/powerpc/power10/others.json b/tools/perf/pmu-events/arch/powerpc/power10/others.json
> > index 53ca610152faa237..3789304cb363bbb7 100644
> > --- a/tools/perf/pmu-events/arch/powerpc/power10/others.json
> > +++ b/tools/perf/pmu-events/arch/powerpc/power10/others.json
> > @@ -197,6 +197,6 @@
> >    {
> >      "EventCode": "0x0B0000026880",
> >      "EventName": "PM_L2_SNP_TLBIE_SLBIE_DELAY",
> > -    "BriefDescription": "Cycles when a TLBIE/SLBIEG/SLBIAG that targets this thread's LPAR was in flight while in a hottemp condition. Multiply this count by 1000 to obtain the total number of cycles. This can be divided by PM_L2_SNP_TLBIE_SLBIE_START to obtain the overall efficiency. Note: ’inflight’ means SnpTLB has been sent to core(ie doesn’t include when SnpTLB is in NCU waiting to be launched serially behind different SnpTLB). The NCU Snooper gets in a ’hottemp’ delay window when it detects it is above its TLBIE/SLBIE threshold for process SnpTLBIE/SLBIE with this core. Event count should be multiplied by 2 since the data is coming from a 2:1 clock domain and the data is time sliced across all 4 threads."
> > +    "BriefDescription": "Cycles when a TLBIE/SLBIEG/SLBIAG that targets this thread's LPAR was in flight while in a hottemp condition. Multiply this count by 1000 to obtain the total number of cycles. This can be divided by PM_L2_SNP_TLBIE_SLBIE_START to obtain the overall efficiency. Note: 'inflight' means SnpTLB has been sent to core(ie doesn't include when SnpTLB is in NCU waiting to be launched serially behind different SnpTLB). The NCU Snooper gets in a 'hottemp' delay window when it detects it is above its TLBIE/SLBIE threshold for process SnpTLBIE/SLBIE with this core. Event count should be multiplied by 2 since the data is coming from a 2:1 clock domain and the data is time sliced across all 4 threads."
> >    }
> >  ]
> > 
