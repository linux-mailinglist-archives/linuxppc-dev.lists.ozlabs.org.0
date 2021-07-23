Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCF23D3507
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 09:06:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWL2N0s5dz30Gn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 17:06:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=AkyYuZgR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.120;
 helo=smtp-relay-canonical-0.canonical.com;
 envelope-from=kai.heng.feng@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=AkyYuZgR; 
 dkim-atps=neutral
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWL1p1kjnz2yLQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jul 2021 17:05:33 +1000 (AEST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id AC2AB3F349
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jul 2021 07:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1627023928;
 bh=nfkPx7NC5zaeXceVlyVGlTHRL5ArI5NO9jvFKmnisTY=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=AkyYuZgRiWKoTrTqlZV5tATy9Dvitjs8j6NnRfcOtGVSzY7VeKiDAQX/UCnuK9ccg
 BPUYyxg+l65emZg7HbqHKOqR0x7KCZ/urNR4D4GfUgyYdUgURe3Tx24tLgbk7fjtka
 Y/WcsDuWKitw+jjB8SENu+BlJX5RnDBX7IDrjeXqE00QEB0RwHdzZhRaxCZvChznWn
 YDbbR0v73O3JmFLh4G3kjq83UeL40S9SF/2Lvdh5J0p6IovtyYK1xGmdlngD6q493t
 szcDl44VG31q9AEwnIMSkkMyTMZaShMGJJui4oKMaLFZax9YW3YfLay7cv7viW/O9V
 WifUDdLGQrTSA==
Received: by mail-ed1-f69.google.com with SMTP id
 f24-20020a0564021618b02903954c05c938so278798edv.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jul 2021 00:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nfkPx7NC5zaeXceVlyVGlTHRL5ArI5NO9jvFKmnisTY=;
 b=LsSf+QD2577l9pWlIyuw3S83q4a7g3/CetcquvCEGyDrpg/IFTJXMTw8P+tq6BEYYb
 0kQkGEY9ZYZMUKFIHTi2CH7gcUr69U+PxzR+M6Wwza5jkB0Qj/lCu/TLw/B4GJYLFiZM
 hVsc9mI/u2bXz+eVqmJb2IS7zjdr/Zcs70F2vUK+XfFUvgZgdGVbH4+HucRGMQAPPDAA
 zOIC1z0xDiOkNAVdeAC3MtDihvWT2kxh2240gJmUTZU/+OQXhcNhZ6boOjiaVV6pPXZD
 WLiOEldGJgPwsvXcX7cOYtONxLarBiy4cxxelNUMmrJtMEWpKoG5uurUEMOOWjivYisJ
 0nMA==
X-Gm-Message-State: AOAM533MO4+iKzD7Yt3HY8bL3cvZtSkY+dM1/JQoQ/XMhfgGXzNf0q0Z
 CysWTFHNCBpgOxlrBU+08uL4jUtmzdeqkaVHoosOXHWPbJsi3p9V+Noo7J0ywiiEgRgzTLtdwVJ
 1wDtWNjLrq4uDQNzL5BJ1WndZnSYm1PMjxCkYu1KzftVJg+I6fgLWPgZ8Fzg=
X-Received: by 2002:a17:906:f0d8:: with SMTP id
 dk24mr3430027ejb.432.1627023926311; 
 Fri, 23 Jul 2021 00:05:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnwrE3fibwAyd5puLQhhkBI3cJ/iZwBYnuPqRykg2M2+jR/0WQUB0/5z1/f5dPMa0hH/lPTm/THgVMa/6SzKQ=
X-Received: by 2002:a17:906:f0d8:: with SMTP id
 dk24mr3430007ejb.432.1627023926038; 
 Fri, 23 Jul 2021 00:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAAd53p6VN0ejKHcTRgj8mZ_iApR=KogpVZ-HkvdoZbJ=Yue98g@mail.gmail.com>
 <20210722222351.GA354095@bjorn-Precision-5520>
 <YPpShrTa448OpGjA@infradead.org>
In-Reply-To: <YPpShrTa448OpGjA@infradead.org>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Fri, 23 Jul 2021 15:05:12 +0800
Message-ID: <CAAd53p75d=ibfFRCLmYOMvfrn7XbDajby1shKdWQWW=DOrX3uw@mail.gmail.com>
Subject: Re: [PATCH 1/2] PCI/AER: Disable AER interrupt during suspend
To: Christoph Hellwig <hch@infradead.org>
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
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Lalithambika Krishnakumar <lalithambika.krishnakumar@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 "open list:PCI ENHANCED ERROR HANDLING \(EEH\) FOR POWERPC"
 <linuxppc-dev@lists.ozlabs.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 23, 2021 at 1:24 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Thu, Jul 22, 2021 at 05:23:51PM -0500, Bjorn Helgaas wrote:
> > Marking both of these as "not applicable" for now because I don't
> > think we really understand what's going on.
> >
> > Apparently a DMA occurs during suspend or resume and triggers an ACS
> > violation.  I don't think think such a DMA should occur in the first
> > place.
> >
> > Or maybe, since you say the problem happens right after ACS is enabled
> > during resume, we're doing the ACS enable incorrectly?  Although I
> > would think we should not be doing DMA at the same time we're enabling
> > ACS, either.
> >
> > If this really is a system firmware issue, both HP and Dell should
> > have the knowledge and equipment to figure out what's going on.
>
> DMA on resume sounds really odd.  OTOH the below mentioned case of
> a DMA during suspend seems very like in some setup.  NVMe has the
> concept of a host memory buffer (HMB) that allows the PCIe device
> to use arbitrary host memory for internal purposes.  Combine this
> with the "Storage D3" misfeature in modern x86 platforms that force
> a slot into d3cold without consulting the driver first and you'd see
> symptoms like this.  Another case would be the NVMe equivalent of the
> AER which could lead to a completion without host activity.

The issue can also be observed on non-HMB NVMe.

>
> We now have quirks in the ACPI layer and NVMe to fully shut down the
> NVMe controllers on these messed up systems with the "Storage D3"
> misfeature which should avoid such "spurious" DMAs at the cost of
> wearning out the device much faster.

Since the issue is on S3, I think the NVMe always fully shuts down.

Kai-Heng
