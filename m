Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9548032D6C8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 16:36:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Drw2c4Jtrz3dCk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 02:36:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.24; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 310 seconds by postgrey-1.36 at boromir;
 Fri, 05 Mar 2021 02:36:23 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Drw2H1pKpz30Kl
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 02:36:21 +1100 (AEDT)
Received: from mail-ot1-f49.google.com ([209.85.210.49]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M5fQq-1lOxk615nm-007GjM for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Mar
 2021 16:31:08 +0100
Received: by mail-ot1-f49.google.com with SMTP id j8so2163771otc.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Mar 2021 07:31:07 -0800 (PST)
X-Gm-Message-State: AOAM532ItmnmC3PSNHibegfpBP83E4FP5M3U80dkZIxq8E9VDJ2Ch08M
 xWVh42BHDL79hPsBffDbcVaKQU8WkIUhedMarac=
X-Google-Smtp-Source: ABdhPJzlMu4XFdyVnD9hytIlowXXGFU41H5abzxoBv1GxGV5riUHWJk7l9y4vC3dE0f4RXteXOKokQ94laXC4xEr3Bw=
X-Received: by 2002:a9d:6b8b:: with SMTP id b11mr3870962otq.210.1614871866158; 
 Thu, 04 Mar 2021 07:31:06 -0800 (PST)
MIME-Version: 1.0
References: <2daa39fa210d971863a6f9ac7c81849764e7a261.1614862233.git.christophe.leroy@csgroup.eu>
 <CAK8P3a2=qOG1iLhw2fi=r128bRMdfNx4BseXONiS7vrnbVvr6w@mail.gmail.com>
 <aca143f6-fcfc-d89f-bb00-26e90257fbf6@csgroup.eu>
In-Reply-To: <aca143f6-fcfc-d89f-bb00-26e90257fbf6@csgroup.eu>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 4 Mar 2021 16:30:49 +0100
X-Gmail-Original-Message-ID: <CAK8P3a02S+8rr4QCwAWF9bTJEK1Tdi0Py11=PVMTu0vARc9ruw@mail.gmail.com>
Message-ID: <CAK8P3a02S+8rr4QCwAWF9bTJEK1Tdi0Py11=PVMTu0vARc9ruw@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/32: remove bogus ppc_select syscall
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+BRgl3XxCSQv1G8r8mGwEPXrrP5sMD/feQYNSWFTfWUDbppksmj
 N1PIhmMmstSxqvKQQM5sLI2eptjtfbk8meSX06w2DAIWKpMw0ZnOnTVDdr8raQJWK0oC5K8
 F/wQ5q36KdiMTjbbpMciFJ4uBJw1RlP20OFDrwGrn/DvBQOumhveh79j+dqrSGj3ystK2/h
 j0rIP29kS3sHWLIeXtgSA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:58IWH4JPyeA=:AtVGC30NiIcmDLDJd/NkBM
 qukLW4QMrDLYYCjKHlRKFYnljPergE632EQeOiyuL5LTpARUMZg7Olu9t92W1xTPWUY+eUATP
 x8CofTC0w1LH3u8QF6QN6cVhQ9r7rGncWRs/h1oI9gUFkozYgzPF+TfWVUHrAHcyR8zmh9yy1
 ExhSWTdDmu7gPWOk5Uk7i+4mDWmrGg6o621vZRbYCzrOvlvSMM+nhWhCND+oBOcLsvJcr0LOE
 XMZkUJiRKlpxuqOAC1nduSVYQ0CJgjjWxFO6o/ZAugA7DX1Jdt9v/vcdhfjPYB+ORyrEGobQt
 KK7KtYA+ABx/r7H87SDHkLWZaj8NTSTU+2FrD0H7r682Oxtqs1/3/zf3EkoTgfRni3Q20KNuv
 oY8CjoDTtEuPza/WgqHiikMjh9m2LnNL01K+ps+v3LBKvVJoqZx6qGs4f0auVCK0mqJCxTDR6
 +hh3FwcTPZLxT01nW0/EWTyk92DdZF/jnOwZir+9vNPDuQUGnnbJ1fhwVQax5K3s3axitqzCt
 hdKeRW/gEZ4o1Vzg7RP3m7Ez5zLrns/9Mldibd1NNvIDa02cQumdcQ8QelIHgdmlQ==
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, halesh.sadashiv@ap.sony.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 4, 2021 at 4:24 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 04/03/2021 =C3=A0 16:17, Arnd Bergmann a =C3=A9crit :
> > On Thu, Mar 4, 2021 at 1:51 PM Christophe Leroy <christophe.leroy@csgro=
up.eu> wrote:
> >> ---
> >> First version was in 2008, at that time it was rejected, see
> >> http://patchwork.ozlabs.org/project/linuxppc-dev/patch/200809240839.14=
902.arnd@arndb.de/
> >
> > The patch from 2008 did two things:
> >
> > - it removed the ppc32 specific 'select' syscall at #82
> > - it fixed the generic '_newselect' syscall at #142
> >
> > Back then, the decision was to only address the second issue, which
> > got merged in commit dad2f2fb0fc7 ("powerpc: Fix wrong error code from
> > ppc32 select syscall").
> >
> > It is probably ok to remove the old select system call now, but
> > my changelog text no longer makes sense, as the patch has nothing
> > to do with the bug that was reported back then.
> >
>
> I understood that the original reported bug was that calling that version=
 of select() with a
> negative value as first parametre would lead to a -EFAULT instead of -EIN=
VAL. That's exactly the
> case here, if you set n =3D -1 you get into this (unsigned long)n > 4096 =
then the buffer is at
> 0xffffffff and access_ok() won't grand access to it so the return value w=
ill be -EFAULT instead of
> -EINVAL.
>
> Am I missing something ?

This is the behavior of the ppc_select() implementation, but as far as
I can tell,
the bug report was for the problem that this behavior would happen for both
syscall #82 and syscall #142 when the correct behavior would have been to
only do it for #82 but not for #142.

       Arnd
