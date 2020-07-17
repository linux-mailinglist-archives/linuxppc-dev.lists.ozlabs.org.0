Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D661F223265
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 06:32:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7JBj3rB2zDqvr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 14:32:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::142;
 helo=mail-lf1-x142.google.com; envelope-from=cyrozap@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aXOnEeX1; dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7Hn641K5zDrDX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 14:13:56 +1000 (AEST)
Received: by mail-lf1-x142.google.com with SMTP id o4so5302198lfi.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 21:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3Lvy+/OH9z2jCzIK+z+Qwn1xr98qqMgmgQ1Ho1iSWBg=;
 b=aXOnEeX1AuBGxenBuWAnRgMfbnP60RGVU/GV01wT86UYEXGdhCzG0oleFfg+4ScfnP
 b6MP1CZh/armT48drJR5MHQ/Eu49ihapDOhIE8elHzd12sKuWxPCJI0rRosBDCxReOKV
 h+WcDu0cqKlMYJtzxLUdYRFJKxIIgoakd9oFokqORQ9V+z8cV1AQgpQld91jZcVtAh/k
 Eqm3I4djaf8eLq905PImT85t32cGUK1fnWJU6HGdilzGP4fr7BE3qhLn8aXpWvKDMl+8
 tuVnNvRHqtV3GLnaXM60rBuXlvipONPnh8Mz2vc0iDEPUQCGz30IIfQqrBIxqhDz2hso
 /Cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3Lvy+/OH9z2jCzIK+z+Qwn1xr98qqMgmgQ1Ho1iSWBg=;
 b=GWQppQJc2hxE06x/Y7l+pfqcW3+anWNprjwBhFBHe1dxZjBFkY7BA5MOPNofmBRrhh
 oUK5O3go4NV5VtEdM/nenbkJ4p77C2sNHhdPB64cFL48Go448lQnKgmWaFahWhBE6FF2
 WyBYsYlR3k66vELDiwMrG/D73mSTkRKeQrIfDtoMzbfFxMUG+tSy8WOj0lLSIUySgwRh
 nQEg3WmjzkE3xXRvHc+hZZh14+xlPnsfG87A7bjqwU+YTzznvOMgtIyyNArC/2NIgxiQ
 iUMdtWNzEmEjCdBFvJkym2lLhaQCvFgtv8L48cKKHO8qMFgrwG6ilHNe+M7AGFc90MEZ
 hlag==
X-Gm-Message-State: AOAM531LAlr87e3DT6ciUQ3ZvBPOFMfOAhRn75XkqV0Dp78iDmhoz/PO
 hALmLco2Bp7b0lFo+UCOvT/h2X7tLVpizEW628OU/Q1i
X-Google-Smtp-Source: ABdhPJzcOfr0kEkGnnHuc0Oqz/LzUKcbRNEfEDLWudgveKV3OUDPPbeCgCGraLsK3wZapShpkimn7lL8cZsiCXQ9wSs=
X-Received: by 2002:ac2:5593:: with SMTP id v19mr3613131lfg.43.1594959230410; 
 Thu, 16 Jul 2020 21:13:50 -0700 (PDT)
MIME-Version: 1.0
From: Forest Crossman <cyrozap@gmail.com>
Date: Thu, 16 Jul 2020 23:13:38 -0500
Message-ID: <CAO3ALPy8_pxVyFROZUWNafEH1vUCP6LVpNmBBuMDSewGitzdLw@mail.gmail.com>
Subject: ASMedia USB 3.x host controllers triggering EEH on POWER9
To: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
 linux-usb@vger.kernel.org
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, all,

I have several ASMedia USB 3.x host controllers (ASM2142 and ASM3142,
both share the same Vendor ID/Device ID pair) that I'd like to use
with a POWER9 system (a Raptor Computing Systems Talos II).
Unfortunately, while the kernel recognizes the controllers just fine,
as soon as I plug in a device, an EEH error occurs and the host
controller gets repeatedly reset until it eventually gets disabled. An
example of one of these errors can be seen here:
https://paste.debian.net/hidden/e39698eb

Based on the "PHB4 Diag-data" reported by the kernel, it seems that
LEM_WOF_R bit 35, PHB_FESR bit 20, and RXE_ARB_FESR bit 28 have been
set. According to the PHB4 specification
(https://ibm.ent.box.com/s/jftnfhceul07qjh9jtn91xwjmclabc71), they
respectively mean the following:
 - ARB: IODA TVT Errors - "TCE Validation Table error occurred. The
entry is invalid, or the PCI Address was out of range as defined by
the TTA bounds in the TVE entry."
 - RXE_ARB OR Error Status - "RXE_ARB error bits, ... OR of all error
status bits."
 - IODA TVT Address Range Error - "IODA Error: The PCI Address was out
of range as defined by the TTA bounds in the TVE entry."

In other words, the ASMedia USB controllers seem to be trying to write
to addresses they're not supposed to, and thankfully the PHB4 is
catching these bad writes before they can cause any corruption of my
system's memory. Of course, this has the unfortunate side-effect that
these devices are completely unable to operate with my computer, and
since it seems to be possible to use these controllers on x86 systems
(presumably because of the less-strict/disabled-by-default IOMMU), I
wonder if maybe it would be possible to work around these errors in
either the kernel or the OPAL firmware? My thinking is that instead of
disconnecting the misbehaving devices, maybe the errors could be
"forgiven" (but still blocked) and the device permitted to continue
operating, possibly with some USB data loss from "writes to nowhere"
or retries that may reduce performance. Or maybe if the issue is
caused by some high address bits being set to random values, those
bits could be masked-off so as to not trigger the errors and even
avoid data loss.

So, my question is, is any of this possible? I know the simple
solution for me is to just RMA the cards and avoid purchasing
ASMedia-based USB host controllers in the future, but the fact that
they still seem to work "mostly ok" on x86 systems (with the
occasional kernel panics and BSODs reported by users) piques my
curiosity and makes me wonder if maybe there's a way for me to have my
cheap, buggy hardware cake and eat it, too.

Now, I'm a novice at kernel hacking, so I don't really know what I'm
doing, but just for fun I did try to paper over the issue by adding an
EEH handler to the xhci driver
(https://paste.debian.net/hidden/16081515), but as you might expect,
that didn't do anything but prevent further communication with the
device. I also read a bunch of the PHB4 and IODA2 specs to see if
maybe there'd be a way to implement that bit-masking thing I
mentioned, but both of those documents are, uh, rather dry reading, so
I haven't read them in their entirety, and I don't know enough about
how this all works to try to search the text for what I need.

All that said, if anyone has any suggestions or comments, I'd be
really interested to hear them, even if it's just to question why I'd
go to such ridiculous lengths to try to get software to account for
buggy hardware.


All the best,

Forest
