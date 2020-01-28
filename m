Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F4214B82D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 15:23:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486TPH6nmPzDqHb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 01:23:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=YR/KY9hS; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486TDx2gCmzDq8v
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 01:16:16 +1100 (AEDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 954A02469C
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 14:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580220974;
 bh=3UIW/IHLdI4xz17lXPE846OTxnzJs5ZmVN6cdtT6nmk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YR/KY9hSgSdZkhrhtUt/PueSWeaB97EHt3KMOoY15fChoo/pJUdJgwLa+NI1CFKdc
 ujorkuvevVDOdgyKh8i5A2+Onyn7dNcYo4pCBM5ZbN5d4x0xr8EsmjjuoKrnchMZL7
 DicT0uOQdmp8SpqBoXfsbOyGpaK06bJIqjHNd+bY=
Received: by mail-qk1-f172.google.com with SMTP id j20so13418815qka.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 06:16:14 -0800 (PST)
X-Gm-Message-State: APjAAAX6wwLQkzKTGBTpE7n8lo5y0K1lgemqxpqQnRL+B7ibafdNou60
 WiX2agRcpCQFITEF3DViw3koPYWPqBkRsRKUGg==
X-Google-Smtp-Source: APXvYqzbCxAM39CpEUYUcKxEjgH8P95qQfbv+KN0KyJyqCnsEckJr2k9Kwcpqh/oHoYBbaCcEjSNRLRSBkJznfqv+L8=
X-Received: by 2002:a05:620a:9c7:: with SMTP id
 y7mr22183123qky.393.1580220973686; 
 Tue, 28 Jan 2020 06:16:13 -0800 (PST)
MIME-Version: 1.0
References: <20200108093903.57620-1-hdegoede@redhat.com>
 <20200108093903.57620-2-hdegoede@redhat.com>
 <61bc9265-ece0-eeb6-d4a1-4631138ecf29@intel.com>
 <8d67882d-04a8-0607-be4e-c1430b7fda21@redhat.com>
 <84a32714-ba08-74a0-0c76-3c36db44dd68@intel.com>
 <93446e09-5f12-800a-62fa-bf3ecea7273d@redhat.com>
 <399ac7d5-2518-799a-595e-f6b6878cf4ab@intel.com>
 <a9ab8946-c599-5f83-7527-2387a9e82e8a@xenosoft.de>
 <CAPDyKFoydOuSE=Eaq168=2_Ycouo7hzyw+RZXhGq7q4D4Qe8TQ@mail.gmail.com>
 <8736c5hyhr.fsf@mpe.ellerman.id.au>
 <688f1943-5b81-6200-d4d9-38d21b69e180@xenosoft.de>
In-Reply-To: <688f1943-5b81-6200-d4d9-38d21b69e180@xenosoft.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 28 Jan 2020 08:16:02 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+r9a0BhvO4-VK59+Fh=9Ean=JgKwwxS+bqVz7=OWD5_w@mail.gmail.com>
Message-ID: <CAL_Jsq+r9a0BhvO4-VK59+Fh=9Ean=JgKwwxS+bqVz7=OWD5_w@mail.gmail.com>
Subject: Re: [PASEMI PA6T PPC] Onboard CF card device with new SanDisk High
 (>8G) CF cards
To: Christian Zigotzky <chzigotzky@xenosoft.de>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Julian Margetson <runaway@candw.ms>, Christoph Hellwig <hch@infradead.org>,
 "contact@a-eon.com" <contact@a-eon.com>, mad skateman <madskateman@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 28, 2020 at 2:01 AM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
>
> Hi All,
>
> Which mailing list is responsible for the pata_pcmcia driver? We are
> using new SanDisk High (>8G) CF cards with this driver [1] and we need
> the following line in the file "drivers/ata/pata_pcmcia.c".
>
> +    PCMCIA_DEVICE_MANF_CARD(0x00f1, 0x0101),        /* SanDisk High
> (>8G) CFA */

Run get_maintainers.pl and it will answer that for you:

$ scripts/get_maintainer.pl -f drivers/ata/pata_pcmcia.c
Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
(maintainer:LIBATA PATA DRIVERS)
Jens Axboe <axboe@kernel.dk> (maintainer:LIBATA PATA DRIVERS)
linux-ide@vger.kernel.org (open list:LIBATA PATA DRIVERS)
linux-kernel@vger.kernel.org (open list)
