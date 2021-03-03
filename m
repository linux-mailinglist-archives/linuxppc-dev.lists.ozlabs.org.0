Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E7632ACD1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 03:01:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dqy0g2m5zz3cV7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 13:01:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gU484zYu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gU484zYu; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dqy0F5vJGz30Mx
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 13:01:17 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C96564E62
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 02:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614736874;
 bh=Jur4X8HCTuoWSA6SEQnGoXAlbGc8RXGw8vUAl2IcNgk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gU484zYudFX7MlIzet+rEGZDykomYPFPpc/clYw85na747ojW4lGWSJMvmSHFm4an
 nJXdWYsk+p3zNoL9HvEaobIN57XC0eVg0BMYNz9lwMp3rudR2smptdnvhNnJuO4QPR
 sz3iHjbgr9KPL6MSgT1kAiVIcBWRP18+6cvjXP75Qou2cQhN2A+fl9i+aQ2Akp8gz8
 bT5V/zwNlxjHnE5UNSf9P7o1U+mbbv5575F4NR/ZdDhEMIjITXRnnPwIU4hd5wzK48
 qbyqch36FTKUdWvVO1NrUYqNEz4mLZv0Q6MzeDDXaheBFg5+GgxBeKvmpf9esP3dAe
 TYE6z9Symp72w==
Received: by mail-ej1-f45.google.com with SMTP id dx17so11571505ejb.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Mar 2021 18:01:14 -0800 (PST)
X-Gm-Message-State: AOAM530fX4Vlz8ERlEJkloCptPFKt3atygE7RU+zcgkUfSGQfr2B+IVa
 xU65J/hp0IAJJkVGgdz5PAv0gi7duqb33AvKzA==
X-Google-Smtp-Source: ABdhPJxohvRCbrznJ/X8kN7mfJ5VeQer8Ncx3QZ8RwevKVFlLbwvKN2msIpiGUN46C0KJZPy2hIRCxqonbPI/JR/Ecs=
X-Received: by 2002:a17:906:2312:: with SMTP id
 l18mr24122920eja.468.1614736873011; 
 Tue, 02 Mar 2021 18:01:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1614705851.git.christophe.leroy@csgroup.eu>
 <20210302173523.GE109100@zorba>
In-Reply-To: <20210302173523.GE109100@zorba>
From: Rob Herring <robh@kernel.org>
Date: Tue, 2 Mar 2021 20:01:01 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ7U8QAbJe3zkZiFPJN4PveHz5TZoPk2S8qQWB6cm5e5Q@mail.gmail.com>
Message-ID: <CAL_JsqJ7U8QAbJe3zkZiFPJN4PveHz5TZoPk2S8qQWB6cm5e5Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Improve boot command line handling
To: Daniel Walker <danielwa@cisco.com>
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
Cc: "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 devicetree@vger.kernel.org,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Will Deacon <will@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+Will D

On Tue, Mar 2, 2021 at 11:36 AM Daniel Walker <danielwa@cisco.com> wrote:
>
> On Tue, Mar 02, 2021 at 05:25:16PM +0000, Christophe Leroy wrote:
> > The purpose of this series is to improve and enhance the
> > handling of kernel boot arguments.
> >
> > It is first focussed on powerpc but also extends the capability
> > for other arches.
> >
> > This is based on suggestion from Daniel Walker <danielwa@cisco.com>
> >
>
>
> I don't see a point in your changes at this time. My changes are much more
> mature, and you changes don't really make improvements.

Not really a helpful comment. What we merge here will be from whomever
is persistent and timely in their efforts. But please, work together
on a common solution.

This one meets my requirements of moving the kconfig and code out of
the arches, supports prepend/append, and is up to date.

Rob
