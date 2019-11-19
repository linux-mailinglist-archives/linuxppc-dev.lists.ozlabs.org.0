Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD38102B4D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 19:00:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HYWs67bvzDqjN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 05:00:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="aSUTdUSR"; 
 dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HYTn03myzDqdt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 04:58:34 +1100 (AEDT)
Received: by mail-oi1-x244.google.com with SMTP id l202so19822077oig.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 09:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W70Dd9++ZO+cJQuc5kJAdml8AzpMFX92tNHeKLr25d4=;
 b=aSUTdUSRb84RDwuBj3LwL4hJWu/PMg141sk/jVAQXSSvAo9TxqDQL9usQEZCSvUubx
 +aVCzipgjxxXZVC5ZdcxnYbDsznecvkJsY2CYHhCnSed0nfMb2e6JfgVIRCb4AzgFsM3
 2EnztEkuKAdcNFE9y0B0QffvwAPbqjDcThcRMO8LdtGfAp6qpspqAPeqPoXcDXwG2mSB
 OcLFX3DaqyrY2SUJ+ebqiPDgAyql2yYgUN9bcObrAC5tCy2MMGgsROECPpqg8SrKsMaY
 WanejoLjUYkk9LyWU4dK6u5taGxQ52diDwe8kPjwVChus/KnISMyKQFJrLxww2riJ7R9
 352w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W70Dd9++ZO+cJQuc5kJAdml8AzpMFX92tNHeKLr25d4=;
 b=dzYeI5Q5eAHku7+i4xiNz1O1H+SK2/VNsQZhm0+3WvoSOuuX6uke/eZwrfXu9DKeJj
 i9DXOx9iY8djehhwCSsFSaD2KBfx7WeL0tszv+Nv7sYZ0XFcnNBXbY2SFvkzIR4UpE79
 KaM3pebh1LArxqgue8HYD3X2dPogIX+4PNQozSA5aFfTEWa/x772rQs4Vv3KFHBR2kw+
 cX9DmxyrWCTDmg4bxXJFeVHWTHo1FyaAes0M5Aioth7V5byOxiweyrqqxbB7134uTBo7
 Bgf8QmvmMtf2Rg4UqO663W8NEXFwXN/PppNfTiWORZLLzxtcZJZR0FyYWWNIyYFEpJtA
 hyXA==
X-Gm-Message-State: APjAAAWvMkMcNhWkOtbHI8R3wciHG/Ra2OkzYOmFvgqR2CGVv42oKZ8+
 F8eQRkGU/jruPpIox6kAbHus8jyYc1lo6fpI64B8jg==
X-Google-Smtp-Source: APXvYqxkb/ytJxhm3fBx0vpuOTOr6uVOwTucEuRFfFGAk5DEmSaBE8Dublz/uwuCgG1VY0XdBdv+bQsMJt4kiHYBono=
X-Received: by 2002:aca:55c1:: with SMTP id j184mr5525622oib.105.1574186310882; 
 Tue, 19 Nov 2019 09:58:30 -0800 (PST)
MIME-Version: 1.0
References: <20191028094825.21448-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4gZ=wKzwscu_nch8VUtNTHusKzjmMhYZWo+Se=BPO9q8g@mail.gmail.com>
 <6f85f4af-788d-aaef-db64-ab8d3faf6b1b@linux.ibm.com>
 <CAPcyv4gMnSe26QfSBABx0zj3XuFqy=K1XaGnmE3h3sP3Y76nRw@mail.gmail.com>
 <4c6e5743-663e-853b-2203-15c809965965@linux.ibm.com>
 <CAPcyv4h42_1deZDaaW1RqX0Ls+maiFO_1e=6xJuHTa3wdWvVvA@mail.gmail.com>
 <87o8xp5lo9.fsf@linux.ibm.com> <8736eohva1.fsf@linux.ibm.com>
 <CAPcyv4hroohsrXT1YHQB-L8ZFa2kUW+bKy03We4Mt7afeJgu3Q@mail.gmail.com>
 <87o8x9h5qa.fsf@linux.ibm.com>
In-Reply-To: <87o8x9h5qa.fsf@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 19 Nov 2019 09:58:19 -0800
Message-ID: <CAPcyv4gv52NK4+=3wcJ2uKX7xnaYVaF-H6O-XfJK8MiRX60SBg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] libnvdimm/namespace: Make namespace size
 validation arch dependent
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 18, 2019 at 1:52 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> Dan Williams <dan.j.williams@intel.com> writes:
>
> > On Sat, Nov 16, 2019 at 4:15 AM Aneesh Kumar K.V
> > <aneesh.kumar@linux.ibm.com> wrote:
> >>
>
> ....
>
>
> >>
> >> Considering the direct-map map size is not going to be user selectable,
> >> do you agree that we can skip the above step 0 configuration you
> >> suggested.
> >>
> >> The changes proposed in the patch series essentially does the rest.
> >>
> >> 1) It validate the size against the arch specific limit during
> >> namespace creation. (part of step 1)
> >
> > This validation is a surprise failure to ndctl.
> >
> >> 2) It also disable initializing a region if it find the size not
> >> correctly aligned as per the platform requirement.
> >
> > There needs to be a way for the user to discover the correct alignment
> > that the kernel will accept.
> >
> >> 3) Direct map  mapping size is different from supported_alignment for a
> >> namespace. The supported alignment controls what possible PAGE SIZE user want the
> >> namespace to be mapped to user space.
> >
> > No, the namespace alignment is different than the page mapping size.
> > The alignment is only interpreted as a mapping size at the device-dax
> > level, otherwise at the raw namespace level it's just an arbitrary
> > alignment.
> >
> >> With the above do you think the current patch series is good?
> >
> > I don't think we've quite converged on a solution.
>
> How about we make it a property of seed device. ie,
> we add `supported_size_align` RO attribute to the seed device. ndctl can
> use this to validate the size value. So this now becomes step0
>
> sys/bus/nd/devices/region0> cat btt0.0/supported_size_align
> 16777216
> /sys/bus/nd/devices/region0> cat pfn0.0/supported_size_align
> 16777216
> /sys/bus/nd/devices/region0> cat dax0.0/supported_size_align
> 16777216

Why on those devices and not namespace0.0?

> We follow that up with validating the size value written to size
> attribute(step 1).
>
> While initializing the namespaces already present in a region we again
> validate the size and if not properly aligned we mark the region
> disabled.

The region might have a mix of namespaces, some aligned and some not,
only the misaligned namespaces should fail to enable. The region
should otherwise enable successfully.
