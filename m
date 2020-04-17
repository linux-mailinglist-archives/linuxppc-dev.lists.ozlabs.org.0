Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7131AE683
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 22:09:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493nGy62y8zDrgN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Apr 2020 06:08:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.13; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493nDc5Kd2zDrbv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Apr 2020 06:06:54 +1000 (AEST)
Received: from mail-qt1-f180.google.com ([209.85.160.180]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M4Ja3-1jPoNP2Imf-000PBk for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr
 2020 22:06:50 +0200
Received: by mail-qt1-f180.google.com with SMTP id w24so3036004qts.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 13:06:49 -0700 (PDT)
X-Gm-Message-State: AGi0PuYPtEgPvxh517+geiJo+tcLP1wM0D6SY6BHavX+ptEE2v72KF1V
 XXVTUKKe/1UBShJUQ4gKqP+5hSLw8AyfKUGyHLU=
X-Google-Smtp-Source: APiQypIuVYTMsWNIMRfLctc2Px6V3Nv5laT/h9easo3nN8JdO/iC9u+TYaVOxEylqCGtuWj1RzmpVdKpAc4Qm4vntwk=
X-Received: by 2002:ac8:6757:: with SMTP id n23mr4819273qtp.304.1587154008516; 
 Fri, 17 Apr 2020 13:06:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200414070142.288696-1-hch@lst.de>
 <20200414070142.288696-5-hch@lst.de>
 <CAK8P3a3HvbPKTkwfWr6PbZ96koO_NrJP1qgk8H1mgk=qUScGkQ@mail.gmail.com>
 <20200415074514.GA1393@lst.de>
 <CAK8P3a0QGQX85LaqKC1UuTERk6Bpr5TW6aWF+jxi2cOpa4L_AA@mail.gmail.com>
 <20200417132714.GA6401@lst.de> <87o8rqc7az.fsf@x220.int.ebiederm.org>
In-Reply-To: <87o8rqc7az.fsf@x220.int.ebiederm.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 17 Apr 2020 22:06:32 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0x0vsgVp-pRWd7rL-6Zg9KimNQjJpnp6KG+kS1=eK7wg@mail.gmail.com>
Message-ID: <CAK8P3a0x0vsgVp-pRWd7rL-6Zg9KimNQjJpnp6KG+kS1=eK7wg@mail.gmail.com>
Subject: Re: [PATCH 4/8] binfmt_elf: open code copy_siginfo_to_user to
 kernelspace buffer
To: "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:xOxQvadrI6Xd64ZZILfJmYg+7H53bQcPb8LkahO5WvGMmATJoLz
 U0lEIMDGEp5QY+jUO8bKdhJMXdeFHlxBpHRTUtjrFbrUVzjKZl9aV8xVy78TE6tyU15Q/sf
 N9VDNxRUgxzFM/ouxyRk31DbvjexLmrWkiy00C1A7pvFQ/j9D2vAXUFssqSKE/0v8pZWN4e
 ac+Iqh0HyQvDfmpbEv3Hw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UVWB+BP5jpA=:z+vKHUozGsW4CYhVAG2epm
 93dl5aWlQy12NHcaCdZncE2I3AyV3Zfw6jAau5iD6Zs7+coVrxdrXhIO7GzBaM99xhnOqRFJO
 R6EOEva5sp6KlPjOQaDzxzeGL9wQEBoTHg6yAYB168OldjU0Sn12aRMlvYtYXlmvqz2Rujn1O
 ROTxES8uotycd/mnN4j2PsFZC3koxzi6yoLjjbbTn8p+GB+JTm2hBm+b/DwPuhf1W6JXkm95a
 waEazoQUD92rUwPD2Qldb8ixzaBEnJmeIE7tn2WTnQ1EY33M0MDvPmFeNa+EJ7mxacubKY1TH
 ovxxcg3ThGCKHfNgGeHBChLdzFdzlqXflo8XKhGwdoUvP4MG1fSS2WSaQvROBw1OC0SOowtAd
 DOBOpHjbIa1Kt/iSdins+rJ0jwcmP73bTdmWEjkp/02D4mWoe38uZJa/8AqHD9KpwdlaFfO8E
 XKCoY2+QVJDQII6dFGfSi12SP5x3fgPx4VU3KAX6G/Pl7spM19ZEEBbJRYQjtDO3l2BnzwXyO
 GIn1MAaGkSmV8F+5gOm+CMfIZ6FiPBKOyctCLGYLiLAaMzIDolHMyvpoFzCASvl9cLAHccqo2
 la8PPwIo8vc8MWP9DOsJduQhtXPWozBioyiIvE02IgRITLd4GAOu6gEnsmPkcguEboW6zXHGw
 HWiKRgHiaPhHjurlgpw7JiFobXjVvoCcc7ITwi6WNPwYwIqqoqj0+V6eIaHAS2NRorSi4tkqg
 fSm8JRanPqYb0vNECU0ot1ceAyNt8YLvb6bX9VAst6yWkePKsnCoWhANdSOYwB0akrh7VoFhQ
 kDiLK8wAraK0ORiDSdCYP3zP0BXSuFpvNJjggiZi4IaKyyJWDo=
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
Cc: the arch/x86 maintainers <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jeremy Kerr <jk@ozlabs.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 17, 2020 at 8:13 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> Christoph Hellwig <hch@lst.de> writes:
>
> > On Wed, Apr 15, 2020 at 10:20:11AM +0200, Arnd Bergmann wrote:
> >> > I'd rather keep it out of this series and to
> >> > an interested party.  Then again x32 doesn't seem to have a whole lot
> >> > of interested parties..
> >>
> >> Fine with me. It's on my mental list of things that we want to kill off
> >> eventually as soon as the remaining users stop replying to questions
> >> about it.
> >>
> >> In fact I should really turn that into a properly maintained list in
> >> Documentation/... that contains any options that someone has
> >> asked about removing in the past, along with the reasons for keeping
> >> it around and a time at which we should ask about it again.
> >
> > To the newly added x86 maintainers:  Arnd brought up the point that
> > elf_core_dump writes the ABI siginfo format into the core dump. That
> > format differs for i386 vs x32.  Is there any good way to find out
> > which is the right format when are not in a syscall?
> >
> > As far a I can tell x32 vs i386 just seems to be based around what
> > syscall table was used for the current syscall, but core dumps aren't
> > always in syscall context.
>
> I don't think this matters.  The i386 and x32 signal structures
> only differ for SIGCHLD.  The SIGCHLD signal does cause coredumps.
> So as long as we get the 32bit vs 64bit distinct correct all should be
> well.

Ok, makes sense. Thanks for taking a look into this!

      Arnd
