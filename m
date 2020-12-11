Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F852D7C51
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 18:08:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Csy0f5rgszDqsX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Dec 2020 04:08:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::442;
 helo=mail-wr1-x442.google.com; envelope-from=daniel.thompson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KKDKtv9T; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsxyF0QcrzDqrN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Dec 2020 04:06:09 +1100 (AEDT)
Received: by mail-wr1-x442.google.com with SMTP id r14so9763412wrn.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 09:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q0kRT9Y/VRKtCl21czUvzutK8NrVOINaPhwQCeEQl8Q=;
 b=KKDKtv9T4wVQJLmhyVWyJ9efMZ7CJ1aUECqZHyeIsCfK++CuhnFvKh59a0VV8AdpfA
 jUzQubJKR2J5tq3+aXGmaCDu0JCSny3fe0QLJlDBIvoiT8+9pgqDd6w6DwZsqgTbFfRn
 xbkrBUzK5VPTDjoVqIHZwnk+0lm9VVcoHd/3WUlslMnskVpNq0W2ElmSA7FlvEJ2Mant
 wCkcF0gULaJhbYEsn7wy8gLof4hYYlL8G4VUlFpvySXG9n+fNK+Bx0vGqcU45jTkqcMj
 N/SlzN/mrD5K8hWr5O6AT5VenBGyHGOd1+F8KTOLI83WuaBGuMUX7bYChXS5Yj+9AcYn
 G+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q0kRT9Y/VRKtCl21czUvzutK8NrVOINaPhwQCeEQl8Q=;
 b=r33FDTTdUpOX/YUsuEo5PA6rUuUx0nj9cTuLEKv1ond+aKCXwdpa/B3z1tMW66S9lU
 MqIjK/HfVu+83xN7kGaPURCoj1ufTYLEQanbAQSTneKhosnEhltvylZWS3yc2biYb7UJ
 gVMIgJQcJU/CoByzv5EgaPoHCq73/6Ve1/mzNS5Kegv5A4iVZZbCYh3F+EVJ8mT4k+MK
 RgOL3/5Mh0HuIhtJHtc4NVXLTCJ6I8mh6XWWI695wnhJi5NxZ1HZcEzwz04yWfAjPPxA
 gPj9ro2FVAzQNAVpMU6SOQCXCtnMP8POSXjBdFHCkMRaDKTazqfcY8mJOL28YU1Ox8Zv
 4Jag==
X-Gm-Message-State: AOAM53262/OjfwkXKrSDS9CtuNuU+YfCUl0q7Nfk3UuW4WEfxD2imz+5
 tbo9wJoqFWM9MS0l6/FoUwPLlA==
X-Google-Smtp-Source: ABdhPJzQNI4hmPzAuQB/ioaujFWQ5mJDHpVNwXekyexc/tGTv6g4qUK/XB00sT2peYlJ4nli9zYsug==
X-Received: by 2002:adf:f344:: with SMTP id e4mr13878740wrp.25.1607706361860; 
 Fri, 11 Dec 2020 09:06:01 -0800 (PST)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id n3sm16433080wrw.61.2020.12.11.09.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 09:06:00 -0800 (PST)
Date: Fri, 11 Dec 2020 17:05:58 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [RFC HACK PATCH] PCI: dwc: layerscape: Hack around enumeration
 problems with Honeycomb LX2K
Message-ID: <20201211170558.clfazgoetmery6u3@holly.lan>
References: <20201211121507.28166-1-daniel.thompson@linaro.org>
 <CAL_JsqKQxFvkFtph1BZD2LKdZjboxhMTWkZe_AWS-vMD9y0pMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqKQxFvkFtph1BZD2LKdZjboxhMTWkZe_AWS-vMD9y0pMw@mail.gmail.com>
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
Cc: Roy Zang <roy.zang@nxp.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Linaro Patches <patches@linaro.org>, PCI <linux-pci@vger.kernel.org>,
 Jon Nettleton <jon@solid-run.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Minghuan Lian <minghuan.Lian@nxp.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 11, 2020 at 08:37:40AM -0600, Rob Herring wrote:
> On Fri, Dec 11, 2020 at 6:15 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > I have been chasing down a problem enumerating an NVMe drive on a
> > Honeycomb LX2K (NXP LX2160A). Specifically the drive can only enumerate
> > successfully if the we are emitting lots of console messages via a UART.
> > If the system is booted with `quiet` set then enumeration fails.
> 
> We really need to get away from work-arounds for device X on host Y. I
> suspect they are not limited to that combination only...

No objection on that. This patch was essentially sharing the result of
an investigation where I got stuck at the "now fix it properly" stage!


> How exactly does it fail to enumerate? There's a (racy) linkup check
> on config accesses, is it reporting link down and skipping config
> accesses?

In dmesg terms it looked like this:

--- nvme_borked_gpu_working.linted.dmesg	2020-11-18 15:28:35.544118213 +0000
+++ nvme_working_gpu_working.linted.dmesg	2020-11-18 15:28:56.180076946 +0000
@@ -241,11 +241,19 @@
 pci 0000:00:00.0: reg 0x38: [mem 0x9048000000-0x9048ffffff pref]
 pci 0000:00:00.0: supports D1 D2
 pci 0000:00:00.0: PME# supported from D0 D1 D2 D3hot
+pci 0000:01:00.0: [15b7:5009] type 00 class 0x010802
+pci 0000:01:00.0: reg 0x10: [mem 0x9049000000-0x9049003fff 64bit]
+pci 0000:01:00.0: reg 0x20: [mem 0x9049004000-0x90490040ff 64bit]
 pci 0000:00:00.0: BAR 1: assigned [mem 0x9040000000-0x9043ffffff]
 pci 0000:00:00.0: BAR 0: assigned [mem 0x9044000000-0x9044ffffff]
 pci 0000:00:00.0: BAR 6: assigned [mem 0x9045000000-0x9045ffffff pref]
+pci 0000:00:00.0: BAR 14: assigned [mem 0x9046000000-0x90460fffff]
+pci 0000:01:00.0: BAR 0: assigned [mem 0x9046000000-0x9046003fff 64bit]
+pci 0000:01:00.0: BAR 4: assigned [mem 0x9046004000-0x90460040ff 64bit]
 pci 0000:00:00.0: PCI bridge to [bus 01-ff]
+pci 0000:00:00.0:   bridge window [mem 0x9046000000-0x90460fffff]
 pci 0000:00:00.0: Max Payload Size set to  256/ 256 (was  128), Max Read Rq  256
+pci 0000:01:00.0: Max Payload Size set to  256/ 512 (was  128), Max Read Rq  256
 layerscape-pcie 3800000.pcie: host bridge /soc/pcie@3800000 ranges:
 layerscape-pcie 3800000.pcie:      MEM 0xa040000000..0xa07fffffff -> 0x0040000000
 layerscape-pcie 3800000.pcie: PCI host bridge to bus 0001:00

... and be aware that the last three lines here are another PCIe
controller coming up just fine and it is about to detect the GPU
(which like the NVMe is also gen3) just fine whether or not we
add a short delay.


> > I guessed this would be due to the timing impact of printk-to-UART and
> > tried to find out where a delay could be added to provoke a successful
> > enumeration.
> >
> > This patch contains the results. The delay length (1ms) was selected by
> > binary searching downwards until the delay was not effective for these
> > devices (Honeycomb LX2K and a Western Digital WD Blue SN550).
> >
> > I have also included the workaround twice (conditionally compiled). The
> > first change is the *latest* possible code path that we can deploy a
> > delay whilst the second is the earliest place I could find.
> >
> > The summary is that the critical window were we are currently relying on
> > a call to the console UART code can "mend" the driver runs from calling
> > dw_pcie_setup_rc() in host init to just before we read the state in the
> > link up callback.
> >
> > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> > ---
> >
> > Notes:
> >     This patch is RFC (and HACK) because I don't have much clue *why* this
> >     patch works... merely that this is the smallest possible change I need
> >     to replicate the current accidental printk() workaround.  Perhaps one
> >     could argue that RFC here stands for request-for-clue.  All my
> >     observations and changes here are empirical and I don't know how best to
> >     turn them into something that is not a hack!
> >
> >     BTW I noticed many other pcie-designware drivers take advantage
> >     of a function called dw_pcie_wait_for_link() in their init paths...
> >     but my naive attempts to add it to the layerscape driver results
> >     in non-booting systems so I haven't embarrassed myself by including
> >     that in the patch!
> 
> You need to look at what's pending for v5.11, because I reworked this
> to be more unified. The ordering of init is also possibly changed. The
> sequence is now like this:
> 
>         dw_pcie_setup_rc(pp);
>         dw_pcie_msi_init(pp);
> 
>         if (!dw_pcie_link_up(pci) && pci->ops->start_link) {
>                 ret = pci->ops->start_link(pci);
>                 if (ret)
>                         goto err_free_msi;
>         }
> 
>         /* Ignore errors, the link may come up later */
>         dw_pcie_wait_for_link(pci);

Thanks. That looks likely to fix it since IIUC dw_pcie_wait_for_link()
will end up waiting somewhat like the double check I added to
ls_pcie_link_up().

I'll take a look at let you know.


Daniel.
