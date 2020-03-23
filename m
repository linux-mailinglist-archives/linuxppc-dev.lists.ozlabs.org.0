Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6171518FD38
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 20:03:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mP1S42rhzDr1c
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 06:03:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=nSW9ZFAT; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mNz45W8dzDqyB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 06:01:52 +1100 (AEDT)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 980742072D
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 19:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584990110;
 bh=YRs4mrhPHXIMZTdf5p/iGgRJf9XseZ16wHVCMQiwstk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nSW9ZFATDzQa9L/ugTIBDmoYXyYF2+hjU1lnoDQcoHHREd11KSu00kwYGOKJqn4rP
 dZ2Po1tHBKPZYBJvdDGW0vzGbij1uSMqlyhhV6Y/yilfhsTqQnoUKNq0tnC8ypAsRl
 b9RzPvCoYHCkmQ+52eyfDyfc860fWyhwaiNXLwg8=
Received: by mail-qv1-f46.google.com with SMTP id cy12so7806631qvb.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 12:01:50 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0DcZLk8eBFYLbKhshekD6u/hsGYusKKNTvXbWuF0xe+8Y8Z6Em
 K/pWX8fEuC9ehxnE2FwMcodL10hkv9lqIxDoHw==
X-Google-Smtp-Source: ADFU+vtZfj3NsyyYYv7dL45XPEBZ0zGdtc3bidPipH2D4nR8TuLq0fULO/yXaatafS8cwmSLkV6OHdodvClaUapmViI=
X-Received: by 2002:a0c:f207:: with SMTP id h7mr3649102qvk.20.1584990109723;
 Mon, 23 Mar 2020 12:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200320174107.29406-1-lkundrak@v3.sk>
In-Reply-To: <20200320174107.29406-1-lkundrak@v3.sk>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 23 Mar 2020 13:01:38 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+JSb3vgRusTu98VH9NVzrWDKEGiY0Rue9P9hUsgxLDgQ@mail.gmail.com>
Message-ID: <CAL_Jsq+JSb3vgRusTu98VH9NVzrWDKEGiY0Rue9P9hUsgxLDgQ@mail.gmail.com>
Subject: Re: [PATCH 0/10] NS 8250 UART Device Tree improvements
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
> Hi,
>
> this series aims to make it possible to validate NS 8250 compatible serial port
> nodes in Device Tree. It ultimately ends up converting the 8250.txt binding
> specification to YAML for json-schema.
>
> It starts by fixing up a couple of issues that would fail validation of
> device trees for various boards. Note there might be validation issues in other
> boards -- I don't have computing power to run "make dtbs_check" with
> CONFIG_OF_ALL_DTBS=y at the moment. I'm happy to fix up issues if somebody
> runs the test output to me.
>
> Unless someone has a different idea, I'd like to submit this to arm-soc once
> I get the Acks from PXA and Tango maintainers as well as DT reviewers:
>
>   [PATCH 01/10] ARM: dts: pxa*: Don't redeclare phandle references
>   [PATCH 02/10] ARM: dts: pxa*: Fix serial port names
>   [PATCH 03/10] ARM: dts: pxa*: Make the serial ports compatible with
>   [PATCH 04/10] ARM: dts: mmp2-brownstone: Don't redeclare phandle
>   [PATCH 05/10] ARM: dts: mmp*: Fix serial port names
>   [PATCH 06/10] ARM: dts: mmp*: Make the serial ports compatible with
>   [PATCH 07/10] ARM: dts: tango4: Make /serial compatible with ns16550a

For 1-7:

Reviewed-by: Rob Herring <robh@kernel.org>
