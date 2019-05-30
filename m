Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB72304AC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2019 00:16:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FMNx3JHYzDqZB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2019 08:16:17 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FMMd4R1SzDqWY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2019 08:15:09 +1000 (AEST)
Received: by mail-ot1-f65.google.com with SMTP id 107so1412449otj.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 15:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=esfrFMZGksDh8a9cO+oFEVkOyToxeVgjGVajp0t5uMA=;
 b=QH7LsV/KJA3Of3TTdV8o0KuPD9wjPiYvu/EHJ7x4fd0dlTo89ncLb9rkJf7UisR2gk
 Xj4y1UIVz4KkyDANlh5RS6jz1KvFNshzDn61G6YM9/hE43sXFn+sxQzBI04ZsEeT8wK5
 /nTETjprXvv+8S91n4sWwza+aDlINbWKlreAfThtkYgQiVWWpaMmlAjeZi8nETSOArWl
 v+sWPM6dAYlIwLSgR2lgoYXoV6leCp7cYm4HRHNg6wMP/qj1nhsApv1BhdNfLMBCQBZl
 lyG3/osLnn4GJm0L5VLQVuKGXZ2v9JkWBOSUeB8uWiX+Z2DTTiktrzpEj7t6zhKvf2i0
 fkaA==
X-Gm-Message-State: APjAAAUKehIJpLMGeQB3FoNOGHJwGEs7bOERzu+I/Ok6U9eu6JtpBX4W
 QaVukILsOcFFG8ba5H7P77wm4WFAihk=
X-Google-Smtp-Source: APXvYqz5NeXhYXIFETWjzi36oVpjMsj7Lps2mNaRkUdIvGxFOiVvk/5y1ukd/19jUe7zyFxc/ikJxw==
X-Received: by 2002:a9d:27e5:: with SMTP id c92mr4666286otb.318.1559254506041; 
 Thu, 30 May 2019 15:15:06 -0700 (PDT)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com.
 [209.85.167.172])
 by smtp.gmail.com with ESMTPSA id l65sm1458938oif.20.2019.05.30.15.15.03
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 15:15:04 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id z65so6198774oia.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 15:15:03 -0700 (PDT)
X-Received: by 2002:aca:ea05:: with SMTP id i5mr3971031oih.51.1559254503293;
 Thu, 30 May 2019 15:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190530141951.6704-1-laurentiu.tudor@nxp.com>
 <20190530.150844.1826796344374758568.davem@davemloft.net>
In-Reply-To: <20190530.150844.1826796344374758568.davem@davemloft.net>
From: Li Yang <leoyang.li@nxp.com>
Date: Thu, 30 May 2019 17:14:51 -0500
X-Gmail-Original-Message-ID: <CADRPPNTn7onrpyicx_ytdaDG4q3v4t494zYetkHrT808RsOByA@mail.gmail.com>
Message-ID: <CADRPPNTn7onrpyicx_ytdaDG4q3v4t494zYetkHrT808RsOByA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Prerequisites for NXP LS104xA SMMU enablement
To: David Miller <davem@davemloft.net>, arm@kernel.org
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
Cc: madalin.bucur@nxp.com, Netdev <netdev@vger.kernel.org>,
 Roy Pledge <roy.pledge@nxp.com>, lkml <linux-kernel@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>, camelia.groza@nxp.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 30, 2019 at 5:09 PM David Miller <davem@davemloft.net> wrote:
>
> From: laurentiu.tudor@nxp.com
> Date: Thu, 30 May 2019 17:19:45 +0300
>
> > Depends on this pull request:
> >
> >  http://lists.infradead.org/pipermail/linux-arm-kernel/2019-May/653554.html
>
> I'm not sure how you want me to handle this.

One suggestion from the arm-soc maintainers is that after this pull
request is merged by arm-soc tree.  You can also merge this pull
request and then apply the patches.

Regards,
Leo
