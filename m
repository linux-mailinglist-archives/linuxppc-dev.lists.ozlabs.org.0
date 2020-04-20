Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E301AFF58
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 02:49:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4957Pq6XPBzDqkh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 10:49:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DpW+N9tW; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4957N51tPJzDqgr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 10:48:03 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id h11so3300462plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 17:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=MsbICPDWcxRGkiVhEunshZhMQoKS6WgXORmQtXYaD9I=;
 b=DpW+N9tWO8d8/jJpKeWD3HZB6OGs7WZ8007rN71DtCQ0QexdeQKrnLu2xT5n1FyYfX
 gEb9+tDeN/+6FhGgudAIEzFVWa89YS3/Nqf6qZ6Rtrs3tPbqTKQ/imMWVkIzA57EDfJS
 wtcK8CC7wuWdpNTK6Vw9cmP7rnDW6nKDIfVZ4htGZa1Xwlu3ZWyzSy5WiEesZ0+aBGGI
 ycxsXP7ITGFHKbOq8pPs3STgRKR6rXGGNUxNwC7h72iC5bdOrbWAPlitDiTcAHCz7r8j
 jzNv+QH8d9Fe7mTCpPunK9CQyxtHQanWvVu5kBMzFfOmvn5Oo1J4i509HK2iQ86r/jer
 Yg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=MsbICPDWcxRGkiVhEunshZhMQoKS6WgXORmQtXYaD9I=;
 b=T9mGOP70VtnzZpz0JGnOd4ncTjgip1UGN0qOAVQ1TDbGZnXiB3wrEVGZli1sTWjpGk
 3ji0SmsISyuNDOJV14xTYRnwFJgsRlA0CA8SUPkEL8jNbFlMkAZus6HS48yk7D2QgOwT
 fT6ryPbUvdccb9bE6+ngDLhJAwkPG5cVN6uehlsOL1YH3eomocaG3pmruWgGtMl+Snzf
 xs8nBTPsqs7pFkhzyChtWd8CUR5S/NogQe3y9Kc6QIuXrV0p9/3BhiL4AI52l3FOMcxx
 Z8eR9reCE1sWHr3hyEBuqtjzEVwpohk67uE8GXm0NGg/Y8tg1R7DejDoo669EvothEdK
 /rEQ==
X-Gm-Message-State: AGi0PuakfSg5T/bfHseByHhSyMbj028zbVhHOOvpvAZTTLUdjmlg+llo
 meqTC163YGT80FRruO7bKO0=
X-Google-Smtp-Source: APiQypLYFCAlptl6m8Gox6gSm0AafwSsC2Sz/gWf64DhHX2yd5cE9fVJ5UfcFd4Z5FUGu6E3lS0J6Q==
X-Received: by 2002:a17:90a:fa17:: with SMTP id
 cm23mr18831304pjb.121.1587343681181; 
 Sun, 19 Apr 2020 17:48:01 -0700 (PDT)
Received: from localhost ([203.185.249.170])
 by smtp.gmail.com with ESMTPSA id e2sm6814708pjt.2.2020.04.19.17.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Apr 2020 17:48:00 -0700 (PDT)
Date: Mon, 20 Apr 2020 10:46:45 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>, Rich Felker
 <dalias@libc.org>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <c2612908-67f7-cceb-d121-700dea096016@linaro.org>
 <20200416153756.GU11469@brightrain.aerifal.cx>
 <4b2a7a56-dd2b-1863-50e5-2f4cdbeef47c@linaro.org>
 <20200416175932.GZ11469@brightrain.aerifal.cx>
 <4f824a37-e660-8912-25aa-fde88d4b79f3@linaro.org>
 <20200416183151.GA11469@brightrain.aerifal.cx>
 <65f70b10-bfc1-e9f6-d48a-4b063ad6b669@linaro.org>
In-Reply-To: <65f70b10-bfc1-e9f6-d48a-4b063ad6b669@linaro.org>
MIME-Version: 1.0
Message-Id: <1587342668.1krc7b5v5v.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: libc-dev@lists.llvm.org, libc-alpha@sourceware.org,
 linuxppc-dev@lists.ozlabs.org, musl@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Adhemerval Zanella's message of April 17, 2020 4:52 am:
>=20
>=20
> On 16/04/2020 15:31, Rich Felker wrote:
>> On Thu, Apr 16, 2020 at 03:18:42PM -0300, Adhemerval Zanella wrote:
>>>
>>>
>>> On 16/04/2020 14:59, Rich Felker wrote:
>>>> On Thu, Apr 16, 2020 at 02:50:18PM -0300, Adhemerval Zanella wrote:
>>>>>
>>>>>
>>>>> On 16/04/2020 12:37, Rich Felker wrote:
>>>>>> On Thu, Apr 16, 2020 at 11:16:04AM -0300, Adhemerval Zanella wrote:
>>>>>>>> My preference would be that it work just like the i386 AT_SYSINFO
>>>>>>>> where you just replace "int $128" with "call *%%gs:16" and the ker=
nel
>>>>>>>> provides a stub in the vdso that performs either scv or the old
>>>>>>>> mechanism with the same calling convention. Then if the kernel doe=
sn't
>>>>>>>> provide it (because the kernel is too old) libc would have to prov=
ide
>>>>>>>> its own stub that uses the legacy method and matches the calling
>>>>>>>> convention of the one the kernel is expected to provide.
>>>>>>>
>>>>>>> What about pthread cancellation and the requirement of checking the
>>>>>>> cancellable syscall anchors in asynchronous cancellation? My plan i=
s
>>>>>>> still to use musl strategy on glibc (BZ#12683) and for i686 it=20
>>>>>>> requires to always use old int$128 for program that uses cancellati=
on
>>>>>>> (static case) or just threads (dynamic mode, which should be more
>>>>>>> common on glibc).
>>>>>>>
>>>>>>> Using the i686 strategy of a vDSO bridge symbol would require to al=
ways
>>>>>>> fallback to 'sc' to still use the same cancellation strategy (and
>>>>>>> thus defeating this optimization in such cases).
>>>>>>
>>>>>> Yes, I assumed it would be the same, ignoring the new syscall
>>>>>> mechanism for cancellable syscalls. While there are some exceptions,
>>>>>> cancellable syscalls are generally not hot paths but things that are
>>>>>> expected to block and to have significant amounts of work to do in
>>>>>> kernelspace, so saving a few tens of cycles is rather pointless.
>>>>>>
>>>>>> It's possible to do a branch/multiple versions of the syscall asm fo=
r
>>>>>> cancellation but would require extending the cancellation handler to
>>>>>> support checking against multiple independent address ranges or usin=
g
>>>>>> some alternate markup of them.
>>>>>
>>>>> The main issue is at least for glibc dynamic linking is way more comm=
on
>>>>> than static linking and once the program become multithread the fallb=
ack
>>>>> will be always used.
>>>>
>>>> I'm not relying on static linking optimizing out the cancellable
>>>> version. I'm talking about how cancellable syscalls are pretty much
>>>> all "heavy" operations to begin with where a few tens of cycles are in
>>>> the realm of "measurement noise" relative to the dominating time
>>>> costs.
>>>
>>> Yes I am aware, but at same time I am not sure how it plays on real wor=
ld.
>>> For instance, some workloads might issue kernel query syscalls, such as
>>> recv, where buffer copying might not be dominant factor. So I see that =
if
>>> the idea is optimizing syscall mechanism, we should try to leverage it
>>> as whole in libc.
>>=20
>> Have you timed a minimal recv? I'm not assuming buffer copying is the
>> dominant factor. I'm assuming the overhead of all the kernel layers
>> involved is dominant.
>=20
> Not really, but reading the advantages of using 'scv' over 'sc' also does
> not outline the real expect gain.  Taking in consideration this should
> be a micro-optimization (focused on entry syscall patch), I think we shou=
ld
> use where it possible.

It's around 90 cycles improvement, depending on config options and=20
speculative mitigations in place, this may be roughly 5-20% of a gettid
syscall, which itself probably bears little relationship to what a recv
syscall doing real work would do, it's easy to swamp it with other work.

But it's a pretty big win in terms of how much we try to optimise this
path.

Thanks,
Nick
