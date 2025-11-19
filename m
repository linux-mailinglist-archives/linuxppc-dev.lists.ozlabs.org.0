Return-Path: <linuxppc-dev+bounces-14371-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1990C711CC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 22:09:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBYyM6qHxz30Vq;
	Thu, 20 Nov 2025 08:09:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763586571;
	cv=none; b=Mlg8bDBBuIbg6w7TTtNRr+q6jjB7ztbQJVsPZKTz/0lWf6md+quaAGl38tf4yuP5PNETMiu4Ng94GLahP5ujUU7eUnMZifUNq/AIOAFkH8M7BZTFbANTBJ1v505WwZgEnomLBEFONAMkFihQJCixlkEzULFvv1f+tH38AYN6E2kskGe/FpMwkOWhyECZwK/clJzD811ErYEX90Jk8OLpliIvLkMhVPvYJgDD2Ny/TC8gWBDrz2jmX1nC+VeV9S7cvzSRXAlz2F+fBV2nuObCkPI0ai6u59s96yvjzFineGCPEMswX6umyBoSAVhjc05QAQSp0UvlHOTnZtVvTdHz8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763586571; c=relaxed/relaxed;
	bh=4vYZZ59eiJ+rr+OmHUGdDH4x5VAuBUi04VucI/8JUBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AiOdl056bhMk9OLrMqgh3NRuvgaFxMAzA3ldO9JB7ByFfWqvVZaH0BktFT5uji/1a3VFU+VhLte9GL6rbGWTcV3lp3iK1NrhWKCD+fF20al+6noPqn2xKnx+YYtt/IbUiyIzwYm6dg3GKWq4dispJgTLrhqoiRUnm0OuEx/Fu3uELgNUaLQKLN+HAOFoz3pZAczQly8Wa2DlnozcZRgOhh5Qjfmlv9Mckr5Jou2MAzHIOFvlXIS9YQaPHrJb9NgjB/ufbWq24Ex+YMkVt+SPK0WaNeQzd2JKj42k+NWELKlUiGWcxbWH74qxm50IlN7YNwW0y/A3x+4KkTeeJE6U+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nD7N46aZ; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nD7N46aZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBYyM1J6yz302l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Nov 2025 08:09:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A39DD44005
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 21:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D756C4AF0B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 21:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763586569;
	bh=ALiAoPFh+7d6jvxH/rpqsdYFWQcbl2zG1BxLXGez5XQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nD7N46aZWHJ+Wo3KNMH/jvXrjYU/pqm5xTFVDiID18eOriD4REaARfU8e4GlzjUgB
	 zNqXMRnrxczHmXh4EJw8+KqWXffxnfV1jAMFgIsEDVIBgHbfVVNO6Q7birtBDcZZGy
	 2qltbncX8DU/Xwe9bLp276eCnF+musNN1PG+IRp6shsDBWyec09h6HusYZnPfq8MaO
	 YlfeqE7vs3tNqrC+aLj4IMEN8yLi4zEWXFSZmK8GP5sOPkpr9NL5XDhAA9D8xpYNK9
	 qVRdkQFI2X+jw/qP4vQMaQQc9rDniJBWMJJMTLopioRSfV+f3wLereg7E2ZRJ2y0xH
	 MxaoCHDQ8A9Nw==
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-65752954c43so71271eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 13:09:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+DddQJOYvaI4thJP50/xf2kVvgGyiUKnTIMuDk3wsIOu1z4qzQa0k1riqL/owBFVa/2RvlTBHcDB14Bk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzkV6SssVC9/aljr9qi2ToKONyp8XlXC7GLl5mScZulXlJ45C6W
	zdPc73ZQwOrlrP8mRRXkDghQqOlblr3pBOrZ5n6K2rYVduRjACQBchmqHwdmie4yLa0BMpo94yr
	+to9e/esw81k+jg67waTpNE7URCfQYxw=
X-Google-Smtp-Source: AGHT+IHdBeILW7V2DuqukUG0SISKpI2F03mL4V4skXrvNzoTRwo3eTblu3arg8RKsvgCNSGs5tk7s70+XawXsjd8Eck=
X-Received: by 2002:a05:6820:4b0d:b0:657:5f19:55fa with SMTP id
 006d021491bc7-65783cf909dmr292259eaf.3.1763586568798; Wed, 19 Nov 2025
 13:09:28 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1763483367.git.lukas@wunner.de> <fd167945bd7852e1ca08cd4b202130659eea2c2f.1763483367.git.lukas@wunner.de>
In-Reply-To: <fd167945bd7852e1ca08cd4b202130659eea2c2f.1763483367.git.lukas@wunner.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 19 Nov 2025 22:09:17 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jTvvsWn0FO5CsT2heDTGPDZ5Uc-g4pGzXTagqjf7RxAw@mail.gmail.com>
X-Gm-Features: AWmQ_bmTfc46Iw5EuQkflyLfsk8kS5doZ8gM6NgTXuLmICwPYjJ05TLP9xgYuGk
Message-ID: <CAJZ5v0jTvvsWn0FO5CsT2heDTGPDZ5Uc-g4pGzXTagqjf7RxAw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] PCI/PM: Stop needlessly clearing state_saved on
 enumeration and thaw
To: Lukas Wunner <lukas@wunner.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Riana Tauro <riana.tauro@intel.com>, "Sean C. Dardis" <sean.c.dardis@intel.com>, 
	Farhan Ali <alifm@linux.ibm.com>, Benjamin Block <bblock@linux.ibm.com>, 
	Niklas Schnelle <schnelle@linux.ibm.com>, Alek Du <alek.du@intel.com>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 19, 2025 at 10:02=E2=80=AFAM Lukas Wunner <lukas@wunner.de> wro=
te:
>
> The state_saved flag tells the PCI core whether a driver assumes
> responsibility to save Config Space and put the device into a low power
> state on suspend.
>
> The flag is currently initialized to false on enumeration, even though it
> already is false (because struct pci_dev is zeroed by kzalloc()) and even
> though it is set to false before commencing the suspend sequence (the onl=
y
> code path where it's relevant).
>
> The flag is also set to false in pci_pm_thaw(), i.e. on resume, when it's
> no longer relevant.
>
> Drop these two superfluous flag assignments for simplicity.
>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  drivers/pci/pci-driver.c | 2 --
>  drivers/pci/probe.c      | 2 --
>  2 files changed, 4 deletions(-)
>
> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> index 327b21c48614..7c2d9d596258 100644
> --- a/drivers/pci/pci-driver.c
> +++ b/drivers/pci/pci-driver.c
> @@ -1133,8 +1133,6 @@ static int pci_pm_thaw(struct device *dev)
>                 pci_pm_reenable_device(pci_dev);
>         }
>
> -       pci_dev->state_saved =3D false;
> -
>         return error;
>  }
>
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index c83e75a0ec12..c7c7a3d5ec0f 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2747,8 +2747,6 @@ void pci_device_add(struct pci_dev *dev, struct pci=
_bus *bus)
>
>         pci_reassigndev_resource_alignment(dev);
>
> -       dev->state_saved =3D false;
> -
>         pci_init_capabilities(dev);
>
>         /*
> --
> 2.51.0
>
>

