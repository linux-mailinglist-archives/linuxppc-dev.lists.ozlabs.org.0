Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED5B3F8A39
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 16:38:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwQS06sg2z2ypM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 00:37:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YKJXlsA8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=YKJXlsA8; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwQRH3Tlgz2yQm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 00:37:15 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GwQRG4Nvqz9sWc;
 Fri, 27 Aug 2021 00:37:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629988634;
 bh=lo7cl1uonA1pf1xotZqGtlkiFRxBwZnWeoVot97pM0c=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=YKJXlsA8pB4LnE9qKK6tUN7LBnWjEDnZE4ijV7LpTrqh1zd68gTI2Q1g9Dt9Aj8Yj
 V8oKEp7wVkDAUd3Zi0ZkojOj2zrx3eT2b+yvnFVPokoGaaI3kejwDLkyLcJ6eAP+zh
 lO2F+xHtKy/n1kY1dH072Bwi5UYsaZJe2oX92jWHMgJL9mq5eRLF6v0ahgHcSqtTF4
 x6ZdUW6tfngH8bnlkAbd3UQqTMWrLNgXEEUKX4/logpoJeRyETFeiMDODbEotiWK8D
 VW2M+6VqesgrCuI3j4pAQjjjp9GS4RUDHMVmk5Y2dQeXPfYHMKkmNkeEQostaCu18Y
 Vd/y/IaFrVClg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Paul Moore <paul@paul-moore.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 RESEND] powerpc/audit: Convert powerpc to
 AUDIT_ARCH_COMPAT_GENERIC
In-Reply-To: <CAHC9VhSG8tPAkAAz5Z77HDMKXLAiaEOanxR+oY5c1E_Xoiso9Q@mail.gmail.com>
References: <a4b3951d1191d4183d92a07a6097566bde60d00a.1629812058.git.christophe.leroy@csgroup.eu>
 <CAHC9VhR3E6=5HmRaWMWbp4WHsua02niwnzaRGM3tLqd4Y4LA6w@mail.gmail.com>
 <5a2692b6-5077-21b4-8ebf-73b1c2b83a40@csgroup.eu>
 <CAHC9VhSG8tPAkAAz5Z77HDMKXLAiaEOanxR+oY5c1E_Xoiso9Q@mail.gmail.com>
Date: Fri, 27 Aug 2021 00:37:12 +1000
Message-ID: <87tujc9srr.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Paul Moore <paul@paul-moore.com> writes:
> On Tue, Aug 24, 2021 at 1:11 PM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>> Le 24/08/2021 =C3=A0 16:47, Paul Moore a =C3=A9crit :
>> > On Tue, Aug 24, 2021 at 9:36 AM Christophe Leroy
>> > <christophe.leroy@csgroup.eu> wrote:
>> >>
>> >> Commit e65e1fc2d24b ("[PATCH] syscall class hookup for all normal
>> >> targets") added generic support for AUDIT but that didn't include
>> >> support for bi-arch like powerpc.
>> >>
>> >> Commit 4b58841149dc ("audit: Add generic compat syscall support")
>> >> added generic support for bi-arch.
>> >>
>> >> Convert powerpc to that bi-arch generic audit support.
>> >>
>> >> Cc: Paul Moore <paul@paul-moore.com>
>> >> Cc: Eric Paris <eparis@redhat.com>
>> >> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> >> ---
>> >> Resending v2 with Audit people in Cc
>> >>
>> >> v2:
>> >> - Missing 'git add' for arch/powerpc/include/asm/unistd32.h
>> >> - Finalised commit description
>> >> ---
>> >>   arch/powerpc/Kconfig                |  5 +-
>> >>   arch/powerpc/include/asm/unistd32.h |  7 +++
>> >>   arch/powerpc/kernel/Makefile        |  3 --
>> >>   arch/powerpc/kernel/audit.c         | 84 --------------------------=
---
>> >>   arch/powerpc/kernel/compat_audit.c  | 44 ---------------
>> >>   5 files changed, 8 insertions(+), 135 deletions(-)
>> >>   create mode 100644 arch/powerpc/include/asm/unistd32.h
>> >>   delete mode 100644 arch/powerpc/kernel/audit.c
>> >>   delete mode 100644 arch/powerpc/kernel/compat_audit.c
>> >
>> > Can you explain, in detail please, the testing you have done to verify
>> > this patch?
>> >
>>
>> I built ppc64_defconfig and checked that the generated code is functionn=
aly equivalent.
>>
>> ppc32_classify_syscall() is exactly the same as audit_classify_compat_sy=
scall() except that the
>> later takes the syscall as second argument (ie in r4) whereas the former=
 takes it as first argument
>> (ie in r3).
>>
>> audit_classify_arch() and powerpc audit_classify_syscall() are slightly =
different between the
>> powerpc version and the generic version because the powerpc version chec=
ks whether it is
>> AUDIT_ARCH_PPC or not (ie value 20), while the generic one checks whethe=
r it has bit
>> __AUDIT_ARCH_64BIT set or not (__AUDIT_ARCH_64BIT is the sign bit of a w=
ord), but taking into
>> account that the abi is either AUDIT_ARCH_PPC, AUDIT_ARCH_PPC64 or AUDIT=
_ARCH_PPC64LE, the result is
>> the same.
>>
>> If you are asking I guess you saw something wrong ?
>
> I was asking because I didn't see any mention of testing, and when you
> are enabling something significant like this it is nice to see that it
> has been verified to work :)
>
> While binary dumps and comparisons are nice, it is always good to see
> verification from a test suite.  I don't have access to the necessary
> hardware to test this, but could you verify that the audit-testsuite
> passes on your test system with your patches applied?
>
>  * https://github.com/linux-audit/audit-testsuite

I tested on ppc64le. Both before and after the patch I get the result
below.

So I guess the patch is OK, but maybe we have some existing issue.

I had a bit of a look at the test code, but my perl is limited. I think
it was running the command below, and it returned "<no matches>", but
not really sure what that means.

  $ sudo ausearch -i -m SYSCALL -p 216440 -ui 0 -gi 0 -ul 0 -su unconfined =
_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 -ts recent
  <no matches>

cheers



Running as   user    root
        with context unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
        on   system  Fedora

backlog_wait_time_actual_reset/test .. ok
exec_execve/test ..................... ok
exec_name/test ....................... ok
file_create/test ..................... ok
file_delete/test ..................... ok
file_rename/test ..................... ok
filter_exclude/test .................. 1/21
# Test 20 got: "256" (filter_exclude/test at line 167)
#    Expected: "0"
#  filter_exclude/test line 167 is: ok( $result, 0 );
# Test 21 got: "0" (filter_exclude/test at line 179)
#    Expected: "1"
#  filter_exclude/test line 179 is: ok( $found_msg, 1 );
filter_exclude/test .................. Failed 2/21 subtests
filter_saddr_fam/test ................ ok
filter_sessionid/test ................ ok
login_tty/test ....................... ok
lost_reset/test ...................... ok
netfilter_pkt/test ................... ok
syscalls_file/test ................... ok
syscall_module/test .................. ok
time_change/test ..................... ok
user_msg/test ........................ ok
fanotify/test ........................ ok
bpf/test ............................. ok

Test Summary Report
-------------------
filter_exclude/test                (Wstat: 0 Tests: 21 Failed: 2)
  Failed tests:  20-21
Files=3D18, Tests=3D202, 45 wallclock secs ( 0.18 usr  0.03 sys + 20.15 cus=
r  0.92 csys =3D 21.28 CPU)
Result: FAIL
Failed 1/18 test programs. 2/202 subtests failed.
