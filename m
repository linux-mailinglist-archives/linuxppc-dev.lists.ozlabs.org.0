Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABAA18B24E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 12:28:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jl5821VczDqBx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 22:27:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jkyN3JpmzDr5n
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 22:22:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=jPns8Zj4; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48jkyJ4c93z9sQt;
 Thu, 19 Mar 2020 22:22:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584616922;
 bh=EEchnxXtnjsxaM2QrIQOc4QB6WvA6Z7scPBjPCIHTLw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=jPns8Zj45gHQLCIXDaac06BYlBNrlEfdIA/AyVRhSvWuFR+bSj6L3xUOlxAeLAT7Y
 IimhyEhBlVePcdOLNWU++TkB4dTNn6/fWpVDVzmvLjSRL3n+C/bhTKCIBp4ybK2VI4
 a818JY9LzjnY7BK8obSeDZhTko1z2dzxiS8xhKrpPOT8TKQkcLFCeG5P9tUM5guDbT
 7RbLWW+cSm/44zSyDEzwJxehyxpWzR3KojDp6N0uEB/+QwcwpUf5bdTr1YJv9TMO2b
 VcZK/Ck0u0ikk8DV+5ArdmgIiZ9GPL+iW4lOqXAPiOit4L52Yeq+QY6sN9tQYGf407
 D2r+081Ra/Mhw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kim Phillips <kim.phillips@amd.com>, maddy <maddy@linux.ibm.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [RFC 00/11] perf: Enhancing perf to export processor hazard
 information
In-Reply-To: <8803550e-5d6d-2eda-39f5-e4594052188c@amd.com>
References: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
 <20200302101332.GS18400@hirez.programming.kicks-ass.net>
 <CABPqkBSzwpR6p7UZs7g1vWGCJRLsh565mRMGc6m0Enn1SnkC4w@mail.gmail.com>
 <df966d6e-8898-029f-e697-8496500a1663@amd.com>
 <2550ec4d-a015-4625-ca24-ff10632dbe2e@linux.ibm.com>
 <d3c82708-dd09-80e0-4e9f-1cbab118a169@amd.com>
 <8a4d966c-acc9-b2b7-8ab7-027aefab201c@linux.ibm.com>
 <f226f4c5-6310-fd6b-ee76-aebd938ec212@amd.com>
 <0c5e94a3-e86e-f7cb-d668-d542b3a8ae29@linux.ibm.com>
 <8803550e-5d6d-2eda-39f5-e4594052188c@amd.com>
Date: Thu, 19 Mar 2020 22:22:03 +1100
Message-ID: <87o8ssd1yc.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andi Kleen <ak@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Jiri Olsa <jolsa@redhat.com>,
 Alexey Budankov <alexey.budankov@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Stephane Eranian <eranian@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 yao.jin@linux.intel.com, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Robert Richter <robert.richter@amd.com>, Namhyung Kim <namhyung@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, "Liang, Kan" <kan.liang@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kim Phillips <kim.phillips@amd.com> writes:
> On 3/17/20 1:50 AM, maddy wrote:
>> On 3/13/20 4:08 AM, Kim Phillips wrote:
>>> On 3/11/20 11:00 AM, Ravi Bangoria wrote:
>>>
>>>> information on each sample using PMI at periodic intervals. Hence proposing
>>>> PERF_SAMPLE_PIPELINE_HAZ.
>>>
>>> And that's fine for any extra bits that POWER9 has to convey
>>> to its users beyond things already represented by other sample
>>> types like PERF_SAMPLE_DATA_SRC, but the capturing of both POWER9
>>> and other vendor e.g., AMD IBS data can be made vendor-independent
>>> at record time by using SAMPLE_AUX, or SAMPLE_RAW even, which is
>>> what IBS currently uses.
>> 
>> My bad. Not sure what you mean by this. We are trying to abstract
>> as much vendor specific data as possible with this (like perf-mem).
>
> Perhaps if I say it this way: instead of doing all the 
> isa207_get_phazard_data() work past the mfspr(SPRN_SIER)
> in patch 4/11, rather/instead just put the raw sier value in a 
> PERF_SAMPLE_RAW or _AUX event, and call perf_event_update_userpage.
> Specific SIER capabilities can be written as part of the perf.data
> header.  Then synthesize the true pipe events from the raw SIER
> values later, and in userspace.

In the past the perf maintainers have wanted the perf API to abstract
over the specific CPU details, rather than just pushing raw register
values out to userspace.

But maybe that's no longer the case and we should just use
PERF_SAMPLE_AUX?

cheers
