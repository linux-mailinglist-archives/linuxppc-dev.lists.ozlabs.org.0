Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF6F54C5A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 12:14:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNLlF1HNDz3dQ6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 20:14:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.126.135; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNLkm2Mp8z302S
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 20:14:22 +1000 (AEST)
Received: from mail-yw1-f171.google.com ([209.85.128.171]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N3bjH-1nbC8p3qD5-010boy for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun
 2022 12:14:17 +0200
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-31756c8143aso7519207b3.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 03:14:16 -0700 (PDT)
X-Gm-Message-State: AJIora8C6nPk192HcraqL1H8IfjjNjM4WvswjNhDIRbcS2xb6abBqE7p
	qWKJRNvBt7KB8YWFK+l9kl7vJQs/naEhOWQGtrw=
X-Google-Smtp-Source: AGRyM1tc1CD3T/V75mltml1RV/EGtx7dMWBJywlVPeKFkpX86eLC6Kc+nnj6VAXLovfPFbFMwM4QIhFnRV8Dvewvij8=
X-Received: by 2002:a81:6ac5:0:b0:317:5299:523d with SMTP id
 f188-20020a816ac5000000b003175299523dmr2197082ywc.249.1655288055350; Wed, 15
 Jun 2022 03:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220601054850.250287-1-rmclure@linux.ibm.com>
 <20220601054850.250287-2-rmclure@linux.ibm.com> <CAK8P3a3jm=02geTcJcfLNpshx1bR1jAnLTzimaaAhB=mGHfJzg@mail.gmail.com>
 <494F2A0A-1C03-4A5A-8BC1-92ACCE34AFE4@linux.ibm.com>
In-Reply-To: <494F2A0A-1C03-4A5A-8BC1-92ACCE34AFE4@linux.ibm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 15 Jun 2022 12:13:58 +0200
X-Gmail-Original-Message-ID: <CAK8P3a29aV9NNHqhv2n6DP=nwT-M0yoVMzQyCnxOBMhxePfFSQ@mail.gmail.com>
Message-ID: <CAK8P3a29aV9NNHqhv2n6DP=nwT-M0yoVMzQyCnxOBMhxePfFSQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] powerpc: Provide syscall wrapper
To: Rohan McLure <rmclure@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:WKvxUTnjNieDPc9zuP7IiW1krNW8txDOaSC4km0nyzxbmR+kYo6
 QzGEfjphf7r0ccaz2Lt3MBtdaK3aTMN+Q74k2XEGD2LTo5yrMTUyMSURlVai9m9jEjVOxRW
 pV3rqUgmdZWbl2CT4Dw33ceK5jQF7IMnANMq54YujlD7snB6Pcs9PGdsjw01npbzrJ3+Ckn
 +VSccJ2YAD1Kjxt3lWXsg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:F9qImbYIZgE=:9ygXqbC+dlI1L9OASL1v13
 B07HeoMSOLAJWL+5DshMVFt6AnxmpYWolPo8o+IlK9dBAUTgfYBtpslY9fp9tZH/SE/W5zK8f
 EHX73NLfrpg4eD041OBq374NMbINUQfrGUZmQ+Ghj5IGTUUz2WEh7NJWvaRESN2/os7itxuC2
 LDQRso62/bOnVmbl6xbOFXV8SneQsmGfNrOqWZReEl9YXph8kDF9/EOLJ2kKqtsrnserCwBNu
 icMZdlvo2EmCM09z20Gu4IifTuGpM9Y04XbM9DnNR3mwErflP8vZcUOAB3XVySqiasDau/3n2
 A6myS7kRSjPlejJr83LCtewJ8945wSLSQl4miMAjcpzSQ2FcCZO7HUGtk9HpidACBDS0njlDJ
 W4yGZePWRrGfeMxvz0S9+Awi034+OS+KjBbOjvUtCOkQt7cMBxk+i8CIL6BWL4LDoInksk/N8
 FEf23+FsemM8AHiXc09vP9hfZqS5SqN8DKT+Ofi5jM2z+d89/3B5Rjvo7pv//pDLAeFsm0+bo
 BlilSk14G+usN2B3Q6+LEgtbEXQVEPhAmhNjgPoNDeV3s2XdUsUTL5qjjj7pbEiNhAnANs+Mb
 pRAOF4z7ccCICRdmWkKExNRkm3an8q5VL34fKT5pUAf5Znw5UPW/C+rUWIkXb+ddOCaNnvTMF
 mN/H+23jTg3AJZTXPxV3oUpR/qq+w9YWFqjGPSygUMJkYuR3VP+A3JmakoPevnV1x6Zy3wQZD
 IR2kVtvtwq6SizTpRnyaN6uAyFJ/kA1pSILnlQ==
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 15, 2022 at 3:47 AM Rohan McLure <rmclure@linux.ibm.com> wrote:
> > On 3 Jun 2022, at 7:04 pm, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Wed, Jun 1, 2022 at 7:48 AM Rohan McLure <rmclure@linux.ibm.com> wrote:

> > What is the benefit of having a separate set of macros for this? I think that
> > adds more complexity than it saves in the end.
>
> I was unsure whether the exact return types needed to be respected for syscall
> handlers or not. I realise that under the existing behaviour,
> system_call_exception performs an indirect call, the return type of which is
> interpreted as a long, so the return type should be irrelevant. On inspection
> PPC_SYSCALL_DEFINE is readily replacable with COMPAT_SYSCALL_DEFINE as you
> have suggested.
>
> Before resubmitting this series, I will try for a patch series which modernises
> syscall handlers in arch/powerpc, and inspect where powerpc private versions
> are strictly necessary, using __ARCH_WANT_... wherever possible.

Ok, great! The parameter ordering is a bit tricky for some of them. I think
in most cases the version used by risc-v now should be the same as what
you need for powerpc (with the appropriate compat_arg_u64_dual()).
If some don't work, I would suggest modifying the common code so it can
handle both riscv and powerpc instead of keeping a private copy.

       Arnd
