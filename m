Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AABB531491C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 07:52:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZYVQ2SsdzDscr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 17:52:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::130;
 helo=mail-il1-x130.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=I8sAs6ST; dkim-atps=neutral
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZY5x1vCJzDshb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 17:34:42 +1100 (AEDT)
Received: by mail-il1-x130.google.com with SMTP id e1so15185120ilu.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 22:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1yfWtyKyTZvhHLdRd0Os+HgXY0IXloCRl6/1X6y49yY=;
 b=I8sAs6STSD3viziWc9zjdGpRV2Ij0huuBcH4DTqpEpqza+Sa89+jcmi0lEr6QyU3Yc
 L7rP/rH0/RfRBI83gH4R47SJOVgSrDffjCf/VWsaIa4tSZ3K01/puYHwXeA+73O+NMbj
 Mayn3mIGAEUCdMMblgZt8JrLoIUQfDCTzzdMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1yfWtyKyTZvhHLdRd0Os+HgXY0IXloCRl6/1X6y49yY=;
 b=HkB6xI/QIvGOXoNfS5pcxzpPPjIGzh55zDtAfIACRvIg3p97sT65mwnxvb/S6oAtlD
 p0VqFAKS4nniNxd1g4W02lw9oF39xi57nGOgdPMevVmXmJ5hP0g6D5DVhOljgfFqgfcr
 N3e4CALQXRR0iI/foFhBjlWLgEscAZuhcC1PNidiBlYJeCmYeSahOVfqgCBqC3Me6kzD
 VZ0lYKLvOo6FXLlHM4vi33L0xJcDUqW78zbvtBJ1kUiYy/6VY1+M2GYMxl3kAv3jEExF
 eO8rCZ3f3+qY7LoJUvgVAESr7eXe6APOrlrE142ZdA/ZbbPhkUSETUsnnPV1ijqRXYe2
 36FA==
X-Gm-Message-State: AOAM532jF8sZFlMlehrwLFJeLO5wijy98Q+MrzVnF7QAof3AERHFR8K7
 g6WFLcNLR4V5mmo9lANz2HJj2lqOHDE0kA==
X-Google-Smtp-Source: ABdhPJz5UqCnP5TpScdQtbLZlGi0JH+bslCLNHA9xqAne3vZnrVyqdI4rOLMAHzVtstOg0uli7QBOg==
X-Received: by 2002:a05:6e02:12e3:: with SMTP id
 l3mr19004637iln.24.1612852475738; 
 Mon, 08 Feb 2021 22:34:35 -0800 (PST)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com.
 [209.85.166.175])
 by smtp.gmail.com with ESMTPSA id l14sm9764756ilh.58.2021.02.08.22.34.35
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 22:34:35 -0800 (PST)
Received: by mail-il1-f175.google.com with SMTP id y15so15127933ilj.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 22:34:35 -0800 (PST)
X-Received: by 2002:a6b:144c:: with SMTP id 73mr18274991iou.69.1612852048986; 
 Mon, 08 Feb 2021 22:27:28 -0800 (PST)
MIME-Version: 1.0
References: <20210106034124.30560-1-tientzu@chromium.org>
 <d7043239-12cf-3636-4726-2e3b90917dc6@gmail.com>
 <CALiNf28sU1VtGB7LeTXExkMwQiCeg8N5arqyEjw0CPZP72R4dg@mail.gmail.com>
 <78871151-947d-b085-db03-0d0bd0b55632@gmail.com>
 <CALiNf29_PmLJTVLksSHp3NFAaL52idqehSMOtatJ=jaM2Muq1g@mail.gmail.com>
 <23a09b9a-70fc-a7a8-f3ea-b0bfa60507f0@gmail.com>
 <CAAFQd5DX=AdaYSYQbxgnrYYojkM5q7EE_Qs-BYPOiNjcQWbN1A@mail.gmail.com>
 <c7f7941d-b8bd-f0f3-4e40-b899a77188bf@gmail.com>
 <CAAFQd5AGm4U8hD4jHmw10S7MRS1-ZUSq7eGgoUifMMyfZgP2NA@mail.gmail.com>
 <7fe99ad2-79a7-9c8b-65ce-ce8353e9d9bf@gmail.com>
In-Reply-To: <7fe99ad2-79a7-9c8b-65ce-ce8353e9d9bf@gmail.com>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 9 Feb 2021 14:27:18 +0800
X-Gmail-Original-Message-ID: <CALiNf2_rRufFoxNN=i0_LkVvw31tXetKasm3SrzYy7O8o-sfgg@mail.gmail.com>
Message-ID: <CALiNf2_rRufFoxNN=i0_LkVvw31tXetKasm3SrzYy7O8o-sfgg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/6] Restricted DMA
To: Florian Fainelli <f.fainelli@gmail.com>
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
Cc: heikki.krogerus@linux.intel.com, peterz@infradead.org, grant.likely@arm.com,
 paulus@samba.org, Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
 linux-devicetree <devicetree@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

v4 here: https://lore.kernel.org/patchwork/cover/1378113/
