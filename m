Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1129B8F79E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 01:33:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468jSd6tdMzDrB2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 09:33:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468jQp1FhvzDqtR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 09:32:00 +1000 (AEST)
Received: by mail-ot1-f65.google.com with SMTP id c7so8112410otp.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 16:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3W/JXRczT4e7iKML5rUyQ8eYma8iSWGGWO86RntEySo=;
 b=ssih72cCAclgB5AVSo/+IkLg/f7L462IHzZQUs7PrMcTUzuLXVR/0n7gSqc5Mfy4fw
 sB75RbzirdS+UhGcek0Y+oNeDEnpRAOTUamq7d8iYq7VO2/o7YGHypwwI1xe/IOrT8uk
 csueK6RbcaQtGMY42gVo610SwM7lzgd2zCmqYjQ9qY7kwZBMSpn/ebnwW2iPWRg0y3XS
 xZxei+DVXtfXQqZzR3QxzcxRa+aDNDwJ7U3H9csXTKi1ZSK+rsBRADxqs9UyBuvQcKvN
 StyO+zfEtHuZayAXKvENLcLBn3BLabgmB9a4smB8owWvHEeSHZEu4JHQmbljmj18XcKJ
 FrBA==
X-Gm-Message-State: APjAAAXx+Qz691QmSRXOm8b1TuCXEuy7Kt7R+c6amRje8uy7mG7xs8VY
 7xMZInCetUVXR/M1ogqQ2N00AlsFsC0=
X-Google-Smtp-Source: APXvYqw8xRFoDg/HLHTjxQZtPSVTtH+t1Lo0yUphYV5Gc6yQzCrWXdP86i31A62MhSNUOHNYRnk9mQ==
X-Received: by 2002:a9d:69d7:: with SMTP id v23mr5607291oto.321.1565911918183; 
 Thu, 15 Aug 2019 16:31:58 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com.
 [209.85.210.49])
 by smtp.gmail.com with ESMTPSA id j6sm1432625otq.16.2019.08.15.16.31.57
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2019 16:31:57 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id k18so8078526otr.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 16:31:57 -0700 (PDT)
X-Received: by 2002:a9d:6b84:: with SMTP id b4mr5482166otq.63.1565911917418;
 Thu, 15 Aug 2019 16:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <1564690599-29713-1-git-send-email-roy.pledge@nxp.com>
In-Reply-To: <1564690599-29713-1-git-send-email-roy.pledge@nxp.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Thu, 15 Aug 2019 18:31:46 -0500
X-Gmail-Original-Message-ID: <CADRPPNQ_3muAr_tVYOThhtPmGXk2gh4qMhhZK402HiHh4fO-Fw@mail.gmail.com>
Message-ID: <CADRPPNQ_3muAr_tVYOThhtPmGXk2gh4qMhhZK402HiHh4fO-Fw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] soc/fsl/qbman: Enable Kexec for DPAA1 devices
To: Roy Pledge <roy.pledge@nxp.com>
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
Cc: Madalin-cristian Bucur <madalin.bucur@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 1, 2019 at 3:20 PM Roy Pledge <roy.pledge@nxp.com> wrote:
>
> Most DPAA1 devices do not support a soft reset which is an issue if
> Kexec starts a new kernel. This patch series allows Kexec to function
> by detecting that the QBMan device was previously initialized.
>
> The patches fix some issues with device cleanup as well as ensuring
> that the location of the QBMan private memories has not changed
> after the execution of the Kexec.
>
> Changes since v1:
>         - Removed a bug fix and sent it separately to ease backporting
> Changes since v2:
>         - Expliciitly flush FQD memory from cache on PPC before unmapping
>
> Roy Pledge (7):
>   soc/fsl/qbman: Rework QBMan private memory setup
>   soc/fsl/qbman: Cleanup buffer pools if BMan was initialized prior to
>     bootup
>   soc/fsl/qbman: Cleanup QMan queues if device was already initialized
>   soc/fsl/qbman: Fix drain_mr_fqni()
>   soc/fsl/qbman: Disable interrupts during portal recovery
>   soc/fsl/qbman: Fixup qman_shutdown_fq()
>   soc/fsl/qbman: Update device tree with reserved memory

Series applied for next.  Thanks!

>
>  drivers/soc/fsl/qbman/bman.c        | 17 ++++----
>  drivers/soc/fsl/qbman/bman_ccsr.c   | 36 +++++++++++++++-
>  drivers/soc/fsl/qbman/bman_portal.c | 18 +++++++-
>  drivers/soc/fsl/qbman/bman_priv.h   |  5 +++
>  drivers/soc/fsl/qbman/dpaa_sys.c    | 63 ++++++++++++++++------------
>  drivers/soc/fsl/qbman/qman.c        | 83 +++++++++++++++++++++++++++++--------
>  drivers/soc/fsl/qbman/qman_ccsr.c   | 68 +++++++++++++++++++++++++++---
>  drivers/soc/fsl/qbman/qman_portal.c | 18 +++++++-
>  drivers/soc/fsl/qbman/qman_priv.h   |  8 ++++
>  9 files changed, 255 insertions(+), 61 deletions(-)
>
> --
> 2.7.4
>
