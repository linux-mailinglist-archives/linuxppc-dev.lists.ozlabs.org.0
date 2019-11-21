Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D3410547B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 15:33:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Jhqq5Kq6zDr7f
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 01:33:11 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JhkN5njzzDqtm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 01:28:27 +1100 (AEDT)
Received: from mail-qt1-f172.google.com ([209.85.160.172]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mr9OA-1i1DrE32BS-00oDWK for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov
 2019 15:28:22 +0100
Received: by mail-qt1-f172.google.com with SMTP id t20so3840441qtn.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 06:28:21 -0800 (PST)
X-Gm-Message-State: APjAAAUg1XObFYTrGf7iBNZyZ4cJmvGegyqM39AW7i3yQ/TQF8RdBEDS
 1gXrbG6pZwVvEXVL0okCXjnS+FUyu5dzqU2mrZY=
X-Google-Smtp-Source: APXvYqxB3fiYXtrETUp5EiMiQ9fb0AeisI+RwKyT7xggRKZinaPFWQOgz7hTMTjBH+1fCN1q48qajjrjZ95bUArYxrA=
X-Received: by 2002:ac8:18eb:: with SMTP id o40mr2519477qtk.304.1574346500017; 
 Thu, 21 Nov 2019 06:28:20 -0800 (PST)
MIME-Version: 1.0
References: <20191108210236.1296047-1-arnd@arndb.de>
 <20191108210824.1534248-8-arnd@arndb.de>
 <dd1a30609f05e800550097080c1d1b27065f91ff.camel@codethink.co.uk>
In-Reply-To: <dd1a30609f05e800550097080c1d1b27065f91ff.camel@codethink.co.uk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Nov 2019 15:28:03 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0VORzqLLTFpt9VYn_SONsve+-q0fTrZrPbLMpX9T6SBQ@mail.gmail.com>
Message-ID: <CAK8P3a0VORzqLLTFpt9VYn_SONsve+-q0fTrZrPbLMpX9T6SBQ@mail.gmail.com>
Subject: Re: [Y2038] [PATCH 08/23] y2038: ipc: remove __kernel_time_t
 reference from headers
To: Ben Hutchings <ben.hutchings@codethink.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:dpcXnqpNoU75y9IS5Ml3otbZqlrAplpL2hd++/sZqYOK8JVFObn
 Ty44LRwGxEEpxQVMazQg5re1lO56ON4y6iDkREBsyEVd1UVTj+jZQeHPNkSXByPup8wwqls
 D9TTnFgB4Wf+23/SSwXqWwBOsaMdguh2NUG9uu//5jzBDumkZZQKMbT7nFrRqMt/+TVtUtc
 9LugtelJl+joFzQY+Zy+Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uzXU+aVXj0Q=:0FZua5Eb/jU00W8OSob1mF
 ZWb7IjUIksVatZGy24ZrN1W+IqRmHdYby8SnEBV9Sn2mfWYPXi7SMwqYB6TRvj3gDH25gFvBI
 HvfQLz/A41caFFI4A6VUC2upcXiBS/KLAgl+qV4l3Tbbc9B0aLf9Jnan7H3MUjcZAH2Ql4V1t
 Ibx13o76GZ6nXGSK0o+6uX8HTVhDb8dSGyGRTYa+Zw6WGplnU/SwhD1wA9C/KbrOg57qgMtkw
 rXsGt6goutyqQjCqHGKptZVtMrXCE41dASYYboolHJMCnJ1B0jcaRPvoSOcoF8u4yKOWFx3Mr
 sPVE42lxGyz1ht9P38kBB3W32d81yg/JYbF41zixwxGeYOQTtnamzU3qfRYkFezfBdaESG2DO
 KbbmlCXvzbmAy+XDN5DfDSfQBAAvyhReq5p3uPSQ8sWll/uddND7fv7weQeAsSRZW7In1kMmd
 QotL/hV+8tFsMKMp7tsXmY4hKy+DGkzBautajojQBKjDVaNebJ5nqWVgmwDnXVoWWJA6xy1sc
 iJ5cXTvrG7rS9T+fjNrfaPrt3lsAffxauG7FGHlrdb2rgOnwAq1PUQJpB0gwMG8SUkIEg9Sh7
 D/6+VE0iigNrWkbfdGgS8GjkAH75BGlXvGnboiooFBHNsYncShBmyuvVpXD/ZSjr/hrRZ88NU
 giHdyfgxRw/UwBvvfI6inKUST/whomPqb0hzSZpbywyKcT2/91iDqWht56/INUtpKpP7k/pdo
 qEAyIZPadHIkY1kA+XOKej0EPC/G+M/u/kJf+sKldsfRwzAxDMtjCL3XP+RG3pFAO3jHc6n/g
 BHhf1nBb9dgUPH6p0uwdVl5X1VeEyT4Nvk724WXUPuuXDKpO/3ZBEbpnWR+kqITvCsKWEjtvB
 SIPaAaQdOR/bTHH/8KPw==
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
Cc: linux-arch <linux-arch@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Parisc List <linux-parisc@vger.kernel.org>,
 y2038 Mailman List <y2038@lists.linaro.org>, James Hogan <jhogan@kernel.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Burton <paul.burton@mips.com>, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux <sparclinux@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 20, 2019 at 11:49 PM Ben Hutchings
<ben.hutchings@codethink.co.uk> wrote:
>
> On Fri, 2019-11-08 at 22:07 +0100, Arnd Bergmann wrote:
> [...]
> > --- a/arch/x86/include/uapi/asm/sembuf.h
> > +++ b/arch/x86/include/uapi/asm/sembuf.h
> > @@ -21,9 +21,9 @@ struct semid64_ds {
> >       unsigned long   sem_ctime;      /* last change time */
> >       unsigned long   sem_ctime_high;
> >  #else
> > -     __kernel_time_t sem_otime;      /* last semop time */
> > +     long            sem_otime;      /* last semop time */
> >       __kernel_ulong_t __unused1;
> > -     __kernel_time_t sem_ctime;      /* last change time */
> > +     long            sem_ctime;      /* last change time */
> >       __kernel_ulong_t __unused2;
> >  #endif
> >       __kernel_ulong_t sem_nsems;     /* no. of semaphores in array */
> [...]
>
> We need to use __kernel_long_t here to do the right thing on x32.

Good catch, thanks for the review!

I applied the patch below now on top.

       Arnd

commit c7ebd8a1c1825c3197732ea692cf3dde34a644f5 (HEAD)
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Thu Nov 21 15:25:04 2019 +0100

    y2038: ipc: fix x32 ABI breakage

    The correct type on x32 is 64-bit wide, same as for the other struct
    members around it, so use  __kernel_long_t in place of the original
    __kernel_time_t here, corresponding to the rest of the structure.

    Fixes: caf5e32d4ea7 ("y2038: ipc: remove __kernel_time_t reference
from headers")
    Reported-by: Ben Hutchings <ben.hutchings@codethink.co.uk>
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/arch/x86/include/uapi/asm/sembuf.h
b/arch/x86/include/uapi/asm/sembuf.h
index 7c1b156695ba..20cab43c4b15 100644
--- a/arch/x86/include/uapi/asm/sembuf.h
+++ b/arch/x86/include/uapi/asm/sembuf.h
@@ -21,9 +21,9 @@ struct semid64_ds {
        unsigned long   sem_ctime;      /* last change time */
        unsigned long   sem_ctime_high;
 #else
-       long            sem_otime;      /* last semop time */
+       __kernel_long_t sem_otime;      /* last semop time */
        __kernel_ulong_t __unused1;
-       long            sem_ctime;      /* last change time */
+       __kenrel_long_t sem_ctime;      /* last change time */
        __kernel_ulong_t __unused2;
 #endif
        __kernel_ulong_t sem_nsems;     /* no. of semaphores in array */
