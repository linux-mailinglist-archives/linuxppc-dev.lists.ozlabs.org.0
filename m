Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7E9315CD0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 03:04:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Db33w1ChMzDwhP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 13:04:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FDHREfY0; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Db2z32wx2zDsmV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 13:00:29 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id 18so267545pfz.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Feb 2021 18:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=icHSuqxAvuWfZWaEB0lhER40wxcGWM6Tp4PSAF9+5DQ=;
 b=FDHREfY0VXhgjJOhLgHfv5ShwcRdfxXeAJRh5S/joH+Msw7q8diCNwoaVAJBUELFPI
 LeISdvoT1hwpj/q+giSa3GCvSiCUy0fhjNgIG1SKOBM6gHwKVh9mRrOuoda4sPW81/Qm
 NK0RbbbQYWfhkoGNbyILwWw1Se0Pez1NcKUex9A8LArkheJK7E6mE8VqEpnTL7sICutU
 e6svUy0Zvg1xyWvZ8eEJ9JmXK4tbJt4Da+4W1EqLD1hP8CHFZ8NrwxlpeWEqYdbC+LgQ
 rGPEEcDrCLp9Rc1Z8ff6wS+xHwqAO6a3LZz26p1d/rJrr1BAxRQGc0heL2NIS5fz9zfw
 wBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=icHSuqxAvuWfZWaEB0lhER40wxcGWM6Tp4PSAF9+5DQ=;
 b=klG+Jdab5PdsKeAghdUfeAy9KZfykZlwjzdwKjUqi4BPnmnYrtAuVmI1LXIUX+thfN
 TfKcfL1azXSPAXPwnHiOcJ0RrtWQDkpvEhaodbj8yneoiTOVHZ/s1WZ9lgUrfG2hBn4V
 wQkQscyUpKAdOFGbz6VZRK6kCzlpYzvvVJzFisWhOthiBYxai7In0RYHOVJ/072TTC1D
 0ySti5gHfU68EjHT4ieYzAS4eUw6T+PoUSJ06HvNV56cc1xF2nwoxJetCZ3aG5TUNMh8
 +GYSHEbgncdqnpB1HLRe67Ha9mXIFKjFLmSyRiVcMa1y04j2FWQ0XQ4Zz1usP+NV9S0B
 p4mQ==
X-Gm-Message-State: AOAM530WxoYmSdf1+znKXeJSIM4Rc592zNEJs3VNqI+oJ0Ikxrvd/OSM
 ZUsfmeD3fS3vFF0KYoMOpCA=
X-Google-Smtp-Source: ABdhPJyIYczqEkDX2r5WQ4N4yzbWuk+ClEAtgeLyp6JmAEF8e5YJBF8YleZRoI0Q0Hcl8sbjrylhiQ==
X-Received: by 2002:a63:c64f:: with SMTP id x15mr829133pgg.196.1612922426770; 
 Tue, 09 Feb 2021 18:00:26 -0800 (PST)
Received: from localhost (14-201-150-91.tpgi.com.au. [14.201.150.91])
 by smtp.gmail.com with ESMTPSA id o76sm187378pfg.164.2021.02.09.18.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 18:00:25 -0800 (PST)
Date: Wed, 10 Feb 2021 12:00:20 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 20/22] powerpc/syscall: Avoid storing 'current' in
 another pointer
To: Christophe Leroy <christophe.leroy@csgroup.eu>, David Laight
 <David.Laight@ACULAB.COM>, 'Segher Boessenkool' <segher@kernel.crashing.org>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <24804747098369ebcdac38970b8f7a1260bdd248.1612796617.git.christophe.leroy@csgroup.eu>
 <1612838134.rvncv9kzls.astroid@bobo.none>
 <20210209135053.GD27854@gate.crashing.org>
 <d35cc46eca474b2c9f94a4de269321e7@AcuMS.aculab.com>
 <f6ae2e77-3a89-c294-9a6e-58d84fbb46b1@csgroup.eu>
In-Reply-To: <f6ae2e77-3a89-c294-9a6e-58d84fbb46b1@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1612922312.mnpowzgd0r.astroid@bobo.none>
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
Cc: Paul Mackerras <paulus@samba.org>, "msuchanek@suse.de" <msuchanek@suse.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of February 10, 2021 3:03 am:
>=20
>=20
> Le 09/02/2021 =C3=A0 15:31, David Laight a =C3=A9crit=C2=A0:
>> From: Segher Boessenkool
>>> Sent: 09 February 2021 13:51
>>>
>>> On Tue, Feb 09, 2021 at 12:36:20PM +1000, Nicholas Piggin wrote:
>>>> What if you did this?
>>>
>>>> +static inline struct task_struct *get_current(void)
>>>> +{
>>>> +	register struct task_struct *task asm ("r2");
>>>> +
>>>> +	return task;
>>>> +}
>>>
>>> Local register asm variables are *only* guaranteed to live in that
>>> register as operands to an asm.  See
>>>    https://gcc.gnu.org/onlinedocs/gcc/Local-Register-Variables.html#Loc=
al-Register-Variables
>>> ("The only supported use" etc.)
>>>
>>> You can do something like
>>>
>>> static inline struct task_struct *get_current(void)
>>> {
>>> 	register struct task_struct *task asm ("r2");
>>>
>>> 	asm("" : "+r"(task));
>>>
>>> 	return task;
>>> }
>>>
>>> which makes sure that "task" actually is in r2 at the point of that asm=
.
>>=20
>> If "r2" always contains current (and is never assigned by the compiler)
>> why not use a global register variable for it?
>>=20
>=20
>=20
> The change proposed by Nick doesn't solve the issue.

It seemed to change code generation in a simple test case, oh well.

>=20
> The problem is that at the begining of the function we have:
>=20
> 	unsigned long *ti_flagsp =3D &current_thread_info()->flags;
>=20
> When the function uses ti_flagsp for the first time, it does use 112(r2)
>=20
> Then the function calls some other functions.
>=20
> Most likely because the function could update 'current', GCC copies r2 in=
to r30, so that if r2 get=20
> changed by the called function, ti_flagsp is still based on the previous =
value of current.
>=20
> Allthough we know r2 wont change, GCC doesn't know it. And in order to sa=
ve r2 into r30, it needs to=20
> save r30 in the stack.
>=20
>=20
> By using &current_thread_info()->flags directly instead of this intermedi=
aite ti_flagsp pointer, GCC=20
> uses r2 instead instead of doing a copy.
>=20
>=20
> Nick, I don't understand the reason why you need that 'ti_flagsp' local v=
ar.

Just to save typing, I don't mind your patch I was just wondering if=20
current could be improved in general.

Thanks,
Nick
