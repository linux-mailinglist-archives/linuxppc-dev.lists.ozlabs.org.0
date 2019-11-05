Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52712F0A6C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 00:48:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4775w52xxBzF3HQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 10:48:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4775t83WgpzF4V2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 10:46:55 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id e17so10724543otk.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Nov 2019 15:46:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iUouFbp90DaJNrdZUlRPbAF1tArrEhWp17DotmP+0tk=;
 b=k2i8dBCpzYAcQEAs/cz0K6dNlrb4AOIuGtKWfxvMM+FYyCAzZb5jNuY618DDSXoEWu
 OGCdtd4nWRFMlDH01xjcBOOhicXPxFbxYfCPDYiKOfns2LWyHClwiZDx/dW3m16OsqA3
 nuEY1rcRZ3jsCq9cpAUDSe360N2JuyI+K14hsaZ+m/1lOcSpvT8R5pXxWFDnMkJXR4o0
 0YfBipH+EZ4b3f/vpsm3jVOakqfXVneZas2McyzCUFyLRL1RK8mH1Ubz7dh4fE/W3p+4
 oJ+JvG4Kvb7N+8jr9C3m160oajPfVo6MGCdvJc0iuiiihlI0SATK1L09pOjPGyEZL5So
 dyAQ==
X-Gm-Message-State: APjAAAUab+LxR26Kjfqixxav9dSQLdEQBE5ouS6DOLGLOF6rVmGjp7+o
 z3ilBaoKEyqv0oERcz8iaBR7KEzW
X-Google-Smtp-Source: APXvYqxPRYCC80+37whUmt9sWYsPqJJi8dkiANWOuY91m/qBzwJM5wAP1H2ZUv9w9zJc5RPS4/QU3g==
X-Received: by 2002:a9d:611c:: with SMTP id i28mr21542229otj.348.1572997611862; 
 Tue, 05 Nov 2019 15:46:51 -0800 (PST)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com.
 [209.85.167.179])
 by smtp.gmail.com with ESMTPSA id o22sm6396171otk.47.2019.11.05.15.46.51
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2019 15:46:51 -0800 (PST)
Received: by mail-oi1-f179.google.com with SMTP id l20so7208487oie.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Nov 2019 15:46:51 -0800 (PST)
X-Received: by 2002:aca:4891:: with SMTP id v139mr1318447oia.175.1572997610943; 
 Tue, 05 Nov 2019 15:46:50 -0800 (PST)
MIME-Version: 1.0
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-36-linux@rasmusvillemoes.dk>
 <4e2ac670-2bf4-fb47-2130-c0120bcf0111@c-s.fr>
 <VE1PR04MB6687D4620E32176BDC120DBA8F620@VE1PR04MB6687.eurprd04.prod.outlook.com>
 <24ea27b6-adea-cc74-f480-b68de163f531@rasmusvillemoes.dk>
 <CADRPPNQ4dq1pnvNU71vNEgk1V5ovrT9O2=UMJxG45=ZSRdJ4ig@mail.gmail.com>
 <f48df0c7-77f1-268f-8588-7eff5e9fd7c5@rasmusvillemoes.dk>
In-Reply-To: <f48df0c7-77f1-268f-8588-7eff5e9fd7c5@rasmusvillemoes.dk>
From: Li Yang <leoyang.li@nxp.com>
Date: Tue, 5 Nov 2019 17:46:39 -0600
X-Gmail-Original-Message-ID: <CADRPPNQ0dR4GkGNmi2dEepJFpULD8DW7_FiYzJZ-er2=UtZ8nA@mail.gmail.com>
Message-ID: <CADRPPNQ0dR4GkGNmi2dEepJFpULD8DW7_FiYzJZ-er2=UtZ8nA@mail.gmail.com>
Subject: Re: [PATCH v3 35/36] net/wan: make FSL_UCC_HDLC explicitly depend on
 PPC32
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Nov 5, 2019 at 4:47 PM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> On 04/11/2019 21.56, Li Yang wrote:
>
> >> No, this patch cannot be dropped. Please see the kbuild complaints for
> >> v2,23/23 about use of IS_ERR_VALUE on not-sizeof(long) entities. I see
> >> kbuild has complained about the same thing for v3 since apparently the
> >> same thing appears in ucc_slow.c. So I'll fix that.
> >
> > When I made this comment I didn't notice you have removed all the
> > architectural dependencies for CONFIG_QUICC_ENGINE.  If the
> > QUICC_ENGINE is only buidable on powerpc, arm and arm64, this change
> > will not be needed.
> >
> > BTW, I'm not sure if it is a good idea to make it selectable on these
> > unrelavent architectures.  Real architectural dependencies and
> > COMPILE_TEST dependency will be better if we really want to test the
> > buildability on other platforms.
>
> Well, making QUICC_ENGINE depend on PPC32 || ARM would certainly make
> things easier for me. Once you include ARM64 or any other 64 bit
> architecture the buildbot complaints start rolling in from the
> IS_ERR_VALUEs. And ARM64 should be supported as well, so there really
> isn't much difference between dropping all arch restrictions and listing
> the relevant archs in the Kconfig dependencies.

I agree that it will be good to have the driver compile for all
architectures for compile test.  But list all the relevant
architectures and CONFIG_COMPILE_TEST as dependencies will make it not
really selected for these irrelevant architectures in real system.

Regards,
Leo
