Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F74F0D1D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 04:37:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477Bzb0k1zzF5NG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 14:36:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477BxS4W6YzF4kc
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 14:35:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="Zue3TGj5"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 477BxS0Hdwz9sPK;
 Wed,  6 Nov 2019 14:35:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1573011308;
 bh=5tQVxw9udsjAubC6/XLuiktJFlolgo185dw0xi1l250=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Zue3TGj5O8+EIJd/FUI5Bn99EHDcdX8d0UDWFnUe+Qk0QtdYIRbolyWO5lGrHK6Gl
 jqoPnliFjLIkLFR90M7S5cYS2VTGJji0jxKPcJbPuDhOs0ZBRx2vw0bJb0fNSZVy7F
 D3QDKNZWd2PdexNHreMufboo0EK1Kvh3cD0bRBylxI2XadZX9+fobrKqXoK/IRJ5An
 nCwT/AR0/tg6Ok/QIKZK9GqEfohPMd7cEdQ255W1DHqmeiHEb1X7P02EEhBL7byMmT
 I1YpNBex0hrDkn3mMyoe26xfel2bKfSdNxH2FfLkPoJSep8k3zY/Ercl7c3q7GmdTw
 0xdIXVte0bX7w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: John Hubbard <jhubbard@nvidia.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] cpufreq: powernv: fix stack bloat and NR_CPUS
 limitation
In-Reply-To: <405c2ac2-a61c-e7e6-3487-c55bcdf1e839@nvidia.com>
References: <20191018045539.3765565-1-jhubbard@nvidia.com>
 <87pnidbptw.fsf@mpe.ellerman.id.au>
 <405c2ac2-a61c-e7e6-3487-c55bcdf1e839@nvidia.com>
Date: Wed, 06 Nov 2019 14:35:05 +1100
Message-ID: <87d0e5wuc6.fsf@mpe.ellerman.id.au>
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
Cc: Preeti U Murthy <preeti@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

John Hubbard <jhubbard@nvidia.com> writes:
> On 10/30/19 7:39 PM, Michael Ellerman wrote:
>> Hi John,
>> 
>> Sorry I didn't reply to this sooner, too many patches :/
>> 
>> John Hubbard <jhubbard@nvidia.com> writes:
>>> The following build warning occurred on powerpc 64-bit builds:
>>>
>>> drivers/cpufreq/powernv-cpufreq.c: In function 'init_chip_info':
>>> drivers/cpufreq/powernv-cpufreq.c:1070:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>> 
>> Oddly I don't see that warning in my builds, eg with GCC9:
>> 
>>    https://travis-ci.org/linuxppc/linux/jobs/604870722
>
> This is with a cross-compiler based on gcc 8.1.0, which I got from:
>    https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/8.1.0/
>
> I'll put that in the v3 commit description.
>
>> 
>>> This is due to putting 1024 bytes on the stack:
>>>
>>>      unsigned int chip[256];
>>>
>>> ...and while looking at this, it also has a bug: it fails with a stack
>>> overrun, if CONFIG_NR_CPUS > 256.
>> 
>> It _probably_ doesn't, because it only increments the index when the
>> chip_id of the CPU changes, ie. it doesn't create a chip for every CPU.
>> But I agree it's flaky the way it's written.
>
> I'll soften up the wording accordingly.
>
>> 
>>> Fix both problems by dynamically allocating based on CONFIG_NR_CPUS.
>> 
>> Shouldn't it use num_possible_cpus() ?
>> 
>> Given the for loop is over possible CPUs that seems like the upper
>> bound. In practice it should be lower because some CPUs will share a
>> chip.
>> 
>
> OK, I see, that's more consistent with the code, I'll change to that.

Thanks.

cheers
