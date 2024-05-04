Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB39C8BBC73
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 16:32:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWqrP4lt3z30Tp
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 May 2024 00:32:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout1.hostsharing.net (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5f64:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWqqx2V5Mz30Tg
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 May 2024 00:31:51 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 8667D300102B7;
	Sat,  4 May 2024 16:31:42 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 672E936599; Sat,  4 May 2024 16:31:42 +0200 (CEST)
Date: Sat, 4 May 2024 16:31:42 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] Deduplicate string exposure in sysfs
Message-ID: <ZjZGzg5LFU2AT3_D@wunner.de>
References: <cover.1713608122.git.lukas@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1713608122.git.lukas@wunner.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>, storagedev@microchip.com, Yicong Yang <yangyicong@hisilicon.com>, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Will Deacon <will@kernel.org>, Jijie Shao <shaojijie@huawei.com>, Khuong Dinh <khuong@os.amperecomputing.com>, Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, linux-rdma@vger.kernel.org, "Luke D. Jones" <luke@ljones.dev>, Nilesh Javali <njavali@marvell.com>, Ilpo Jaervinen <ilpo.jarvinen@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Hans de Goede <hdegoede@redhat.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, Azael Avalos <coproscefalo@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, linux-scsi@vger.kernel.org, "Martin K. Petersen" <mart
 in.petersen@oracle.com>, Don Brace <don.brace@microchip.com>, Bjorn Andersson <andersson@kernel.org>, Anil Gurumur thy <anil.gurumurthy@qlogic.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, GR-QLogic-Storage-Upstream@marvell.com, Shuai Xue <xueshuai@linux.alibaba.com>, Corentin Chary <corentin.chary@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Greg,

On Sat, Apr 20, 2024 at 10:00:00PM +0200, Lukas Wunner wrote:
> Introduce a generic ->show() callback to expose a string as a device
> attribute in sysfs.  Deduplicate various identical callbacks across
> the tree.
> 
> Result:  Minus 216 LoC, minus 1576 bytes vmlinux size (x86_64 allyesconfig).
> 
> This is a byproduct of my upcoming PCI device authentication v2 patches.
> 
> 
> Lukas Wunner (6):
>   driver core: Add device_show_string() helper for sysfs attributes
>   hwmon: Use device_show_string() helper for sysfs attributes
>   IB/qib: Use device_show_string() helper for sysfs attributes
>   perf: Use device_show_string() helper for sysfs attributes
>   platform/x86: Use device_show_string() helper for sysfs attributes
>   scsi: Use device_show_string() helper for sysfs attributes

This series hasn't been applied to driver-core-next AFAICS and the
merge window is drawing closer.

So far only patches 1, 2 and 5 have been ack'ed by the respective
subsystem maintainers.  If the missing acks are the reason it hasn't
been applied, would it be possibe to apply only 1, 2 and 5?

I would then resubmit the other ones individually to the subsystem
maintainers in the next cycle.

Thanks!

Lukas
