Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 753E912A103
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 13:06:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hw1j3BTgzDqNx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 23:06:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=amacapital.net (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=luto@amacapital.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amacapital.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=amacapital-net.20150623.gappssmtp.com
 header.i=@amacapital-net.20150623.gappssmtp.com header.b="AQugnPU1"; 
 dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hvzK5TLBzDqDM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 23:04:40 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id j11so1118325pjs.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 04:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=VHzH6WH6Y51Hv8qWhxgK6vx35XDhgJUQtiy7D9VMqAM=;
 b=AQugnPU1j3l+UliZJ1cFDWfn1gfoQcO/nzfL11rOcYeTLX/P87iqPaaJmBaMlSz7f1
 /DhGazm2NTR2ZIaiN+mUvEAnOZrI7Ge0Mg1zI2ZlVdeTi0aTgDWcWRqSCId8E113LX3m
 6HCYlixeRMc9TaLMlaAzwKbLAUzigX1Ncl8C866LmmeME3vMRc45SQjPLyr6MHX+L6Cw
 vv52P5dueRyUQBwwusD+tHpoqoHbOj8XjhE0q9U9hlqCHn27d/gBrcaQanBO29ITAp34
 bn7tzg79vFow2UHY2TlVVezhuLVq4rXQXKJzfTff9415HHT3maptkAcWgSZsizcHzud6
 8efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=VHzH6WH6Y51Hv8qWhxgK6vx35XDhgJUQtiy7D9VMqAM=;
 b=KHgQMi6REf4ns/ewMKDRzNIUONoFsh1JjiWI4vKrCsnTXsOW4XGpmevcRHeXW52uZV
 cMlKw8CASQa1ug7Uh4Y75PiH/PqWLlBYQleDwZSwWVKJ9EjsyJQ3mNi0aL8frZvaeHTs
 G6Y5NZrklkUVfcYmr8PDF8VcyBXz0ML8mFm7IzDPfGhJ/ZAWh5pMCWwwItbtZK/lqRsr
 zc8+92pnyMOChauVIGs+63MMYjx+J5xFER1nKImHEX2RmL6Cj8up04y+XrO43laf0qMA
 TlwW/G7IH1+0dP8bQw0NIPE8XpL6IGFDFc9ftKLaHVDw/AZBMjMJoHUMny72BnxhV9nj
 ISVg==
X-Gm-Message-State: APjAAAWIRwK8rsBHxlQo3CyYIakZFzX7U2dQTRiCg00gat4z6bN13ntW
 Mk6NBie14enEG+sBW/GwxxKsZA==
X-Google-Smtp-Source: APXvYqyJXa2dY59EyR45IM7PX4/Dja/wo48oiNHNLhyt3TL1GWpIJ61wHLTCUZ3QRkI0SvFitogUkA==
X-Received: by 2002:a17:902:7288:: with SMTP id
 d8mr34182926pll.341.1577189076952; 
 Tue, 24 Dec 2019 04:04:36 -0800 (PST)
Received: from [192.168.0.9] (111-255-104-19.dynamic-ip.hinet.net.
 [111.255.104.19])
 by smtp.gmail.com with ESMTPSA id k21sm14926039pfa.63.2019.12.24.04.04.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Dec 2019 04:04:36 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH v2 07/10] lib: vdso: don't use READ_ONCE() in
 __c_kernel_time()
Date: Tue, 24 Dec 2019 20:04:33 +0800
Message-Id: <98C1F790-7647-4203-9B31-4B8FED8CCA12@amacapital.net>
References: <abc4b4a6-d355-4dfd-a207-603e877b2b23@c-s.fr>
In-Reply-To: <abc4b4a6-d355-4dfd-a207-603e877b2b23@c-s.fr>
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


> On Dec 24, 2019, at 7:12 PM, christophe leroy <christophe.leroy@c-s.fr> wr=
ote:
>=20
> =EF=BB=BF
>=20
>> Le 24/12/2019 =C3=A0 02:58, Andy Lutomirski a =C3=A9crit :
>>> On Mon, Dec 23, 2019 at 6:31 AM Christophe Leroy
>>> <christophe.leroy@c-s.fr> wrote:
>>>=20
>>> READ_ONCE() forces the read of the 64 bit value of
>>> vd[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec allthough
>>> only the lower part is needed.
>> Seems reasonable and very unlikely to be harmful.  That being said,
>> this function really ought to be considered deprecated -- 32-bit
>> time_t is insufficient.
>> Do you get even better code if you move the read into the if statement?
>=20
> Euh ...
>=20
> How can you return t when time pointer is NULL if you read t only when tim=
e pointer is not NULL ?
>=20
>=20

Duh, never mind.

But this means your patch may be buggy: you need to make sure the compiler r=
eturns the *same* value it stores. Maybe you=E2=80=99re saved by the potenti=
al aliasing between the data page and the passed parameter and the value you=
 read, but that=E2=80=99sa bad thing to rely on.

Try barrier() after the read.=
