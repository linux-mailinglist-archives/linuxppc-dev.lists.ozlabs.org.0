Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D7E41902A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 09:45:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HHvnQ0Yv3z2ybB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 17:45:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.135; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 308 seconds by postgrey-1.36 at boromir;
 Mon, 27 Sep 2021 17:45:03 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HHvmv1YWVz2xs6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Sep 2021 17:45:02 +1000 (AEST)
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MAtoX-1mfSUX2qUb-00BLqq for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Sep
 2021 09:39:48 +0200
Received: by mail-wr1-f42.google.com with SMTP id w29so49500799wra.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Sep 2021 00:39:47 -0700 (PDT)
X-Gm-Message-State: AOAM530zJGNE9RlkaJXacPxItyy1MjF4ffe441nV+Ohgv6vUh3ae12MW
 niOmiInAyvT61MJne5vMncguecLx0YzpA1OMxOM=
X-Google-Smtp-Source: ABdhPJytwg2Jscle8D6U7FjXeASR49u7ckmZRsHWvpWZ7dVMwzcRYybH1hTRxtWvWXS2xPhWFtHNHK/cOuV06y8U5RI=
X-Received: by 2002:adf:f481:: with SMTP id l1mr26255175wro.411.1632728387404; 
 Mon, 27 Sep 2021 00:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210926095847.38261-1-sven@svenpeter.dev>
 <20210926095847.38261-3-sven@svenpeter.dev>
In-Reply-To: <20210926095847.38261-3-sven@svenpeter.dev>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 27 Sep 2021 09:39:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2_6rcQa8TCgw=6uH26UfjShrVVu-zfLf2=pi6Z8cGOPg@mail.gmail.com>
Message-ID: <CAK8P3a2_6rcQa8TCgw=6uH26UfjShrVVu-zfLf2=pi6Z8cGOPg@mail.gmail.com>
Subject: Re: [PATCH 02/10] i2c: pasemi: Use io{read,write}32
To: Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:TyqdOgIcKo8GszmqnKBz3dXTMDx/+CuhBvBlh3qvM3103xcmxGi
 dDnn5S1FgrIRjE0P2PS0aP+Q6Q2WjYT4GGWa/F6aXlFD6Y87WiWDr+pTDm0tPPMHWcmffWN
 li/4lL4AhxLP48k2jB8okiEUct6vQKHR7JYoClMb4gL4Z1frXbGHQjSot3C5OZ3W7kXcCTd
 b9eRvSD6DPr29jQO5LZbg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9OHUj9v+EMU=:SVLiQGToGh89Q1TSfg3TI3
 gjIR2VaQOo5cN5DfqWK7hSk0BGJYhRm+97NahRrkV+SnpH+2hbXkS8txgHXfeBXbQKsUgzEph
 zIZ66hzaMEglgPHoN8J0W1AXgIiGjc+QRmpm/w5u9iI0CDaUpt6npZ5x33UA42wkHDuMmyeIJ
 HlII71Kw6vEQzjefuvBRds7CjvG/60R5KlzRpxg6UlavMk8wXHM11usX6noIq/mH1zUJJv+Dl
 /8+dF3OORgh21n8lxJinoHYMADCIO/QS6oUDUrm5/f+4124DvyzbYyz56XsRd+nyNrm/mZZWY
 1wFV5OkR/vTS8bpLYVTKnhI6rOaPK5ExQjWye1i8w7aZHMvw+IdKwho01YNKn7ymXgAQOIZWP
 BdU1u4B5eRSrWvNLUllyHGhDArw++xYS0fvjEeIpkO7hl7wNYpO70gGa6MWaHF1NuFpCZmpfB
 1gBvUXs1NWllGdVDxP7yofxU4lxhxVNwAZcf51x4rBv4Zdq7RXJlHCQExR4hVyfbNqygDtNPr
 uiA7s0x3tEIFgD6yRNtLfe1dmkfCJ4GKeOOskn23pHx8ebwt/3y/i+BAF9rFlZICM+NpgvFHW
 TxgzvwQCLfVz7yr+u1zoclQOUbD2Jm86ylywdBYylvVk6Dolb7hcqlK4BfSmBLuGpRWb9XUVg
 5zmHmvtWn+UI8DUFhDYRR4llGJheagKq0moxXcdn+pVHacVUdwNWIV2VmAi84PgL9NSHHhR2l
 ywmi60cHBAsK5/8ChJnYbXhxA4XVN5mwnsP8t4pP+5KyU17Ihp68CHjNDveTsmsWTTJNTOPSj
 a01vAG014dFWbTfqGztgpJ2GGBZrq+5QAiRYkUdjKf4NjbuZEgqQrIzafo4Yd+YenxJZlaJ/n
 Q3wJRtz53zGMi4GZ15bg==
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
Cc: Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Olof Johansson <olof@lixom.net>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stan Skowronek <stan@corellium.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Sep 26, 2021 at 12:00 PM Sven Peter <sven@svenpeter.dev> wrote:
>
> In preparation for splitting this driver up into a platform_driver
> and a pci_driver, replace outl/inl usage with ioport_map and
> ioread32/iowrite32.
>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
>
> +       smbus->ioaddr = ioport_map(smbus->base, smbus->size);
> +       if (!smbus->ioaddr) {
> +               error = -EBUSY;
> +               goto out_release_region;
> +       }

While this works, I would suggest using the more regular pci_iomap()
or pcim_iomap() helper to turn the port number into an __iomem token.

        Arnd
