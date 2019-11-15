Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 465BDFD486
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 06:46:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DnRG4DYZzF5Tv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 16:46:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.194;
 helo=mail-oi1-f194.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DnNk0jPVzF78x
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 16:44:37 +1100 (AEDT)
Received: by mail-oi1-f194.google.com with SMTP id a14so7637684oid.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 21:44:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/3uU+eY5BtMdRnLX2UOVt6iN0KOpw7AZZyEPeGfnQp4=;
 b=E+7RsZC2JgKnqsKjJVn45juXuIRORpndt2FJsDB9IEKZJ7Uovllki3+s5AoHYoSBl7
 82XHCHeUdoN3to75tFQDdqe88vBfuUWFw5kXP7qclLvzzqXLFmC34/xHt/gQEq7iHdhy
 cAFkOI9b6FRLb18Sgs//aCcQg9bGJJA4Qrq1WEe/IR2+sDMhqRiUDBnOJLMI/dX7GcVO
 00fkLjBFJSosUOdYn+Z1ohbqAWFCQ3UURAUSQBvpu3jCDrHqm4TuUh3e3IEWerLer6/B
 TW1kQgrQHRHtBdOKp9O2UraRQyNBNmsGW+W47UeVgubdykuOMnG8T7QX86HKjlS+JcMD
 +7uQ==
X-Gm-Message-State: APjAAAVj+HpBloxEwfKp7kLHIPg8Fq0SsyJnc4lCjDc1KVyJGNph/qwH
 RqY7yXvHn78p4Bqb5gZXXzq0d5ZB
X-Google-Smtp-Source: APXvYqwke/p2q65QD6D3IQYzdVRRE6+WsUkLy6b9/2ogDITA3MJ9y5DgT6Lb4invTRUweFQYDd1o3A==
X-Received: by 2002:aca:4f4f:: with SMTP id d76mr6659928oib.167.1573796673284; 
 Thu, 14 Nov 2019 21:44:33 -0800 (PST)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com.
 [209.85.167.178])
 by smtp.gmail.com with ESMTPSA id z2sm2623904otp.2.2019.11.14.21.44.32
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2019 21:44:32 -0800 (PST)
Received: by mail-oi1-f178.google.com with SMTP id i185so7622249oif.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 21:44:32 -0800 (PST)
X-Received: by 2002:a54:451a:: with SMTP id l26mr6675985oil.154.1573796672412; 
 Thu, 14 Nov 2019 21:44:32 -0800 (PST)
MIME-Version: 1.0
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
 <20191108130123.6839-47-linux@rasmusvillemoes.dk>
 <CAOZdJXUX2cZfaQTkBdNrwD=jT2399rZzRFtDj6vNa==9Bmkh5A@mail.gmail.com>
In-Reply-To: <CAOZdJXUX2cZfaQTkBdNrwD=jT2399rZzRFtDj6vNa==9Bmkh5A@mail.gmail.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Thu, 14 Nov 2019 23:44:21 -0600
X-Gmail-Original-Message-ID: <CADRPPNS00uU+f6ap9D-pYQUFo_T-o2bgtnYaE9qAXOwck86-OQ@mail.gmail.com>
Message-ID: <CADRPPNS00uU+f6ap9D-pYQUFo_T-o2bgtnYaE9qAXOwck86-OQ@mail.gmail.com>
Subject: Re: [PATCH v4 46/47] net: ethernet: freescale: make UCC_GETH
 explicitly depend on PPC32
To: Timur Tabi <timur@kernel.org>
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
Cc: netdev <netdev@vger.kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 lkml <linux-kernel@vger.kernel.org>, Scott Wood <oss@buserror.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 14, 2019 at 10:37 PM Timur Tabi <timur@kernel.org> wrote:
>
> On Fri, Nov 8, 2019 at 7:04 AM Rasmus Villemoes
> <linux@rasmusvillemoes.dk> wrote:
> >
> > Currently, QUICC_ENGINE depends on PPC32, so this in itself does not
> > change anything. In order to allow removing the PPC32 dependency from
> > QUICC_ENGINE and avoid allmodconfig build failures, add this explicit
> > dependency.
>
> Can you add an explanation why we don't want ucc_geth on non-PowerPC platforms?

I think it is because the QE Ethernet was never integrated in any
non-PowerPC SoC and most likely will not be in the future.  We
probably can make it compile for other architectures for general code
quality but it is not a priority.

Regards,
Leo
