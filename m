Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D654552952
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 04:28:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRr6N1kXmz3bs0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 12:28:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=W9FajsxT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=kai.heng.feng@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=W9FajsxT;
	dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRr5j22sBz2yxF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 12:27:51 +1000 (AEST)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B57813FC12
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 02:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1655778464;
	bh=E2ILNW0gf9tTHNwMSSDXvKI5yArGGaqGE5uePOoWe2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=W9FajsxT7yfyXABmQspbiWpj2Tl+V6X6z0PbhDGNE+V0RzG1vKBMUl0kKtdMZnAka
	 zMDSOoTBFh4KAuTDL8ozW1KP1v4EHsX/oyMnn8/3zR6n/vqDzPg3PVgBrWnHxDn3T1
	 47QUCKM45QACPRsRQE5G9wYQN7kN9/BpfzupXinFGK6aqK7fVIhlPFEjyWZ8GoJK1S
	 Io1IV3doh4NXllC2C1ZWpH81o7AfBckPF+GQsJMVU7oBsBna3xOBpfNgsoAgDPcrmL
	 x1oU3qRQYLc/VUZRswEe9d+bThm9JvVcc21dIQ+zLd0YoWlcqkYnJLSwHsvpbF7aPe
	 ZQvD+M//QmKgw==
Received: by mail-oi1-f199.google.com with SMTP id e205-20020acab5d6000000b0032f6c02bea5so6991580oif.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 19:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E2ILNW0gf9tTHNwMSSDXvKI5yArGGaqGE5uePOoWe2M=;
        b=L11wAQepSDLBgvNZyz3U34YPo6/FgpysX9kG5sBlSYncpHw1lxTkECGpI9Av5D8aES
         3o88WWoUTAdT1HD0T6bewE9HfkVKshz2QbBIqwDlYWq2+GOpturhnWR/FrxJmO5OXiGd
         e7HgUwQ1NN9689jddAiwOZ+OOgmtSdNgzAmMYh79vHGa9mwOHwuSlsx+ELezs6IQhYjD
         bT7Q7qvI27qPKgyGQe2uCByAORgZ9N978qIyAxT4YCXQ+/R1zHZOk42XKJ8wDrrAH+Cd
         oXRDkqxyAsFyY0mXgG4MAnIJ9bWOiAnHooJyiwlFwmet8HGfHEmLJ2aQQi28sPkqMRU3
         KwLQ==
X-Gm-Message-State: AJIora/bkKX2YdCYB0M1rDW8WT6lY6rHxKya+jbqxWif/0YVhU42QD33
	v1Jts2/zQkuE5aI+KNYh/mUpyx9qrX/don8SRNiF9bkOvYJPUWG07roG536fJbcB2+AdPr9dc9N
	wiaatJE754vSlacjAvltJm6/ZwwatFSm8KTNeQC2LTSjNSMecy+3KR+7Zb3A=
X-Received: by 2002:a05:6870:51ce:b0:101:c7e3:d7a5 with SMTP id b14-20020a05687051ce00b00101c7e3d7a5mr7075686oaj.176.1655778463517;
        Mon, 20 Jun 2022 19:27:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vZLvkYDH4Le6WT3ZT7+7pPrshf6xYt0vj8FsKZf3JR7+H1FAKU3rm40KLEl0Jy+kx4CjUCiuSHq1zWHm5piH0=
X-Received: by 2002:a05:6870:51ce:b0:101:c7e3:d7a5 with SMTP id
 b14-20020a05687051ce00b00101c7e3d7a5mr7075675oaj.176.1655778463263; Mon, 20
 Jun 2022 19:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220408153159.106741-1-kai.heng.feng@canonical.com>
 <20220408153159.106741-2-kai.heng.feng@canonical.com> <0d4e8764-b1ae-ae59-06ff-d5b705891da4@linux.intel.com>
In-Reply-To: <0d4e8764-b1ae-ae59-06ff-d5b705891da4@linux.intel.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Tue, 21 Jun 2022 10:27:31 +0800
Message-ID: <CAAd53p61knfUS02Ny9JCn18F8EgiP0EmJjJcPZ6PoKsPC0y5Hg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] PCI/DPC: Disable DPC service when link is in L2/L3
 ready, L2 and L3 state
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, koba.ko@canonical.com, Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com, mika.westerberg@linux.intel.com, baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 18, 2022 at 10:41 AM Sathyanarayanan Kuppuswamy
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>
>
>
> On 4/8/22 8:31 AM, Kai-Heng Feng wrote:
> > On Intel Alder Lake platforms, Thunderbolt entering D3cold can cause
> > some errors reported by AER:
> > [   30.100211] pcieport 0000:00:1d.0: AER: Uncorrected (Non-Fatal) error received: 0000:00:1d.0
> > [   30.100251] pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Requester ID)
> > [   30.100256] pcieport 0000:00:1d.0:   device [8086:7ab0] error status/mask=00100000/00004000
> > [   30.100262] pcieport 0000:00:1d.0:    [20] UnsupReq               (First)
> > [   30.100267] pcieport 0000:00:1d.0: AER:   TLP Header: 34000000 08000052 00000000 00000000
> > [   30.100372] thunderbolt 0000:0a:00.0: AER: can't recover (no error_detected callback)
> > [   30.100401] xhci_hcd 0000:3e:00.0: AER: can't recover (no error_detected callback)
> > [   30.100427] pcieport 0000:00:1d.0: AER: device recovery failed
> >
> > Since AER is disabled in previous patch for a Link in L2/L3 Ready, L2
> > and L3, also disable DPC here as DPC depends on AER to work.
> >
> > Bugzilla:https://bugzilla.kernel.org/show_bug.cgi?id=215453
> > Reviewed-by: Mika Westerberg<mika.westerberg@linux.intel.com>
> > Signed-off-by: Kai-Heng Feng<kai.heng.feng@canonical.com>
>
> Reviewed-by: Kuppuswamy Sathyanarayanan
> <sathyanarayanan.kuppuswamy@linux.intel.com>

A gentle ping...

> --
> Sathyanarayanan Kuppuswamy
> Linux Kernel Developer
