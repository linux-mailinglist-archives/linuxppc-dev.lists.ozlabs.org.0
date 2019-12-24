Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AF612A12A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 13:11:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hw7L42bXzDqP1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 23:11:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=amacapital.net (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=luto@amacapital.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amacapital.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=amacapital-net.20150623.gappssmtp.com
 header.i=@amacapital-net.20150623.gappssmtp.com header.b="v5uo6zSi"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hw4s4SgXzDqFM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 23:09:33 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id 2so10668221pfg.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 04:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=K4+yYEajmvASBw/wK7dx01YAKKK9lQkCygbw5uYtDvw=;
 b=v5uo6zSi8Zl71hkeRCL1WDbTWJpta5F83ZOr5fxkkmp8Nw9B+KoTpjA3o2GjQy6HDP
 z+802JX+aRA390qBjINq0fnHSEcntSkwsD2EIdKdxcvAxxrKOvxCCaWOUUvCrR+n8fRj
 meVMHS9VnwRQ3Mpp3i0JSkU6+2DH9Tm8yVzs9R4X2pRKBJzEhe4Iu0+PxpENQ/X2kzLq
 V/G9BIlbM5R458R2UgYGUF2TnKMV2LmqGcHfOZ5qKpX+LQzykslgAxQOVxRyy1Xrojh+
 ahp+RNTQr5w5UIgQgyaUDAlDJlFjIHRY7VldSOH4+iPjEpgAad3Lc8Ta0OVzWIkcCVWq
 1C+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=K4+yYEajmvASBw/wK7dx01YAKKK9lQkCygbw5uYtDvw=;
 b=Z2ISiDULXfPX6EoOeyJjYzQfxCIFaKXQLVkV0H1/RBAeExPobK/e/Pzj4lueHrJtUm
 cL0DoeCqvc28qMHpXzc1Fm0VrXj4JphZF+SF31e6Cbb2h0vIYRLBiESGDori1twiV1dg
 nHQ2GqEi6PBPrcgs9sngZSoisBjf3ZF8MNeqAfRmuPyHYgdc7AXzp317EBbVEuiabSeZ
 jOCnSS5RyHiEH4MAUXVYdXtPyzDFEPGQ3+uwhhYg5aPeeO9qbKImC2K1J46kwMCIsv1z
 Qvxu/Th5oyHHxi62+Yjm6xB61TcmR3ItsVWrhMOee0nzUehOvCVVlbsNori4OkW8oPqr
 nVaw==
X-Gm-Message-State: APjAAAV0lmUnE26vgGHPyX7wjCN4qZ6LO/izttav1yxmm819het1llmD
 Q9foWfzPHE6PcGxyalHKNH0YMq7rlpTOhg==
X-Google-Smtp-Source: APXvYqxA1SUulGpkbXDrLJ25MMXUtUB4dZYV+TVQUc/X6xA8o+7HrjCmP4+vfrzt7tm6wB0tahblTA==
X-Received: by 2002:a63:1106:: with SMTP id g6mr36472053pgl.13.1577189369917; 
 Tue, 24 Dec 2019 04:09:29 -0800 (PST)
Received: from [192.168.0.9] (111-255-104-19.dynamic-ip.hinet.net.
 [111.255.104.19])
 by smtp.gmail.com with ESMTPSA id 68sm25845145pge.14.2019.12.24.04.09.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Dec 2019 04:09:29 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH v2 02/10] lib: vdso: move call to fallback out of
 common code.
Date: Tue, 24 Dec 2019 20:09:26 +0800
Message-Id: <3D74AE31-03EA-4552-8AF7-90AA9DD65830@amacapital.net>
References: <36f1ce73-d8bc-9c46-8a2a-b6514d4a1ba0@c-s.fr>
In-Reply-To: <36f1ce73-d8bc-9c46-8a2a-b6514d4a1ba0@c-s.fr>
To: christophe leroy <christophe.leroy@c-s.fr>
X-Mailer: iPhone Mail (17C54)
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
Cc: Arnd Bergmann <arnd@arndb.de>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On Dec 24, 2019, at 7:41 PM, christophe leroy <christophe.leroy@c-s.fr> wr=
ote:
>=20
> =EF=BB=BF
>=20
>> Le 24/12/2019 =C3=A0 03:24, Andy Lutomirski a =C3=A9crit :
>>> On Mon, Dec 23, 2019 at 6:31 AM Christophe Leroy
>>> <christophe.leroy@c-s.fr> wrote:
>>>=20
>>> On powerpc, VDSO functions and syscalls cannot be implemented in C
>>> because the Linux kernel ABI requires that CR[SO] bit is set in case
>>> of error and cleared when no error.
>>>=20
>>> As this cannot be done in C, C VDSO functions and syscall'based
>>> fallback need a trampoline in ASM.
>>>=20
>>> By moving the fallback calls out of the common code, arches like
>>> powerpc can implement both the call to C VDSO and the fallback call
>>> in a single trampoline function.
>> Maybe the issue is that I'm not a powerpc person, but I don't
>> understand this.  The common vDSO code is in C.  Presumably this means
>> that you need an asm trampoline no matter what to call the C code.  Is
>> the improvement that, with this change, you can have the asm
>> trampoline do a single branch, so it's logically:
>> ret =3D [call the C code];
>> if (ret =3D=3D 0) {
>>  set success bit;
>> } else {
>>  ret =3D fallback;
>>  if (ret =3D=3D 0)
>>   set success bit;
>> else
>>   set failure bit;
>> }
>=20
> More simple than above, in fact it is:
>=20
> ret =3D [call the C code];
> if (ret =3D=3D 0) {
> set success bit;
> } else {
> ret =3D fallback [ which sets the success/failure bit];
> }
> return ret

Cute.

>=20
>=20
>> return ret;
>> instead of:
>> ret =3D [call the C code, which includes the fallback];
>=20
> C code cannot handle the success/failure bit so we need to do something wh=
ich does:
>=20
> int assembly_to_fallback()
> {
>    ret =3D [syscall the fallback]
>    if (success bit set)
>        return ret;
>    else
>        return -ret;
> }

Wait, your calling convention has syscalls return positive values on error?

But I think this is moot. The syscalls in question never return nonzero succ=
ess values, so you should be able to inline the syscall without worrying abo=
ut this.

>=20
> Also means going back and forth between the success bit and negative retur=
n.
>=20
>> if (ret =3D=3D 0)
>>   set success bit;
>> else
>>   set failure bit;
>> It's not obvious to me that the former ought to be faster.
>>>=20
>>> The two advantages are:
>>> - No need play back and forth with CR[SO] and negative return value.
>>> - No stack frame is required in VDSO C functions for the fallbacks.
>> How is no stack frame required?  Do you mean that the presence of the
>> fallback causes worse code generation?  Can you improve the fallback
>> instead?
>=20
> When function F1 calls function F2 (with BL insn), the link register (LR) i=
s set with the return address in F1, so that at the end of F2, F2 branches t=
o LR (with BLR insn), that's how you return from functions.
>=20
> When F2 calls function F3, the same happens, LR is set to the return of F3=
 into F2. It means that F2 has to save LR in order to be able to return to F1=
, otherwise the return address from F2 into F1 is lost.
>=20
> But ... thinking about it once more, indeed fallback means doing a syscall=
, and in fact I realise that syscalls won't clobber LR, so it should be poss=
ible to do something. Let me try it.
>=20

With that plus assume that nonzero return means failure, I think you should h=
ave all your bases covered.=
