Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 060A33899A3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 01:08:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlpSq05jFz30GR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 09:08:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gC9WAZKA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gC9WAZKA; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlpSK0tYpz2xZB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 09:07:59 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id z4so5727216plg.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 16:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=cymZYvTpVQSrTcAXUybuDxB8tbOvF2n109X7Qd3QHII=;
 b=gC9WAZKA86C7gWqhb8VQik/Nw0aVcDfyRtgnUlSQUhYLb+icQldwNoYlZNHNWSKujx
 mMkCPDYMYrEaWepeJ9NpoPz0+do8WExDObJLAI6dVu/IAoRAnPh9WhUklCV+rrs40fsw
 V4q98u4GS+4aM1gaoFUbygPc0ST+S1aTIuZb5SzWTkB0W6CVQUFYGnAUZrI2iEgRx8DT
 UYaSatelKvAy3OZ9fYU98UdOnjaXFhr1mqydtIbUlQOgiZc2t1sQDAH6nEnzOdw6t1F4
 6KBQ0+gIPPwc0Ao5IR5PAcsPSOIrXeCprsfIjtU52w4RnJIrvgzQgwmkRIUzM6rYAi3m
 OW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=cymZYvTpVQSrTcAXUybuDxB8tbOvF2n109X7Qd3QHII=;
 b=Il2pDaPX63eXB8cHDf+cb4LsvJj9bOm4y/w/nPwwwIIyYoUKfDoQt2QUikwxdvfp9G
 fGlRXYg795c+bWCR/tCkTyK9Q3ZbOF4e3iutHT2hZglTI+5HDpoN3qZY2aC5KIapBqhw
 pR3/G0YI87gDb92VqpMz+eYn6G5WkkHikaBCs4NpClgGktBITAXua9W9TQxigIEyvBin
 5eI1vh7hezxpokviQnkrS1kEyWGdvLOK5EtM6xmhynb0u/hq4SfrsmAvhoNpV3LA1aJh
 PW5KoO5hZGP/A2RcTt/o4WcvGVdu5i0WQMziXlrcwA9reBPY34RZDmC8c+HQmQeZ5yl4
 FSFw==
X-Gm-Message-State: AOAM530UwDQK0KrKkaD/wAJhnAbdSRuAxz3FFhyvnlrXUp+qpiEaeN7I
 5f60vRb3ILRfpAAJD2Thjsw=
X-Google-Smtp-Source: ABdhPJy+WYY8IkzRFV/hh4NfJvnY+fXH3wMeNL+ToKcyRCO3c3nZKI4q9nf0D2FNohwdwfn5U/Dgaw==
X-Received: by 2002:a17:902:dcce:b029:ef:339:fa6a with SMTP id
 t14-20020a170902dcceb02900ef0339fa6amr2130593pll.24.1621465677922; 
 Wed, 19 May 2021 16:07:57 -0700 (PDT)
Received: from localhost (60-241-27-127.tpgi.com.au. [60.241.27.127])
 by smtp.gmail.com with ESMTPSA id ch24sm5254090pjb.18.2021.05.19.16.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 16:07:57 -0700 (PDT)
Date: Thu, 20 May 2021 09:07:51 +1000
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
In-Reply-To: <acf63821-2030-90fa-f178-b2baeb0c4784@xenosoft.de>
MIME-Version: 1.0
Message-Id: <1621464963.g8v9ejlhyh.astroid@bobo.none>
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

Excerpts from Christian Zigotzky's message of May 19, 2021 9:52 pm:
> On 19 May 2021 at 09:57 am, Nicholas Piggin wrote:
>> Excerpts from Christian Zigotzky's message of May 17, 2021 7:42 pm:
>>> On 17 May 2021 at 09:42am, Nicholas Piggin wrote:
>>>> Excerpts from Christian Zigotzky's message of May 15, 2021 11:46 pm:
>>>>> I tried it but it doesn't solve the issue. The uImage works without=20
>>>>> KVM
>>>>> HV in a virtual e5500 QEMU machine.
>>>> Any more progress with this? I would say that bisect might have just
>>>> been a bit unstable and maybe by chance some things did not crash so
>>>> it's pointing to the wrong patch.
>>>>
>>>> Upstream merge of powerpc-5.13-1 was good and powerpc-5.13-2 was bad?
>>>>
>>>> Between that looks like some KVM MMU rework. You could try the patch
>>>> before this one b1c5356e873c ("KVM: PPC: Convert to the gfn-based MMU
>>>> notifier callbacks"). That won't revert cleanly so just try run the
>>>> tree at that point. If it works, test the patch and see if it fails.
>>>>
>>>> Thanks,
>>>> Nick
>>> Hi Nick,
>>>
>>> Thanks a lot for your answer. Yes, there is a little bit of progress.
>>> The RC2 of kernel 5.13 successfully boots with -smp 3 in a virtual e550=
0
>>> QEMU machine.
>>> -smp 4 doesn't work anymore since the PowerPC updates 5.13-2. I used
>>> -smp 4 before 5.13 because my FSL P5040 machine has 4 cores.
>>>
>>> Could you please post a patch for reverting the commit before
>>> b1c5356e873c ("KVM: PPC: Convert to the gfn-based MMU notifier callback=
s")?
>> You could `git checkout b1c5356e873c~1`
>>
>> Thanks,
>> Nick
> Hi Nick,
>=20
> Thanks for your answer. I checked out the commit b1c5356e873c~1 (HEAD is=20
> now at d923ff258423 KVM: MIPS/MMU: Convert to the gfn-based MMU notifier=20
> callbacks).
> The kernel boots with '-smp 4' without any problems.
> After that I patched with the probable first bad commit (KVM: PPC:=20
> Convert to the gfn-based MMU notifier callbacks). The kernel also boots=20
> with this patch. That means, this isn't the first bad commit.
> Further information:=20
> https://forum.hyperion-entertainment.com/viewtopic.php?p=3D53267#p53267

Hmm, okay that probably rules out those notifier changes then.

Can you remind me were you able to rule these out as suspects?

8f6cc75a97d1 powerpc: move norestart trap flag to bit 0
8dc7f0229b78 powerpc: remove partial register save logic
c45ba4f44f6b powerpc: clean up do_page_fault
d738ee8d56de powerpc/64e/interrupt: handle bad_page_fault in C
ceff77efa4f8 powerpc/64e/interrupt: Use new interrupt context tracking sche=
me
097157e16cf8 powerpc/64e/interrupt: reconcile irq soft-mask state in C
3db8aa10de9a powerpc/64e/interrupt: NMI save irq soft-mask state in C
0c2472de23ae powerpc/64e/interrupt: use new interrupt return
dc6231821a14 powerpc/interrupt: update common interrupt code for
4228b2c3d20e powerpc/64e/interrupt: always save nvgprs on interrupt
5a5a893c4ad8 powerpc/syscall: switch user_exit_irqoff and trace_hardirqs_of=
f order

Thanks,
Nick
