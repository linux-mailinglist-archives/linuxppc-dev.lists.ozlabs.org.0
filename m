Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D61104DAA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 09:16:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JXTP2CG7zDqB4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 19:16:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="KEiU3m6w"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JWH74h50zDqww
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 18:22:43 +1100 (AEDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1ADC208A1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 07:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574320961;
 bh=YADEyjm7guxEoLaCkxuDN8e12OturEk30iMb1m0sXy8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KEiU3m6w1QRLPYis/nvdOXCNLlDJVzXntmLC4o8vU3pQCiVDGQI6Mx6W6pgd/uU4l
 IYbi0R1Xw/eDXYuud7ezUAOHQ4gRyiEJY+88ENSFNqdaJyjEi6I/9s/1FVQ1ChoZzK
 c6s5Dzo7eGIF404BGqwPFFLALrFTH5wDt93kgnwo=
Received: by mail-lj1-f169.google.com with SMTP id q2so2005870ljg.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 23:22:40 -0800 (PST)
X-Gm-Message-State: APjAAAVqczWcbBhdGHbW4A/QuBU7eBuruyWqNdDoIGTVXqPHGdX6albY
 KSfca1SkSb+K/qNAUQcfBUsDbc21TQCiG+MNWXg=
X-Google-Smtp-Source: APXvYqwXIosldCdyfqLaI2gnKCAKMpUmtejqgmFnVUw8bU3ySqaIdMLSDal4fqS+E60cPFhwielOTRBHCX04FcEd0TQ=
X-Received: by 2002:a2e:9842:: with SMTP id e2mr5961570ljj.93.1574320958924;
 Wed, 20 Nov 2019 23:22:38 -0800 (PST)
MIME-Version: 1.0
References: <1574306408-20021-1-git-send-email-krzk@kernel.org>
 <20191121072124.GA356838@kroah.com>
In-Reply-To: <20191121072124.GA356838@kroah.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 21 Nov 2019 15:22:27 +0800
X-Gmail-Original-Message-ID: <CAJKOXPeW_ffza48Bbxm7Od-Xo_Vt-Qfy+8OY5w8AzZOPkxriXg@mail.gmail.com>
Message-ID: <CAJKOXPeW_ffza48Bbxm7Od-Xo_Vt-Qfy+8OY5w8AzZOPkxriXg@mail.gmail.com>
Subject: Re: [PATCH v2] tty: Fix Kconfig indentation
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 21 Nov 2019 at 15:21, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Nov 21, 2019 at 04:20:08AM +0100, Krzysztof Kozlowski wrote:
> > Adjust indentation from spaces to tab (+optional two spaces) as in
> > coding style with command like:
> >       $ sed -e 's/^        /\t/' -i */Kconfig
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >
> > ---
> >
> > Changes since v1:
> > 1. Fix also 7-space and tab+1 space indentation issues.
>
> Same here, I already applied v1, so this one does not apply :(

Hi Greg,

I missed your notification that the patch was applied and then I
worked on a updated version fixing few more whitespace errors (pointed
during review on other patches). This supersedes v1 but if you do not
want to rebase, I can send it later as a separate patch.

Best regards,
Krzysztof
