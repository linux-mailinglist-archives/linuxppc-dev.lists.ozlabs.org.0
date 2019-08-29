Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07374A2016
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 17:54:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46K6cR0pdgzDr6W
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 01:54:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="djH6La8j"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46K6XF32LZzDrdR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 01:50:53 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id p3so1791539pgb.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 08:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=zWyJTdUHWgBJkX5LtSotNggpMMu1fgvQtBIm+NFzJxM=;
 b=djH6La8j6LacLE472fc+s6E0FC/lSEap/hhMHZ0/D+40T14Y1aMBXP5n8wP9NmMnba
 ski12u+y5Hgu6K60VSGeUXuUGotQZWxWfuT222f4TKK7sfDNbjxHEGHJaKe8kRUiaH1N
 PcvnEiKBm+fB40/tlai5o1+qe7/w18r4m6RzUdYfWvvdjKpgDeVmONdtbdET96lir1je
 M/xr030BsOuL3rX0HtFcFKONrFUKVZ+/MH01ew2wLL6kYvGk8AI/etMI/vJdqMD7q0cF
 c5M7LO8aLaTrK3Q9VrPXsUXjN2ePGTUDcw7Bkt/Wf8SlyAHvM0RtwNiz9gUnWXRhNG1l
 HZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=zWyJTdUHWgBJkX5LtSotNggpMMu1fgvQtBIm+NFzJxM=;
 b=ZDCVKVqXruAP8VEuEeVwxCUqZC8VOnekJb/VUNGr90g0cLaKnPWNgoaYSenpnc3OfX
 wWFEJAwcOXONveDYosSNiszL73UgpYpRCXz+nr8sqeDzY6qSbwmrzwhi+rIvahSD2iDy
 bA9VNkkt2VcXJZaduUtOGVVMKDfdwZigrQczNK9CwasWQhtY901hTJ9mqmDVcKtnpsgM
 enCXV3ohwgj+IQ697GyCtH0mnIzgA9Cx48UJZYJRa3hJ6OEDRfEGX5YYsqViC2Z9Obym
 RQkUw3o6r+kuaJE/DvKZDF1KmFiEamEAYo96dCGjL9aVyvN0DqZ90cl2b1/+SHxImeGJ
 sc2A==
X-Gm-Message-State: APjAAAWtEX3RXHTeBuYrkMbPize7A5hHCsn6HzSegV8oA4dA6OFeitF8
 l2RpXKbKKWJfgoMAJf19e48=
X-Google-Smtp-Source: APXvYqxXiN04gJX2JCJrXV2itoiqpLBNeaL94nMWUvMxKhUjeThyv97kDLcu1pRpHD3hQ58w4uSGxQ==
X-Received: by 2002:a63:d23:: with SMTP id c35mr8927276pgl.376.1567093850887; 
 Thu, 29 Aug 2019 08:50:50 -0700 (PDT)
Received: from localhost ([61.68.162.209])
 by smtp.gmail.com with ESMTPSA id e5sm2731803pgt.91.2019.08.29.08.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 08:50:50 -0700 (PDT)
Date: Fri, 30 Aug 2019 01:49:02 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 0/4] powerpc/64: syscalls in C
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20190827135548.21457-1-npiggin@gmail.com>
 <5ecd9d1a-d35e-dc8c-9ad4-a830a8b1a952@c-s.fr>
 <1566985278.ehbnos9t6c.astroid@bobo.none>
 <4d0359d8-0958-583f-7727-10a51bd3c7c6@c-s.fr>
 <1567070800.hlilai6sy6.astroid@bobo.none>
 <20190829115122.GJ31406@gate.crashing.org>
In-Reply-To: <20190829115122.GJ31406@gate.crashing.org>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1567092470.5ojl8q11gz.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool's on August 29, 2019 9:51 pm:
> On Thu, Aug 29, 2019 at 07:38:01PM +1000, Nicholas Piggin wrote:
>> So... this actually seems to work. Haven't booted it, but the compiler
>> seems to do what we want.
>=20
> From the GCC manual:
>=20
>    After defining a global register variable, for the current compilation
>   unit:
>=20
>      * If the register is a call-saved register, call ABI is affected: th=
e
>        register will not be restored in function epilogue sequences after
>        the variable has been assigned.  Therefore, functions cannot safel=
y
>        return to callers that assume standard ABI.
>=20
> and
>=20
>      * Accesses to the variable may be optimized as usual and the registe=
r
>        remains available for allocation and use in any computations,
>        provided that observable values of the variable are not affected.
>=20
> This doesn't do what you think, or what you want, or what you think you
> want ;-)

After reading gcc docs from gcc 4 to 9, I think it does.

We want this to apply to all functions in the compilaition unit. It's
fine to use the regs temporarily, and so it's fine for called functions
in other units to call them (because they will be restored), and we
don't want them restored for our caller.

> (And if you make all those regs -ffixed-* you are in for a world of hurt)=
.

From the look of it, -ffixed would be a little bit stronger in that it
will never allow the register to be used, wheras the global register
variable allows it to be allocated and used elsewhere so long as its
observable value is not affected. The latter is actually preferred=20
because it's fine for the compiler to use the regs if it wants to. It
does not even have to use r15 register when I reference r15 variable,
only whatever value it had.

Thanks,
Nick
=
