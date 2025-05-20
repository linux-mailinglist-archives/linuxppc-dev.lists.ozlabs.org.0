Return-Path: <linuxppc-dev+bounces-8762-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1D7ABE0B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 18:31:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b20Rd6DwVz3bNw;
	Wed, 21 May 2025 02:31:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747758669;
	cv=none; b=iFIlrQpax/1ULXiZ2/muZ/ijxz8zJBlMNRY82HrOZ9vGGEKjtSKdrFxwFYKb/sBEfBFaD3ysuBQ7Yf3AMsfw7udb+9/DOcXFZbfSPw6Ku+LqNr9FeBV0gvuoo4S06QUtC90Bvb+w3yPVsKKMiI4lq7NxiuSzOvOMfY+nqt6itmflItecBTX+2n3vaVrNuvyS2ygAehi0XX4A7UIrkX/gRIsQWHkhU50IclpGmKql4ZxH5x7DwSkR9IPKyNiGTxhpTwr0fHIFEHdt4zbcCsB9mbrVpCCCb8MO7cVXl6BA5sAwn5oq34QNswHu4mKsxYhfqgpy7nF3l5H4isE4+xed4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747758669; c=relaxed/relaxed;
	bh=H0dt/6fguYrUbq9aAHTWguT1CAMFUL28o/27BPcnfMA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=hfUtC9+gudIK5St1uS+MtfGjIgvQprk7w5Q5UQ57oy2WyRBTOaAYcmgpxEYzDZh/hLX9DQIIpyzDUlushm6FrTPhHhhWMSBlfdSgmzl7F6zos3Q+MuKYNlGbAr+VtywGmcAw1ZorLtU6ZzaqQWPf/ab2b3Z/jxEmxhIrgAnl1VQ47odxbTjoI38wfMNS/SmIbSuIRlU78WQ5fgwU4yEgFo0J+cXmOPZNkxcjSIR+DKsXLRbh5n/ciK7NJVqHa3F/GgGIh3G8bZbnegpHUOydZ9L6Md5DDloeJKSKtH6DgMl1UJZZoeN321Y1MVoinpw09NcjGqfutoRBeRty6rPZPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qZPrfh52; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qZPrfh52;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b20RY2DS9z30g6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 02:31:05 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E0707A4EBB8;
	Tue, 20 May 2025 16:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5206CC4CEE9;
	Tue, 20 May 2025 16:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747758662;
	bh=Hem8uB3zD/uymJ9qJM41N8VYIt7YRxLcq73u4y3iXZQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=qZPrfh52H9nmCtaZEzHwRsuSjNG60L8K+op7YjP/4d3Clt8YrQ61bHb4RMRebkQYp
	 ZlfbFO/xEeyf3YewDEOrx+Gsz/ioRAER2UxfGLorG8iVIO7cNDTqMWBFQ9n2/f1+5p
	 GaUbj1QCopmcrQvH294U3xHiBoEaRf0UPLpni9r23pLebn/8/003ycFdkfhuI2VLlt
	 BLLWuhfkeGcf26KXqG192DtM77svvxhattM5I7y1gXS+2A5aZTh+G+/KIZFjAuGbT9
	 CSBhrSR1NKdXdr06Ibm3CHtR7lB9c9Z5ns4XBHRJzFPUd1oFaKN9HSZLBplRI/Alg7
	 TSa9BmbDkwVWQ==
Date: Tue, 20 May 2025 11:31:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Jon Pan-Doh <pandoh@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Martin Petersen <martin.petersen@oracle.com>,
	Ben Fuller <ben.fuller@oracle.com>,
	Drew Walton <drewwalton@microsoft.com>,
	Anil Agrawal <anilagrawal@meta.com>,
	Tony Luck <tony.luck@intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sargun Dhillon <sargun@meta.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v6 16/16] PCI/AER: Add sysfs attributes for log ratelimits
Message-ID: <20250520163100.GA1307206@bhelgaas>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cfe3d2a5-fe32-ca35-98f5-812da367dc99@linux.intel.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, May 20, 2025 at 03:02:06PM +0300, Ilpo Järvinen wrote:
> On Mon, 19 May 2025, Bjorn Helgaas wrote:
> 
> > From: Jon Pan-Doh <pandoh@google.com>
> > 
> > Allow userspace to read/write log ratelimits per device (including
> > enable/disable). Create aer/ sysfs directory to store them and any
> > future aer configs.
> > 
> > Update AER sysfs ABI filename to reflect the broader scope of AER sysfs
> > attributes (e.g. stats and ratelimits).
> > 
> >   Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats ->
> >     sysfs-bus-pci-devices-aer
> > 
> > Tested using aer-inject[1]. Configured correctable log ratelimit to 5.
> > Sent 6 AER errors. Observed 5 errors logged while AER stats
> > (cat /sys/bus/pci/devices/<dev>/aer_dev_correctable) shows 6.
> > 
> > Disabled ratelimiting and sent 6 more AER errors. Observed all 6 errors
> > logged and accounted in AER stats (12 total errors).
> > 
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.git
> > 
> > Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
> > Signed-off-by: Jon Pan-Doh <pandoh@google.com>
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > Acked-by: Paul E. McKenney <paulmck@kernel.org>
> > ---
> >  ...es-aer_stats => sysfs-bus-pci-devices-aer} | 34 +++++++
> >  Documentation/PCI/pcieaer-howto.rst           |  5 +-
> >  drivers/pci/pci-sysfs.c                       |  1 +
> >  drivers/pci/pci.h                             |  1 +
> >  drivers/pci/pcie/aer.c                        | 99 +++++++++++++++++++
> >  5 files changed, 139 insertions(+), 1 deletion(-)
> >  rename Documentation/ABI/testing/{sysfs-bus-pci-devices-aer_stats => sysfs-bus-pci-devices-aer} (77%)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats b/Documentation/ABI/testing/sysfs-bus-pci-devices-aer
> > similarity index 77%
> > rename from Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
> > rename to Documentation/ABI/testing/sysfs-bus-pci-devices-aer
> > index d1f67bb81d5d..771204197b71 100644
> > --- a/Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
> > +++ b/Documentation/ABI/testing/sysfs-bus-pci-devices-aer
> > @@ -117,3 +117,37 @@ Date:		July 2018
> >  KernelVersion:	4.19.0
> >  Contact:	linux-pci@vger.kernel.org, rajatja@google.com
> >  Description:	Total number of ERR_NONFATAL messages reported to rootport.
> > +
> > +PCIe AER ratelimits
> > +-------------------
> > +
> > +These attributes show up under all the devices that are AER capable.
> > +They represent configurable ratelimits of logs per error type.
> > +
> > +See Documentation/PCI/pcieaer-howto.rst for more info on ratelimits.
> > +
> > +What:		/sys/bus/pci/devices/<dev>/aer/ratelimit_log_enable
> > +Date:		March 2025
> > +KernelVersion:	6.15.0
> 
> This ship has sailed.

Updated to May 2025 and 6.16.0 (I hope :)).

> > +Contact:	linux-pci@vger.kernel.org, pandoh@google.com
> > +Description:	Writing 1/0 enables/disables AER log ratelimiting. Reading
> > +		gets whether or not AER is currently enabled.
> 
> AER or AER ratelimiting is enabled?

I think we want "AER ratelimiting" here, thanks!

> > + * Ratelimit enable toggle
> > + * 0: disabled with ratelimit.interval = 0
> > + * 1: enabled with ratelimit.interval = nonzero
> > + */
> > +static ssize_t ratelimit_log_enable_show(struct device *dev,
> > +					 struct device_attribute *attr,
> > +					 char *buf)
> > +{
> > +	struct pci_dev *pdev = to_pci_dev(dev);
> > +	bool enabled = pdev->aer_report->cor_log_ratelimit.interval != 0;
> > +
> > +	return sysfs_emit(buf, "%d\n", enabled);
> > +}
> > +
> > +static ssize_t ratelimit_log_enable_store(struct device *dev,
> > +					  struct device_attribute *attr,
> > +					  const char *buf, size_t count)
> > +{
> > +	struct pci_dev *pdev = to_pci_dev(dev);
> > +	bool enable;
> > +	int interval;
> > +
> > +	if (!capable(CAP_SYS_ADMIN))
> > +		return -EPERM;
> > +
> > +	if (kstrtobool(buf, &enable) < 0)
> > +		return -EINVAL;
> > +
> > +	if (enable)
> > +		interval = DEFAULT_RATELIMIT_INTERVAL;
> > +	else
> > +		interval = 0;
> > +
> > +	pdev->aer_report->cor_log_ratelimit.interval = interval;
> > +	pdev->aer_report->uncor_log_ratelimit.interval = interval;
> > +
> > +	return count;
> > +}
> > +static DEVICE_ATTR_RW(ratelimit_log_enable);

