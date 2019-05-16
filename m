Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5629D1FEE1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 07:51:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454LC163CrzDqY5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 15:51:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JYIckbev"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454L9T1jgVzDqY0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 15:50:02 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id t187so962802pgb.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 22:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=Dyg1zcWLdB0rJ2eOWiXMVKHKbznsTA80CqNcMVjxx48=;
 b=JYIckbevxXZ0jorC0VU/34+m6FHtwdTxdJ5vrdOdt30qdXYDSPLyDgHFLt3KnEzJ7C
 kVfjGVcjqNQuPN9L6Bu4MoJCRFdMGZH/Y37iVF/FAj5ZTIKZknXV+kjF4G+JYsFwzQHF
 FBq7kyUEJjAT0IA5kGR3KaDJcn6MsyUSeUeGhSz5YVscTANwXz/sN9YWhV+SNlNtHiIm
 D139YreknMEFVZFa/PrwLFKUiaKn2YyCfFtD/1W+tQ0tuXZKQmL3juolury3oMewOCjy
 ehLRMG6HhRHYJEb5HtXe1x8fPtng9bZ5NtJu8RXmB6VWOxVm0rqOkME+OdLAI/qQRzoY
 6rRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=Dyg1zcWLdB0rJ2eOWiXMVKHKbznsTA80CqNcMVjxx48=;
 b=E9v9IeKRtdl+/dwlHDNQD2zGowW++ypeMUQgWOv4CuE2WWj27BORYbQmQbG+7yJMK9
 6lVxVeXDlO+OdVToxV0Jzk17cqd54ABirKT30vNJvVX4aPynmEc+lFS3W8tw+YBx3UKs
 4gg106T4bxr3jJLHitVujvw4Mx/noaAoJOY+WAd8cGZ2ET4Vpm+J6fDljQ/oyFOZAHvL
 8PABRdXGGdVrpJxkgpd4FW/JKMtXLQx05m9m31/7tCCPaRgT0WRt9YouncSzqeeZy2Uu
 0/k3dtKjlevDDYc/YdGyVXH19sEgTniWB/+xZF8JDHNAkTC4/m2JJI1TyJhrgzcw8Sf0
 HFGw==
X-Gm-Message-State: APjAAAXx5dNiaVNqy6AxJs1/xcg2PYlJyOBxYXPAQn+huIRxGT2F5Xjb
 xdkCyWhIX5JJHrFAtnozcHOqVPZP
X-Google-Smtp-Source: APXvYqx23rFg6f4u4ZLrm6G51b+N4p6QDarseXNSbetE3LYPZRS3MBp47AF71A7/UiaJ2QYYb93RhA==
X-Received: by 2002:a63:90c7:: with SMTP id a190mr49682180pge.23.1557985800645; 
 Wed, 15 May 2019 22:50:00 -0700 (PDT)
Received: from localhost (193-116-124-212.tpgi.com.au. [193.116.124.212])
 by smtp.gmail.com with ESMTPSA id c23sm8322335pfp.0.2019.05.15.22.49.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 22:49:59 -0700 (PDT)
Date: Thu, 16 May 2019 15:49:51 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH] powerpc/64/ftrace: mprofile-kernel patch out mflr
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
References: <20190413015940.31170-1-npiggin@gmail.com>
 <871s13ujcf.fsf@concordia.ellerman.id.au>
 <1557729790.fw18xf9mdt.naveen@linux.ibm.com>
 <87tvdytwo0.fsf@concordia.ellerman.id.au>
 <1557821918.xbleq18bk2.naveen@linux.ibm.com>
In-Reply-To: <1557821918.xbleq18bk2.naveen@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1557985279.4o349j5g2i.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Naveen N. Rao's on May 14, 2019 6:32 pm:
> Michael Ellerman wrote:
>> "Naveen N. Rao" <naveen.n.rao@linux.ibm.com> writes:
>>> Michael Ellerman wrote:
>>>> Nicholas Piggin <npiggin@gmail.com> writes:
>>>>> The new mprofile-kernel mcount sequence is
>>>>>
>>>>>   mflr	r0
>>>>>   bl	_mcount
>>>>>
>>>>> Dynamic ftrace patches the branch instruction with a noop, but leaves
>>>>> the mflr. mflr is executed by the branch unit that can only execute o=
ne
>>>>> per cycle on POWER9 and shared with branches, so it would be nice to
>>>>> avoid it where possible.
>>>>>
>>>>> This patch is a hacky proof of concept to nop out the mflr. Can we do
>>>>> this or are there races or other issues with it?
>>>>=20
>>>> There's a race, isn't there?
>>>>=20
>>>> We have a function foo which currently has tracing disabled, so the mf=
lr
>>>> and bl are nop'ed out.
>>>>=20
>>>>   CPU 0			CPU 1
>>>>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>   bl foo
>>>>   nop (ie. not mflr)
>>>>   -> interrupt
>>>>   something else	enable tracing for foo
>>>>   ...			patch mflr and branch
>>>>   <- rfi
>>>>   bl _mcount
>>>>=20
>>>> So we end up in _mcount() but with r0 not populated.
>>>
>>> Good catch! Looks like we need to patch the mflr with a "b +8" similar=20
>>> to what we do in __ftrace_make_nop().
>>=20
>> Would that actually make it any faster though? Nick?
>=20
> Ok, how about doing this as a 2-step process?
> 1. patch 'mflr r0' with a 'b +8'
>    synchronize_rcu_tasks()
> 2. convert 'b +8' to a 'nop'

Good idea. Well the mflr r0 is harmless, so you can leave that in.
You just need to ensure it's not removed before the bl is. So nop
the bl _mcount, then synchronize_rcu_tasks(), then nop the mflr?

Thanks,
Nick

=
