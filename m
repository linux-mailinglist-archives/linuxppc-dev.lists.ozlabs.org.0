Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E15701B1FF3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 09:37:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495wPW2kwzzDr3y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 17:37:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.187; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495wMj1mzQzDr08
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 17:35:27 +1000 (AEST)
Received: from mail-qk1-f180.google.com ([209.85.222.180]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MLAAs-1jhucC239O-00IA8c for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr
 2020 09:35:22 +0200
Received: by mail-qk1-f180.google.com with SMTP id b62so13570657qkf.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 00:35:22 -0700 (PDT)
X-Gm-Message-State: AGi0Pua8D59o51VCBRLcUBdZETEu/MOvc15FD7uoGqSyhTAvbVqJhNn6
 MWC8yyI6T/00nRUMket8rum1RyddVZhgxeWIA+8=
X-Google-Smtp-Source: APiQypKjNuE0ov8Q5Kh3Qj5sUqm6RehBU38JdwRRhHvt/JhsbR78RtqaPmzF8wumGWq33NI4eFIPzDfFc/G5Q1axl8w=
X-Received: by 2002:a37:a046:: with SMTP id j67mr20340914qke.286.1587454521357; 
 Tue, 21 Apr 2020 00:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587401492.git.christophe.leroy@c-s.fr>
 <CAK8P3a11t=piuDq+TuGMo0xDiN06OLMxsym0PGiWNv5qYSUXLQ@mail.gmail.com>
 <268ff4cf-2f30-fead-fef5-e8e5f8f17aba@c-s.fr>
In-Reply-To: <268ff4cf-2f30-fead-fef5-e8e5f8f17aba@c-s.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 21 Apr 2020 09:35:05 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3iHf3TAZtiBH4L23LqyfVUmTpKk339Wtv+d1FcuYRD6A@mail.gmail.com>
Message-ID: <CAK8P3a3iHf3TAZtiBH4L23LqyfVUmTpKk339Wtv+d1FcuYRD6A@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] powerpc: switch VDSO to C implementation
To: Christophe Leroy <christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ndQi9amuyO47DbidkLhi4RhRgmC3gRfNhRdiMgtAOfo9tTKxAfI
 DLR7UUeZAD/DMHO+zY1SX18jqst5+OrHUN4i5XYecEchgTRKuWJcgPXcr0AEQ4nnaWDk2xY
 PSwiURvrO4hLyh1dAx1id/65KrRfawBlEc2tu+0hNrrgmTREvQq9k0yA5l2Iw/eN0pqK6EE
 Qzh7nX9QuGIisRBQDE+iQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:r9JMx5Kes7g=:U6kJ1C1T5siKWULp5oFWRi
 YYZlgNU/UXwxS9xnxOntFsZHsP04ys53G4aVBCzC+XRmvCZKhofxe1YIJ66Q9r4FeuZI00vl/
 nDh0aW8xN6KqNSNf4ulMrO7JSligWa8uL/pE4UalnCkIWBF3ybiWUCLgOH7TgmAvuqrF8Y7Rk
 5eQ6OyzDhHyz3TZeW5ZwxP5yc65vEzjTqv+g/EQrfoNeQuqVoIE9vNjUmbWhAhDTE1aInZ+Zi
 QufgthOe5LB9vYnMgYFYzvfNXuz27NV9lfwVlqfK1pvhrIk7HKQ2MaDCLX/0SQGnmBbR7sXeQ
 +m0m2+FbyEDBAeTp2gqoiV1srA9n76JUYWnbSaUpeieJCbR5HRPez5hnNyDuJYEykjUE4S9Dy
 OCvj/g45/N2aerva++dl7EmWlGhVJvxOWR+f9uT6BpNUviAA1FCMytwqZBbbHQ79jzfLl6VHJ
 Bqh1tLYqROpCkRuctvGQO9iOch9G1CCTFGFU4pIoG1yOvzM4UdX2g/4R+8aLgHHpxVIhrvVTz
 XESDcrcd0eRSemxfAZ+5pgMFDuSYC5R4LZmVloV3H4Jt5xuNjL1RXr/hJ6M6OzeuzACg8BiU+
 eBnBvFrFcAjPx1aMFLjCfnW6EYmFN8ItJ0VT8j6RPvn7CpaVy9IGzNBDk89SVeJ/WuBSiQ8Up
 w/Gw/TM5COIOlERvkx+Zv/Q0ANB4NdSNMv25j+InkrBrhYwZ6kPzpke5xZzLGGWJCMR9z4NhU
 PT3oYeA8ImJLUGXzrK9HLPT1F2gjQNbyGdaNwG9VffL40vJa2LjnE+bZSKjhGYAp8g3NXGcO2
 +rqqT6Kq/bN7cG0AkKuBqmpZsHpcDe4P+6YhHF6jZ95gc5xRf0=
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 21, 2020 at 8:56 AM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
> Le 20/04/2020 =C3=A0 21:57, Arnd Bergmann a =C3=A9crit :
>
> Yes that was one of the objective, be able to add that as a second step.
> First objective was adding the missing clocks and increasing
> maintainability.
>
> I can add a patch for that now, it looks easy, but how do I test it ?
> vdsotest from Nathan doesn't seem to test that.

I wasn't aware of vdsotest, but I suppose it should be fixed in there
as well. It's only one extra call that is supposed to be available on
all 32-bit architectures.

The other thing to try is musl libc 1.2, or any distro based on it.
https://distfiles.adelielinux.org/adelie/1.0/iso/rc1/ has a ppc32
image file.

I think this is all you should need to do to enable vdso in musl:

--- a/arch/powerpc/syscall_arch.h
+++ b/arch/powerpc/syscall_arch.h
@@ -92,3 +92,9 @@ static inline long __syscall6(long n, long a, long
b, long c, long d, long e, lo

 #define SO_RCVTIMEO_OLD  18
 #define SO_SNDTIMEO_OLD  19
+
+#define VDSO_USEFUL
+#define VDSO_CGT32_SYM "__vdso_clock_gettime"
+#define VDSO_CGT32_VER "LINUX_2.6"
+#define VDSO_CGT_SYM "__vdso_clock_gettime64"
+#define VDSO_CGT_VER "LINUX_2.6"

At the moment, the vdso is just disabled for powerpc because there is no
__vdso_clock_gettime64 definition in the kernel.

> > Without it, any 32-bit user space has to go through the system call
> > for time()/getttimeofday()/clock_gettime() when built with a
> > modern libc.
> >
>
> How modern ? I have glibc 2.28, the only symbols it seems to know are
> (extracted with 'strings') :
>
> __vdso_clock_gettime
> __vdso_time
> __vdso_get_tbfreq
> __vdso_getcpu
> __vdso_clock_getres
> __vdso_sigtramp32
> __vdso_sigtramp_rt32
> __vdso_gettimeofday

Mainline glibc still doesn't have it, I don't know when it will,
presumably either
the coming 2.32 release, or 2.33. There is a tree at
https://github.com/lmajewski/y2038_glibc/commits/y2038_edge that has the
necessary changes, and it is slowly getting merged upstream.

       Arnd
