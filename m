Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 308722E04C0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 04:30:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0MKq32YxzDqQT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 14:30:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AFT2g43Y; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0MHt6BL3zDqNr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Dec 2020 14:28:42 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id w5so7538069pgj.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 19:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=GBE3Mvr9HgeX297h6qW2RBB9m/r95z6g6VUdTz0LYyE=;
 b=AFT2g43Y8RXestXgRueSQc+wsIn3MYd/mHa6VoeL1klA8So/SVtGIA8PfBT8b3otwO
 xHSxjuidB4aK5CZZ1EE15BRZV5HIz5KYGNabVlWCNUQ51RrTaVXzoHXiVyku/LCBhnRN
 XJFc0+5VwSwY2hQeSJWbRCKCOOXSqhRi9jQq/3RTmqN6z4G0W/rFoIcmOlbPuKdvTRon
 J4GHHU+lR/GZngCOF5Jm15jEaR8reeApaM5v/YSboclqTEOYgqQUTYGq1c2YQYUe2zJC
 AyBfoQINnQrhGK0IWq1/6YeEUdBewFeZIQQP5n4cG4hyLbF91MzyxMNIXPsKRujc6hBz
 pVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=GBE3Mvr9HgeX297h6qW2RBB9m/r95z6g6VUdTz0LYyE=;
 b=Wz/hIJnA7Ws/MzT+Dnt4Zz1TNlVWQ7WKQORH4mKskFg8qTB9hEYmSAFi1aP2wJkYD9
 DOr9Sc2IDjR/VXdgpDC9plnt9MOWf4YL7J5aCKVAawfevwHNJOjtaI5aDKAImnHRJsbK
 ns+XhUoJvRFaUlasBXxaFMQpoZ47czMotNcTIkxfX0jAmAiM2IIh+RuISMjBXWALNIXx
 gHuDFmQlRBAKQqmVDq9cPhZqjSO9RkypFbwLUoVZcIs1aJOzdI/imbPzPRRj8emomfyx
 wYVDGB07elkf8/h9taAyjJp2bHQLcWadiWJoInqH3VXrXe61l1gvNMZ6l5oGYm1dW9sH
 4zlg==
X-Gm-Message-State: AOAM532SnXsghvi0hJo4Vsl1xleD7yKjiZpLSjMtkBapHt+Ro3+uZSAu
 l5Kla3q4/ksMWHM0PyVwlnsGNkbDNW4=
X-Google-Smtp-Source: ABdhPJw9hkEKYXrHzFl+fguxUSI4Pn1zj8JHCsueBQ0AOQ9m6/v5xb88bTtfk/HP9wVAgxwFZL6vew==
X-Received: by 2002:a63:4c4b:: with SMTP id m11mr17776240pgl.20.1608607718584; 
 Mon, 21 Dec 2020 19:28:38 -0800 (PST)
Received: from localhost (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id b13sm18724322pfi.162.2020.12.21.19.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 19:28:37 -0800 (PST)
Date: Tue, 22 Dec 2020 13:28:32 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: always enable queued spinlocks for 64s, disable
 for others
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20201221032226.888758-1-npiggin@gmail.com>
 <769ec5dd-8e74-56cb-a3fe-3b657bb3d14c@csgroup.eu>
In-Reply-To: <769ec5dd-8e74-56cb-a3fe-3b657bb3d14c@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1608607516.sjv8dzuw4m.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of December 21, 2020 4:04 pm:
>=20
>=20
> Le 21/12/2020 =C3=A0 04:22, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Queued spinlocks have shown to have good performance and fairness
>> properties even on smaller (2 socket) POWER systems. This selects
>> them automatically for 64s. For other platforms they are de-selected,
>> the standard spinlock is far simpler and smaller code, and single
>> chips with a handful of cores is unlikely to show any improvement.
>>=20
>> CONFIG_EXPERT still allows this to be changed, e.g., to help debug
>> performance or correctness issues.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/Kconfig | 8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index ae7391627054..1f9f9e64d638 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -255,6 +255,7 @@ config PPC
>>   	select PCI_MSI_ARCH_FALLBACKS		if PCI_MSI
>>   	select PCI_SYSCALL			if PCI
>>   	select PPC_DAWR				if PPC64
>> +	select PPC_QUEUED_SPINLOCKS		if !EXPERT && PPC_BOOK3S_64 && SMP
>=20
> The condition is a bit complicated, and it doesn't set it to Y by default=
 when EXPERT is selected.

Yeah, I don't know how to do that (switch people's oldconfig from =3DN to=20
=3DY) otherwise (without renaming the option). I think it's enough though,=20
experts should have said yes already :)

>=20
>>   	select RTC_LIB
>>   	select SPARSE_IRQ
>>   	select SYSCTL_EXCEPTION_TRACE
>> @@ -506,16 +507,13 @@ config HOTPLUG_CPU
>>   config PPC_QUEUED_SPINLOCKS
>>   	bool "Queued spinlocks"
>>   	depends on SMP
>> +	depends on EXPERT || PPC_BOOK3S_64
>> +
>=20
> I would do:
>=20
>     config PPC_QUEUED_SPINLOCKS
>   	bool "Queued spinlocks" if EXPERT
>   	depends on SMP
> 	default PPC_BOOK3S_64

That's nicer.

Thanks,
Nick
