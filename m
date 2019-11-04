Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 594B8EEA93
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 21:58:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476QB133lNzF3Nh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 07:58:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.196;
 helo=mail-oi1-f196.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476Q844z4dzF0dm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 07:56:34 +1100 (AEDT)
Received: by mail-oi1-f196.google.com with SMTP id k2so15422440oij.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2019 12:56:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/uPNoT5pyyczJJEGNLqWLD6OKr6e8V9JSPptdcpHVcU=;
 b=I6Pib02fbjxOEDvxtaPaID1yC9ltfdcK5tPMB5KI6fZELZ4eDGW3p/vxFToJBm3Gas
 OWiQ1DAhNyKFETkiIgj+eR0BZXRmxN8E2qgK1Gog/1ff/HjtIfrIe0i1kezIowow1z07
 IiCaIvvRRUhb5ZK8gyheC/oif7z9K5/S6tgDBHGVgR6WiBrNhS46VbHav6PzuoUGgpm5
 40eax76gf6bdJphJAkCMxQ8XaTmcaVmkgrJQj0az69IJL3y/HkC1gS5QO1ACrqb2anxA
 d3bhdp2VheURw4N2pOr/7ENqbHTl4tPQKuozfwjlD2gTmECLv7sQqowdh18kJXpFSLmI
 MlpA==
X-Gm-Message-State: APjAAAX2TnhpanVXv55nUxER7qbDZffsFOoO2LF/Awki3gqnBZlY/K72
 PZ5Q5Bm/5wVkC5r20r+sxs5MkCbA
X-Google-Smtp-Source: APXvYqzvqWiMC9d7IPtN2Q5g0kNURjDiEFgLMvaxENLJuG9f5D1gdC1tzZlowCnZv9FGwyLluDerGw==
X-Received: by 2002:a05:6808:287:: with SMTP id
 z7mr754246oic.139.1572900991627; 
 Mon, 04 Nov 2019 12:56:31 -0800 (PST)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com.
 [209.85.167.174])
 by smtp.gmail.com with ESMTPSA id m9sm5105211oim.9.2019.11.04.12.56.30
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2019 12:56:31 -0800 (PST)
Received: by mail-oi1-f174.google.com with SMTP id r27so15439610oij.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2019 12:56:30 -0800 (PST)
X-Received: by 2002:aca:ec89:: with SMTP id k131mr840013oih.154.1572900990777; 
 Mon, 04 Nov 2019 12:56:30 -0800 (PST)
MIME-Version: 1.0
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-36-linux@rasmusvillemoes.dk>
 <4e2ac670-2bf4-fb47-2130-c0120bcf0111@c-s.fr>
 <VE1PR04MB6687D4620E32176BDC120DBA8F620@VE1PR04MB6687.eurprd04.prod.outlook.com>
 <24ea27b6-adea-cc74-f480-b68de163f531@rasmusvillemoes.dk>
In-Reply-To: <24ea27b6-adea-cc74-f480-b68de163f531@rasmusvillemoes.dk>
From: Li Yang <leoyang.li@nxp.com>
Date: Mon, 4 Nov 2019 14:56:19 -0600
X-Gmail-Original-Message-ID: <CADRPPNQ4dq1pnvNU71vNEgk1V5ovrT9O2=UMJxG45=ZSRdJ4ig@mail.gmail.com>
Message-ID: <CADRPPNQ4dq1pnvNU71vNEgk1V5ovrT9O2=UMJxG45=ZSRdJ4ig@mail.gmail.com>
Subject: Re: [PATCH v3 35/36] net/wan: make FSL_UCC_HDLC explicitly depend on
 PPC32
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Scott Wood <oss@buserror.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 4, 2019 at 2:39 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> On 01/11/2019 23.31, Leo Li wrote:
> >
> >
> >> -----Original Message-----
> >> From: Christophe Leroy <christophe.leroy@c-s.fr>
> >> Sent: Friday, November 1, 2019 11:30 AM
> >> To: Rasmus Villemoes <linux@rasmusvillemoes.dk>; Qiang Zhao
> >> <qiang.zhao@nxp.com>; Leo Li <leoyang.li@nxp.com>
> >> Cc: linuxppc-dev@lists.ozlabs.org; linux-arm-kernel@lists.infradead.or=
g;
> >> linux-kernel@vger.kernel.org; Scott Wood <oss@buserror.net>;
> >> netdev@vger.kernel.org
> >> Subject: Re: [PATCH v3 35/36] net/wan: make FSL_UCC_HDLC explicitly
> >> depend on PPC32
> >>
> >>
> >>
> >> Le 01/11/2019 =C3=A0 13:42, Rasmus Villemoes a =C3=A9crit :
> >>> Currently, FSL_UCC_HDLC depends on QUICC_ENGINE, which in turn
> >> depends
> >>> on PPC32. As preparation for removing the latter and thus allowing th=
e
> >>> core QE code to be built for other architectures, make FSL_UCC_HDLC
> >>> explicitly depend on PPC32.
> >>
> >> Is that really powerpc specific ? Can't the ARM QE perform HDLC on UCC=
 ?
>
> I think the driver would build on ARM. Whether it works I don't know. I
> know it does not build on 64 bit hosts (see kbuild report for v2,23/23).

The problem for arm64 can be easy to fix.  Actually I don't think it
is neccessarily to be compiled on all architectures except powerpc,
arm and arm64.  I am surprised that you made the core QE code compile
for all architecture(although still have some kbuild warnings)

>
> > No.  Actually the HDLC and TDM are the major reason to integrate a QE o=
n the ARM based Layerscape SoCs.
>
> [citation needed].

I got this message from our marketing team.  Also it is reflected on
marketing materials like
https://www.nxp.com/products/processors-and-microcontrollers/arm-processors=
/layerscape-communication-process/qoriq-layerscape-1043a-and-1023a-multicor=
e-communications-processors:LS1043A

"The QorIQ LS1043A ... integrated QUICC Engine=C2=AE for legacy glue-less
HDLC, TDM or Profibus support."

>
> > Since Rasmus doesn't have the hardware to test this feature Qiang Zhao =
probably can help verify the functionality of TDM and we can drop this patc=
h.
>
> No, this patch cannot be dropped. Please see the kbuild complaints for
> v2,23/23 about use of IS_ERR_VALUE on not-sizeof(long) entities. I see
> kbuild has complained about the same thing for v3 since apparently the
> same thing appears in ucc_slow.c. So I'll fix that.

When I made this comment I didn't notice you have removed all the
architectural dependencies for CONFIG_QUICC_ENGINE.  If the
QUICC_ENGINE is only buidable on powerpc, arm and arm64, this change
will not be needed.

BTW, I'm not sure if it is a good idea to make it selectable on these
unrelavent architectures.  Real architectural dependencies and
COMPILE_TEST dependency will be better if we really want to test the
buildability on other platforms.

Regards,
Leo
