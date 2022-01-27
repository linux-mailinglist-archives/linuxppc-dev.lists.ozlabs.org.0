Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CF549E065
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 12:15:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jkyg95hwVz3cG2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 22:15:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=ZVHblktj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=kai.heng.feng@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=ZVHblktj; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JkyfX2wTkz2yPV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 22:14:43 +1100 (AEDT)
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9BB5F3F197
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 11:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643282077;
 bh=ei0q12+pTEkVCSC3KLPxXTL3wN1Kz2V2e0OB+SXoUME=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=ZVHblktjtJb4zmm6qxwYNHV/E7IVKctDR0Xi8qhJjDB9XxuUw2/ozucX3kxsw+ncb
 Y3Xc0KKMAhz22VhYK8dx0SRyyzxfVrErXNb1H/9QWMDfBI1xxUkWFCrZ3DtQU3DdmP
 mLAklBFPcsfBWrffkhFrObBGbJtGYvbWSwjvvB85emFAp/8e9N8tpy8jV/9sJS2nv1
 bU6LBlOPog3l8BC4T0Ws5kkL2idbGUyURXVgFHZ89pUONKQHgpiUuWfcHKZLR6b+tK
 1/+oKNm7LzK8Ftw3lL71MkqcG/Q4o0O5mCp9dJ89Kz3WIXKr5EpehGLeb0LjG/oVWU
 orjXazh0AY2Gw==
Received: by mail-oo1-f72.google.com with SMTP id
 h19-20020a4a6f13000000b002e3c2ae2affso1482160ooc.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 03:14:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ei0q12+pTEkVCSC3KLPxXTL3wN1Kz2V2e0OB+SXoUME=;
 b=0mLoxK1zotGETQxxDZHp7aH7LQd4Wz2spPx+hPE70faKSWBRY8+krYAC2+TPZWV6p+
 QoBmaEKJzUPgzHOdAWbHjz4h5p3CK26B12ml08h5DnjOiZqbf7G2mSDIHgYNS7WUm8Hm
 XhTDtvn1M80r4/rc/Yg3mERzm7Zid0HNQH3yLbBfnTuyDceYZC/Xu9n2vueisrfCZnNJ
 CkTSwp6pYUAhvNQxUhxIEAYDgWt+e71/cyczKHB3xZ8l+eysCmE1QSG67hBPrEHMKLyK
 u6lv/a8vjWQprN9SdWIlAKjwdDLKLN/JHB1CGEYo/UMTD5n2TWgACjA7ef6/E5+ddhdx
 bijQ==
X-Gm-Message-State: AOAM5302Lr0KJx7QKnQ7EZAfnTLaPv/Be7BJeQayEjxfkh8EqX5GrXdq
 HGIVzcJAvkCoJesp+WHwJdaGdOA2sh56GvVUNJcZ+YLsFQu4kFMH0DeTNBXv21DNHda+FMpThEY
 h8dWVs65I8KsU4ciH5ZUs61yqGtZAnUSzCiLtN3b0bPLphqfaHmYCG8hl4iQ=
X-Received: by 2002:a05:6808:179e:: with SMTP id
 bg30mr1968522oib.57.1643282076595; 
 Thu, 27 Jan 2022 03:14:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxEE5Ap4FJ4cUst9yvbfsRQokijydzPA6OcoO6QyYWtnn1PDvaX7TZkZkLGBEICFTLx1JnuD/+0yw+QuDnNaE=
X-Received: by 2002:a05:6808:179e:: with SMTP id
 bg30mr1968509oib.57.1643282076282; 
 Thu, 27 Jan 2022 03:14:36 -0800 (PST)
MIME-Version: 1.0
References: <20220127025418.1989642-1-kai.heng.feng@canonical.com>
 <0259955f-8bbb-1778-f234-398f1356db8b@linux.intel.com>
In-Reply-To: <0259955f-8bbb-1778-f234-398f1356db8b@linux.intel.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Thu, 27 Jan 2022 19:14:25 +0800
Message-ID: <CAAd53p6+KPAJchh9Jx59Fkkj5FidSxsW0yHjLqooFjvu-Y9u7w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] PCI/AER: Disable AER service when link is in L2/L3
 ready, L2 and L3 state
To: Lu Baolu <baolu.lu@linux.intel.com>
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
Cc: Joerg Roedel <jroedel@suse.de>,
 Lalithambika Krishnakumar <lalithambika.krishnakumar@intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, koba.ko@canonical.com,
 Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com,
 mika.westerberg@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 27, 2022 at 3:01 PM Lu Baolu <baolu.lu@linux.intel.com> wrote:
>
> On 2022/1/27 10:54, Kai-Heng Feng wrote:
> > Commit 50310600ebda ("iommu/vt-d: Enable PCI ACS for platform opt in
> > hint") enables ACS, and some platforms lose its NVMe after resume from
> > S3:
> > [   50.947816] pcieport 0000:00:1b.0: DPC: containment event, status:0x1f01 source:0x0000
> > [   50.947817] pcieport 0000:00:1b.0: DPC: unmasked uncorrectable error detected
> > [   50.947829] pcieport 0000:00:1b.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Receiver ID)
> > [   50.947830] pcieport 0000:00:1b.0:   device [8086:06ac] error status/mask=00200000/00010000
> > [   50.947831] pcieport 0000:00:1b.0:    [21] ACSViol                (First)
> > [   50.947841] pcieport 0000:00:1b.0: AER: broadcast error_detected message
> > [   50.947843] nvme nvme0: frozen state error detected, reset controller
> >
> > It happens right after ACS gets enabled during resume.
> >
> > There's another case, when Thunderbolt reaches D3cold:
> > [   30.100211] pcieport 0000:00:1d.0: AER: Uncorrected (Non-Fatal) error received: 0000:00:1d.0
> > [   30.100251] pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Requester ID)
> > [   30.100256] pcieport 0000:00:1d.0:   device [8086:7ab0] error status/mask=00100000/00004000
> > [   30.100262] pcieport 0000:00:1d.0:    [20] UnsupReq               (First)
> > [   30.100267] pcieport 0000:00:1d.0: AER:   TLP Header: 34000000 08000052 00000000 00000000
> > [   30.100372] thunderbolt 0000:0a:00.0: AER: can't recover (no error_detected callback)
> > [   30.100401] xhci_hcd 0000:3e:00.0: AER: can't recover (no error_detected callback)
> > [   30.100427] pcieport 0000:00:1d.0: AER: device recovery failed
> >
> > So disable AER service to avoid the noises from turning power rails
> > on/off when the device is in low power states (D3hot and D3cold), as
> > PCIe spec "5.2 Link State Power Management" states that TLP and DLLP
> > transmission is disabled for a Link in L2/L3 Ready (D3hot), L2 (D3cold
> > with aux power) and L3 (D3cold).
> >
> > Bugzilla:https://bugzilla.kernel.org/show_bug.cgi?id=209149
> > Bugzilla:https://bugzilla.kernel.org/show_bug.cgi?id=215453
> > Fixes: 50310600ebda ("iommu/vt-d: Enable PCI ACS for platform opt in hint")
>
> I don't know what this fix has to do with the commit 50310600ebda.

Commit 50310600ebda only exposed the underlying issue. Do you think
"Fixes:" tag should change to other commits?

> Commit 50310600ebda only makes sure that PCI ACS is enabled whenever
> Intel IOMMU is on. Before this commit, PCI ACS could also be enabled
> and result in the same problem. Or anything I missed?

The system in question didn't enable ACS before commit 50310600ebda.

Kai-Heng

>
> Best regards,
> baolu
