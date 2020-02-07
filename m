Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA6A1550F7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 04:24:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DLJV5w5rzDqdS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 14:24:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::144;
 helo=mail-il1-x144.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=X8aVsk+2; dkim-atps=neutral
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DLGg4ny5zDqc4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 14:23:05 +1100 (AEDT)
Received: by mail-il1-x144.google.com with SMTP id b15so511765iln.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Feb 2020 19:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=999+ro1o71YjmL31hHjYlyWQofbf4WDiQJUb05dcYmk=;
 b=X8aVsk+2LLQM5aWqCqB4wtLmYJhWTuHsR0nkEhswG03BUXPNETkgBci6SiZBHdqTfG
 /5kkNNq9oQcqq5KC/uZAhg8P88X9Bwtx1dboZgs3FQ1T8wEaRA2PKFdPjWvVDbmhkQqC
 emUlQQFv85qU13dQKxIZaZddPIkWi15ygR4CP+TG7vdMY7+FshtLbG8IOVxTgXJDci7C
 CRjKa6rQMkwhVRfysaOrSeoIgS30WUVM8fhD00lr/BQGlrFxo8sq60XBFCPNjPc+3c3R
 TRldFvuQWup5hBp2vaiverX5MHyHu8r22d4lfUvLubrxJjCR5DbTb35KoGFkAxC6w3n3
 KDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=999+ro1o71YjmL31hHjYlyWQofbf4WDiQJUb05dcYmk=;
 b=g7QluUi+rmTQ00ZJhHyUsm+vCds0InJ0q1ILG7GdTIhKlfvasIYlY3O0NjurTVUWLh
 m+Et5Ryc+Rhfyk4YS1fxVZGG8SBws6g2NrKA/1eZ/GStKAFss5QFuA7yO8FNnti6omOD
 VQuHixa5Zb2awjlff1QdbafkdspZfRNoBTyodBkSJdeLSLQ09sr6AHoqYALprVHshnfY
 ChVCeSZSurOI0Obno+ofPSNnWMC3yYjhSgNT0/MdqkPTCnu/4eqExU79OU2QPtXC7H8H
 wjCPOdPMdW7Li/KLLfy5v0XpWrTpnFXwAqM0xQ8ZQVlWvLAh4xSoOqzTxCxr4rckNS3V
 fLIA==
X-Gm-Message-State: APjAAAWrHdU/tR9CUAa0anyoDmnoZuVZZNZGNodr4xDmmBLPbCR7yJoR
 O/UHaAm4oOt9gt8YmzS1PDrxGzSnxOOprIL360DPFw==
X-Google-Smtp-Source: APXvYqy/V3SG+xXFCWsfcdxja+eeYWt4fX8Z7rQ1VoFNlplzeIJETZ6f9thOx+Z5rTDidoBGmRDjm95wnE+plkvkGCQ=
X-Received: by 2002:a92:4e:: with SMTP id 75mr7075819ila.276.1581045780075;
 Thu, 06 Feb 2020 19:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20200203083521.16549-1-oohall@gmail.com>
 <20200203083521.16549-2-oohall@gmail.com>
 <20200206041311.GD15629@osmium>
In-Reply-To: <20200206041311.GD15629@osmium>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 7 Feb 2020 14:22:49 +1100
Message-ID: <CAOSf1CGuNvj7voW+sh_Y+d-PLf5DVy1qngXzCGuPvtbDPERcKA@mail.gmail.com>
Subject: Re: [PATCH 1/6] powerpc/eeh: Add sysfs files in late probe
To: Sam Bobroff <sbobroff@linux.ibm.com>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 6, 2020 at 3:13 PM Sam Bobroff <sbobroff@linux.ibm.com> wrote:
>
> On Mon, Feb 03, 2020 at 07:35:16PM +1100, Oliver O'Halloran wrote:
> > Move creating the EEH specific sysfs files into eeh_add_device_late()
> > rather than being open-coded all over the place. Calling the function is
> > generally done immediately after calling eeh_add_device_late() anyway. The
> > two cases where it's not done there (OF based PCI probing and the pseries
> > VFs) don't seem to have any issues with the re-ordering.
>
> I haven't tested it explicitly, but I suspect the re-ordering will
> actually improve things: in some error cases it will no longer add sysfs
> files for devices that have failed to init, because bailing out in
> eeh_add_device_late() (or eeh_probve_device()) will now prevent
> eeh_sysfs_add_device() from being called.
>
> Nice cleanup.
>
> Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>

Ah, good point. I'll update the commit message.
