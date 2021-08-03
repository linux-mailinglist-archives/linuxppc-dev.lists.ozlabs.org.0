Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 984DF3DFAEB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 07:08:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GffsM3ywLz3cPK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 15:08:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=F/09aFyg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=new1-smtp.messagingengine.com (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=idosch@idosch.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=F/09aFyg; 
 dkim-atps=neutral
X-Greylist: delayed 584 seconds by postgrey-1.36 at boromir;
 Wed, 04 Aug 2021 00:56:05 AEST
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfHxd0H7Jz2yX8
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 00:56:05 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id EBF245806A0;
 Tue,  3 Aug 2021 10:46:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 03 Aug 2021 10:46:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=ZhhzKAcbp08j/zLplXp7CUKlTW+9yQngYwV71xLLU
 uk=; b=F/09aFygJQYV2RtiZgmhk7lrEY/SgDHVCp9GLx/945GbshDofvqnTjhPv
 MdQvU0XkuXuw8J+MuhKrJ5gR1GZcomEdsTK6ZD7aIFtguwONkYK584aL0vB3+uOi
 1cZ7en9ladrjw6Am+2BpbC6fRp8uuoZu3LuWznvdmPAybGSJD4k6LsC2dgve+Rgl
 7lVDmmuL7y/jEYsgA56vScY1S21u5F3TLg4OLHZRv4+oQDdiQgC7TWc+gnXL5h4w
 2rvrqIo0t83pmPMDPPc41jSJk9WPHxdOeJIBVx4KzCnsejQeB77xOjaT3gfaZ5ud
 PQwuZWkKpupEjh03t9vkMNG6BzFeQ==
X-ME-Sender: <xms:slYJYT6kZeAR_u8nmIhOwwTdbdSTNZDG6YV26ZSH5RAkJpiwDMEecg>
 <xme:slYJYY6-9FEu98HWO-uZSzE-IqI3ADKc0IPE-fH4fhb6O37ZXlqSYAoGH26C6xR_Y
 3AnO0EnJ1_HFrI>
X-ME-Received: <xmr:slYJYacOsY7ys2tiGj1OcG6XygrXSWg4xrc9GnX_-fPcsyrhgEjtC7VnWYQEv5nVsTuIg9N7CZQZGuQjxh2ppRV9AbXp_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieeggdejjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefkughoucfu
 tghhihhmmhgvlhcuoehiughoshgthhesihguohhstghhrdhorhhgqeenucggtffrrghtth
 gvrhhnpedvffevkeefieeiueeitedufeekveekuefhueeiudduteekgeelfedvgeehjeeh
 hfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehiug
 hoshgthhesihguohhstghhrdhorhhg
X-ME-Proxy: <xmx:slYJYUKzZG3Xz6r6LaeXad3wYy6LOTbk81cO0cMnwYXwbSFEc7wHjQ>
 <xmx:slYJYXJjCcb3nZi9UnC0Hz6_YYtYtVnj1jBbwCxXsrsAsiMMX5tIkw>
 <xmx:slYJYdxfVsvKDxmjEDddhWRd4PUJmS19TokpDNA-XT3HSimKkg7Dwg>
 <xmx:uFYJYVgEB2oEZs8RPQxAloMFD7GNawFrzXmXD3USqGR6p1WsqWraOg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Aug 2021 10:46:09 -0400 (EDT)
Date: Tue, 3 Aug 2021 17:46:05 +0300
From: Ido Schimmel <idosch@idosch.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 5/6] PCI: Adapt all code locations to not use struct
 pci_dev::driver directly
Message-ID: <YQlWrcCY3X01eNJJ@shredder>
References: <20210803100150.1543597-1-u.kleine-koenig@pengutronix.de>
 <20210803100150.1543597-6-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210803100150.1543597-6-u.kleine-koenig@pengutronix.de>
X-Mailman-Approved-At: Wed, 04 Aug 2021 15:05:41 +1000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-pci@vger.kernel.org,
 Alexander Duyck <alexanderduyck@fb.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>, oss-drivers@corigine.com,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Jiri Olsa <jolsa@redhat.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-perf-users@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org,
 Ido Schimmel <idosch@nvidia.com>, x86@kernel.org, qat-linux@intel.com,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, linux-wireless@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, Fiona Trahe <fiona.trahe@intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Simon Horman <simon.horman@corigine.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Michael Buesch <m@bues.ch>, Jiri Pirko <jiri@nvidia.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Namhyung Kim <namhyung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@intel.com>, Juergen Gross <jgross@suse.com>,
 Salil Mehta <salil.mehta@huawei.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>, xen-devel@lists.xenproject.org,
 Vadym Kochan <vkochan@marvell.com>, MPT-FusionLinux.pdl@broadcom.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Wojciech Ziemba <wojciech.ziemba@intel.com>, linux-kernel@vger.kernel.org,
 Taras Chornyi <tchornyi@marvell.com>, Zhou Wang <wangzhou1@hisilicon.com>,
 linux-crypto@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org,
 Frederic Barrat <fbarrat@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 03, 2021 at 12:01:49PM +0200, Uwe Kleine-König wrote:
> This prepares removing the driver member of struct pci_dev which holds the
> same information than struct pci_dev::dev->driver.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  arch/powerpc/include/asm/ppc-pci.h            |  3 +-
>  arch/powerpc/kernel/eeh_driver.c              | 12 ++++---
>  arch/x86/events/intel/uncore.c                |  2 +-
>  arch/x86/kernel/probe_roms.c                  |  2 +-
>  drivers/bcma/host_pci.c                       |  6 ++--
>  drivers/crypto/hisilicon/qm.c                 |  2 +-
>  drivers/crypto/qat/qat_common/adf_aer.c       |  2 +-
>  drivers/message/fusion/mptbase.c              |  4 +--
>  drivers/misc/cxl/guest.c                      | 21 +++++------
>  drivers/misc/cxl/pci.c                        | 25 +++++++------
>  .../ethernet/hisilicon/hns3/hns3_ethtool.c    |  2 +-
>  .../ethernet/marvell/prestera/prestera_pci.c  |  2 +-
>  drivers/net/ethernet/mellanox/mlxsw/pci.c     |  2 +-
>  .../ethernet/netronome/nfp/nfp_net_ethtool.c  |  2 +-
>  drivers/pci/iov.c                             | 23 +++++++-----
>  drivers/pci/pci-driver.c                      | 28 ++++++++-------
>  drivers/pci/pci.c                             | 10 +++---
>  drivers/pci/pcie/err.c                        | 35 ++++++++++---------
>  drivers/pci/xen-pcifront.c                    |  3 +-
>  drivers/ssb/pcihost_wrapper.c                 |  7 ++--
>  drivers/usb/host/xhci-pci.c                   |  3 +-
>  21 files changed, 112 insertions(+), 84 deletions(-)

For mlxsw:

Tested-by: Ido Schimmel <idosch@nvidia.com>
