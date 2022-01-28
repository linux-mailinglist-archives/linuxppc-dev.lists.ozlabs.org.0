Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E8A49F1E3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 04:30:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlNJt5jK6z3bZY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 14:30:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=nO5Y//Xo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=kai.heng.feng@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=nO5Y//Xo; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JlNJ71pdFz2yYJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 14:30:14 +1100 (AEDT)
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D9CFF40049
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 03:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643340607;
 bh=o1I8UaIYrM6dC/0Rd0QRoVtyxyLa0HoViEvgtP4OM7I=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=nO5Y//XoBV+zNQYzMG8F9jNmJkui9O+/Cssc0Wltivpqo5x4By6tmVM7LBcd+rMl6
 MnQpukQqOw9X8FBmcpq/cIbXVgoj5UAP8pHyIlkAgHSPlDSBDi/dw/vMAnddXbwnwe
 61IgiU1OT5lKDJg+OL9Vo3ss1adKX+WCakDJrH83MSHgQl2QXiHRj6p1mCBUh7RoVd
 TvO+AHBS/UfQ1wqPpHjzEetjs0nKb1wSivtH0ch1W491DmlQTp9PWQ95Q+fFSVYK4u
 Wa1JElgtRYWw7BBjthmb2KvCnHq2pJTh15M7Gjcc58boe0r25tnNPeYss8hTqLPyJY
 ugCJL1p0DCS4A==
Received: by mail-oo1-f71.google.com with SMTP id
 v30-20020a4a9761000000b002daad3afaf6so2663901ooi.18
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 19:30:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o1I8UaIYrM6dC/0Rd0QRoVtyxyLa0HoViEvgtP4OM7I=;
 b=JkRbpm+XdzeIrzFVAA5hDSHdtyZWvkRa2OzZkSCJaMIXZK0mHCSsQZVr5QD/X/v9df
 sZpKSBo04+WFD4Tm8zz3P4k0GpByiMIFCtNebViS15FH6EfpsZSLhKofY0g+khwc06P8
 Zy16gB7TWOpT1l+vykEGiVN3ghQHDiv1DGNha1rLWU1SuaBtTEq3C6e71bVagNXRnj91
 HujHjA93EovaTtVozLlGnUvpnWhiqrWQukOEZKoYlo5RSaDtXPcWZNZ5RtHBx7T7aJIC
 CzfY2nDTXUDcidIm2ZHuxl+8SKEicuotxjadT8XUwc+soeZiHxcQoimIhNQpaBMJ1Fqn
 ucag==
X-Gm-Message-State: AOAM5335MBpiNOPH7pNA1KHG+xua76E+rX74OAlQT+fM7pu4e86UBwY2
 jh9T3JUEkd8cvIeyqqw/fufJTasJb566udadXwI+cUTPwVRLpDwlmvtQii6Yq9W7RU5XNOkDZgN
 nb8R+kGYrhgb82zDH6Hc5y3wvNUNKdrIIijFb4s0L8ScSkhoLcFbYI7FngQw=
X-Received: by 2002:a05:6808:191a:: with SMTP id
 bf26mr9172619oib.111.1643340606602; 
 Thu, 27 Jan 2022 19:30:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1jv4J88ak1rDj6mbh78ua15nyVyq1aqhXCtXon2huqpabC8PnLCHWXFERGI5wRDEfkfYL3kiys1HJTFSdoOQ=
X-Received: by 2002:a05:6808:191a:: with SMTP id
 bf26mr9172601oib.111.1643340606215; 
 Thu, 27 Jan 2022 19:30:06 -0800 (PST)
MIME-Version: 1.0
References: <20220127025418.1989642-1-kai.heng.feng@canonical.com>
 <0259955f-8bbb-1778-f234-398f1356db8b@linux.intel.com>
 <CAAd53p6+KPAJchh9Jx59Fkkj5FidSxsW0yHjLqooFjvu-Y9u7w@mail.gmail.com>
 <11891652-40c6-f111-46b7-e96d1729815e@linux.intel.com>
In-Reply-To: <11891652-40c6-f111-46b7-e96d1729815e@linux.intel.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Fri, 28 Jan 2022 11:29:54 +0800
Message-ID: <CAAd53p5rNFBK8t7bK_Jdds2c4dXpWtEb10iTtsc4zQEjGrf-Pg@mail.gmail.com>
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

On Fri, Jan 28, 2022 at 10:57 AM Lu Baolu <baolu.lu@linux.intel.com> wrote:
>
> On 1/27/22 7:14 PM, Kai-Heng Feng wrote:
> > On Thu, Jan 27, 2022 at 3:01 PM Lu Baolu <baolu.lu@linux.intel.com> wrote:
> >>
> >> On 2022/1/27 10:54, Kai-Heng Feng wrote:
> >>> Commit 50310600ebda ("iommu/vt-d: Enable PCI ACS for platform opt in
> >>> hint") enables ACS, and some platforms lose its NVMe after resume from
> >>> S3:
> >>> [   50.947816] pcieport 0000:00:1b.0: DPC: containment event, status:0x1f01 source:0x0000
> >>> [   50.947817] pcieport 0000:00:1b.0: DPC: unmasked uncorrectable error detected
> >>> [   50.947829] pcieport 0000:00:1b.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Receiver ID)
> >>> [   50.947830] pcieport 0000:00:1b.0:   device [8086:06ac] error status/mask=00200000/00010000
> >>> [   50.947831] pcieport 0000:00:1b.0:    [21] ACSViol                (First)
> >>> [   50.947841] pcieport 0000:00:1b.0: AER: broadcast error_detected message
> >>> [   50.947843] nvme nvme0: frozen state error detected, reset controller
> >>>
> >>> It happens right after ACS gets enabled during resume.
> >>>
> >>> There's another case, when Thunderbolt reaches D3cold:
> >>> [   30.100211] pcieport 0000:00:1d.0: AER: Uncorrected (Non-Fatal) error received: 0000:00:1d.0
> >>> [   30.100251] pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Requester ID)
> >>> [   30.100256] pcieport 0000:00:1d.0:   device [8086:7ab0] error status/mask=00100000/00004000
> >>> [   30.100262] pcieport 0000:00:1d.0:    [20] UnsupReq               (First)
> >>> [   30.100267] pcieport 0000:00:1d.0: AER:   TLP Header: 34000000 08000052 00000000 00000000
> >>> [   30.100372] thunderbolt 0000:0a:00.0: AER: can't recover (no error_detected callback)
> >>> [   30.100401] xhci_hcd 0000:3e:00.0: AER: can't recover (no error_detected callback)
> >>> [   30.100427] pcieport 0000:00:1d.0: AER: device recovery failed
> >>>
> >>> So disable AER service to avoid the noises from turning power rails
> >>> on/off when the device is in low power states (D3hot and D3cold), as
> >>> PCIe spec "5.2 Link State Power Management" states that TLP and DLLP
> >>> transmission is disabled for a Link in L2/L3 Ready (D3hot), L2 (D3cold
> >>> with aux power) and L3 (D3cold).
> >>>
> >>> Bugzilla:https://bugzilla.kernel.org/show_bug.cgi?id=209149
> >>> Bugzilla:https://bugzilla.kernel.org/show_bug.cgi?id=215453
> >>> Fixes: 50310600ebda ("iommu/vt-d: Enable PCI ACS for platform opt in hint")
> >>
> >> I don't know what this fix has to do with the commit 50310600ebda.
> >
> > Commit 50310600ebda only exposed the underlying issue. Do you think
> > "Fixes:" tag should change to other commits?
> >
> >> Commit 50310600ebda only makes sure that PCI ACS is enabled whenever
> >> Intel IOMMU is on. Before this commit, PCI ACS could also be enabled
> >> and result in the same problem. Or anything I missed?
> >
> > The system in question didn't enable ACS before commit 50310600ebda.
>
> This commit exposed the issue on your configuration doesn't mean the
> fix should be back ported as far as that commit. I believe if you add
> intel-iommu=on in the kernel parameter, the issue still exists even you
> revert commit 50310600ebda or checkout a tag before it.

That's true.

I guess it's better to drop the "Fixes:" tag.

Bjorn, should I send another version of it?

Kai-Heng

>
> Best regards,
> baolu
