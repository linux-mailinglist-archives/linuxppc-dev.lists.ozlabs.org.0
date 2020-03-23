Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A3218FC39
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 19:01:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mMd43K9XzDrBH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 05:01:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=0lqsb+hy; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mMb92VrdzDr2K
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 04:59:32 +1100 (AEDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D9DE20771
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 17:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584986370;
 bh=2l0KQW4VoP61cJLv+dL28Z9ly7A7laSQG5Iu1ELGiNg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=0lqsb+hyuD6XqDBK/iujiOzptPXvHe2aV/Kkwr/P9PUnDfHuueev3+9fAESyrBbXO
 ZkqqYSoJFuvUWkikxGH/IUJ026YcMeuNlg4tvEn2RHdNtA8m0Q8d/1izBjP/Y7z1YM
 neW0n8jo8z3fJdmpYEmC19DdPkIw8QyaG/UxJ2uQ=
Received: by mail-qk1-f170.google.com with SMTP id j4so16205427qkc.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 10:59:30 -0700 (PDT)
X-Gm-Message-State: ANhLgQ23jRye6gkFRHNOeYb+eMoLWeqfk4px8NfAbSGTdI0tIagtSKBz
 8yCsS+d6BRVfy00z94SjDlNTQvxocoBbTPZ68A==
X-Google-Smtp-Source: ADFU+vsR6Us0V+BMyVNelvszRuS/SrM36zlyf95ZYn/ZAx/QRMGOQ3N6czh+WeF4cZMmcFdLqwHXYaDLwzsbRTR1RmQ=
X-Received: by 2002:a37:8502:: with SMTP id h2mr22475590qkd.223.1584986369516; 
 Mon, 23 Mar 2020 10:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200320174107.29406-1-lkundrak@v3.sk>
 <20200320174107.29406-9-lkundrak@v3.sk>
In-Reply-To: <20200320174107.29406-9-lkundrak@v3.sk>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 23 Mar 2020 11:59:17 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+rzaFLvZGX+dpgGhfCSsAvj06T8fcgo83m+ZJGboKsnQ@mail.gmail.com>
Message-ID: <CAL_Jsq+rzaFLvZGX+dpgGhfCSsAvj06T8fcgo83m+ZJGboKsnQ@mail.gmail.com>
Subject: Re: [PATCH 08/10] powerpc/fsl: Make serial ports compatible with
 ns16550a
To: Lubomir Rintel <lkundrak@v3.sk>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Mans Rullgard <mans@mansr.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 20, 2020 at 11:41 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
>
> There are separate compatible strings for ns16550 and ns16550a and the
> Freescale serial port is compatible with the latter one, with working
> FIFO.

I don't think changing this is right. First, 'ns16550' is what's
documented in the DT spec (and ePAPR which it's based on).

Second, these dts files are pretty mature/stable, so I'm less inclined
to change them. AFAICT, this change either enables the fifo (which
would be an untested change in behavior) or has no effect because the
fifo is auto-detected.

> Use the appropriate compatible string that is also consistent with ARM64
> Freescale boards and thus avoiding one special case in the binding schema.

Well, that's annoying...

Rob
