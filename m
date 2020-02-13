Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F066D15B708
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 03:12:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48J0Qh2TPGzDqSf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 13:12:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=B4o4H9MS; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48J0NW457HzDqS0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 13:10:51 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id t13so3289299qto.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 18:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mUdWWp+c0fomnydwOZuzDqMxQIhxsbRs6tTf2TPYRzA=;
 b=B4o4H9MS03jB3qy+5V0hztuGt3eAHe4/kGTzKfPzIWZrT6Y4P2LcjHeFf4TFYvd/4j
 c1VJvS86dpFeceOKyicjeG6kYeVBDsmpTaXrZ20HPUemdGubmkbA7sBEC6ahtejz3YAO
 cVaQ/gJ7T9m2ApmVqTSgj3VnjBCPXehozQsheNAbO72TPNNrMu7/PbSeLE1OlLLEzsTB
 z4uefz8/7cc19Ehm9ubSScg/EwOgQB7zT4isfIYAYKb8EVl8NR11BCDQkCjmPNd4LrUE
 biYkgKUS8ALiZ3ciyqkigVZnZldwIJ6DlBboH0IqE/3d4W/ufw9l2xwsxLZV41XTE03f
 uN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mUdWWp+c0fomnydwOZuzDqMxQIhxsbRs6tTf2TPYRzA=;
 b=CGZMyjxOFOV1eh5fPdyPve0QWpYncEMIvBJ1YpGwfwOU6O5joMJcflC12sIhHMRPQ7
 s4IZEXjkMarI8ePHWAmBRq6s39afRhK13QNemvHFM3tSOX6onl7Vuxh6Sud5xFOQ9gh7
 Hqx29CA+pIfS5DFUCrpv5IEeltDkmsareB5wHC/Mbq5F8C4bFhF2C/IfDIhh7olSv+xY
 +fTtdkLsEPnILYcOJU/CVPlyi0586rCCplpkSS5MWjz5klK9PRCnFKmUPfujrNc7x8p8
 O974yWOSkLwwzZUASxL4EKVQnkoZWQtktW84ig1/kplmMzY8kYA1GUPcqB6KESXbE5Hy
 vdCg==
X-Gm-Message-State: APjAAAXVpqBbkmjrtdmzl6MxpzfNPrDp+apOJi5+WWESCyXsmNTAo7q2
 fawb2WsM3p4lxD2TDZY1RCz/ez8mqD2iukzmdU8=
X-Google-Smtp-Source: APXvYqxdyDijz1rGqrbYCmLrIjViy7wgwMXb68AAZ4r2pC01PDuSdhiWq9HvmosjKuHgpR9L2JZlZb6NKQE8p5vXjwU=
X-Received: by 2002:ac8:3a27:: with SMTP id w36mr21937606qte.204.1581559847782; 
 Wed, 12 Feb 2020 18:10:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581475981.git.shengjiu.wang@nxp.com>
 <1ae9af586a2003e23885ccc7ef58ee2b1dce29f7.1581475981.git.shengjiu.wang@nxp.com>
 <CAOMZO5Do=dzh4WXvm44mB7-PeesWuA6qRtMXwHCH9piXd1dZEw@mail.gmail.com>
In-Reply-To: <CAOMZO5Do=dzh4WXvm44mB7-PeesWuA6qRtMXwHCH9piXd1dZEw@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 13 Feb 2020 10:10:36 +0800
Message-ID: <CAA+D8ANGtnPYNA9__Zeg8MJDaiw_kVebUUgU-jPmp8GXRNX4hg@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH 2/3] ASoC: dt-bindings: fsl_easrc: Add
 document for EASRC
To: Fabio Estevam <festevam@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

On Thu, Feb 13, 2020 at 1:26 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Wed, Feb 12, 2020 at 1:35 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> >
> > EASRC (Enhanced Asynchronous Sample Rate Converter) is a new
> > IP module found on i.MX815.
>
> i.MX815 in an internal terminology. Please avoid it on the commit log.
>
Ok, will use i.MX8MN instead.
