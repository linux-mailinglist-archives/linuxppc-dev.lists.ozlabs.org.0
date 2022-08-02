Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D484F5878FF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 10:29:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lxp7B0VTkz3cBj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 18:29:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.17.10; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lxp6n6fSkz2xHL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 18:28:48 +1000 (AEST)
Received: from mail-ej1-f52.google.com ([209.85.218.52]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MCsDe-1o9xYx3txI-008omm for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Aug
 2022 10:28:43 +0200
Received: by mail-ej1-f52.google.com with SMTP id rq15so18624198ejc.10
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Aug 2022 01:28:43 -0700 (PDT)
X-Gm-Message-State: AJIora95crsI2qp8eTeZPN1o7AxuwasY3oUAMoyVjLDiG7ZaAVSZCS6J
	OU1c08/hzS5Zj1bAuDSnRWuu/Rym26HEjTuR+5A=
X-Google-Smtp-Source: AGRyM1sBgrA1UdcarZllVCRo42OFkmI9ilCikiNnJYMZ6OZZnO0W1vtMDHkMoPHBQLfE86HembsdnedooK68PmLoDLU=
X-Received: by 2002:a17:906:dc89:b0:72f:1d4f:cea8 with SMTP id
 cs9-20020a170906dc8900b0072f1d4fcea8mr15821217ejc.654.1659428923342; Tue, 02
 Aug 2022 01:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220722090929.mwhmxxdd7yioxqpz@pali> <6b227478-73b8-2a97-1c78-89570d928739@csgroup.eu>
 <20220723150702.jecerkhxhy65dgww@pali> <875yjld2oe.fsf@mpe.ellerman.id.au>
 <20220725125256.cg6su4d2ageylvp6@pali> <e2487668-b6d9-9ddb-1bb4-9f4d37fae1a7@csgroup.eu>
 <20220725201009.gwuchzswcqaxntrk@pali> <20220725215416.GV25951@gate.crashing.org>
 <20220726083406.tcjvny6d2di6q7ar@pali> <CAK8P3a2iM+RoySWEC2e0==rwBSVrZoRa8c4ADyFNB24JZM=hkw@mail.gmail.com>
 <20220726134405.GX25951@gate.crashing.org> <7e7feffd-1f22-83bf-1c74-4ec48d973514@csgroup.eu>
In-Reply-To: <7e7feffd-1f22-83bf-1c74-4ec48d973514@csgroup.eu>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 2 Aug 2022 10:28:27 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0GFeWY-SuXsbP9z8CZa_8tL9FT+8Xx=VVUA2KhdTT6gA@mail.gmail.com>
Message-ID: <CAK8P3a0GFeWY-SuXsbP9z8CZa_8tL9FT+8Xx=VVUA2KhdTT6gA@mail.gmail.com>
Subject: Re: Regression: Linux v5.15+ does not boot on Freescale P2020
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ad8Ijn6VbGNSK/kd5xSU4SARy8n8QaYfEMfoXpUet504y6P3wL9
 ADYnA7h7Pyn+jHo6+Er+0o+K4NjjJcIMEuCEAfUa0e5aJe2QBSxrITk+e+UEHXYl+OQ7EAe
 6o2DkuoXl9gQGX1QfMHFY2MfVWZQDfwXxlTpmbtqVGchUwlZhTZ9FiQCmSxuG/OwFPOi6fn
 VHqWljE+bCkCtLKfX+lnA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6UQ5kd2IJmg=:n0pkCGqy91BV9VKtd8RtDu
 0w2CTfjyZT5jOZZdaoPgM5xRR/rrrWKfPU0JbKZOFyusoAup8+3ioztdy6MOmHpvgx1PQ746/
 UxQ8/S3TvaF1yPQuRMjdTAG/2f71iHCKlxabT2zhzWwtvwvYd6Rm0elsBb91mhmM0uR/Hm40T
 nAMNw8ciOEQVbv/qYMr8veloyTosKry50NLZppDyjtb4uAk3H9Zmkz4NNGxJXS3W7D/FgUps1
 10dU8iP9OQsvyOEAcs7ZDmDVrW4zU8QEv52naVh0W8ZN4RJUAgwWMO7vImo/dUya7r1TedKYj
 Iw+NUT6UaFF3Vtxt6EUjVasFnuOeRQS4xP8MBzis4ioFiTyXFz4dMs03reY7r8hrxqlnP+93d
 MvngRHJmUixkjAgFby5gYXUfqaeLLCe6oyT1JHMV6D8CodkXqM3mdh8iSLoepVCdJibbEGGCQ
 n+o/z/Jaw1b2cwhpLS5ceuDuZUSU2aDdYkehm++6KXoqY3Mj57h+/lsertF4I8jFo6ss58dc+
 Fws39sEvoRQVGEDcviYUg0bxyPJmRSRRfZycOGC120OtFnnt+DlW+B/5GYyULdsNv0mICymqR
 458gkzEElVEpFg79EJP9Ur19jvL3l8WJTyOSpr8iD1c6F3U5l1Fx3J7P1frs0FSAnQdDijlll
 uAsy1Le6qOPzGo/Yc6yGljC2aPaFnezXp+72qBa5vE6vGvHzl8mmqZuB6XI6X50yymy6dUOfY
 2PI/MqyCuo6VCMNOEe3Vfl0+uIgV/U2yYqJDNXirx20x9+U6pK5hhHwmTDXZkCPE5Dd2+T+fr
 CY1TK336Y5gc3BOglEDx152vApkbE8PJ+OZnXHh4h9zv0yM4Inn6szW803/j3vMOD/ivh39YY
 XSVGIJTRB+A8f8SxNz2g==
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
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 2, 2022 at 8:47 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 26/07/2022 =C3=A0 15:44, Segher Boessenkool a =C3=A9crit :
> > Whoops :-)  We need fixes for processor implementation bugs all the
> > time of course, but this is a massive *design* bug.  I'm surprised this
> > CPU still works as well as it does!
>
> "Programming Environments Manual for 32-Bit Implementations of the
> PowerPC=E2=84=A2 Architecture" =C2=A74.1.2.2.2 says: "Invalid forms resul=
t when a bit
> or operand is coded incorrectly, for example, or when a reserved bit
> (shown as =E2=80=980=E2=80=99) is coded as =E2=80=981=E2=80=99."
> >
> > Also people using an SMP kernel on older cores should see the problem,
> > no?  Or is that patched out?  Or does this use case never happen :-)

It doesn't get patched out, I think it's just not a combination that anyone
tests on. The few defconfig files for SMP 85xx tend to be e500mc (which
is incompatible with the older cores).

> Maybe unlike e500, older cores ignore the EH bit and don't mind when
> it's set to 1 ?

Pretty sure this is the case. My interpretation is that Freescale and IBM
just interpreted the spec differently at the time and were not even aware
of the difference until it was too late.

        Arnd
