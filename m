Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF6A94A7B8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 14:30:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gLHnLt/3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wf8dt71kYz3dFx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 22:30:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gLHnLt/3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=oohall@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wf8dB2Kttz3cXy
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 22:29:48 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1fc52394c92so18939745ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Aug 2024 05:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723033787; x=1723638587; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kx32xTT3Lmjn28QqG28xI58RScq11tK0yTOGRh/oOE4=;
        b=gLHnLt/3/CVRUlgrT9+Q6qaMDN/5f97JwFhQMUvzn/VUALoF71G2Un+Po5MfjsxfQu
         F5I8iBh73Q1fe36gU6hGUCHQGCQiPmfXv8Hfuj+G5qUCmKlsIdGBvZNQ/GrllzzMcvTF
         AzblyGep091n6kQVuF2UalS0H6oB/S6EYTGNNsCC8tJNqkhziT7CuUSAxpnTv1S4RBJu
         gqVOiBV6GwOCOKq/wlyAao6ZMDZmplpvphXJ7c3smT1tQlnQ9IwxJ30IAEgcmea4eCec
         +b6/ws8bCrF6v2kJEBgQQo+pccpZgXHFqodnDx9U0saDu1waCObGdnUs9m5Ts1J6l5k6
         IOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723033787; x=1723638587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kx32xTT3Lmjn28QqG28xI58RScq11tK0yTOGRh/oOE4=;
        b=lW0URXAqltv2Ut2vsoImlWikb8CkC1An/GalAWWOgCytLNlQhH1p066X3I7lOmOq2S
         uMGttLPpjxKcK2xyuehjezjEg3G7SWXEqT4G5aS7qcAn++oBVMW3HKKLB81YNLhw80sR
         AfeI4Ehye/ykaCbJ46j9HLzTJw+bzz2I/FxfDOzN4MyWIkFG0Fi9Jdlycv61mJphnkWA
         fbCxDyUABg+CjF9LPn9llfvSaSY7vB7lQiF74v8Uo/fnv2k+Mk0SPJYwTLsUix12vjGn
         QgYBKfoRZIJfOQ9cREy/16Xcqnw6xWexMlFdtW2d2xS6GzBQi1GUjlEiJ8JsnVacMfPK
         7Ehg==
X-Forwarded-Encrypted: i=1; AJvYcCWaalzLQeo8J2ngKUp09Oh8u/PSDe676wv3uyr1jjA+pSA46QpXc6mjkpuORlCQF6Aegtie5SPY5huNx8Yk6WScYuiIuVKJuvqG9ZqgDQ==
X-Gm-Message-State: AOJu0YxPIVs6DKZaoXNaSEsV/8dPnBxqb88+QF8VPGQ2QzuoJexv7BSB
	d3cM4UrCET60k0ugQHSi3h+brdPlNWJWziZJLaYyEAGQFsqjJ1GXMoatGltPKEeSgcw3GnlRc11
	eFK6UCT1VqmN0iN4vMnxJw6GT6VU=
X-Google-Smtp-Source: AGHT+IHX/Io8BGEe/ckylAL2OpQEtD0KNkWtQjYnygkiTok5unepYcDXoXJVkqfRWDMR5n7NAPzxYbxjWVzJl5nWASc=
X-Received: by 2002:a17:903:41d2:b0:1fd:9d0c:9996 with SMTP id
 d9443c01a7336-1ff572d4738mr263854185ad.35.1723033786674; Wed, 07 Aug 2024
 05:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240806193622.GA74589@bhelgaas> <20240807084348.12304-1-mattc@purestorage.com>
 <alpine.DEB.2.21.2408070956520.61955@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2408070956520.61955@angie.orcam.me.uk>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 7 Aug 2024 22:29:35 +1000
Message-ID: <CAOSf1CHo66dxmChrx97+tfKSE=JM_NzrgdUF_Y4kFabnu3qotQ@mail.gmail.com>
Subject: Re: PCI: Work around PCIe link training failures
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, edumazet@google.com, sr@denx.de, leon@kernel.org, linux-rdma@vger.kernel.org, helgaas@kernel.org, kuba@kernel.org, pabeni@redhat.com, Jim Wilson <wilson@tuliptree.org>, npiggin@gmail.com, alex.williamson@redhat.com, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Bjorn Helgaas <bhelgaas@google.com>, mika.westerberg@linux.intel.com, pali@kernel.org, david.abdurachmanov@gmail.com, netdev@vger.kernel.org, mahesh@linux.ibm.com, "David S. Miller" <davem@davemloft.net>, lukas@wunner.de, Matthew W Carlis <mattc@purestorage.com>, linuxppc-dev@lists.ozlabs.org, saeedm@nvidia.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 7, 2024 at 9:14=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me.uk=
> wrote:
>
> On Wed, 7 Aug 2024, Matthew W Carlis wrote:
>
> > > it does seem like this series made wASMedia ASM2824 work better but
> > > caused regressions elsewhere, so maybe we just need to accept that
> > > ASM2824 is slightly broken and doesn't work as well as it should.
> >
> > One of my colleagues challenged me to provide a more concrete example
> > where the change will cause problems. One such configuration would be n=
ot
> > implementing the Power Controller Control in the Slot Capabilities Regi=
ster.
> > Then, Powering off the slot via out-of-band interfaces would result in =
the
> > kernel forcing the DSP to Gen1 100% of the time as far as I can tell.
> > The aspect of this force to Gen1 that is the most concerning to my team=
 is
> > that it isn't cleaned up even if we replaced the EP with some other EP.
>
>  Why does that happen?
>
>  For the quirk to trigger, the link has to be down and there has to be th=
e
> LBMS Link Status bit set from link management events as per the PCIe spec
> while the link was previously up, and then both of that while rescanning
> the PCIe device in question, so there's a lot of conditions to meet.  Is
> it the case that in your setup there is no device at this point, but one
> gets plugged in later?

My read was that Matt is essentially doing a surprise hot-unplug by
removing power to the card without notifying the OS. I thought the
LBMS bit wouldn't be set in that case since the link goes down rather
than changes speed, but the spec is a little vague and that appears to
be happening in Matt's testing. It might be worth disabling the
workaround if the port has the surprise hotplug capability bit set.
It's fairly common for ports on NVMe drive backplanes to have it set
and a lot of people would be unhappy about those being forced to Gen 1
by accident.
