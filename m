Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B759B5FF3D0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 20:48:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpwQM38Mrz3drq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 05:48:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=lixom-net.20210112.gappssmtp.com header.i=@lixom-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=8Hqn3/OK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=lixom.net (client-ip=2607:f8b0:4864:20::a30; helo=mail-vk1-xa30.google.com; envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=lixom-net.20210112.gappssmtp.com header.i=@lixom-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=8Hqn3/OK;
	dkim-atps=neutral
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpwPS0TkQz3bjF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 05:47:54 +1100 (AEDT)
Received: by mail-vk1-xa30.google.com with SMTP id w185so2690277vkb.7
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 11:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKbi477tnn71WmQm0Czb7Hac8XXB2ZMv4zWV5eXxBHQ=;
        b=8Hqn3/OKKY55aFUff9BLgiSs7l3rNLBfY40chU3juN2e6mq/wU12WaBmOGC4UjWw1C
         FC51EPTonjkSmYxyitn9SOIsGqSB9gVyCtJ57qvZhi4gjAQ7DvvT/EVlTKVwLF0cd/F5
         zalnXyppOU6RBxsWlpmoxijpYScGwzESBUphOxtL8jnDXMCv7v37YRWHmt/gLlysAMfg
         q0HZ38gnXAWxpWn/4ShLziXDDXdlGDmU6bSqHZaL609Th0u60mLML7LxZh9sl5bGffOs
         +soETBRw5Ljr9pjWJX+5NP1Z8kY3AXF2/MdDXTYpD1NdHzZwvFuwotO4e0KeSURTHJa5
         7QCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKbi477tnn71WmQm0Czb7Hac8XXB2ZMv4zWV5eXxBHQ=;
        b=gbuOb4TqQN9C058+xnaio+2/jwAjsGPpRnBTYoAPmCf9sIsynn/2ADeN/4Cxc2DwCA
         /tuuUYI1MmjjxR5F6KsA3DyfFjVmkCHQviTq/3ZNpvYrcqeTqM+akVIeqrHP+rBGtH7D
         /cupNbwLMKEeATzdd3YPoM5cfyJjeCCS3+c1TDjveoXlz/5r/3t4Oc8atz1bkB/7VWyA
         wXLBSNm5CLKsX9fSohKiKPOZOkC+us3/OY7jFT9Mnr6VHLQ3nHp/Ai0Q4ZgMq1B2F9g4
         n2tPKUAWnuE0+2/jFJ63Vzca/E8Puy/cTzCMhtxsIxgfPuLHNVnFotW6EdoBH5m3lMYh
         N6JQ==
X-Gm-Message-State: ACrzQf3Otp+NmVPoKRgkaRJR39FxyGjHiya0zSX4LV7XMKLM9+pJm/Uy
	k9MCfjXF9mBtV19CSNGP8yF/z5JTtYk3mvMYEdTtUg==
X-Google-Smtp-Source: AMsMyM5dcYa0DecD0zBcXTbmSa9mth6M0FrOhPPSc728CcZAXE6DHfdjvALoweVQgN+2B5RPYEsmSEoDcJBoGU8e208=
X-Received: by 2002:a1f:9116:0:b0:3a2:362b:fea9 with SMTP id
 t22-20020a1f9116000000b003a2362bfea9mr3440278vkd.11.1665773270647; Fri, 14
 Oct 2022 11:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <0D40FEF9-D87D-42C4-BC31-EC8AE952C1FB@xenosoft.de> <0D8C8783-238D-4B4D-BA3D-766AB7139253@xenosoft.de>
In-Reply-To: <0D8C8783-238D-4B4D-BA3D-766AB7139253@xenosoft.de>
From: Olof Johansson <olof@lixom.net>
Date: Fri, 14 Oct 2022 11:47:40 -0700
Message-ID: <CAOesGMgETp0KDfdJxbqkYzCS+BWmMz9Wvv94xK7RQ7bjj27YjA@mail.gmail.com>
Subject: Re: Issues with the first PowerPC updates for the kernel 6.1
To: Christian Zigotzky <chzigotzky@xenosoft.de>
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
Cc: Darren Stevens <darren@stevens-zone.net>, Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, npiggin@gmail.com, rmclure@linux.ibm.com, mad skateman <madskateman@gmail.com>, Trevor Dickinson <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Fri, Oct 14, 2022 at 9:11 AM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
>
> Hi All,
>
> make oldconfig has asked because of the CPU family. I choosed GENERIC for=
 my P.A. Semi PWRficient PA6T-1682M. Is this correct? Maybe this is the pro=
blem.
>
> config GENERIC_CPU
> - bool "Generic (POWER4 and above)"
> + bool "Generic (POWER5 and PowerPC 970 and above)"
>   depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
>   select PPC_64S_HASH_MMU
>
> There isn=E2=80=99t a POWER4 anymore and I used it via CONFIG_GENERIC_CPU=
=3Dy before.
>
> Before the first PowerPC updates:
> CONFIG_GENERIC_CPU=3Dy
> # CONFIG_POWER5_CPU is not set
>
> Link: https://github.com/torvalds/linux/blob/master/arch/powerpc/platform=
s/Kconfig.cputype

I think the mistake here is that there are two GENERIC_CPUs now, and
one of them is the wrong one and overrides settings. I'm surprised
Kconfig didn't balk at it.

I have a vague memory that PA6T had a little-endian mode, but it was
never used much and I wouldn't expect it to work.


-Olof
