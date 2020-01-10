Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B1D137842
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 22:04:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vb8N3LSyzDqhm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2020 08:04:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=amacapital.net (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=luto@amacapital.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amacapital.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=amacapital-net.20150623.gappssmtp.com
 header.i=@amacapital-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=diDEq6At; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vb6F0kzJzDqTJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2020 08:02:44 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id d15so88541pjw.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 13:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=jfaknLo6dB7P4TvTZQmRLqfYR5CIiTdIXE9lXNwSsYU=;
 b=diDEq6At2DzWHKg+ysDMV1tW4o5AwiDyePd9VJ3pD+hsHR8cFV1SQyA59/kk5j+xgK
 1TsiRsOtgi+SYWZwPpnwbgbMpOpTBFOKIhld9J4VOn7z8Dvcdp0cMv0hT4o/pvqNYmDt
 o4KzRsf6U3mSxqr+NmFY1NZJnZtU2+mfib5RYv0qXqMmAsYYbLhAWvkbyVPGWDeCmn8R
 7u0u0fxOpKaCifg3xTVtRj86GX6J5Y91BN2RZHE6YugaM1ohryvVWffdKXI4ka0Un7Ss
 RKeBRruVTUOlB+gGzitr3sXC8NAV3FbdCW7mfIrVpeM7E4B6rp/ZzqXS+QVwjmw5GjMb
 dA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=jfaknLo6dB7P4TvTZQmRLqfYR5CIiTdIXE9lXNwSsYU=;
 b=DD5nYho5kNZbbJCCFedtThCyxvF25JfugwZlUsBPq+OkgcYZUdPB5QlDTvohH4IAbW
 qqJyJCjRCE+2wDOEYAXOV1WZ5LFAgp6X0y2J6JvUbl80tH+vrfcivpvxxfj8qX59BFgR
 5cwseRt9YZ0QvLOmjgT8RtTM4q8EypMeveg9+KlDQborv/+zeVYItjdNfvB4boU5icLz
 JWH9qXRbBWwzCy3UmM2qSXt0bT8fOfnqAGDgPlgV3Mliz3N710mRO8XkuBg9GfJvUCHx
 G7TzMgqji65BwCDwA0WFdUkV2JN4IObDQB6rLMQcBAteo6fkjKlHVG6s4NtuBH4x5QMz
 D8FQ==
X-Gm-Message-State: APjAAAWbAN6mudtV72lq0B5/gP3awOXUfYCNDseywFlNSAhzrPD8XB2I
 ACGmOR5xwE3/7Wb7zCCrNi+t/w==
X-Google-Smtp-Source: APXvYqwcK5EuXgyJPF3Ld4Ugh4h8SPw00JyrmxOuZ/D2wMI6lxIb8hITf4wySqQXcJ4mHz7I9DvGuA==
X-Received: by 2002:a17:902:ff12:: with SMTP id
 f18mr545089plj.256.1578690162146; 
 Fri, 10 Jan 2020 13:02:42 -0800 (PST)
Received: from [10.197.30.113] ([139.104.2.240])
 by smtp.gmail.com with ESMTPSA id d22sm3725278pgg.52.2020.01.10.13.02.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2020 13:02:41 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH v2 01/10] lib: vdso: ensure all arches have 32bit
 fallback
Date: Fri, 10 Jan 2020 11:02:38 -1000
Message-Id: <53785EAC-A04C-4B02-9698-D11D75BE2C4D@amacapital.net>
References: <87sgknrpxy.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87sgknrpxy.fsf@nanos.tec.linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
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
 Paul Mackerras <paulus@samba.org>, Andrew Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Jan 10, 2020, at 10:56 AM, Thomas Gleixner <tglx@linutronix.de> wrote:
>=20
> =EF=BB=BFAndy Lutomirski <luto@kernel.org> writes:
>=20
>>> On Mon, Dec 23, 2019 at 6:31 AM Christophe Leroy
>>> <christophe.leroy@c-s.fr> wrote:
>>>=20
>>> In order to simplify next step which moves fallback call at arch
>>> level, ensure all arches have a 32bit fallback instead of handling
>>> the lack of 32bit fallback in the common code based
>>> on VDSO_HAS_32BIT_FALLBACK
>>=20
>> I don't like this.  You've implemented what appear to be nonsensical
>> fallbacks (the 32-bit fallback for a 64-bit vDSO build?  There's no
>> such thing).
>>=20
>> How exactly does this simplify patch 2?
>=20
> There is a patchset from Vincenzo which fell through the cracks which
> addresses the VDS_HAS_32BIT_FALLBACK issue properly. I'm about to pick
> it up. See:
>=20
> https://lore.kernel.org/lkml/20190830135902.20861-1-vincenzo.frascino@arm.=
com/
>=20

Thanks.  I had been wondering why the conditionals were still there, since I=
 remember seeing these patches.

> Thanks,
>=20
>        tglx
