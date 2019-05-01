Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AEF10CF9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 21:00:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vSQr5KWPzDqPf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 05:00:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vSPR5H1DzDqMV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 04:59:34 +1000 (AEST)
Received: by mail-ot1-f68.google.com with SMTP id o39so4300134ota.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 May 2019 11:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z+2ax8ZyIZztFylyBB7zkL9d45BwY6plRBtZFuq3Y0w=;
 b=R9SiHiD9VAR4TEKOsoRdB/eYnEXokYjKP7lT/5Ba48tShvssuvUuUkoHZM2JGgD3tm
 2b0BZxNK8C2RANc0mTNcdqSImZKcc3v6kNPZzowSQnd77+wjO+7UKi8e6EW+gwSfh2t1
 85nvXjrvBB4Ti3EH5SdZoGmV0Sa7Z1Bn1zzidilb3Ansk0ufKgN65CKLyeRdqmNlFh+L
 N8SaLg/eWEMJQ8jzb5svgq6QLZ4oLGQaB3WFdp67JfqxMsZv7arY8tkAEGZLjrOyv1dz
 Z6Bz44I8SuLIX47MAgHLx8DU0LWT6pjkVL2yYRlKV6pRZMLiGK3MhPXgvn6ltBJRltY7
 /NSQ==
X-Gm-Message-State: APjAAAVdm9W2Jwm67ZZcuD2ebqM+O2PvzmhIh3o55f+IrRLpMI5FmBOG
 je7jiM2FiSQcR1hNGko3c3bBEMfQzYI=
X-Google-Smtp-Source: APXvYqyph7KDAYQX8dnUbK8TQhcpiIYS0DxISsTmn+SSCXbRHGeM5/b22ynAjKwfCORbBLfIkBZbMQ==
X-Received: by 2002:a05:6830:153:: with SMTP id
 j19mr8804362otp.248.1556737171123; 
 Wed, 01 May 2019 11:59:31 -0700 (PDT)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com.
 [209.85.167.169])
 by smtp.gmail.com with ESMTPSA id o203sm16789078oia.20.2019.05.01.11.59.30
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 May 2019 11:59:30 -0700 (PDT)
Received: by mail-oi1-f169.google.com with SMTP id 143so1391476oii.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 May 2019 11:59:30 -0700 (PDT)
X-Received: by 2002:aca:d984:: with SMTP id q126mr7776664oig.108.1556737169867; 
 Wed, 01 May 2019 11:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <1554475256-4805-1-git-send-email-roy.pledge@nxp.com>
In-Reply-To: <1554475256-4805-1-git-send-email-roy.pledge@nxp.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Wed, 1 May 2019 13:59:18 -0500
X-Gmail-Original-Message-ID: <CADRPPNSLGYDGnhVfJAYk66=bP2oZVtJiynwwgLiKiAKeSseR7w@mail.gmail.com>
Message-ID: <CADRPPNSLGYDGnhVfJAYk66=bP2oZVtJiynwwgLiKiAKeSseR7w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] soc: fsl: dpio: Add support for memory backed
 QBMan portals
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stuyoder@gmail.com" <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 5, 2019 at 9:42 AM Roy Pledge <roy.pledge@nxp.com> wrote:
>
> This patch series adds support for QBMan memory backed portals which is
> avaialble in devices containing QBMan verion 5.0 and above (for example
> NXP's LX2160A SoC).
>
> Memory backed portals can be mapped as normal cacheable/shareable memory
> which allows the portals to migrate between cores without needing manual
> cache manipulations by the CPU.
>
> The patches add support for the new portal attributes in the fsl-mc bus
> drivers as well as modifying the QBMan driver to use the new portal read
> trigger mechanism.
>
> Changes since v1:
>  * Support older DPRC command in case of older MC firmware
>  * Fix issue with padding in command
>
>
> Roy Pledge (2):
>   bus: mc-bus: Add support for mapping shareable portals
>   soc: fsl: dpio: Add support for memory backed QBMan portals

Both applied for next.  Thanks.

>
>  drivers/bus/fsl-mc/dprc.c           |  30 +++++++-
>  drivers/bus/fsl-mc/fsl-mc-bus.c     |  15 +++-
>  drivers/bus/fsl-mc/fsl-mc-private.h |  17 ++++-
>  drivers/soc/fsl/dpio/dpio-driver.c  |  23 ++++--
>  drivers/soc/fsl/dpio/qbman-portal.c | 148 ++++++++++++++++++++++++++++++------
>  drivers/soc/fsl/dpio/qbman-portal.h |   5 ++
>  6 files changed, 199 insertions(+), 39 deletions(-)
>
> --
> 2.7.4
>
