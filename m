Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 444B23A39B1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 04:25:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1Pnv5z3gz3bvk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 12:25:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=I6ibkR1f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=I6ibkR1f; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1PnQ31Mmz2xvG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 12:24:58 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id i34so1238736pgl.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 19:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=lWU4Vw0CGzQdddd7531AABGYy3FLb0CgVBwzysYGHYA=;
 b=I6ibkR1f0h0wumnTnmTl44RwOrJeQ04rA21yaUsHN0zd0m9JbQc+v0uw9/gE62YLcz
 CklpqIuzOcj1S3pvKA+fyfdsheWl3CJLU8H1PfXUHzgCvHpPY8MU7Uf6kfbF181q6pX3
 IunZswNAMoSi/XRgUCBVU4Shg/NRVsElcZGOCgsyIwZh/tF5JmxO9B75pTf8Cwos/oDg
 QKCkxxqQ99Xqc3cI6T8d3fa/sg3VvaNq8s/PoWIP3d5g58z3ARISNbxPnSjXFbElv502
 Kz5K+iVH0j0EojnZqJbI70iPouED4wauLPGM7hg6PlP0gaKyHDdP43A22/CSZvmkeVQV
 kV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=lWU4Vw0CGzQdddd7531AABGYy3FLb0CgVBwzysYGHYA=;
 b=tSDlTgxujvf2S1cOtplmgDm4cdfy+/+r+2lFYyaF82qyBA9zSMy/Ub4/al7707ao27
 Dzh9tz5XGEPlMXbCe3M+ppCE5Wj2YwhK00oj9QWPePPTQlGRn/SIESZlk2zVcl5OAzCL
 iGYNWyYrbAuo53EDees6aJLwOT+lmmZxKMw55LOSwzjPEBKSTFM9R1je6y+W5Cw6EBd+
 TeWWc8ixrLdKcDleXPfzLgD+8QUkmFVy/elSx1mXXlUL0unv5K+oIN+eBvzylXRtj22e
 31NLFnIfeMC+hyc0GEJyAWoBiTUF9sJ5xDGSowpbaah/DhpfxoSsT5yMsE2/CXw/U6vx
 dppA==
X-Gm-Message-State: AOAM533UNbJTmLCh/zbS17zppvNN3iubVxztMMg4p29yZJbNsV3yF/eO
 QpPvXsZEzs8AIaIHJo8xGW8=
X-Google-Smtp-Source: ABdhPJz57Cm9SUiVdKRM7MoGvcOhd0hkvt4CITORQXOWGm2kw0Vh1lSZXAwJIWizsPnbtxdb7qifbQ==
X-Received: by 2002:a62:5547:0:b029:2ec:8f20:4e2 with SMTP id
 j68-20020a6255470000b02902ec8f2004e2mr5913590pfb.71.1623378294499; 
 Thu, 10 Jun 2021 19:24:54 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id f17sm3668935pgm.37.2021.06.10.19.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 19:24:53 -0700 (PDT)
Date: Fri, 11 Jun 2021 12:24:48 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [FSL P50x0] KVM HV doesn't work anymore
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Christian Zigotzky
 <chzigotzky@xenosoft.de>, "kvm-ppc@vger.kernel.org"
 <kvm-ppc@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <04526309-4653-3349-b6de-e7640c2258d6@xenosoft.de>
 <34617b1b-e213-668b-05f6-6fce7b549bf0@xenosoft.de>
 <9af2c1c9-2caf-120b-2f97-c7722274eee3@csgroup.eu>
 <199da427-9511-34fe-1a9e-08e24995ea85@xenosoft.de>
 <1621236734.xfc1uw04eb.astroid@bobo.none>
 <e6ed7674-3df9-ec3e-8bcf-dcd8ff0fecf8@xenosoft.de>
 <1621410977.cgh0d6nvlo.astroid@bobo.none>
 <acf63821-2030-90fa-f178-b2baeb0c4784@xenosoft.de>
 <1621464963.g8v9ejlhyh.astroid@bobo.none>
 <f437d727-8bc7-6467-6134-4e84942628f1@xenosoft.de>
 <b3821ab6-f3b4-ee51-93a2-064c09bc4278@xenosoft.de>
In-Reply-To: <b3821ab6-f3b4-ee51-93a2-064c09bc4278@xenosoft.de>
MIME-Version: 1.0
Message-Id: <1623377186.j5de3q1s8g.astroid@bobo.none>
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christian Zigotzky's message of June 7, 2021 5:21 pm:
> On 02 June 2021 at 01:26pm, Christian Zigotzky wrote:
>> On 20 May 2021 at 01:07am, Nicholas Piggin wrote:
>>> Hmm, okay that probably rules out those notifier changes then.
>>> Can you remind me were you able to rule these out as suspects?
>>>
>>> 8f6cc75a97d1 powerpc: move norestart trap flag to bit 0
>>> 8dc7f0229b78 powerpc: remove partial register save logic
>>> c45ba4f44f6b powerpc: clean up do_page_fault
>>> d738ee8d56de powerpc/64e/interrupt: handle bad_page_fault in C
>>> ceff77efa4f8 powerpc/64e/interrupt: Use new interrupt context=20
>>> tracking scheme
>>> 097157e16cf8 powerpc/64e/interrupt: reconcile irq soft-mask state in C
>>> 3db8aa10de9a powerpc/64e/interrupt: NMI save irq soft-mask state in C
>>> 0c2472de23ae powerpc/64e/interrupt: use new interrupt return
>>> dc6231821a14 powerpc/interrupt: update common interrupt code for
>>> 4228b2c3d20e powerpc/64e/interrupt: always save nvgprs on interrupt
>>> 5a5a893c4ad8 powerpc/syscall: switch user_exit_irqoff and=20
>>> trace_hardirqs_off order
>>>
>>> Thanks,
>>> Nick
>> Hi Nick,
>>
>> I tested these commits above today and all works with -smp 4. [1]
>>
>> Smp 4 still doesn't work with the RC4 of kernel 5.13 on quad core=20
>> e5500 CPUs with KVM HV. I use -smp 3 currently.
>>
>> What shall I test next?
>>
>> Thanks,
>> Christian
>>
>> [1] https://forum.hyperion-entertainment.com/viewtopic.php?p=3D53367#p53=
367
> Hi All,
>=20
> I tested the RC5 of kernel 5.13 today. Unfortunately the KVM HV issue=20
> still exists.
> I also figured out, that '-smp 2' doesn't work either.
>=20
> Summary:
>=20
> -smp 1 -> works
> -smp 2 -> doesn't work
> -smp 3 -> works
> -smp 4 -> doesn't work

Sorry, I'm not able to see anything, if the KVM patches were okay and=20
the 64e interrupt series. I don't know why the -smp behaviour would make

I can't think of why the -smp behaviour would make a difference except=20
for a strange race. Doing another bisect might be the only way to get
to the bottom of it.

But before that you could try get some data about why the guest stops?
Get some samples of CPU registers when it gets stuck and see if you can
see if it is stuck in a loop of interupts or something.

I don't know if qemu can log much from KVM execution so you might have
to just run info registers a dozen times on each CPU (`cpu 1` will=20
change to CPU 1 in the qemu monitor).

Thanks,
Nick
