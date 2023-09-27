Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 517E87AF900
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 06:04:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SulE1m8D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwNKY11PHz3cg5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 14:04:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SulE1m8D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com; envelope-from=oohall@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwNJg734cz2yq2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 14:03:46 +1000 (AEST)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-d7b91422da8so11843428276.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 21:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695787421; x=1696392221; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZWmen4JLaB5x8ESbke0gsUwehKeCChPmC+1mwTtUuc=;
        b=SulE1m8DVIsLPoakwdwS95o9hnwxbhng7L60pqAHBTRKkH4Sscm7lHXJPifp+XRpbY
         5Gd9791n0NJQRXj6Y1EJn6bLf1Gf41pyBISqZoXIeBtYWUumROgvHvQcI+GJ4ktZW6PB
         vuzgUFGePJF9tkMWq1Pvl71uRtzh8vm9XDjoiWaXYtMY0NtV1dQicD2ECZSr/fa1Fuo9
         NgrI9Do+lmI1lgFdYs8Ha+bfwc1cgmYlJKTcNf868qxy/+H0vdRQZ/lw5T2yBt9P7p2q
         9D9ZP9MlWtlwlYuhwIDgovgIdITlUbRygKMc5/QifdGkLVJpcJS75gk5w//5oObZMTTE
         FSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695787421; x=1696392221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZWmen4JLaB5x8ESbke0gsUwehKeCChPmC+1mwTtUuc=;
        b=A67bOptR1EWVdpBdUYb9feOEGVtpCSdg9UvDEonBgwv0GNjifYfjLubd4l3aWfX2NT
         a43dQ9ex7Tr925Eb7QDfTiG1CppoDy+D0+u5NZKlqaMGwwcOHZgi4EtHd2oBN2PldAFI
         2oG7rhn18DNbPxzlrVK0e7xpsV43MXm4NXjyv53zDDgAHZc4hHRQeWjKqnoW32SGWFhm
         3fBtqia4zdVVQ1uyKwJCmHh2Nj8cZq6ZDfrKq9dQQhL7D5a87FlQAiv+dzCDzM/XCjgV
         7LFusE6fIw80sqlMxedOKRdzd3cB/mDliMuKRjyGAnD9dlMizjNZnwfxtTGBzmjZZYIX
         DuLg==
X-Gm-Message-State: AOJu0YxEjSf1GKiTujKxAoWy45cvQd4Nt384XE+r14n0uK9xF1DKlF1m
	y9/6G1iFwzh/Aci0x79mK+/Fg+68hXdpvWffcUk=
X-Google-Smtp-Source: AGHT+IF/vVrJQC7R1KNQ8hd+XcJr7nFxUONmpUX2ez40DLteEgJFOZKReYjsBtv6ACZD43negIIJXfw85N4ywMxMNuI=
X-Received: by 2002:a25:d6c9:0:b0:d78:ae6:e75a with SMTP id
 n192-20020a25d6c9000000b00d780ae6e75amr797922ybg.60.1695787420719; Tue, 26
 Sep 2023 21:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <fdc7a4ee-250f-7ec8-ca15-32cbd480bd3e@linux.alibaba.com> <20230926230247.GA429368@bhelgaas>
In-Reply-To: <20230926230247.GA429368@bhelgaas>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 27 Sep 2023 14:03:28 +1000
Message-ID: <CAOSf1CF0nxSbLGhuB8LbK=LgpSQ1hfwPcH=-TV7VFj0N8adm2A@mail.gmail.com>
Subject: Re: Questions: Should kernel panic when PCIe fatal error occurs?
To: Bjorn Helgaas <helgaas@kernel.org>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, gregkh@linuxfoundation.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>, mahesh@linux.ibm.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "tanxiaofei@huawei.com" <tanxiaofei@huawei.com>, "bp@alien8.de" <bp@alien8.de>, Shuai Xue <xueshuai@linux.alibaba.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Linux PCI <linux-pci@vger.kernel.org>, bhelgaas@google.com, "james.morse@arm.com" <james.morse@arm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "lenb@kernel.org" <lenb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 27, 2023 at 9:03=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Fri, Sep 22, 2023 at 10:46:36AM +0800, Shuai Xue wrote:
> > ...
>
> > Actually, this is a question from my colleague from firmware team.
> > The original question is that:
> >
> >     "Should I set CPER_SEV_FATAL for Generic Error Status Block when a
> >     PCIe fatal error is detected? If set, kernel will always panic.
> >     Otherwise, kernel will always not panic."
> >
> > So I pull a question about desired behavior of Linux kernel first :)
> > From the perspective of the kernel, CPER_SEV_FATAL for Generic Error
> > Status Block is not reasonable. The kernel will attempt to recover
> > Fatal errors, although recovery may fail.
>
> I don't know the semantics of CPER_SEV_FATAL or why it's there.
> With CPER, we have *two* error severities: a "native" one defined by
> the PCIe spec and another defined by the platform via CPER.
>
> I speculate that the reason for the CPER severity could be to provide
> a severity for error sources that don't have a "native" severity like
> AER does, or for the vendor to force the OS to restart (for
> CPER_SEV_FATAL, anyway) in cases where it might not otherwise.
>
> In the native case, we only have the PCIe severity and don't have the
> CPER severity at all, and I suspect that unless there's uncontained
> data corruption, we would rather handle even the most severe PCIe
> fatal error by disabling the specific device(s) instead of panicking
> and restarting the whole machine.

From a user's point of view disabling a device is often worse than a
reboot. If you get a fatal error from a system's only network card
then disabling the card may result in the system being uncontactable
until someone manually recovers it. Similarly, if the disk hosting the
root filesystem disappears the system may not crash immediately (most
of what it needs will be in page cache), but there's no guarantee that
it can do anything useful in that state. In both cases forcing a
reboot will probably bring the system back into a usable state.

> So for PCIe errors, I'm not sure setting CPER_SEV_FATAL is beneficial
> unless the platform wants to force the OS to panic, e.g., maybe the
> platform knows about data corruption and/or the vendor wants the OS to
> panic as part of a reliability story.

The PCIe spec is (intentionally?) vague about the causes of fatal
errors. For all we know a device is reporting one because the embedded
OS it was running crashed and as a side effect it's been DMAing junk
into system memory for the past hour. If you know something about the
device in question maybe you can make those assumptions, but in
general it's impossible to assess the actual severity of an error.
Even in the case of a noisy link causing bit flips (it's possible,
LCRC is only 16bit and ECEC is optional) if we get corruption of the
address bits of the TLP header then the DMA might have overwritten
something important to the OS. From a hardware vendor's point of view
just forcing a reboot makes a lot of sense.

Paranoia aside, in a lot of cases PCI device errors are nothing major
and can be resolved by just restarting the device. However, there's no
way for generic kernel code to make that assessment and we probably
shouldn't have the kernel guess. I'd say the safest option would be to
punt that decision to userspace and provide some way to whitelist
devices that we can ignore errors from. I'm not familiar enough with
the ACPI to know if we have enough details in the notification it
sends to actually implement that though.

Oliver
