Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBDF100FAE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 01:06:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47H5hX1LY8zDqPR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 11:06:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::242;
 helo=mail-oi1-x242.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="OwqIclI3"; 
 dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47H5fM5s7czDqZl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 11:04:22 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id n14so17122538oie.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 16:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZtbvKjjnscKy4A6MuNeD3a3NFthr68OtKoL8RB+WxNo=;
 b=OwqIclI3keeY7VHTJMp42XcFMnSTpvkqGJgi1VHbv9P05zsqk7I4qEew1vlPCtyxE6
 NtIAzveBsEu4kp70hWM+c+0r8DFE2JfAuqsFbN0yMpKcYrac8GPNaBuUxFR2EypImxtG
 TbR3Gp8qoV/FATMkEKzlAggAnAqeHJJgJMZccBlQX3YSC1H5g1ptRg934gVSvL4odkQm
 wN0l/Z3VtNzyskVviilqa+8hpfN1DGw5KiJZiWyXEP/sX3mSW9PujfWr8BAiH/OJoUMU
 BEXRq1HBY8xK18/ZQAcIxHS4HLunPih16a070i5KPwuvbR2SMnxCy8MdUDiXvgBRovMR
 2nUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZtbvKjjnscKy4A6MuNeD3a3NFthr68OtKoL8RB+WxNo=;
 b=rOgBBOk/jpjmiMCgR92qhNnBFq1LI9OTGBE4p/6zzNh98xcU1EAaPoZdrlKZYWrxss
 EKd9+AoJI72ntG0BXGZGVDihdjqLFQXDMzPGMVpBh5EFqa/w5rYz2tD9PjS6yFuDdCyN
 GQFG5OXKQ5fBi2UwmZiIC6mep167C0B3vPkHBWnoUILEMjXqSaXL6i4g9LLJhd1vHOWx
 gAIJqwolJnqPZJxGBufyqIKbfMTj55kHkGHPieCFRixUAmZ9KXT57Yu5mYIqJoe/iCMX
 fLqkJu5uVKX+yOrt74J31RkXKQyYfPcvYHnwPWysR7MAcqQaYyiQ2HC6vhgZd/u4dbaH
 Hfzg==
X-Gm-Message-State: APjAAAVwCY5VEflxzSLjMJvTYWqcQS0jsfIMTTcRjEcrn9gU6O0U4lQu
 Cl1ke8QROI/Gesiqjkl+HuLNqV7G10PGQLRZ8UGLUA==
X-Google-Smtp-Source: APXvYqyHTRHOCdWxsyyF+07+0YV81ecwmO5E2eDEN7/DauYrZtLt+iJnkG3Op6xVtOT1jIhYYt8wSLdsK2pfoAPRMRw=
X-Received: by 2002:aca:ea57:: with SMTP id i84mr1382576oih.73.1574121858711; 
 Mon, 18 Nov 2019 16:04:18 -0800 (PST)
MIME-Version: 1.0
References: <20191025044721.16617-1-alastair@au1.ibm.com>
 <20191025044721.16617-9-alastair@au1.ibm.com>
 <8232c1a6-d52a-6c32-6178-de082174a92a@linux.ibm.com>
 <CAPcyv4g9b6PyREurH9NcQf4BO2YcRGJPBZDqGKy-Vz91mBKjew@mail.gmail.com>
 <02374c9a-39fb-5693-3d9c-aa7e7674a6c1@linux.ibm.com>
In-Reply-To: <02374c9a-39fb-5693-3d9c-aa7e7674a6c1@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 18 Nov 2019 16:04:07 -0800
Message-ID: <CAPcyv4hDxeJo-i9FG=JBhaK3awjm3cN_MNvdO_7Z=9bJT9wsGw@mail.gmail.com>
Subject: Re: [PATCH 08/10] nvdimm: Add driver for OpenCAPI Storage Class Memory
To: Andrew Donnellan <ajd@linux.ibm.com>
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
Cc: Oscar Salvador <osalvador@suse.com>, Michal Hocko <mhocko@suse.com>,
 David Hildenbrand <david@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Wei Yang <richard.weiyang@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, Ira Weiny <ira.weiny@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Vishal Verma <vishal.l.verma@intel.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 alastair@d-silva.org, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Qian Cai <cai@lca.pw>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alastair D'Silva <alastair@au1.ibm.com>, Linux MM <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 18, 2019 at 3:48 PM Andrew Donnellan <ajd@linux.ibm.com> wrote:
>
> On 15/11/19 3:35 am, Dan Williams wrote:
> >> Have you discussed with the directory owner if it's ok to split the
> >> driver over several files?
> >
> > My thought is to establish drivers/opencapi/ and move this and the
> > existing drivers/misc/ocxl/ bits there.
>
> Is there any other justification for this we can think of apart from not
> wanting to put this driver in the nvdimm directory? OpenCAPI drivers
> aren't really a category of driver unto themselves.

The concern is less about adding to drivers/nvdimm/ and more about the
proper location to house opencapi specific transport and enumeration
details. The organization I'm looking for is to group platform
transport and enumeration code together similar to how drivers/pci/
exists independent of all pci drivers that use that common core. For
libnvdimm the enumeration is platform specific and calls into the
nvdimm core. This is why the x86 platform persistent memory bus driver
lives under drivers/acpi/nfit/ instead of drivers/nvdimm/. The nfit
driver is an ACPI extension that translates ACPI details into
libnvdimm core objects.

The usage of "ocxl" in the source leads me to think part of this
driver belongs in a directory that has other opencapi specific
considerations.
