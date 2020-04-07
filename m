Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEE51A03B6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 02:25:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48x7VK08KpzDqnT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 10:25:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cLp/U4LX; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48x7SM3XGHzDqmC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 10:24:03 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id kx8so632922pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 17:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=fkkoXTqICrhfI0O291OsPi1le2LLISiv9KvqGzJ1lRM=;
 b=cLp/U4LXlpw/S4H/fngDMWW48C/pnzAVPqAT/YjmmdcqLJitsCOl0bVKWyFJWzenSd
 DbjOae9WWegv+7Kn+jum0aM0VRbUl3pWv8OAg5kScEPatj34FXZfkDervrGJtN4cCaXE
 Zer8eZnpGSkFHcTqTLtufx8j+5kcYVQAwYKyCxxshH7ZRkMkdR0qbnl64cjLN9mBqG8I
 hmd6MGQmpvouNDAUNs4FM/9OgF1D7bia6OLeiyA2TjZhbH7/uO6UhFToGimfHSZYlzpm
 /UtWP2GEjyVWTRN++1wQ8Y4i3dxzdGbqSywEB3XL+GiSgUCDngAi6LGDo5ROQJFdwmJ3
 sGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=fkkoXTqICrhfI0O291OsPi1le2LLISiv9KvqGzJ1lRM=;
 b=K0jgTX4cjnx1mCGeVR4q4cltb/BsEVdJVwgQjts6S/d+UyfB04moh1AUJmMUiamFUv
 nZlE/+gmsIdKoH1/3ya2WAtLfOYc0xL4MrmJLJgbqo+vefuTHtUINFWzNqguyIa1Hm7E
 E+CsX4CGTG1Uj3zwc+6WmxZ2Toxk3z0wE9a3Z5tjvMeD8Q7o9nse+ZF9+LjcrxPtMt01
 6XmNGG7rdeXAQX/XIbBBEtesnGcWQRe8H+x1vCJUmgVxPTQBlZ2ENhtJYJ9qJQY9tR3B
 esg6VW3fzZyDd58SkNmKKvcQdJMEBMXQVL/2LLEVPCfqT4wueiNsekzAAmSWVAf0dQ9j
 MogA==
X-Gm-Message-State: AGi0PubrhehMvSRhnPzdLKlQsLVKc3beKarIrsCiXgwdiir1IhZf0Lc/
 P8Q6omyBDVeXGuTZN0DLaBY=
X-Google-Smtp-Source: APiQypJ1PmMXocM19uNmFSCVzSeP+x8zrMcsmsc5rJUdQsYouh5WdLMWmtNz6sxP1KZ/8kCis2jf7Q==
X-Received: by 2002:a17:90b:2394:: with SMTP id
 mr20mr1998678pjb.79.1586219039523; 
 Mon, 06 Apr 2020 17:23:59 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id r24sm3889293pgn.44.2020.04.06.17.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 17:23:58 -0700 (PDT)
Date: Tue, 07 Apr 2020 10:22:36 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH v2 05/13] powerpc/syscall: Rename syscall_64.c into
 syscall.c
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <029e1064b1ad738785718221ea468c9cfc282457.1586108649.git.christophe.leroy@c-s.fr>
 <cacbc62ded444e26e15ca67e0ec91b05b7de6459.1586108649.git.christophe.leroy@c-s.fr>
 <1586137301.c2ssus5vmb.astroid@bobo.none>
 <1a154868-6849-ebd7-9d38-673d0954c2d7@c-s.fr>
In-Reply-To: <1a154868-6849-ebd7-9d38-673d0954c2d7@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1586216862.v31svyhizc.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on April 7, 2020 4:20 am:
>=20
>=20
> Le 06/04/2020 =C3=A0 03:42, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Christophe Leroy's on April 6, 2020 3:44 am:
>>> syscall_64.c will be reused almost as is for PPC32.
>>>
>>> Rename it syscall.c
>>=20
>> Don't mind this, but I wonder if we can rename it to interrupt.c.
>=20
> Interrupt for me is irq.
>=20
> Maybe exception.c ?
>=20
> Exceptions, that's what interrupts and system calls are.

It's not the same. An interrupt is caused by an exception, but an=20
exception does not always cause an interrupt.

The code here is handling interrupts, it is not handling the exceptions
(those are handled by handlers that are called). We also handle
exceptions without taking an interrupt, for example if we set=20
decrementer or msgclr.

And we often (especially in 64-bit with soft masking) take interrupts
without handling the exception (we set EE=3D0 and return, leaving the
exception existing).

So I'm trying to fix terminology slowly. We are not "returning" from
an exception for example, that doesn't make sense. An exception is a
condition of processor state which is either satisfied or it is not.
What the software returns from is an interrupt.

I'd like irq to be ~=3D Linux irq, which in general means an asynchronous=20
interrupt that can be blocked by local_irq_disable or sometimes a device=20
irq specifically, as distinct from "interrupt" which is powerpc=20
architecture definition.

Thanks,
Nick
=
