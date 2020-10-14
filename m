Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D484E28E878
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 23:38:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBQlg5Gl9zDrQC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 08:38:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baikalelectronics.ru (client-ip=94.125.187.42;
 helo=mail.baikalelectronics.ru;
 envelope-from=sergey.semin@baikalelectronics.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=baikalelectronics.ru
Received: from mail.baikalelectronics.ru (ns2.baikalelectronics.ru
 [94.125.187.42])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CBL8b6BqLzDqqD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 05:11:43 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 263C4803073E;
 Wed, 14 Oct 2020 18:11:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ntl7Ii8wms8a; Wed, 14 Oct 2020 21:11:40 +0300 (MSK)
Date: Wed, 14 Oct 2020 21:11:36 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 18/20] arch: dts: Fix EHCI/OHCI DT nodes name
Message-ID: <20201014181136.5hwsu77rv3wbxw7w@mobilestation>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-19-Sergey.Semin@baikalelectronics.ru>
 <ed0221ee-c586-b8f8-a7d1-4a2a190dc41b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ed0221ee-c586-b8f8-a7d1-4a2a190dc41b@gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-Mailman-Approved-At: Thu, 15 Oct 2020 07:49:50 +1100
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>, Paul Mackerras <paulus@samba.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-stm32@st-md-mailman.stormreply.com,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Wei Xu <xuwei5@hisilicon.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Kevin Hilman <khilman@baylibre.com>, linux-snps-arc@lists.infradead.org,
 devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Mathias Nyman <mathias.nyman@intel.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Felipe Balbi <balbi@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 Manu Gautam <mgautam@codeaurora.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vineet Gupta <vgupta@synopsys.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 14, 2020 at 11:00:45AM -0700, Florian Fainelli wrote:
> On 10/14/20 3:14 AM, Serge Semin wrote:
> > In accordance with the Generic EHCI/OHCI bindings the corresponding node
> > name is suppose to comply with the Generic USB HCD DT schema, which
> > requires the USB nodes to have the name acceptable by the regexp:
> > "^usb(@.*)?" . Let's fix the DTS files, which have the nodes defined with
> > incompatible names.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > ---
> > 
> > Please, test the patch out to make sure it doesn't brake the dependent DTS
> > files. I did only a manual grepping of the possible nodes dependencies.
> 

> Not sure how you envisioned these change to be picked up, but you may
> need to split these changes between ARM/ARM64, MIPS and PowerPC at
> least. And within ARM/ARM64 you will most likely have to split according
> to the various SoC maintainers.

Hmm, I don't really know how it's going to be done in this case, but there must
be a way to get the cross-platform patches picked up in general. For
instance, see the patches like:
714acdbd1c94 arch: rename copy_thread_tls() back to copy_thread()
140c8180eb7c arch: remove HAVE_COPY_THREAD_TLS
They touched the files from different files, but still have been merged in.
Maybe I should have copied these three patches to the "linux-arch@vger.kernel.org"
list or some other mailing list...

-Sergey

> -- 
> Florian
