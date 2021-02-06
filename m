Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E15311967
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 04:04:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXcb64g6CzDqv6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 14:04:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XHE7VzBe; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXcYM4vffzDqCX
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 14:03:18 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id lw17so7404029pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Feb 2021 19:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=P8M5D06zGz+PP013NXW7T63SHqKN6IjGe2PJ8tjT/2M=;
 b=XHE7VzBeJ2VyZCPQMDaisRZpClsmtX217Q8Cgdwx9ko69Fi5QbynKNqxgLWUpM2bky
 WPB7UTigD2ob9uxRdLQykZwyfhwJgAjCoCHwLgn8UvkvjpcrEipfcVa7z+7g5jwlz6eP
 UFyncS8wiBBC6pYf+M7/FizQjhrofvnnvaUHHS/y7wuK99w9cc6VpTw4tvXDCQNjlGW1
 vn8FTnp7Wd790YaVImg3dSIDExL/78UXbmBlYk5KNeuvkd8B0stdiMpxneFbaqkr1xsi
 F/vxjHdZHXsnp2p7RpsaObZBaLeu1mbnXDqcFR2XGqCNXDMpcZoy5rhqQvUW2qy7mmuc
 eW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=P8M5D06zGz+PP013NXW7T63SHqKN6IjGe2PJ8tjT/2M=;
 b=X8nSAMsHTI51UQsQmNHyBZLY7/iL1aTmhH5pPjTuHXoTGjuy4vW1pbvgOQFfR4p0Jm
 PC3tvUdRZBj4gNSLdair3jhWJYWR75s3AKe0hihjh2ORn1u/zItjBUAX/BnWv/ZdtdJS
 QrSuLiUrRAVsa9TVvSQ8OWwOxjOZT+b6jWOduWjdfBjoMcSAeLFlnhwdaWYUMjGfgzxA
 7HhVoWr0IOu3a5SspVB2KqKwKt98yjqm5bJrjsr+VqIrqOqKd+zcmLNkxzkIed491HnY
 iTFPGmc4gk7CdyFJINGO42pQNM5ECUC0FHivyE0BpZ7LWJeBdtrvyWI4A7bNI6QBBlVi
 RdfQ==
X-Gm-Message-State: AOAM533RphQNqefzMIs5IkNNgS7Q7r9kBtSGVk1BH1QTPyzSscJ0iGQv
 QnOnkeudYRrkC+Jm+5UWQJQ=
X-Google-Smtp-Source: ABdhPJxJDmx9MXlvGvNPHaf7pRRBEVl8C9+Widbx/vQIGpAMgg0BZtVlJlGx3r9B0aHF0Ng4b2qBIQ==
X-Received: by 2002:a17:90a:4a84:: with SMTP id
 f4mr7094787pjh.231.1612580595381; 
 Fri, 05 Feb 2021 19:03:15 -0800 (PST)
Received: from localhost (60-242-11-44.static.tpgi.com.au. [60.242.11.44])
 by smtp.gmail.com with ESMTPSA id x4sm3135012pfm.64.2021.02.05.19.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 19:03:14 -0800 (PST)
Date: Sat, 06 Feb 2021 13:03:09 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 1/1] powerpc/kvm: Save Timebase Offset to fix
 sched_clock() while running guest code.
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Athira Rajeev
 <atrajeev@linux.vnet.ibm.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Frederic Weisbecker <frederic@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Jordan Niethe <jniethe5@gmail.com>, Leonardo Bras
 <leobras.c@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras
 <paulus@ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>
References: <20210205060643.233481-1-leobras.c@gmail.com>
 <1612506268.6rrvx34gzu.astroid@bobo.none>
 <7e231b91e41c3f3586ba2fd604c40f1716db228d.camel@gmail.com>
In-Reply-To: <7e231b91e41c3f3586ba2fd604c40f1716db228d.camel@gmail.com>
MIME-Version: 1.0
Message-Id: <1612579579.ztbklit4un.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Leonardo Bras's message of February 5, 2021 5:01 pm:
> Hey Nick, thanks for reviewing :)
>=20
> On Fri, 2021-02-05 at 16:28 +1000, Nicholas Piggin wrote:
>> Excerpts from Leonardo Bras's message of February 5, 2021 4:06 pm:
>> > Before guest entry, TBU40 register is changed to reflect guest timebas=
e.
>> > After exitting guest, the register is reverted to it's original value.
>> >=20
>> > If one tries to get the timestamp from host between those changes, it
>> > will present an incorrect value.
>> >=20
>> > An example would be trying to add a tracepoint in
>> > kvmppc_guest_entry_inject_int(), which depending on last tracepoint
>> > acquired could actually cause the host to crash.
>> >=20
>> > Save the Timebase Offset to PACA and use it on sched_clock() to always
>> > get the correct timestamp.
>>=20
>> Ouch. Not sure how reasonable it is to half switch into guest registers=20
>> and expect to call into the wider kernel, fixing things up as we go.=20
>> What if mftb is used in other places?
>=20
> IIUC, the CPU is not supposed to call anything as host between guest
> entry and guest exit, except guest-related cases, like

When I say "call", I'm including tracing in that. If a function is not=20
marked as no trace, then it will call into the tracing subsystem.

> kvmppc_guest_entry_inject_int(), but anyway, if something calls mftb it
> will still get the same value as before.

Right, so it'll be out of whack again.

> This is only supposed to change stuff that depends on sched_clock, like
> Tracepoints, that can happen in those exceptions.

If they depend on sched_clock that's one thing. Do they definitely have=20
no dependencies on mftb from other calls?

>> Especially as it doesn't seem like there is a reason that function _has_
>> to be called after the timebase is switched to guest, that's just how=20
>> the code is structured.
>=20
> Correct, but if called, like in rb routines, used by tracepoints, the
> difference between last tb and current (lower) tb may cause the CPU to
> trap PROGRAM exception, crashing host.=20

Yes, so I agree with Michael any function that is involved when we begin=20
to switch into guest context (or have not completed switching back to=20
host going the other way) should be marked as no trace (noinstr even,=20
perhaps).

>> As a local hack to work out a bug okay. If you really need it upstream=20
>> could you put it under a debug config option?
>=20
> You mean something that is automatically selected whenever those
> configs are enabled?=20
>=20
> CONFIG_TRACEPOINT && CONFIG_KVM_BOOK3S_HANDLER && CONFIG_PPC_BOOK3S_64
>=20
> Or something the user need to select himself in menuconfig?

Yeah I meant a default n thing under powerpc kernel debugging somewhere.

Thanks,
Nick
