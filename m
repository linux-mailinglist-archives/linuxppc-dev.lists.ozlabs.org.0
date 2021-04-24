Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8E736A192
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Apr 2021 16:22:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FSCzN4h4dz30Fb
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Apr 2021 00:22:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=o1clgpPj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22e;
 helo=mail-lj1-x22e.google.com; envelope-from=sxwjean@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=o1clgpPj; dkim-atps=neutral
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FSCyy4SyCz2yR7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Apr 2021 00:21:59 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id z23so12322613lji.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Apr 2021 07:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P531jV/gE1FZqL6RA2hoIiPZe+DPKeqrBTIMQshMdGo=;
 b=o1clgpPjpGEFw3+FHdVkmFJOv8/dKJlYdw2w7kl6XVx/GSsBL29iRck78tEqK7ObYF
 MbFaT+nPdKpMirkk+KDuJjJcsqB+FlZ1QKk9PXEkAxhKvaKa8p4OCNztMP+dWbX02ykS
 3nVlCuHpAACeGMCRSdJncL9oTU4XvfOQD6ovqWO4Xlksm6+W7TGwUPSpV0+YogaDt9Cs
 C5G8CBSqx4MMDNAHmk/5g+Y5pR58HapTLrB7QN3lU/KTKl4RQHgX+wQKqZ1p0UnuRTiA
 S49Q67T95z+/mqJMg1Nu6HV1LpJN43+/AS5SBdD5QuVyfH56iQgh9EQThR94wqDJ2lGg
 sjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P531jV/gE1FZqL6RA2hoIiPZe+DPKeqrBTIMQshMdGo=;
 b=IshZci4vWaVusEZ2Ebx9gGj33G1pHz87qGvcESaX1Zj+jB9QFxBgAxEPeSUkmXLuUN
 3jeJfren2NlP4jloIFWWutR+GQyc8b9HX5QtAdZEaWi3ozvUDW02NGGSeb06IhRv8HTv
 pCSge3AJykWD3kEgheP7zO75DKURquHf95U1Ba4ANVOpHZjdLcLSdSS4W3A5x+Sd1RtO
 YT1+2kZTtMrhIqLkhQEw3B6Vn5SS81Mk8IDcAnPV/vlT0vMaVMT2iHiZuZ8lTaI6pRsc
 6VhQLbmPLbHbq4+41niBRtbyRsQqoQnAMqA5ZV0JQAbd1Ij+KK8pl08Su5YmNXc2QbYJ
 c79Q==
X-Gm-Message-State: AOAM530PmWUquPK3naVfpY3qBlG9hCLc/m5B89MWCWvxHjxvxfgcCYLy
 bss2RhcktF3AxFxbonG+/5jhV90W79Uf6S0UjFA=
X-Google-Smtp-Source: ABdhPJwjfSVVifAjHfydswQQAARoNfpuidd98YqrcBbE9hLP1VRL8N8S3uHAuepIxwUToZfhYrytyg4o+OqulWITkuA=
X-Received: by 2002:a2e:bb8f:: with SMTP id y15mr6174605lje.86.1619274115443; 
 Sat, 24 Apr 2021 07:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210422151022.17868-1-sxwjean@me.com>
 <20210422151022.17868-2-sxwjean@me.com>
 <ac6cf0ae-7565-180e-03b2-5e72f89a823a@csgroup.eu>
 <7b3ad970-707d-ffcd-e4a3-0b6e622db403@csgroup.eu>
In-Reply-To: <7b3ad970-707d-ffcd-e4a3-0b6e622db403@csgroup.eu>
From: Xiongwei Song <sxwjean@gmail.com>
Date: Sat, 24 Apr 2021 22:21:29 +0800
Message-ID: <CAEVVKH9xM7_u1xY9MswxT2ZH6XEDDxe2sW7f47ajw+x5J5vzgg@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc: Print esr register when hitting Program
 Interrupt
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: ravi.bangoria@linux.ibm.com, mikey@neuling.org,
 Xiongwei Song <sxwjean@me.com>, 0x7f454c46@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, npiggin@gmail.com,
 Paul Mackerras <paulus@samba.org>, aneesh.kumar@linux.ibm.com,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 23, 2021 at 12:50 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 22/04/2021 =C3=A0 17:29, Christophe Leroy a =C3=A9crit :
> >
> >
> > Le 22/04/2021 =C3=A0 17:10, Xiongwei Song a =C3=A9crit :
> >> From: Xiongwei Song <sxwjean@gmail.com>
> >>
> >> The esr register has the details of Program Interrupt on BookE/4xx cpu=
s,
> >> printing its value is helpful.
> >>
> >> Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
> >> ---
> >>   arch/powerpc/kernel/process.c | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/proce=
ss.c
> >> index 5c3830837f3a..664aecf8ee2e 100644
> >> --- a/arch/powerpc/kernel/process.c
> >> +++ b/arch/powerpc/kernel/process.c
> >> @@ -1459,6 +1459,7 @@ static bool interrupt_detail_printable(int trap)
> >>       case INTERRUPT_MACHINE_CHECK:
> >>       case INTERRUPT_DATA_STORAGE:
> >>       case INTERRUPT_ALIGNMENT:
> >> +    case INTERRUPT_PROGRAM:
> >
> > With this, it will also print the DSISR on 8xx/6xx so it will print gar=
bage.
> >
> > 8xx/6xx provide the information in SRR1. If you want to proceed, you ha=
ve to do the same as in ISI:
> > Copy the content of SRR1 into regs->dsisr in the assembly handler in he=
ad_book3s_32.S and in the
> > instruction TLB error handler in head_8xx.S
>
> In fact, we already have get_reason() called by do_program_check() to ret=
rieve the reason of the
> program check exception. Maybe it could be used to print usefull informat=
ion instead of starting
> doing almost the same is another way.

Yes, there is the get_reason() function. But if the program interrupt
is triggered in kernel mode,
the reason can be lost , see the code below:

335 static bool exception_common(int signr, struct pt_regs *regs, int code,
 336                               unsigned long addr)
 337 {
 338         if (!user_mode(regs)) {
 339                 die("Exception in kernel mode", regs, signr);
 340                 return false;
 341         }

The third parameter(int code) of exception_common is to pass the
reason, when in kernel
mode, the "code" parameter is lost, hence I append INTERRUPT_PROGRAM here.

This is for __show_regs(), so just printing the content of the
register is fine I think.

>
> Or we do as I suggested above, and we remove that get_reason() stuff. But=
 get_reason() is also used
> by the alignment exception. So that doesn't look easy.
>
> I don't know what the best approach is.

Is it acceptable to print the interrupt reason before invoking die()
in exception_common()?

Regards,
Xiongwei
