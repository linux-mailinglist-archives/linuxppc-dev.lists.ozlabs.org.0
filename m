Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9132E18F23E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 10:57:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m8tf56R5zDqQ1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 20:57:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hUZIWMHk; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m8rY4CxLzDqQ1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 20:55:25 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id f206so7259889pfa.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 02:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=4D1Yk7aV5KUay3khao7Iagf4Ouqb7NPNl0EqVsFX830=;
 b=hUZIWMHkb86D9FPHvxYCvT8dGjbropw7rIwdgU/NuurOpCSIXsRUwvVcBleJ8gO9oF
 hjRu2TXYWeXHWYngMnh0DSd3Fj/T9Q1XkIDlrC0CtNJu1mupG2bupK9Mfg6WjIgX8v4c
 QJyunGxYLkPLPIJcTC5AIxi8gJDyJwobTLuhHLTtQEGvi14/npDdqk6t3MPGgchll81a
 MsAqCNDu0+T2L8y59BDMLa/542FwySoeXUjbaaG3gVg4vQh7Foc5Cp7GMmov3CaPXSes
 9AOStCrkDJ6URVthXUnAVy3GMIq7Xp/RCCuxH9Hym57729L7row1qM1O1OEbBbZle7jS
 VXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=4D1Yk7aV5KUay3khao7Iagf4Ouqb7NPNl0EqVsFX830=;
 b=gDLngvbMo8cdUC9DixfX3IgT4mrVcb/KS0YweFcJrasCxS5WzpJTdnunlKIDLaiXtW
 7Wo8wWg6+AGwg2TmRnLO0b8pEmgusx2hRXSwHeJTTS25GJUjyLD8M5vzViqC7AeZ9PxI
 G1QN21pDF14KDgtebsan2YVQrF9jnskQNGn5HypMIyglYKlscIPq2DoTz1h6YEuOlJ9+
 PpACi94mAdcD4sRjwsXJuFwFpHLhxu5ceixVRv5DjPvLv59YN7TbtwN/tcK9tCiqQ6QA
 M+vDHDo+6dLcT5xLaUUXUUMWV62uLvh4qfeUlRg4yXinOSeB0FRuFHr7wFuku09S93ms
 zteQ==
X-Gm-Message-State: ANhLgQ2kkh8o2ZvwKd86coVXXFAifU9AgUPP7uHhkuuUKF5ioZu2cj0j
 WGOCg+z/Vh7XbtIwsBZGLTk=
X-Google-Smtp-Source: ADFU+vvU8kXY8q7lTmjF+JNMvYcV+oWkIjIp55C7+z2LH9/bYl/qyoGMz7ZTAtKOvSrAUl/Wrms9HA==
X-Received: by 2002:a63:778e:: with SMTP id s136mr3772316pgc.155.1584957322461; 
 Mon, 23 Mar 2020 02:55:22 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id a127sm12835289pfa.111.2020.03.23.02.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 02:55:21 -0700 (PDT)
Date: Mon, 23 Mar 2020 19:51:32 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 03/16] powerpc: Use a datatype for instructions
To: Jordan Niethe <jniethe5@gmail.com>
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-4-jniethe5@gmail.com>
 <1584944554.pe2tzckmyl.astroid@bobo.none>
 <CACzsE9qy7dUv+sbcCN-i0EeYiH=DacutULunpBdgV0h8D0m2yQ@mail.gmail.com>
In-Reply-To: <CACzsE9qy7dUv+sbcCN-i0EeYiH=DacutULunpBdgV0h8D0m2yQ@mail.gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584956855.oidzv2r2fr.astroid@bobo.none>
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Balamuruhan S <bala24@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe's on March 23, 2020 7:28 pm:
> On Mon, Mar 23, 2020 at 5:27 PM Nicholas Piggin <npiggin@gmail.com> wrote=
:
>>
>> Jordan Niethe's on March 20, 2020 3:17 pm:
>> > Currently unsigned ints are used to represent instructions on powerpc.
>> > This has worked well as instructions have always been 4 byte words.
>> > However, a future ISA version will introduce some changes to
>> > instructions that mean this scheme will no longer work as well. This
>> > change is Prefixed Instructions. A prefixed instruction is made up of =
a
>> > word prefix followed by a word suffix to make an 8 byte double word
>> > instruction. No matter the endianess of the system the prefix always
>> > comes first. Prefixed instructions are only planned for powerpc64.
>> >
>> > Introduce a ppc_inst type to represent both prefixed and word
>> > instructions on powerpc64 while keeping it possible to exclusively hav=
e
>> > word instructions on powerpc32, A latter patch will expand the type to
>> > include prefixed instructions but for now just typedef it to a u32.
>> >
>> > Later patches will introduce helper functions and macros for
>> > manipulating the instructions so that powerpc64 and powerpc32 might
>> > maintain separate type definitions.
>>
>> ppc_inst_t I would slightly prefer for a typedef like this.
> Are _t types meant to be reserved?

No, just convention that structs are not normally typedefed unless
they are a pervasive interface that gets passed around a lot but
does not get accessed without accessor functions much. When you do
typedef them, add a _t (or less frequently _s/_u/etc). pte_t,
cpumask_t, atomic_t.

Thanks,
Nick
=
