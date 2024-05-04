Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B62188BBCCB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 17:37:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gOU9LDkG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWsHH1x6Mz30Wn
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 May 2024 01:37:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gOU9LDkG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWsGN4VYKz30TY
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 May 2024 01:36:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E42260AB9;
	Sat,  4 May 2024 15:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92CBEC072AA;
	Sat,  4 May 2024 15:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714836983;
	bh=nwu87VDHK729eGU2R6RqtqlA5jPb1XtrfjcVNZX2UW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gOU9LDkGC/Nk0n7vDBEZnWdd/OxMBxqcUv0bWurd537fHJ4jcdyDDcv+QbZAK3nE/
	 ++E8Cs160Smi3bmrYhGFtE6q5sBfTKr4b7AubdwbVrdiO9sZW2n1rHLERpHgtLVwFL
	 eCOt84oekveT8FaBGhnj3Hf2FmZa93ZVT3j5PrVE=
Date: Sat, 4 May 2024 17:36:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 0/6] Deduplicate string exposure in sysfs
Message-ID: <2024050409-confident-delouse-a976@gregkh>
References: <cover.1713608122.git.lukas@wunner.de>
 <ZjZGzg5LFU2AT3_D@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjZGzg5LFU2AT3_D@wunner.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, storagedev@microchip.com, Yicong Yang <yangyicong@hisilicon.com>, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Will Deacon <will@kernel.org>, Jijie Shao <shaojijie@huawei.com>, Khuong Dinh <khuong@os.amperecomputing.com>, Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, linux-rdma@vger.kernel.org, "Luke D. Jones" <luke@ljones.dev>, Nilesh Javali <njavali@marvell.com>, Ilpo Jaervinen <ilpo.jarvinen@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Hans de Goede <hdegoede@redhat.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, Azael Avalos <coproscefalo@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, linux-scsi@vg
 er.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, Don Brace <don.brace@microchip.com>, Bjorn Andersson <andersson@kernel.org>, Anil Gurumur thy <anil.gurumurthy@qlogic.com>, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, GR-QLogic-Storage-Upstream@marvell.com, Shuai Xue <xueshuai@linux.alibaba.com>, Corentin Chary <corentin.chary@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 04, 2024 at 04:31:42PM +0200, Lukas Wunner wrote:
> Dear Greg,
> 
> On Sat, Apr 20, 2024 at 10:00:00PM +0200, Lukas Wunner wrote:
> > Introduce a generic ->show() callback to expose a string as a device
> > attribute in sysfs.  Deduplicate various identical callbacks across
> > the tree.
> > 
> > Result:  Minus 216 LoC, minus 1576 bytes vmlinux size (x86_64 allyesconfig).
> > 
> > This is a byproduct of my upcoming PCI device authentication v2 patches.
> > 
> > 
> > Lukas Wunner (6):
> >   driver core: Add device_show_string() helper for sysfs attributes
> >   hwmon: Use device_show_string() helper for sysfs attributes
> >   IB/qib: Use device_show_string() helper for sysfs attributes
> >   perf: Use device_show_string() helper for sysfs attributes
> >   platform/x86: Use device_show_string() helper for sysfs attributes
> >   scsi: Use device_show_string() helper for sysfs attributes
> 
> This series hasn't been applied to driver-core-next AFAICS and the
> merge window is drawing closer.
> 
> So far only patches 1, 2 and 5 have been ack'ed by the respective
> subsystem maintainers.  If the missing acks are the reason it hasn't
> been applied, would it be possibe to apply only 1, 2 and 5?
> 
> I would then resubmit the other ones individually to the subsystem
> maintainers in the next cycle.

I'll just pick it up now, thanks!

greg k-h
