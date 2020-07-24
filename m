Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E466622BC91
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 05:41:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCZkn2PRSzDrhj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 13:41:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::142;
 helo=mail-il1-x142.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JVbBqq2t; dkim-atps=neutral
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCZhv3yNwzDrgt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 13:40:14 +1000 (AEST)
Received: by mail-il1-x142.google.com with SMTP id e18so6138610ilr.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 20:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/cT/Svh/cxOFqev+KyPc3eX5uThpwntklR90/BishT4=;
 b=JVbBqq2tBCOD/zVdgBypAlnyzw0FNqyHnjIIoyifRlKdMffVvD3f1YpPLmEg1Xusbb
 8sKnW4jNkpJcT02DzGwDpQXR+bD6xAJHUV6RMAO8NHBsDD5H8rVjUyMEQEcWOArQ7qW9
 8MF7UPDiydWApBicPR1JvzLNqIsjXxs4czgHO+2Isio9LPaBmUy7X4OegBY4MhdNblgA
 zu0DELBBw/vwoVkGQSkp0UoB3MCRbPOb1+aaNEZfFqrZ9DDSvB2Q5pQq4yWvygU21y2a
 bBYErjDor4QU18uC9bpd4O5irdamU4qI+ccTH+1PuuSpKLP9dyAcDNiGAcEgdmgrQGqO
 JJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/cT/Svh/cxOFqev+KyPc3eX5uThpwntklR90/BishT4=;
 b=RPkykkP17bOAQRwPwpiADiCtlHMD/p59XJQjjIGozNUyNRhMxsobWYOGz5QdeGO2tV
 8oAl8IoXKQTMRhOVVxjlwShIrtXGuamycK9SqoAcIMb2tkVFJpR1FF9hV9CczkaGSq8L
 6HzU0SEzPUmNWe5/iDcDZetAEoHopUh1wWl8zlpC04fdqyaF7CuNaehbtvg154X06CJh
 Li+p2R24BPa3kMqrw4SGWoNGqNpC53V/0toLBk2qmw+woT3q6hQvfBx+RNraPq/dNqfQ
 WHozhng5hYPXhS/FeSAkUwJZGrCJPJL7NzPyfzFokmQ/lwJm7EX1ETCgctreXovoph69
 CDoQ==
X-Gm-Message-State: AOAM531z64g4F0+JoADKVseUlnaQOgjeoLt3b671w3Irht/D33vfIxo9
 7OWWR8Pbzw3/Jy8Pbcv1VEjR23Cs7gkXiGso72H9VVGW
X-Google-Smtp-Source: ABdhPJwCgBIYEr4i0h/a2BxWggwUT+7kCsB/DC5qJKNkh2wJGPUrDZuVQKeQ+mHDUmWGbdeAoHM5+4rzLIOCoPL8Shs=
X-Received: by 2002:a92:4913:: with SMTP id w19mr7759630ila.185.1595562011444; 
 Thu, 23 Jul 2020 20:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200710052340.737567-1-oohall@gmail.com>
 <20200710052340.737567-16-oohall@gmail.com>
 <c89dfd04-afc2-4d69-00ab-2e743d5bb844@ozlabs.ru>
 <CAOSf1CHL9YoSohwMWm1YkLbLTqOn-WfBMKERZaPYb_5-UKmsuw@mail.gmail.com>
 <25d7fd88-668a-861e-a93c-3188caeac3cf@ozlabs.ru>
 <CAOSf1CF1_Ga1KDhqLGxTgg+ugj6AfrzXbouZq1MiMa0faHZeeg@mail.gmail.com>
 <fdd88062-0b62-fc6b-4de7-a4e099768cd9@ozlabs.ru>
In-Reply-To: <fdd88062-0b62-fc6b-4de7-a4e099768cd9@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 24 Jul 2020 13:40:00 +1000
Message-ID: <CAOSf1CHO3U7Az5O-9gS=quYvGQW5NtXzuZjw52G+=1fgR=HBeg@mail.gmail.com>
Subject: Re: [PATCH 15/15] powerpc/powernv/sriov: Make single PE mode a
 per-BAR setting
To: Alexey Kardashevskiy <aik@ozlabs.ru>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 22, 2020 at 8:06 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> >> Well, realistically the segment size should be 8MB to make this matter
> >> (or the whole window 2GB) which does not seem to happen so it does not
> >> matter.
> >
> > I'm not sure what you mean.
>
> I mean how can we possibly hit this case, what m64_segsize would the
> platform have to trigger this. The whole check seems useless but whatever.

Yeah maybe.

IIRC some old P8 FSP systems had tiny M64 windows so it might have
been an issue there. Maybe we can get rid of it., but I'd rather just
leave the behaviour as-is for now.
