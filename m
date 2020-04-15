Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5D61AACA0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 18:01:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492Rt84lxnzDr6Y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 02:01:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=SQrNtYzd; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492RpD01tJzDqG1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 01:57:55 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id l78so2038282qke.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 08:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=WoLXatgZ0kPKvWwgaZUiwyS4MRwDs1N6m2LhcTxFUGQ=;
 b=SQrNtYzdaavZZqu7QRnrqy3xpHZx5glGFPc1HQx7XouRdlG+N2ZwzS9JS5rVzBfwik
 rA39ye37SXHeFN61uBMzsBF2h9bkN/b+0u4D7YmPd5GyTL/jEkkZM3Mi1VJD9ir+mmm9
 LDIyOSH5DwP55jcpzdaBPfQbLGjRVO+4JZh+f2VWmBqM972bvvHDrRHZSXnVm2kMH3iL
 8caMOfSX6LaXQvJj6t/z63vQqHgYcAOl139tHv+WqFjOe1Fq6ajli9HMLIO6y7C73mAT
 nrXQVipqt61rZK/quil7c1IXOJ/G277L9NsFK1USg3MiyXZ1Coo1xThqO5nwD5q6QhWq
 efOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=WoLXatgZ0kPKvWwgaZUiwyS4MRwDs1N6m2LhcTxFUGQ=;
 b=sXPoTh/tF4g2gvPeAd9AWWURi134vpGPYRtjNFQczsIFCPPUA5oIRAR7k4L5Bypsn2
 6yJgPOiTP0kGgvH7MF0d39lAuSRyhBXmC59VHMUMIdJq9O1nXCNGIgwqn9Mnm8vsAgRs
 F0SI3Lk381vAaLlSOe8aaVGoysGnTm4JsDLKa4k/wnP8gVLUgdEG8k9Qh7GZRPMjhNzG
 OlIthtob+6FpPNFNvaLNWrfz3OqwWunLuN2L46CUWoPgLpsSKO8cJdpRQmIXRKvFh1gS
 8vCNgVqWp4wGm+6Q4FeWBPuSyA8QxSjLoz+ndWKxPPGefyb6fqpLATn7hW13eBELsyrA
 N3Yw==
X-Gm-Message-State: AGi0PuY5+2n53dyM2Y9c71sg3jiPQEL9tw/TieTARFf43GBpSOm/0XJJ
 6fCH/JqwhEWLjejNH+rWMRA92A==
X-Google-Smtp-Source: APiQypJ6oq8MV9YqaOT9f+ss8UoMahcS/0OQWdCdTdAjBjZMpRAFErRQM3Nm2bXq+GnilmSjKgcwxg==
X-Received: by 2002:a37:7605:: with SMTP id r5mr24570359qkc.345.1586966271450; 
 Wed, 15 Apr 2020 08:57:51 -0700 (PDT)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id i4sm12943212qkh.27.2020.04.15.08.57.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Apr 2020 08:57:50 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Linux-next POWER9 NULL pointer NIP since 1st Apr.
From: Qian Cai <cai@lca.pw>
In-Reply-To: <06A2EA93-B730-4DB1-819F-D27E7032F0B3@lca.pw>
Date: Wed, 15 Apr 2020 11:57:50 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <161662E3-5D9C-4C15-919C-CFEFE4CC35CB@lca.pw>
References: <15AC5B0E-A221-4B8C-9039-FA96B8EF7C88@lca.pw>
 <87eeszlb6u.fsf@mpe.ellerman.id.au>
 <0675B22E-8F32-432C-9378-FDE159DD1729@lca.pw>
 <20200407093054.3eb23e45@gandalf.local.home>
 <EA9F9A54-87BC-477A-BE8A-7D53F80C5223@lca.pw>
 <20200409101413.35d9c72d@gandalf.local.home>
 <06A2EA93-B730-4DB1-819F-D27E7032F0B3@lca.pw>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
Cc: Steven Rostedt <rostedt@goodmis.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Apr 10, 2020, at 3:20 PM, Qian Cai <cai@lca.pw> wrote:
>=20
>=20
>=20
>> On Apr 9, 2020, at 10:14 AM, Steven Rostedt <rostedt@goodmis.org> =
wrote:
>>=20
>> On Thu, 9 Apr 2020 06:06:35 -0400
>> Qian Cai <cai@lca.pw> wrote:
>>=20
>>>>> I=E2=80=99ll go to bisect some more but it is going to take a =
while.
>>>>>=20
>>>>> $ git log --oneline 4c205c84e249..8e99cf91b99b
>>>>> 8e99cf91b99b tracing: Do not allocate buffer in =
trace_find_next_entry() in atomic
>>>>> 2ab2a0924b99 tracing: Add documentation on set_ftrace_notrace_pid =
and set_event_notrace_pid
>>>>> ebed9628f5c2 selftests/ftrace: Add test to test new =
set_event_notrace_pid file
>>>>> ed8839e072b8 selftests/ftrace: Add test to test new =
set_ftrace_notrace_pid file
>>>>> 276836260301 tracing: Create set_event_notrace_pid to not trace =
tasks =20
>>>>=20
>>>>> b3b1e6ededa4 ftrace: Create set_ftrace_notrace_pid to not trace =
tasks
>>>>> 717e3f5ebc82 ftrace: Make function trace pid filtering a bit more =
exact =20
>>>>=20
>>>> If it is affecting function tracing, it is probably one of the =
above two
>>>> commits. =20
>>>=20
>>> OK, it was narrowed down to one of those messed with mcount here,
>>=20
>> Thing is, nothing here touches mcount.
>=20
> Yes, you are right. I went back to test the commit just before the =
5.7-trace merge request,
> I did reproduce there. The thing is that this bastard could take more =
6-hour to happen,
> so my previous attempt did not wait long enough. Back to the square =
one=E2=80=A6

OK, I starts to test all commits up to 12 hours. The progess on far is,

BAD: v5.6-rc1
GOOD: v5.5
GOOD: 153b5c566d30 Merge tag 'microblaze-v5.6-rc1' of =
git://git.monstr.eu/linux-2.6-microblaze

The next step I=E2=80=99ll be testing,

71c3a888cbca Merge tag 'powerpc-5.6-1' of =
git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux

IF that is BAD, the merge request is the culprit. I can see a few =
commits are more related that others.

5290ae2b8e5f powerpc/64: Use {SAVE,REST}_NVGPRS macros
ed0bc98f8cbe powerpc/64s: Reimplement power4_idle code in C

Does it ring any bell yet?


