Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EB73F9170
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 02:53:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gwh64403Nz2ynX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 10:53:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=bk6vfNTo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=paul-moore.com
 (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=paul-moore-com.20150623.gappssmtp.com
 header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=bk6vfNTo; dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gwh5J57VQz2xY0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 10:52:34 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id bt14so10207712ejb.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 17:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kcZjG66xtA/jY29pBRQOPOds6aYeDhJ8jQhY1pZY80A=;
 b=bk6vfNTov+ymNHAHaSlYzg+pXn1z2h9fT4GVPYxh4e4SQY71Z+fwbcXFztimoz1hRx
 zAwLQ1RSvbuz4IRt0ig1e+XVKOZaaMxfKyoyq+Rt6S6gaf9zftZdOG7AxEarsGi3Il2O
 B2czlprwtwo/7hHgL6EAXw4s6UpUrMvEmls2ejoH8ChoWFOu5CcXvRH1ZJUhmrh9yCov
 QOr+bT67MTqhZcIxXeHriyMGroLP6PBDJJ+Q5AMb/5W8KyTeBJVKeIQpy0xmNRi/FRsH
 yEHvmu62DIMfdmj7f4Y5VDYPjELEslbXVqjS0Z6fIHLehadImqvThpAD+b0KDXV31pA/
 hGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kcZjG66xtA/jY29pBRQOPOds6aYeDhJ8jQhY1pZY80A=;
 b=C1LpiEbO25AIbs/pUNOhhsv27iKXfP3fRMyAsblsqnoIiaKWG3BqHotx7ilW4hLYco
 HgMeMnhWZFIqkJesNeEVKIseZpLLJl8tEwsjpeFTCcNrHRKisUf+1ZoHe68Nw5eFNyX4
 IYBLY9VYOLzjKTGqnvpoZEDIOCkegkcI/o5LasjYWFwkaOiSSfZPNrwfJhDVFORF+AkF
 GwVGFQSs7tVg/yOkOGMz/9t/bkrtLL8YemOGVw/6qww1uW7GYpu7iMEYiaGdpWxAcxBB
 cm0oFnaTXlR/z22RApTsd1THR6QKEHCmFvDo/DXx3Uy2T/+0kKL1qwImTM8k7GhvUGxl
 apBg==
X-Gm-Message-State: AOAM531fKD6NRZpBmfMifIQC9TuyLbytgJcaFjlGIyM1erkAIudHK+iu
 M8x/lBHHYIaWtabS8xGkWu9zMvHWDqmteHCfhodI
X-Google-Smtp-Source: ABdhPJzNgmgA/Zd8FwouLieIWH2ENsJn+2AobXdHZoN8I7oJKtub/jVE993grloLZb9EUOCjaGUaPDPKuDihcP2ySkI=
X-Received: by 2002:a17:906:1d59:: with SMTP id
 o25mr7136046ejh.431.1630025548172; 
 Thu, 26 Aug 2021 17:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <a4b3951d1191d4183d92a07a6097566bde60d00a.1629812058.git.christophe.leroy@csgroup.eu>
 <CAHC9VhR3E6=5HmRaWMWbp4WHsua02niwnzaRGM3tLqd4Y4LA6w@mail.gmail.com>
 <5a2692b6-5077-21b4-8ebf-73b1c2b83a40@csgroup.eu>
 <CAHC9VhSG8tPAkAAz5Z77HDMKXLAiaEOanxR+oY5c1E_Xoiso9Q@mail.gmail.com>
 <87tujc9srr.fsf@mpe.ellerman.id.au>
In-Reply-To: <87tujc9srr.fsf@mpe.ellerman.id.au>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 26 Aug 2021 20:52:17 -0400
Message-ID: <CAHC9VhRAbsjifuO+fw4_KpK3ErVM0Dk0Ru3LuZKkeTZvWYc5=w@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] powerpc/audit: Convert powerpc to
 AUDIT_ARCH_COMPAT_GENERIC
To: Michael Ellerman <mpe@ellerman.id.au>, rgb@redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>,
 linux-audit@redhat.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 26, 2021 at 10:37 AM Michael Ellerman <mpe@ellerman.id.au> wrot=
e:
> Paul Moore <paul@paul-moore.com> writes:
> > On Tue, Aug 24, 2021 at 1:11 PM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >> Le 24/08/2021 =C3=A0 16:47, Paul Moore a =C3=A9crit :
> >> > On Tue, Aug 24, 2021 at 9:36 AM Christophe Leroy
> >> > <christophe.leroy@csgroup.eu> wrote:
> >> >>
> >> >> Commit e65e1fc2d24b ("[PATCH] syscall class hookup for all normal
> >> >> targets") added generic support for AUDIT but that didn't include
> >> >> support for bi-arch like powerpc.
> >> >>
> >> >> Commit 4b58841149dc ("audit: Add generic compat syscall support")
> >> >> added generic support for bi-arch.
> >> >>
> >> >> Convert powerpc to that bi-arch generic audit support.
> >> >>
> >> >> Cc: Paul Moore <paul@paul-moore.com>
> >> >> Cc: Eric Paris <eparis@redhat.com>
> >> >> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> >> ---
> >> >> Resending v2 with Audit people in Cc
> >> >>
> >> >> v2:
> >> >> - Missing 'git add' for arch/powerpc/include/asm/unistd32.h
> >> >> - Finalised commit description
> >> >> ---
> >> >>   arch/powerpc/Kconfig                |  5 +-
> >> >>   arch/powerpc/include/asm/unistd32.h |  7 +++
> >> >>   arch/powerpc/kernel/Makefile        |  3 --
> >> >>   arch/powerpc/kernel/audit.c         | 84 ------------------------=
-----
> >> >>   arch/powerpc/kernel/compat_audit.c  | 44 ---------------
> >> >>   5 files changed, 8 insertions(+), 135 deletions(-)
> >> >>   create mode 100644 arch/powerpc/include/asm/unistd32.h
> >> >>   delete mode 100644 arch/powerpc/kernel/audit.c
> >> >>   delete mode 100644 arch/powerpc/kernel/compat_audit.c
> >> >
> >> > Can you explain, in detail please, the testing you have done to veri=
fy
> >> > this patch?
> >> >
> >>
> >> I built ppc64_defconfig and checked that the generated code is functio=
nnaly equivalent.
> >>
> >> ppc32_classify_syscall() is exactly the same as audit_classify_compat_=
syscall() except that the
> >> later takes the syscall as second argument (ie in r4) whereas the form=
er takes it as first argument
> >> (ie in r3).
> >>
> >> audit_classify_arch() and powerpc audit_classify_syscall() are slightl=
y different between the
> >> powerpc version and the generic version because the powerpc version ch=
ecks whether it is
> >> AUDIT_ARCH_PPC or not (ie value 20), while the generic one checks whet=
her it has bit
> >> __AUDIT_ARCH_64BIT set or not (__AUDIT_ARCH_64BIT is the sign bit of a=
 word), but taking into
> >> account that the abi is either AUDIT_ARCH_PPC, AUDIT_ARCH_PPC64 or AUD=
IT_ARCH_PPC64LE, the result is
> >> the same.
> >>
> >> If you are asking I guess you saw something wrong ?
> >
> > I was asking because I didn't see any mention of testing, and when you
> > are enabling something significant like this it is nice to see that it
> > has been verified to work :)
> >
> > While binary dumps and comparisons are nice, it is always good to see
> > verification from a test suite.  I don't have access to the necessary
> > hardware to test this, but could you verify that the audit-testsuite
> > passes on your test system with your patches applied?
> >
> >  * https://github.com/linux-audit/audit-testsuite
>
> I tested on ppc64le. Both before and after the patch I get the result
> below.
>
> So I guess the patch is OK, but maybe we have some existing issue.
>
> I had a bit of a look at the test code, but my perl is limited. I think
> it was running the command below, and it returned "<no matches>", but
> not really sure what that means.

If it makes you feel any better, my perl is *very* limited; thankfully
this isn't my first time looking at that test :)

It's a little odd, but after some basic sanity tests at the top, the
test sets a watch on a file, /tmp/<rando_string>, and tells the kernel
to generate audit records for any syscall that operates on that file.
It then creates, and removes, a series of exclude audit filters to
check if the exclude filtering is working as expected, e.g. when
syscall filtering is excluded there should be no syscall records in
the audit log.

In the case you describe, it looks like it looks like the audit
exclude filter is removed (that's what line 147 does), the
/tmp/<rando_string> file is removed (line 152), and then we check to
see if any syscall records exist (line 164, and yes, there should be
*something* there for the unlink/rm).

It may be of little consolation, but this test works just fine on
recent kernels running on both x86_64 and aarch64.  I don't have
access to a powerpc system of any vintage, but I added Richard to the
To line above in case he has easier access to a test system (I suspect
the RH/IBM linkage should help in this regard).  Otherwise I would
suggest starting to debug this by simply doing some basic tests using
auditctl to create rules and exclude rules to see what is working, and
what isn't; that might provide some clues.

Sorry I'm not much more help at this point :/

>   $ sudo ausearch -i -m SYSCALL -p 216440 -ui 0 -gi 0 -ul 0 -su unconfine=
d _u:unconfined_r:unconfined_t:s0-s0:c0.c1023 -ts recent
>   <no matches>
>
> cheers
>
>
>
> Running as   user    root
>         with context unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c102=
3
>         on   system  Fedora
>
> backlog_wait_time_actual_reset/test .. ok
> exec_execve/test ..................... ok
> exec_name/test ....................... ok
> file_create/test ..................... ok
> file_delete/test ..................... ok
> file_rename/test ..................... ok
> filter_exclude/test .................. 1/21
> # Test 20 got: "256" (filter_exclude/test at line 167)
> #    Expected: "0"
> #  filter_exclude/test line 167 is: ok( $result, 0 );
> # Test 21 got: "0" (filter_exclude/test at line 179)
> #    Expected: "1"
> #  filter_exclude/test line 179 is: ok( $found_msg, 1 );
> filter_exclude/test .................. Failed 2/21 subtests
> filter_saddr_fam/test ................ ok
> filter_sessionid/test ................ ok
> login_tty/test ....................... ok
> lost_reset/test ...................... ok
> netfilter_pkt/test ................... ok
> syscalls_file/test ................... ok
> syscall_module/test .................. ok
> time_change/test ..................... ok
> user_msg/test ........................ ok
> fanotify/test ........................ ok
> bpf/test ............................. ok
>
> Test Summary Report
> -------------------
> filter_exclude/test                (Wstat: 0 Tests: 21 Failed: 2)
>   Failed tests:  20-21
> Files=3D18, Tests=3D202, 45 wallclock secs ( 0.18 usr  0.03 sys + 20.15 c=
usr  0.92 csys =3D 21.28 CPU)
> Result: FAIL
> Failed 1/18 test programs. 2/202 subtests failed.



--=20
paul moore
www.paul-moore.com
