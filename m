Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F351F45B986
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 12:58:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hzff65lWQz2yg3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 22:58:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=c4j1793E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzfdN4DP2z2xtR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 22:57:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=c4j1793E; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4HzfdN3w2vz4xbs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 22:57:28 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4HzfdN3sP5z4xbw; Wed, 24 Nov 2021 22:57:28 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=c4j1793E; dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4HzfdN2kjzz4xbs
 for <linuxppc-dev@ozlabs.org>; Wed, 24 Nov 2021 22:57:28 +1100 (AEDT)
Received: by mail-qt1-x831.google.com with SMTP id 8so2324954qtx.5
 for <linuxppc-dev@ozlabs.org>; Wed, 24 Nov 2021 03:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lkhutH8VfCRJmlFl7RfIAOtkFa+T1ELPehCcVKFyuSw=;
 b=c4j1793EKQUKSvigXaQcr6OS//VJr7XRE0+rQ47LCEU47Qb5a4YrvY5Cugt5xkpVEr
 mJ4o/86tDTY0NQ94MUWKljmp8ndHq+eUfcGXaGTkTihbsYLTLy9mBx4pKtX92Rv2ub3I
 BkiJXKxfKdQBG36s893a06x/YHydlrMsFgjpxO4nITjmLzWckx06AGtYnsfrFizq3Gr4
 irvTRAR5sWx9n5hILNMhG8K8gorfD8ozI3zntWhLCzAg4A/4eQvP+ie8tRFtocTpqRJC
 VpbKLiKqrvTmDeCArP+ntT+QJw03vMtu/8g73xyKZllj3qzUMsxZqu9YKCYXqzXBj/N3
 oOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lkhutH8VfCRJmlFl7RfIAOtkFa+T1ELPehCcVKFyuSw=;
 b=LhaDib9dc/VzbH7s7yVzgg6QVPNjSue4Fs6VXjyOT6jYjWJ0vCVUGLNc2QMMUHsZZ9
 XHbUMprs04Muj1bCulgcUVuUKqucoCeAliuqrdo5GqZ3H3cJ+K01soVAwHWQmHImkLqv
 4sgz3zGIOq0MfkzZTzq1twPtg97i9dL3xEvyccsUmYFcdG3HSCPULDL6pphlwMbrUR8e
 R5aAic5x4AXBYlVaob5nkTE+qIcN+dIqFAuuNjSgAE8s5I7WMXpM8VBIzujRPvpRDm8Q
 z0WEBUjN4NaSiXYnDT8XT2Tcunyf8cZ+M2WCaLy3mCMW6YK4fLwVwYbMnLd8ZyfzvggT
 yJBg==
X-Gm-Message-State: AOAM530CCEpzwbVmzXMblN+kzQ5yUvFxVbwLe3CFjU1T65pZCD7JvsnX
 BnOJszuy1wkRelUYBG6/jH7HZcwiYHay7ngY16A=
X-Google-Smtp-Source: ABdhPJzCQ5Faijz5fKoh/E5m8suS1Wv7bjQREAUQf3cK8wx9fWyo2lhA4l4EZpZMEbfAKH2rezGfT8sCMe0FEfND4j0=
X-Received: by 2002:ac8:5f4a:: with SMTP id y10mr6535280qta.139.1637755045029; 
 Wed, 24 Nov 2021 03:57:25 -0800 (PST)
MIME-Version: 1.0
References: <163767273634.1368569.7327743414665595326.stgit@jupiter>
 <875ysiqxbd.fsf@mpe.ellerman.id.au>
 <20211124084539.issrrg2lxq3mp6mj@in.ibm.com>
In-Reply-To: <20211124084539.issrrg2lxq3mp6mj@in.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 24 Nov 2021 22:57:13 +1100
Message-ID: <CAOSf1CEv2kwRqctuwn1xkKTH_FmBLGx_FJefhs7FsTOSc72fdQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc/eeh: Delay slot presence check once driver is
 notified about the pci error.
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 24, 2021 at 7:45 PM Mahesh J Salgaonkar
<mahesh@linux.ibm.com> wrote:
>
> No it doesn't. We will still do a presence check before the recovery
> process starts. This patch moves the check after notifying the driver to
> stop active I/O operations. If a presence check finds the device isn't
> present, we will skip the EEH recovery. However, on a surprise hotplug,
> the user will see the EEH messages on the console before it finds there
> is nothing to recover.

Suppressing the spurious EEH messages was part of why I added that
check in the first place. If you want to defer the presence check
until later you should move the stack trace printing, etc to after
we've confirmed there are still devices present. Considering the
motivation for this patch is to avoid spurious warnings from the
driver I don't think printing spurious EEH messages is much of an
improvement.

The other option would be returning an error from the pseries hotplug
driver. IIRC that's what pnv_php / OPAL does if the PHB is fenced and
we can't check the slot presence state.
