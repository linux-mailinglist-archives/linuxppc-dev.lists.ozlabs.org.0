Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 682811BC4FD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 18:20:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BRhj3XvbzDqsQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 02:20:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.73; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BRLv3GgCzDqXK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 02:05:25 +1000 (AEST)
Received: from mail-lf1-f53.google.com ([209.85.167.53]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mo6zF-1ioeok4879-00pZIs for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr
 2020 18:05:22 +0200
Received: by mail-lf1-f53.google.com with SMTP id u10so17350586lfo.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 09:05:21 -0700 (PDT)
X-Gm-Message-State: AGi0Pubu+2TSf7BosVsTDw4Y9SRnb11zF9ZzaCDP36/kcPVbdiunyu0W
 A1rE8zEKsF03z4q+Zujfg1kB6+kgF/Gf40iRim8=
X-Google-Smtp-Source: APiQypLrh7goUYFCcrHRyRyMKDsyAveCKs6dCpTFYxufTmhSFxrioTA6Q8bARt9FHX/ytYSEYl2HA7MOF3TO7A8k8/I=
X-Received: by 2002:a19:40d0:: with SMTP id
 n199mr19399076lfa.161.1588089920707; 
 Tue, 28 Apr 2020 09:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588079622.git.christophe.leroy@c-s.fr>
 <e78344d3fcc1d33bfb1782e430b7f0529f6c612f.1588079622.git.christophe.leroy@c-s.fr>
In-Reply-To: <e78344d3fcc1d33bfb1782e430b7f0529f6c612f.1588079622.git.christophe.leroy@c-s.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 28 Apr 2020 18:05:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2aXJRWjxWO8oMRX2AJkfeVeeoYbOPbpd9-UTgjqM4B7g@mail.gmail.com>
Message-ID: <CAK8P3a2aXJRWjxWO8oMRX2AJkfeVeeoYbOPbpd9-UTgjqM4B7g@mail.gmail.com>
Subject: Re: [PATCH v8 8/8] powerpc/vdso: Provide __kernel_clock_gettime64()
 on vdso32
To: Christophe Leroy <christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:RPc7aXzOZ9u4gOnMhJlFaph954I/iIvI7v68QVdEZ05G+R34Z78
 Bz4q4GCJSwkaEP/t2QDG47S9vB8pFDUcDijPZlxVpzSrIQTxqAmjf5tb8yIlf/xaJc2UOBX
 D5ZGEdKyILwQRu+jtuF1VMBptI619Em/guHEGDrZVM0frE6PxjrrigHv+8VkCbLHEBKZ82l
 WYeafWWpYcukJs+oUiv2g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0Uqc4wiiA/8=:ijTph+4YAb+mfEzO5/Z/TX
 K47MoyqFZ9TmDkB/kx1XZGjN8Na6iqjjrbTCTmdZhHq7wQiMwM1anTtsJpTMAwpeDcWdbaOIH
 fgaiSUmiD47qg11PMGK9k/UIO59rthMPgzMmDnHUcL/l7w1dT0ARthYt7AVBFArvhMIr6s2Mw
 s+XrjT/8hmC87WEkqsgqCeQWlUetgU5A/kO4JSAsJCx3hqfxs7bD0Ww9t2z0OjasXHFL9IZEk
 muxg0fLrrbXwZQE85CByzZ9jgAvV8W/mspfW0WJYms/cdAdHwH0bdQDwZZcXEPplKBZc+C7i+
 3rXuP18UtZCRS7ksrtc2i7U0Mi7LqxPA/hAll+4C1pdYeUUD/MOGgCf6iS5vIwXF4VjI/T3g0
 YkUPz6B8eu86zU3bMGwFyZvM7NVr/hqq44jWYfyspLg2obXLYGV8okSNp5ogTLBbJbtxe0uw4
 IUELUgC1WEG2ZXAUhvgwzNxlgZykVK16vIKFM16s6dXxVtGyztoeFaCIFntfSAHu+kZhvQP8V
 bzEs6nWeP/N2o9cnEBZphoeTVohPfTdI7eAXKMq7eopboMiCrmXgr384/duI6bc2wfVTQTBrY
 4YA1tYFoSyjiPnj2NTz12MFtrX86ucdH+9OaHa2IQOZgZLvrOzLsXtGuTISHS6cSVSPmJ3v4K
 swdlnl/lQ6dbj50c/I7npTWepLGVFaJGB+EURxWMP/Q+jkJ05+FLH1RA2ACXlKar86vDKpoP8
 RNUx+TpCya6jZW2+aF+EKLG/Akh3FkXETq2RKOvSOvs55JkzjLuR7b2mboh+36CGZrmPd+eGa
 oNwEZGjSV/BfjU+3cCAZu2OTrdIBvFkquz+JTJr3h7NBGHDrIg=
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
 linux-arch <linux-arch@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 28, 2020 at 3:16 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
> Provides __kernel_clock_gettime64() on vdso32. This is the
> 64 bits version of __kernel_clock_gettime() which is
> y2038 compliant.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Looks good to me

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

There was a bug on ARM for the corresponding function, so far it is unclear
if this was a problem related to particular hardware, the 32-bit kernel code,
or the common implementation of clock_gettime64 in the vdso library,
see https://github.com/richfelker/musl-cross-make/issues/96

Just to be sure that powerpc is not affected by the same issue, can you
confirm that repeatedly calling clock_gettime64 on powerpc32, alternating
between vdso and syscall, results in monotically increasing times?

       Arnd
