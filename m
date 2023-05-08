Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C406FBA5F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 23:57:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFZsT0Bhlz3fCW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 07:57:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.214.180; helo=mail-pl1-f180.google.com; envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFZrx3xDSz3bxY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 07:57:20 +1000 (AEST)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ab1b79d3a7so34630035ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 May 2023 14:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683583036; x=1686175036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nr1Zb6Ozywk7OVF4mmQ0nbkLri6483J5psmZMkp9VDE=;
        b=MZp5tvKwNPw3b5QeyWPqkfwWQD1BYL6s8gdQF+Xf4eHnFRz/+dpCuWCrVngFEpZI//
         O4E74FfizPA0JU9KKAYZhNr6cP0+qtjAzwD9pKaTa3As2tQFpstPPgNt+/bNN6IKJP2/
         B/3SN5WHjyczfG/60s4y6wGDIgrktZ2QCoUY6JRC+piGzfhZBPZ+D3G8Ln6CNxep+Svr
         HKFdRvA7jIqxSzsSJQwJ23fHlhA4oXLn74Intqs6zekCidxu45/I5GMy7KT9gsHoc0mD
         8WU2Ypk5ckZdUu013XrZCSLFSB1dA32dXU6jZCZEIQhl8g8ADhg76Z/dvMp3sjY2qWMD
         7boA==
X-Gm-Message-State: AC+VfDz5JQPMzP/EYsvjq2O9nuuVv/PZgPpVTMPuyjQ/qe0jsLMQ3vv7
	HoPO5UY1eLn8Eud35S/aXxRmQlni1wmEwixP
X-Google-Smtp-Source: ACHHUZ4AlKuTsQsgvEyaPsvgyuctAYyyvVPxTjPdAXpm3k7Tcp3PXki3rCN3sgwONU2S9VCJuoS9sw==
X-Received: by 2002:a17:902:f690:b0:1ab:29bc:bd87 with SMTP id l16-20020a170902f69000b001ab29bcbd87mr13339357plg.35.1683583036136;
        Mon, 08 May 2023 14:57:16 -0700 (PDT)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com. [209.85.214.171])
        by smtp.gmail.com with ESMTPSA id b7-20020a170902d50700b001a19f3a661esm7764071plg.138.2023.05.08.14.57.13
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 14:57:15 -0700 (PDT)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1aad5245571so34637085ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 May 2023 14:57:13 -0700 (PDT)
X-Received: by 2002:a17:903:1247:b0:1ac:3605:97ec with SMTP id
 u7-20020a170903124700b001ac360597ecmr15056103plh.62.1683583033433; Mon, 08
 May 2023 14:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230310224128.2638078-1-u.kleine-koenig@pengutronix.de>
 <20230412171056.xcluewbuyytm77yp@pengutronix.de> <AM0PR04MB6289BB9BA4BC0B398F2989108F9B9@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <20230413060004.t55sqmfxqtnejvkc@pengutronix.de> <20230508134300.s36d6k4e25f6ubg4@pengutronix.de>
In-Reply-To: <20230508134300.s36d6k4e25f6ubg4@pengutronix.de>
From: Li Yang <leoyang.li@nxp.com>
Date: Mon, 8 May 2023 16:57:00 -0500
X-Gmail-Original-Message-ID: <CADRPPNQ0QiLzzKhHon62haPJCanDoN=B4QsWCxunJTc4wXwMaA@mail.gmail.com>
Message-ID: <CADRPPNQ0QiLzzKhHon62haPJCanDoN=B4QsWCxunJTc4wXwMaA@mail.gmail.com>
Subject: Re: [PATCH 0/6] bus: fsl-mc: Make remove function return void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
Cc: Stuart Yoder <stuyoder@gmail.com>, Gaurav Jain <gaurav.jain@nxp.com>, Roy Pledge <roy.pledge@nxp.com>, "Diana Madalina Craciun \(OSS\)" <diana.craciun@oss.nxp.com>, Eric Dumazet <edumazet@google.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Horia Geanta <horia.geanta@nxp.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Richard Cochran <richardcochran@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>, Alex Williamson <alex.williamson@redhat.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Herbert Xu <herbert@gondor.apana.org.au>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "Y.B. Lu" <yangbo.lu@nxp.com>, "dmaengine@vger.kernel.org
 " <dmaengine@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 8, 2023 at 8:44=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello Leo,
>
> On Thu, Apr 13, 2023 at 08:00:04AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > On Wed, Apr 12, 2023 at 09:30:05PM +0000, Leo Li wrote:
> > > > On Fri, Mar 10, 2023 at 11:41:22PM +0100, Uwe Kleine-K=C3=B6nig wro=
te:
> > > > > Hello,
> > > > >
> > > > > many bus remove functions return an integer which is a historic
> > > > > misdesign that makes driver authors assume that there is some kin=
d of
> > > > > error handling in the upper layers. This is wrong however and
> > > > > returning and error code only yields an error message.
> > > > >
> > > > > This series improves the fsl-mc bus by changing the remove callba=
ck to
> > > > > return no value instead. As a preparation all drivers are changed=
 to
> > > > > return zero before so that they don't trigger the error message.
> > > >
> > > > Who is supposed to pick up this patch series (or point out a good r=
eason for
> > > > not taking it)?
> > >
> > > Previously Greg KH picked up MC bus patches.
> > >
> > > If no one is picking up them this time, I probably can take it throug=
h
> > > the fsl soc tree.
> >
> > I guess Greg won't pick up this series as he didn't get a copy of it :-=
)
> >
> > Browsing through the history of drivers/bus/fsl-mc there is no
> > consistent maintainer to see. So if you can take it, that's very
> > appreciated.
>
> My mail was meant encouraging, maybe it was too subtile? I'll try again:
>
> Yes, please apply, that would be wonderful!

Sorry for missing your previous email.  I will do that.  Thanks.

Regards,
Leo
