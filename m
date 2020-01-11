Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA79B137C3F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2020 08:57:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vsdc0FlSzDqjy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2020 18:57:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f42;
 helo=mail-qv1-xf42.google.com; envelope-from=arnaldo.melo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YvNIeLox; dkim-atps=neutral
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vgqD1V1zzDqjV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2020 11:35:03 +1100 (AEDT)
Received: by mail-qv1-xf42.google.com with SMTP id l14so1638443qvu.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 16:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:from:date:user-agent:in-reply-to:references:mime-version
 :content-transfer-encoding:subject:to:cc;
 bh=6ZxdMaOqxAtsCLY7Lzkx2L/EBnUsDnrBslrx0A7xKC4=;
 b=YvNIeLoxxUS8MiKp2Ri8iAcXzrJxtE44cmCaAzEOlIiO3zdIjAdic6y/7gp05iDy+4
 Psa6obfkZ/2miGQ5CBZOM2hPQw13LKvkvkvxdObU65wzP3ra2LNlPLoI/PvksYjlJJGl
 iSS8P5cVN9p61Gb6Nps3ktzRFCv0Ing6Li0w3f+VU2FaDbtR+UbZqnBI7f57XL6zxiwV
 8zc0GQwvgUDLz68MUfzUHbkOWN6RgoAeVP6n6Ni+2wDy9pXZ/Y5jKoEYEgnhpY8BItXX
 +vICW1PeMxcX+zNfgGRTBkMaN4NCrNgM0PyEOAUoMMz1lYO2qTltSh4Ch14nfdS6Qmzl
 zsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:from:date:user-agent:in-reply-to
 :references:mime-version:content-transfer-encoding:subject:to:cc;
 bh=6ZxdMaOqxAtsCLY7Lzkx2L/EBnUsDnrBslrx0A7xKC4=;
 b=a4/tMzNrAPsLLRI7XjtTNFpoPte+gKlCu5RRv9g6rW6NF82GNfcIPaO66gpKc4h8fj
 bBvTm5ts+oBlSQsttVa3HKCiHFxWvk5cEpAVydb19e3ErWtTx1wxv+387EpH+Hl7l2RN
 ifceR+xj+96/MSQG+63jHQk3ikIqustM1qlwGOXpZcXxrLClf0VLFq6SWCJT/jXvLnQz
 XkPMbkiMODsc+GobPjANg6szh2qyXBLMAR6hOjAqSEkkAjcvdf8/0oYuIB8UlnvyXzvv
 8yGQOuoOi8q4nOS+F1FM1pdr0OfOvFNokusVGc4QmHtU41ZsU4xJHV1Ow3AfxElloXm+
 i/sg==
X-Gm-Message-State: APjAAAUg38/Hgwv/B2KAA9NtEOn56zxHIB0tGgEQUD/mMnE/Mj20I1Zo
 GyMfwqNp5pZLjyZXd2sDrck=
X-Google-Smtp-Source: APXvYqxPyWA8KpmKGMVMME8gPN1B98zu6uMFW1TJ+TYPsRSpYEPZl4k9D7BDYVrpcTXTD8zwqLuGjQ==
X-Received: by 2002:a0c:f7c3:: with SMTP id f3mr1362344qvo.52.1578702900264;
 Fri, 10 Jan 2020 16:35:00 -0800 (PST)
Received: from [192.168.86.249] ([179.97.37.151])
 by smtp.gmail.com with ESMTPSA id z141sm1638958qkb.63.2020.01.10.16.34.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Jan 2020 16:34:59 -0800 (PST)
Message-ID: <5e191833.1c69fb81.8bc25.a88c@mx.google.com>
From: arnaldo.melo@gmail.com
Date: Fri, 10 Jan 2020 21:35:12 -0300
User-Agent: K-9 Mail for Android
In-Reply-To: <2B79131A-3F76-47F5-AAB4-08BCA820473F@fb.com>
References: <c0460c78-b1a6-b5f7-7119-d97e5998f308@linux.intel.com>
 <c93309dc-b920-f5fa-f997-e8b2faf47b88@linux.intel.com>
 <20200108160713.GI2844@hirez.programming.kicks-ass.net>
 <cc239899-5c52-2fd0-286d-4bff18877937@linux.intel.com>
 <20200110140234.GO2844@hirez.programming.kicks-ass.net>
 <20200111005213.6dfd98fb36ace098004bde0e@kernel.org>
 <20200110164531.GA2598@kernel.org>
 <20200111084735.0ff01c758bfbfd0ae2e1f24e@kernel.org>
 <2B79131A-3F76-47F5-AAB4-08BCA820473F@fb.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/9] perf/core: open access for CAP_SYS_PERFMON
 privileged process
To: Song Liu <songliubraving@fb.com>,Masami Hiramatsu <mhiramat@kernel.org>
X-Mailman-Approved-At: Sat, 11 Jan 2020 18:51:38 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
	Will Deacon <will.deacon@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Stephane Eranian <eranian@google.com>,
	"james.bottomley@hansenpartnership.com" <james.bottomley@hansenpartnership.com>,
	Paul Mackerras <paulus@samba.org>, Jiri Olsa <jolsa@redhat.com>,
	Andi Kleen <ak@linux.intel.com>,
	Alexey Budankov <alexey.budankov@linux.intel.com>,
	Igor Lubashev <ilubashe@akamai.com>,
	James Morris <jmorris@namei.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>, Serge Hallyn <serge@hallyn.com>,
	Robert Richter <rric@kernel.org>,
	"jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
	"rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
	Namhyung Kim <namhyung@kernel.org>, Kees@lists.ozlabs.org,
	Casey Schaufler <casey@schaufler-ca.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

<keescook@chromium.org>,Jann Horn <jannh@google.com>,Thomas Gleixner <tglx@linutronix.de>,Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,Lionel Landwerlin <lionel.g.landwerlin@intel.com>,linux-kernel <linux-kernel@vger.kernel.org>,"linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>,"selinux@vger.kernel.org" <selinux@vger.kernel.org>,"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,"bpf@vger.kernel.org" <bpf@vger.kernel.org>,"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,"oprofile-list@lists.sf.net" <oprofile-list@lists.sf.net>
From: Arnaldo Carvalho de Melo <acme@kernel.org>
Message-ID: <A7F0BF73-9189-44BA-9264-C88F2F51CBF3@kernel.org>

On January 10, 2020 9:23:27 PM GMT-03:00, Song Liu <songliubraving@fb=2Ecom=
> wrote:
>
>
>> On Jan 10, 2020, at 3:47 PM, Masami Hiramatsu <mhiramat@kernel=2Eorg>
>wrote:
>>=20
>> On Fri, 10 Jan 2020 13:45:31 -0300
>> Arnaldo Carvalho de Melo <acme@kernel=2Eorg> wrote:
>>=20
>>> Em Sat, Jan 11, 2020 at 12:52:13AM +0900, Masami Hiramatsu escreveu:
>>>> On Fri, 10 Jan 2020 15:02:34 +0100 Peter Zijlstra
><peterz@infradead=2Eorg> wrote:
>>>>> Again, this only allows attaching to previously created kprobes,
>it does
>>>>> not allow creating kprobes, right?
>>>=20
>>>>> That is; I don't think CAP_SYS_PERFMON should be allowed to create
>>>>> kprobes=2E
>>>=20
>>>>> As might be clear; I don't actually know what the user-ABI is for
>>>>> creating kprobes=2E
>>>=20
>>>> There are 2 ABIs nowadays, ftrace and ebpf=2E perf-probe uses ftrace
>interface to
>>>> define new kprobe events, and those events are treated as
>completely same as
>>>> tracepoint events=2E On the other hand, ebpf tries to define new
>probe event
>>>> via perf_event interface=2E Above one is that interface=2E IOW, it
>creates new kprobe=2E
>>>=20
>>> Masami, any plans to make 'perf probe' use the perf_event_open()
>>> interface for creating kprobes/uprobes?
>>=20
>> Would you mean perf probe to switch to perf_event_open()?
>> No, perf probe is for setting up the ftrace probe events=2E I think we
>can add an
>> option to use perf_event_open()=2E But current kprobe creation from
>perf_event_open()
>> is separated from ftrace by design=2E
>
>I guess we can extend event parser to understand kprobe directly=2E
>Instead of
>
>	perf probe kernel_func
>	perf stat/record -e probe:kernel_func =2E=2E=2E
>
>We can just do=20
>
>	perf stat/record -e kprobe:kernel_func =2E=2E=2E


You took the words from my mouth, exactly, that is a perfect use case, an =
alternative to the 'perf probe' one of making a disabled event that then ge=
ts activated via record/stat/trace, in many cases it's better, removes the =
explicit probe setup case=2E

Regards,=20

- Arnaldo

>
>Thanks,
>Song

