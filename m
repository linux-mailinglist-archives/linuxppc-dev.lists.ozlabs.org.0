Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E9519A84B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 11:09:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sgNv1X3zzDr3r
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 20:09:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=IfBVo0qt; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sfyZ1JmhzDqxf
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 19:49:42 +1100 (AEDT)
Received: by mail-ed1-x544.google.com with SMTP id w26so28681128edu.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 01:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A7+9v32j9cPB3QX5vXPFoTYuOQMb+jFtKmzdafzKlXc=;
 b=IfBVo0qtkzx0IwrTLjMKGmOczvAfIcGCXFrucXhdytTeaMv3LlGABrbnLscvf6EhPu
 ZipNSAsdlrGbSXI2CqQreu8FxLOGRWD8tJDVQkXpETIdmXHwd+Xv1jp44fy/mtTN32kt
 fVa09PGK306kWlrf3zKeHF07SGJb0bHLqW0CIkn37zcb7BIrEg+bNikwEXJacTI+GagZ
 hpxLEcN73/j3YUhCKXBElj08nNWzPs0hV3h929pXH5yevZyR1Cqzb0EOT5jcy3jgbKE7
 d2Ahuxp5GjmVR/tbuNADZWn5ZmlTpD668O9WqG3hIA5ukj8ZWJtmtna2sM5J2LzKH6Sn
 jAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A7+9v32j9cPB3QX5vXPFoTYuOQMb+jFtKmzdafzKlXc=;
 b=ojiNWBu6QIYvi2iwRWQ5LIUfGu9QfPc/kHgUcwNbtfEH/hqqg/yMpj9djsCoG+PyHq
 T4Dv7OL35m0tPdc51KYyiXWMBaBbwFytK4kJqEbjykL2VG2m/BmALdiMy2925zmhl1qX
 NIBDFAmColDII9g0zCmGGBNyOceliZXERJnJRoy/4W2f5koAd2FOjvUq92YTcRP4EAW9
 c0lfhSuG0oWr8TwGw4IBPII2aFlUaVI3A7rPIcy03N80myB6P6a6WNqSGD4cy4rlwjxZ
 /7Z4w7TrpkI26+sLt04H3GoWZZMcB3ylj55G1WumKy/0mkNAQeuatkv9Y8Q08qnKjGNY
 VuQA==
X-Gm-Message-State: ANhLgQ2wjlmnVs9jpQ278WunjgPxfTK+0ESAhg3N6uA8PAiv8PVwSkvC
 gQQdDRkmHnOl8UmYom7NDSRzLlx6nu/ByjPGDlFLCg==
X-Google-Smtp-Source: ADFU+vvi5v9sHbdO0IWcuuBEvZqkCqjH7pX1tPN0HKLi97q9NYRu1C93IYlcqCprR6w1SOFMCMFSMzwhs34udzF7ni0=
X-Received: by 2002:a17:906:1e42:: with SMTP id
 i2mr18635550ejj.317.1585730979486; 
 Wed, 01 Apr 2020 01:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200327071202.2159885-1-alastair@d-silva.org>
 <20200327071202.2159885-9-alastair@d-silva.org>
In-Reply-To: <20200327071202.2159885-9-alastair@d-silva.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 1 Apr 2020 01:49:28 -0700
Message-ID: <CAPcyv4j4_owxEVjanwH5TiuMMJB3CaMannDzpXnaHedX7LuarQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/25] ocxl: Emit a log message showing how much LPC
 memory was detected
To: "Alastair D'Silva" <alastair@d-silva.org>
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Rob Herring <robh@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 Linux MM <linux-mm@kvack.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 29, 2020 at 10:23 PM Alastair D'Silva <alastair@d-silva.org> wrote:
>
> This patch emits a message showing how much LPC memory & special purpose
> memory was detected on an OCXL device.
>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>
> Acked-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
>  drivers/misc/ocxl/config.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/misc/ocxl/config.c b/drivers/misc/ocxl/config.c
> index a62e3d7db2bf..69cca341d446 100644
> --- a/drivers/misc/ocxl/config.c
> +++ b/drivers/misc/ocxl/config.c
> @@ -568,6 +568,10 @@ static int read_afu_lpc_memory_info(struct pci_dev *dev,
>                 afu->special_purpose_mem_size =
>                         total_mem_size - lpc_mem_size;
>         }
> +
> +       dev_info(&dev->dev, "Probed LPC memory of %#llx bytes and special purpose memory of %#llx bytes\n",
> +                afu->lpc_mem_size, afu->special_purpose_mem_size);

A patch for a single log message is too fine grained for my taste,
let's squash this into another patch in the series.

> +
>         return 0;
>  }
>
> --
> 2.24.1
>
