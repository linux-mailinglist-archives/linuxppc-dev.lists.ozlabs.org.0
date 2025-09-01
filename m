Return-Path: <linuxppc-dev+bounces-11549-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC31B3DCB6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 10:39:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFj366D7Zz2yt0;
	Mon,  1 Sep 2025 18:39:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756715954;
	cv=none; b=aXkKoajx2ubNVN4/Q8bxZgVa3b+P+fFSnzw5rk6Ag4YAkQn+l2jhL6U1LaqPaq0tmz2CnMKUauVfCk6+lGG5M1AaYfhUoNCJAXPFcKW25sPvIJF2vc41Na2ZBVTI8yClTd+qlf9n5G7lH9AvFhnB4+ifxi3FvswJn2T5IOpqmgxezFpHhgxqddZdoAZbwBtFItr1qKPqUJbH7SynxWJWFeTXUt7H/3nxUzxEKnNFZaz0OM/EtdJPEN5Qqw80shLSQQW5w9PlAxIQO5MxutMSx/ulOeJyTPLAI/OHcS4LptTJXpEWcnsX+7zZoz17QpXIwR4TWgflC2qg1zBgeCfIPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756715954; c=relaxed/relaxed;
	bh=Ulv02t6E8nasXluvV9ehM0QMWfZqnXi7fBl8WMsUhHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kiwXnGpAAS1XJhumNoKrGFJbuPEqqiD2/3K6DPMX7opj3eA+zEv+tvmC7eYAZld2lTg5iMnCRAtm08ebWT2ccwaE+Bv/PVGTDfXYsFBFrwAUf9JrwcyT2fOVqzL4T0NUwU4S/5PvroSAt5iBB48Hq9tbFoT2/KQtT6yIvbkAZPCQx2phrTmEHcXlxnVaQaV7htbRx3upYxJDikVnk1gba7dznF2JXvPEeHLdC8UbFGiVypbTjq0pMb5uOSnnpQRBg4g3xXKobXUGZI4HqwbG97Ou/O3LLQCFY74rL2pultXiVbc4CGZ7L0/d8HsoPWtYw5BN/LqIyK3V1DWczaHn6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.217.48; helo=mail-vs1-f48.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.217.48; helo=mail-vs1-f48.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFj353jy6z2yhb
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Sep 2025 18:39:13 +1000 (AEST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5245cffa20eso3277199137.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Sep 2025 01:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756715950; x=1757320750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ulv02t6E8nasXluvV9ehM0QMWfZqnXi7fBl8WMsUhHw=;
        b=Qf8IieFHWWGOOX8l7BJtoSAxC+G6gWhKz//aL+zjk82pt8l0/gxKobvYQm0aKsQfLs
         YmDmmga7+hVsmPspbVSRNusmXFUCm4NC4TxCFxugA+Vfq7KNwAfWZScJg7bat/zv6xSj
         Mzc5dRKw7k8MDy798lSAdBoqFW6q6G8r357kAPcYcKHRYGS0SngG7HQ9jIEdEzDnsdQu
         +4yxmnmDLdq1EHu4SDnAjoYZzQDx9OsCSqM4GpJneKBgItgAotC/pC0mlWh/5b40eIzU
         UUEnJnAKyF0Uep6l1FSE8kdy8hVdkgUaC1kOsziCLp8ULcUfbpqruR0AGQsMcD+KLh5d
         fUYg==
X-Forwarded-Encrypted: i=1; AJvYcCVOhuzziXzRy3sD5wcxL0YaAgGaUR9COMOLxT9rgytBDdyAPdA8XJj5PXsjHYGpvkTZaoNRtNhDQeX9FCg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw3j6hGUyjt7QV+7wucjELw2FTB978ziqU/z7g4odEZjrVUps7k
	w8uiHaAqyBHPw0OQnolZx7M/3W8rKOqAuUgHYZs6i3a4F0WASaaH6/aj+fbueML7
X-Gm-Gg: ASbGncspMG27AXV4XSM6ABay9wI/I1PMLQy/kiYDCH+UrdZCwZZc2zqFgpyXQbCM970
	Wx1E1XDxLj571iRnHRm8yWt68vf5JsciW2yj2xiNKYJYKRbfp+CjZysFSw1dwT6SklyoNRj7+s9
	QdD0og0Z0Z5/QYqOOsrUMEN/c3Y61H/P8hw7Y94KeK4Bb4vbjGcrkXaIj6ioAWw1k+9SynOdzKc
	AGGF1KSUdX4tC0rOSMOfHKpWMnUDS/mJ9WM2XIzOwhK95ZuZez55rb2QYI0GaQVW3yoro+Dv/V8
	2Sfeud3RkbonycI+wRoYq9ed/ribHsQJT4xapxzx1fbT7lZDs6rAuNhztyndN8f0Gu0A/Dg3Sub
	o2fSbNLfSpifnclgsQndafTeX4ADpqSy32qDKlyKATLgFG8E0pNpv7hkADPrYxiVUiIIO/EOufr
	7yHEssBA==
X-Google-Smtp-Source: AGHT+IHfId8iBRuV7uViACTAJjzNqur09Jy1FSO/xy7JSNdj+XPaVA5XhXeL/Jy1iMo7VRRNRa1Xpw==
X-Received: by 2002:a05:6102:441e:b0:528:ec33:3675 with SMTP id ada2fe7eead31-52b1b1efd85mr2104490137.17.1756715950448;
        Mon, 01 Sep 2025 01:39:10 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8943bb744fasm3472151241.15.2025.09.01.01.39.09
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 01:39:09 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5245cffa20eso3277185137.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Sep 2025 01:39:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXpSKfWlWt/xroKqDjM6LOvApXdOLZOV4OpvIoQhHpgKbmLp4mL6wr4DGmaMjfCQk1AdIuf1/DcmiOEmDA=@lists.ozlabs.org
X-Received: by 2002:a05:6102:5789:b0:51c:4443:16e0 with SMTP id
 ada2fe7eead31-52b1be316e5mr1967209137.30.1756715948932; Mon, 01 Sep 2025
 01:39:08 -0700 (PDT)
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
References: <20250822145605.18172-1-ilpo.jarvinen@linux.intel.com> <20250827223606.GA915856@bhelgaas>
In-Reply-To: <20250827223606.GA915856@bhelgaas>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Sep 2025 10:38:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqKT4OaX6P_1CW_e2U1GwiCmyV5sAoDVa7EWUX2r6SsA@mail.gmail.com>
X-Gm-Features: Ac12FXyky2hWsQI9uSpsphCp4R_EUgbfbVJ67zlGAAXkq-snhjMBdE6QAlpgqhY
Message-ID: <CAMuHMdUqKT4OaX6P_1CW_e2U1GwiCmyV5sAoDVa7EWUX2r6SsA@mail.gmail.com>
Subject: Re: [PATCH 00/24] PCI: Bridge window selection improvements
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andreas Larsson <andreas@gaisler.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	"David S. Miller" <davem@davemloft.net>, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-pci@vger.kernel.org, 
	sparclinux@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Yinghai Lu <yinghai@kernel.org>, Igor Mammedov <imammedo@redhat.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	linuxppc-dev@lists.ozlabs.org, Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

CC Greg

On Thu, 28 Aug 2025 at 00:36, Bjorn Helgaas <helgaas@kernel.org> wrote:
> On Fri, Aug 22, 2025 at 05:55:41PM +0300, Ilpo J=C3=A4rvinen wrote:
> > This series is based on top of the three resource fitting and
> > assignment algorithm fixes (v3).
> >
> > PCI resource fitting and assignment code needs to find the bridge
> > window a resource belongs to in multiple places, yet, no common
> > function for that exists. Thus, each site has its own version of
> > the decision, each with their own corner cases, misbehaviors, and
> > some resulting in complex interfaces between internal functions.
> > ...
>
> > I've tried to look out for any trouble that code under arch/ could
> > cause after the flags start to behave differently and therefore ended
> > up consolidating arch/ code to use pci_enable_resources(). My
> > impression is that strictly speaking only the MIPS code would break
> > similar to PCI core's copy of pci_enable_resources(), the others were
> > much more lax in checking so they'd likely keep working but
> > consolidation seemed still the best approach there as the enable checks
> > seemed diverging for no apparent reason.
> > ...
>
> >   m68k/PCI: Use pci_enable_resources() in pcibios_enable_device()
> >   sparc/PCI: Remove pcibios_enable_device() as they do nothing extra
> >   MIPS: PCI: Use pci_enable_resources()
> > ...
>
> >  arch/m68k/kernel/pcibios.c   |  39 +-
> >  arch/mips/pci/pci-legacy.c   |  38 +-
> >  arch/sparc/kernel/leon_pci.c |  27 --
> >  arch/sparc/kernel/pci.c      |  27 --
> >  arch/sparc/kernel/pcic.c     |  27 --
> > ...
>
> I love the fact that you're doing so much cleanup.  Thanks for all the
> work in this!
>
> Obviously all this code is quite sensitive, so I put it on
> pci/resource to get more exposure in -next.  If it turns out that we
> trip over things or just don't feel comfortable yet for v6.18, we can
> always defer this part until the next cycle.
>
> I will also watch for acks from the m68k, mips, and sparc maintainers
> for those pieces.

