Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE2318EEDC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 05:21:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m1RN2CwGzDqZQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 15:21:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=q81OyrZj; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m1H25GSTzDqgD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 15:14:22 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id z25so2528851pfa.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 21:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=WULtTOCjwyi9QruTZ6fQzlltct+XqJsTkVH8hoKrYsA=;
 b=q81OyrZjkxH5dx800fzz2+eyzeST6Um/5WnzJNquWKZRGOJc1BOM8qwR7lhSGvm3v3
 AyPBiPLxwUw3aG4V2a5/5aEaiqn1qv/K45e+DW5nCPOWpUx2Sx0uheIDlQuMEman2Yxv
 6D6Kalw36QwjUismWHFMNFqBCNeoJHeToWfxHRFp/zS8sSmtJO1mgs0Ov2u1kx9IhQ52
 M74/WU/u8yBLFyH+qS20l+Ayvs4+gtaQn5t40VwPdGlZ9YP6T542uW+ii47xzJgf4dQO
 kMrwXTzQ7EpiEJ2+eK1icrU7Tfc66EdybHmpLigl8rLR2RpN9q0sFQFaBW9mt7GvhBWV
 qRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=WULtTOCjwyi9QruTZ6fQzlltct+XqJsTkVH8hoKrYsA=;
 b=H++Drb607MDk7rGn/unPOEB4pH5KpVBxyIjwvgFhYFuYX4QfJYRXfLKqxV5QOQuRNz
 FPFlodE5GZjG2rq3cI6XYHkKcItjf18C+DxNHoMd55O6mg5IlVS5cOG4INut0GYm7LED
 00U9enZjJrBr8kL9NJf2nZdNsO2ADv7PWAqfd+LfDRSeSRFBEPw/MINNiAA9CX3HJXPY
 vot9bCeDkyV6Mo4U1xnuFS4MKKzdQlx3xySKW7AVNlHFX55TrE36CzrtwKRiIbo7VyRe
 m+1kwEe5eVIJhYab63stu/TEJf0fNm9TiWDGE0pJWFWpI8T/i3J++QhSAm4rMtAFEyxG
 pUDQ==
X-Gm-Message-State: ANhLgQ1SdbaO0sqNVh0/tpMC1iADatHFKdVgQRQPLyyKBlzKKUPqRtYp
 /QwkU2t46/ijhxqwxIhZQmhEzdDd
X-Google-Smtp-Source: ADFU+vu+QlH5n10PtxZ3W4I2uZOLyiU0c4YeXkFXf2wrQDddPQ4dC/i2hwN5sD40a3Wjxj+udNykXg==
X-Received: by 2002:a65:428a:: with SMTP id j10mr16718006pgp.272.1584936857570; 
 Sun, 22 Mar 2020 21:14:17 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id z63sm11013602pgd.12.2020.03.22.21.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 21:14:17 -0700 (PDT)
Date: Mon, 23 Mar 2020 14:10:39 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64: ftrace don't trace real mode
To: linuxppc-dev@lists.ozlabs.org, "Naveen N. Rao"
 <naveen.n.rao@linux.vnet.ibm.com>
References: <20200320152551.1468983-1-npiggin@gmail.com>
 <1584728788.91gvyrzbi3.naveen@linux.ibm.com>
 <1584759479.7ueu8qvhgs.astroid@bobo.none>
 <1584893587.qg26sf1ty0.naveen@linux.ibm.com>
In-Reply-To: <1584893587.qg26sf1ty0.naveen@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584936504.dbruogn3re.astroid@bobo.none>
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

Naveen N. Rao's on March 23, 2020 2:17 am:
> Nicholas Piggin wrote:
>> Naveen N. Rao's on March 21, 2020 4:39 am:
>>> Hi Nick,
>>>=20
>>> Nicholas Piggin wrote:
>>>> This warns and prevents tracing attempted in a real-mode context.
>>>=20
>>> Is this something you're seeing often? Last time we looked at this, KVM=
=20
>>> was the biggest offender and we introduced paca->ftrace_enabled as a wa=
y=20
>>> to disable ftrace while in KVM code.
>>=20
>> Not often but it has a tendancy to blow up the least tested code at the
>> worst times :)
>>=20
>> Machine check is bad, I'm sure HMI too but I haven't tested that yet.
>>=20
>> I've fixed up most of it with annotations, this is obviously an extra
>> safety not something to rely on like ftrace_enabled. Probably even the
>> WARN_ON here is dangerous here, but I don't want to leave these bugs
>> in there.
>=20
> Ok, makes sense.
>=20
>>=20
>> Although the machine check and hmi code touch a fair bit of stuff and
>> annotating is a bit fragile. It might actually be better if the
>> paca->ftrace_enabled could be a nesting counter, then we could use it
>> in machine checks too and avoid a lot of annotations.
>=20
> I'm not too familiar with MC/HMI, but I suppose those aren't re-entrant? =
=20
> If those have access to an emergency stack, can we save/restore=20
> ftrace_enabled state across the handlers?

Yeah that's true. They're not highly reentrant though, we could just=20
make it an 8 bit counter, it's nicer than saving / restoring from stack
(but I guess I could do that too).

>=20
> We're primarily disabling ftrace across idle/offline/KVM right now. I'm=20
> not sure if nesting is useful there.
>=20
>>=20
>>> While this is cheap when handling ftrace_regs_caller() as done in this=20
>>> patch, for simple function tracing (see below), we will have to grab th=
e=20
>>> MSR which will slow things down slightly.
>>=20
>> mfmsr is not too bad these days.=20
>=20
> That's great!

Thanks,
Nick
=
