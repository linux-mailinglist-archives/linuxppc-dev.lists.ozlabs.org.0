Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 961593E0053
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 13:37:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfqTS3vlDz3cXH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 21:37:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gF3r7qOs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gF3r7qOs; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfqT250jhz30CG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 21:36:37 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id
 t7-20020a17090a5d87b029017807007f23so5038801pji.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Aug 2021 04:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=NZ/0/+yYuwdkpbX5oFvz16HwaLmTEpHhMKuNCUfxk4Q=;
 b=gF3r7qOstjH9QMvL0KDhdeomTUe6G6/EvS86x8rETnZqRHLvt8OxDiDzbpcI9KvJ24
 Rxm2amun1r7chb+18rNnDbXY2BgZQboSntluf8AyUDNloTtg/82f7Ta/+vrXyNki8NUi
 xluKfNgXBmDn0ex617tdUo0nFI/fs8Ar7wapqhrMNqljgM7wVt+pH7QGCfBO0sgtIeAX
 HVDQTKdeX9aguNoaQoGCg9ZgWVyliV0TZAP3rSbKv+HQp4s/9oCH95ssld7mrbkkTNGr
 aZgsOTeMPIuw8tf2KnOPQvz1ockj2xU15A1iiHupib70pJcINjvFcE2i/1WFj9W3rvf2
 BHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=NZ/0/+yYuwdkpbX5oFvz16HwaLmTEpHhMKuNCUfxk4Q=;
 b=sc2KpZ43YPa+MV51GIGoftMWtzNWErdnirioHIaaO6Mznealz2M5FTaxSx5QNqxBBF
 U45oHdFh1KsyBslXRabxOaE3HVrnn/fMlNta7TOKtxcey/ZQe1YR+WOGU8Hhd9JCvcTE
 jn+kQJjmPa5bxCuOB6OWALbz80RQXSJu/rX6NJWboB+s2ANGGfPW+Knay0dCHlI7BFHl
 kkEb7f+QMfK1DMqLuA3oMmGfl0wd2SvfNA0OKoactB8nDHQULaTwnffB7a7ZRKRMDU5y
 zWSdoII024BW4jIDGj4yyqLEmDChb1dOv52KytQdmsGM/H/B1XkUmWyFcdHuztLX38Wh
 wH0g==
X-Gm-Message-State: AOAM531Pp0aMfULJoqdCYxy8kcsue3A0KYyGYQb6gMQKpTDvhgGCuuNE
 m+Xnr4IKPFEz9UohpIR/JUs=
X-Google-Smtp-Source: ABdhPJyo8cHiTEPDgmmu1Z0MQsBUtD7Z7mhW0xA//+W2Mjv46B4pcHlvix76NZnBLnqcbKN0SjxUeA==
X-Received: by 2002:aa7:870e:0:b029:3c2:f326:468b with SMTP id
 b14-20020aa7870e0000b02903c2f326468bmr11047150pfo.53.1628076993433; 
 Wed, 04 Aug 2021 04:36:33 -0700 (PDT)
Received: from localhost (60-242-181-102.static.tpgi.com.au. [60.242.181.102])
 by smtp.gmail.com with ESMTPSA id
 b207sm2566964pfb.156.2021.08.04.04.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 04:36:33 -0700 (PDT)
Date: Wed, 04 Aug 2021 21:36:27 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/32s: Fix napping restore in data storage
 interrupt (DSI)
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <731694e0885271f6ee9ffc179eb4bcee78313682.1628003562.git.christophe.leroy@csgroup.eu>
 <ce20d16c-b0b2-94c-3e22-794d95c376b@linux-m68k.org>
 <b04a90a9-9d62-2192-f896-ea99be911604@csgroup.eu>
 <8fb08f68-ed01-65f9-fb9e-66abf2b18a00@csgroup.eu>
In-Reply-To: <8fb08f68-ed01-65f9-fb9e-66abf2b18a00@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1628068469.gv4bl1fw7w.astroid@bobo.none>
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
Cc: userm57@yahoo.com, Finn Thain <fthain@linux-m68k.org>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of August 4, 2021 4:21 pm:
> Hi Nic,
>=20
> I think I'll need your help on that one.
>=20
> Le 04/08/2021 =C3=A0 08:07, Christophe Leroy a =C3=A9crit=C2=A0:
>>=20
>>=20
>> Le 04/08/2021 =C3=A0 06:04, Finn Thain a =C3=A9crit=C2=A0:

Hi Finn!

>>> On Tue, 3 Aug 2021, Christophe Leroy wrote:
>>>
> ...
>>>
>>> ------------[ cut here ]------------
>>> kernel BUG at arch/powerpc/kernel/interrupt.c:49!
>>> Oops: Exception in kernel mode, sig: 5 [#1]
>>> BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
>>> Modules linked in:
>>> CPU: 0 PID: 1859 Comm: xfce4-session Not tainted 5.13.0-pmac-VMAP #10
>>> NIP:=C2=A0 c0011474 LR: c0011464 CTR: 00000000
>>> REGS: e2f75e40 TRAP: 0700=C2=A0=C2=A0 Not tainted=C2=A0 (5.13.0-pmac-VM=
AP)
>>> MSR:=C2=A0 00021032 <ME,IR,DR,RI>=C2=A0 CR: 2400446c=C2=A0 XER: 2000000=
0
>>>
>>> GPR00: c001604c e2f75f00 ca284a60 00000000 00000000 a5205eb0 00000008 0=
0000020
>>> GPR08: ffffffc0 00000001 501200d9 ce030005 ca285010 00c1f778 00000000 0=
0000000
>>> GPR16: 00945b20 009402f8 00000001 a6b87550 a51fd000 afb73220 a6b22c78 a=
6a6aecc
>>> GPR24: 00000000 ffffffc0 00000020 00000008 a5205eb0 00000000 e2f75f40 0=
00000ae
>>> NIP [c0011474] system_call_exception+0x60/0x164
>>> LR [c0011464] system_call_exception+0x50/0x164
>>> Call Trace:
>>> [e2f75f00] [00009000] 0x9000 (unreliable)
>>> [e2f75f30] [c001604c] ret_from_syscall+0x0/0x28
>>> --- interrupt: c00 at 0xa69d6cb0
>>> NIP:=C2=A0 a69d6cb0 LR: a69d6c3c CTR: 00000000
>>> REGS: e2f75f40 TRAP: 0c00=C2=A0=C2=A0 Not tainted=C2=A0 (5.13.0-pmac-VM=
AP)
>>> MSR:=C2=A0 0000d032 <EE,PR,ME,IR,DR,RI>=C2=A0 CR: 2400446c=C2=A0 XER: 2=
0000000
>>>
>>> GPR00: 000000ae a5205de0 a5687ca0 00000000 00000000 a5205eb0 00000008 0=
0000020
>>> GPR08: ffffffc0 401201ea 401200d9 ffffffff c158f230 00c1f778 00000000 0=
0000000
>>> GPR16: 00945b20 009402f8 00000001 a6b87550 a51fd000 afb73220 a6b22c78 a=
6a6aecc
>>> GPR24: afb72fc8 00000000 00000001 a5205f30 afb733dc 00000000 a6b85ff4 a=
5205eb0
>>> NIP [a69d6cb0] 0xa69d6cb0
>>> LR [a69d6c3c] 0xa69d6c3c
>>> --- interrupt: c00
>>> Instruction dump:
>>> 7cdb3378 93810020 7cbc2b78 93a10024 7c9d2378 93e1002c 7d3f4b78 4800d629
>>> 817e0084 931e0088 69690002 5529fffe <0f090000> 69694000 552997fe 0f0900=
00
>>> ---[ end trace c66c6c3c44806276 ]---
>>>
>=20
> Getting a BUG at arch/powerpc/kernel/interrupt.c:49 meaning MSR_RI is not=
 set, but the c00 interrupt=20
> frame shows MSR_RI properly set, so what ?

Could the stack be correct but regs pointer incorrect?

Instruction dump is

   0:   78 33 db 7c     mr      r27,r6
   4:   20 00 81 93     stw     r28,32(r1)
   8:   78 2b bc 7c     mr      r28,r5
   c:   24 00 a1 93     stw     r29,36(r1)
  10:   78 23 9d 7c     mr      r29,r4
  14:   2c 00 e1 93     stw     r31,44(r1)
  18:   78 4b 3f 7d     mr      r31,r9
  1c:   29 d6 00 48     bl      0xd644
  20:   84 00 7e 81     lwz     r11,132(r30)
  24:   88 00 1e 93     stw     r24,136(r30)
  28:   02 00 69 69     xori    r9,r11,2
  2c:   fe ff 29 55     rlwinm  r9,r9,31,31,31
  30:   00 00 09 0f     twnei   r9,0
  34:   00 40 69 69     xori    r9,r11,16384
  38:   fe 97 29 55     rlwinm  r9,r9,18,31,31
  3c:   00 00 09 0f     twnei   r9,0

regs->msr is in r11 =3D=3D 0xce030005 so some kernel address?

r1  =3D=3D 0xe2f75f00
r30 =3D=3D 0xe2f75f40

I think that matches if the function allocates 48 bytes of stack.=20
STACK_FRAME_OVERHEAD is 16, so the difference would be 0x40 in that
case. Seems okay.

I'm not sure then. Can you get a hash fault interrupt come in here
because of the vmap stack access and clobber r11? Hmm...

fast_hash_page_return:
        andis.  r10, r9, SRR1_ISI_NOPT@h        /* Set on ISI, cleared on D=
SI */

Is that really right? DSI can set this bit for NOHPTE as well no?
That'd do it.

Thanks,
Nick
