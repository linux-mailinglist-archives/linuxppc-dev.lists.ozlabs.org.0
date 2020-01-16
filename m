Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 174AC13D80B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 11:37:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47z0y33m0PzDqZm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 21:37:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47z0vm5bjdzDqYh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 21:35:32 +1100 (AEDT)
Received: from [5.158.153.52] (helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1is2Uf-00048X-Ra; Thu, 16 Jan 2020 11:35:17 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id 7755E101B66; Thu, 16 Jan 2020 11:35:17 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Christophe Leroy <christophe.leroy@c-s.fr>, luto@kernel.org
Subject: Re: [RFC PATCH v3 08/12] lib: vdso: allow arches to provide vdso data
 pointer
In-Reply-To: <b5fddcf8-99ff-fc0d-40c0-0eb81ad4e94a@c-s.fr>
References: <cover.1578934751.git.christophe.leroy@c-s.fr>
 <381e547dbb3c48fd39d6cf208033bba38ad048fb.1578934751.git.christophe.leroy@c-s.fr>
 <87ftghbpuu.fsf@nanos.tec.linutronix.de>
 <d2de3211-9d7c-513e-fe0f-8bdce623fb65@c-s.fr>
 <b5fddcf8-99ff-fc0d-40c0-0eb81ad4e94a@c-s.fr>
Date: Thu, 16 Jan 2020 11:35:17 +0100
Message-ID: <87k15rwuxm.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
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
Cc: arnd@arndb.de, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Le 15/01/2020 =C3=A0 07:15, Christophe Leroy a =C3=A9crit=C2=A0:
>  From your point of view, what should I do:
> A/ __arch_get_vdso_data() handled entirely at arch level and arches=20
> handing over the vdso data pointer to generic C VDSO functions all the=20
> time (as in my v2 series) ?

No. That's again moving the same code to all architectures.

> B/ Data pointer being handed over all the way up for arches wanting to=20
> do so, no changes at all for others (as in my v3 series) ?

Too much ifdeffery

> C/ __arch_get_vdso_data() being called at the outermost generic level=20
> for arches not interested in handling data pointer from the caller (as=20
> suggested by Thomas) ?
>
> Andy, with A/ you were concerned about arches being able to do PC=20
> related accesses. Would it be an issue for C/ as well ? If not, I guess=20
> C/ would be cleaner than B/ allthought not as clean as A which doesn't=20
> add any #ifdefery at all.

You can avoid ifdeffery with C if you do:

static __maybe_unused int
__cvdso_data_clock_gettime(clockid_t clock, struct __kernel_timespec *ts,
                           const struct vdso_data *vd)
{
        .....
}

static __maybe_unused int
__cvdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
{
        const struct vdso_data *vd =3D __arch_get_vdso_data();

        return __cvdso_data_clock_gettime(clock, ts, vd);
}

and then use __cvdso_data_clock_gettime on PPC and let the other archs
unmodified.

Thanks,

        tglx
