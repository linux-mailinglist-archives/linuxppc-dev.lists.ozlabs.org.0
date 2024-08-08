Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F7D94C742
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 01:14:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MlAQATzT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wg2tn6TJ9z2yZ6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 09:14:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MlAQATzT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=oohall@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wg2t61PYjz2yHD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 09:14:05 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1fd66cddd4dso15067675ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2024 16:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723158844; x=1723763644; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzxAnNd+2P5RagrV70uSTDmukSTtgzZlqgxHDGW9DCk=;
        b=MlAQATzTom370RRHJjubV1X9Kr+EacHdjlaHonqGR3LOU1xbDcaZbBM0bjtYQT1k46
         ce6w2H0jr6VJ/TmZ1XYIwkgaw4c2qEHfaqPfIxcWrygfxura0n159S2XRXLxesct5JUu
         BJJ6g/YX5vNUzdfhgHdoi9qmZivCUc4bR2QijrUokkz210aVrGNIq6ZK6LP29Ti4yGyE
         xTs03v0X9YT3PBYCVKcZHrwZIy5GJFVsaTm9j/bB9lAe3Qe3ZsLsl9idguVO08kdqUAj
         vZkX8mWt0/0F5QCM1wBYVnmn9kFGq1isVNKdN8RioYFk083Z5ejMJ5ExFhkNSs6vze0j
         ys9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723158844; x=1723763644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzxAnNd+2P5RagrV70uSTDmukSTtgzZlqgxHDGW9DCk=;
        b=hZX+jy9OQHFWoIeIBaHkitxNwQe+409vGOpFYvA7oGcFiLNmYkMV41E1PWH/lcP9aM
         JnBUEzuVEUkUbqwjysbQgFqvhgd/ql58QOCJBAgolFVmgCiz+EbxDG+xXgsm5yrlet01
         zSluc4yQSbEb6n1u3Q85ijHN/GualRIYj0Uslz7XDjkC8P1iPu/LLPhrdIIhQh6QrrBq
         hYwJ4aNTVsX7gETdLK13F6pH5QJqaBHcQFeFCcG75lRgx+Z4gkdxBbwyyWNyLf8/wQ4K
         fV6eH2e0Y08y5I2FYt2i3uimftZ9w4uj8gtd4cedCfCsqID4tChNS3im28fmVEQRt79h
         0mKw==
X-Forwarded-Encrypted: i=1; AJvYcCWqegLCXzkohDTIY0ODHw7Wv57DYWVIKPrP/6qRyIIPGoX85c+cwN38Le427XVE0JwbdgymDV5fonQBbva/s2XZQTKzRGf3PPyWasiLew==
X-Gm-Message-State: AOJu0YwXQf3MnW/AyecteyBEgWbSFNWza1kl55ChUrwl6BRpEGTT4KSN
	fsEX1iAHqBNqa91XS8Ff1FSFMqU/Z8vu1Ugh/CJ8hM10N9pYzOud78Zls97cehLyyb9a85j4wgI
	NaEMeVPwVbzVTi3errV4RW4h1qHY=
X-Google-Smtp-Source: AGHT+IG1/DdoAKFjvHg9EVP5I2kaAQyATplTDXAqOEcpfBC4JM11ab36k7mIWy41WyBWVbFkeNIGORA/STIiVejkIG8=
X-Received: by 2002:a17:902:d503:b0:1fb:5b83:48d9 with SMTP id
 d9443c01a7336-200952a285cmr45534635ad.37.1723158844196; Thu, 08 Aug 2024
 16:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2408071241160.61955@angie.orcam.me.uk> <20240808020753.16282-1-mattc@purestorage.com>
In-Reply-To: <20240808020753.16282-1-mattc@purestorage.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 9 Aug 2024 09:13:52 +1000
Message-ID: <CAOSf1CEcUgVg3bj4s-zRM0RUCkLq-udiyA7QGOy66=Bam8PDFw@mail.gmail.com>
Subject: Re: PCI: Work around PCIe link training failures
To: Matthew W Carlis <mattc@purestorage.com>
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
Cc: linux-pci@vger.kernel.org, mahesh@linux.ibm.com, edumazet@google.com, sr@denx.de, leon@kernel.org, linux-rdma@vger.kernel.org, helgaas@kernel.org, kuba@kernel.org, pabeni@redhat.com, wilson@tuliptree.org, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, alex.williamson@redhat.com, bhelgaas@google.com, mika.westerberg@linux.intel.com, david.abdurachmanov@gmail.com, saeedm@nvidia.com, linux-kernel@vger.kernel.org, lukas@wunner.de, netdev@vger.kernel.org, pali@kernel.org, davem@davemloft.net, macro@orcam.me.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 8, 2024 at 12:08=E2=80=AFPM Matthew W Carlis <mattc@purestorage=
.com> wrote:
>
> On Wed, 7 Aug 2024 22:29:35 +1000 Oliver O'Halloran Wrote
> > My read was that Matt is essentially doing a surprise hot-unplug by
> > removing power to the card without notifying the OS. I thought the
> > LBMS bit wouldn't be set in that case since the link goes down rather
> > than changes speed, but the spec is a little vague and that appears to
> > be happening in Matt's testing. It might be worth disabling the
> > workaround if the port has the surprise hotplug capability bit set.
>
> Most of the systems I have are using downstream port containment which do=
es
> not recommend setting the Hot-Plug Surprise in Slot Capabilities & theref=
ore
> we do not. The first time we noticed an issue with this patch was in test
> automation which was power cycling the endpoints & injecting uncorrectabl=
e
> errors to ensure our hosts are robust in the face of PCIe chaos & that th=
ey
> will recover. Later we started to see other teams on other products
> encountering the same bug in simpler cases where humans turn on and off
> EP power for development purposes.

Ok? If we have to check for DPC being enabled in addition to checking
the surprise bit in the slot capabilities then that's fine, we can do
that. The question to be answered here is: how should this feature
work on ports where it's normal for a device to be removed without any
notice?
