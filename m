Return-Path: <linuxppc-dev+bounces-8831-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFFDABF203
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 12:46:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2Sl74s82z3c47;
	Wed, 21 May 2025 20:46:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747824371;
	cv=none; b=aICwZuUaQBb9zAOV+V+NeQxrQHPhhwMACML7AqwAFoFWmGudllZbU8Fxknqaj+JuaUl2X3yfjGqGwX+nkoRZzsBXnDoPGwk40hBZpcL1iP85WmmZl+2nYusSSGjIjD7FZbtchsfZcXR+Nm7IL42+5oN1pzrRPRfK95/cYt7RQNgR9N6aOvzcc6UDt8Zp9e28M0VlELT3sHg+uD8zhhzFvo2iC+u53stPb+zEHoRWxv7dgb02blR9a0KpLTRVxkVouG9VRtfTxb8AhJm5RyQQy5r+eo3NW8a5xy3ah8LkhnKfkDn0tXLoAzLId7OrBQhheaoNw0oLfXZy6HQIL5KbuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747824371; c=relaxed/relaxed;
	bh=bPeKmKw5FEij7XdAi3Jn7FSVijrji0FLXsI5Ly/hOnk=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eTiJmPEWypSkR+xnkhiS8XKupwZ9QHkt3hn8HXpDsaG7ky+H/swn0zO85ueQN+zaiVouQGIASNBggs32yWNMuf+nFSJ6fcIbH9XhUKK9J6GO5P3o07hjLn9Gxe0rRGq/4V+fYjccjpsIcUE7pj1XzaDWttqV21y2C+MaqoJ5KjpL0AH7ILF2S+J6xDWOIBlPApHxdF3tB44qXVPzgcZGk/TQYkzc7x3DBhbnxTPgSjtsQyQ08fGeveLza10LsqbqEnIkilzj0ZP30SJ849Tnf6CooU1/R4G5W7kUULcyvK7rY5sY/ZywzSoBCdGg0gVc775K9cpQlB8xd41R21J0hA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2Sl61pw8z3c3l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 20:46:08 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b2SgJ6CcTz6L4sp;
	Wed, 21 May 2025 18:42:52 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id EB4871404FC;
	Wed, 21 May 2025 18:46:03 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 21 May
 2025 12:46:02 +0200
Date: Wed, 21 May 2025 11:46:00 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <linux-pci@vger.kernel.org>, Jon Pan-Doh <pandoh@google.com>, "Karolina
 Stolarek" <karolina.stolarek@oracle.com>, Weinan Liu <wnliu@google.com>,
	Martin Petersen <martin.petersen@oracle.com>, Ben Fuller
	<ben.fuller@oracle.com>, Drew Walton <drewwalton@microsoft.com>, "Anil
 Agrawal" <anilagrawal@meta.com>, Tony Luck <tony.luck@intel.com>, Ilpo
 =?UTF-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Sathyanarayanan
 Kuppuswamy" <sathyanarayanan.kuppuswamy@linux.intel.com>, Lukas Wunner
	<lukas@wunner.de>, Sargun Dhillon <sargun@meta.com>, "Paul E . McKenney"
	<paulmck@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "Oliver
 O'Halloran" <oohall@gmail.com>, Kai-Heng Feng <kaihengf@nvidia.com>, "Keith
 Busch" <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>, Terry Bowman
	<terry.bowman@amd.com>, Shiju Jose <shiju.jose@huawei.com>, Dave Jiang
	<dave.jiang@intel.com>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v7 17/17] PCI/AER: Add sysfs attributes for log
 ratelimits
Message-ID: <20250521114600.00007010@huawei.com>
In-Reply-To: <20250520215047.1350603-18-helgaas@kernel.org>
References: <20250520215047.1350603-1-helgaas@kernel.org>
	<20250520215047.1350603-18-helgaas@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 20 May 2025 16:50:34 -0500
Bjorn Helgaas <helgaas@kernel.org> wrote:

> From: Jon Pan-Doh <pandoh@google.com>
>=20
> Allow userspace to read/write log ratelimits per device (including
> enable/disable). Create aer/ sysfs directory to store them and any
> future aer configs.
>=20
> Update AER sysfs ABI filename to reflect the broader scope of AER sysfs
> attributes (e.g. stats and ratelimits).
>=20
>   Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats ->
>     sysfs-bus-pci-devices-aer
>=20
> Tested using aer-inject[1]. Configured correctable log ratelimit to 5.
> Sent 6 AER errors. Observed 5 errors logged while AER stats
> (cat /sys/bus/pci/devices/<dev>/aer_dev_correctable) shows 6.
>=20
> Disabled ratelimiting and sent 6 more AER errors. Observed all 6 errors
> logged and accounted in AER stats (12 total errors).
>=20
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.=
git
>=20
> [bhelgaas: note fatal errors are not ratelimited, "aer_report" -> "aer_in=
fo"]
> Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
> Signed-off-by: Jon Pan-Doh <pandoh@google.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Tested-by: Krzysztof Wilczy=C5=84ski <kwilczynski@kernel.org>

There is some relatively new SYSFS infra that I think will help
make this slightly nicer by getting rid of the extra directory when
there is nothing to be done with it.

> ---
>  ...es-aer_stats =3D> sysfs-bus-pci-devices-aer} | 34 +++++++
>  Documentation/PCI/pcieaer-howto.rst           |  5 +-
>  drivers/pci/pci-sysfs.c                       |  1 +
>  drivers/pci/pci.h                             |  1 +
>  drivers/pci/pcie/aer.c                        | 99 +++++++++++++++++++
>  5 files changed, 139 insertions(+), 1 deletion(-)
>  rename Documentation/ABI/testing/{sysfs-bus-pci-devices-aer_stats =3D> s=
ysfs-bus-pci-devices-aer} (77%)


> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index f9e684ac7878..9b8dea317a79 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -627,6 +627,105 @@ const struct attribute_group aer_stats_attr_group =
=3D {
>  	.is_visible =3D aer_stats_attrs_are_visible,
>  };

> +#define aer_ratelimit_burst_attr(name, ratelimit)			\
> +	static ssize_t							\
> +	name##_show(struct device *dev, struct device_attribute *attr,	\
> +		    char *buf)						\
> +{									\

A little odd looking to indent this less than the line above.

> +	struct pci_dev *pdev =3D to_pci_dev(dev);				\
> +									\
> +	return sysfs_emit(buf, "%d\n",					\
> +			  pdev->aer_info->ratelimit.burst);		\
> +}									\
> +									\
> +	static ssize_t							\
> +	name##_store(struct device *dev, struct device_attribute *attr,	\
> +		     const char *buf, size_t count)			\
> +{									\
> +	struct pci_dev *pdev =3D to_pci_dev(dev);				\
> +	int burst;							\
> +									\
> +	if (!capable(CAP_SYS_ADMIN))					\
> +		return -EPERM;						\
> +									\
> +	if (kstrtoint(buf, 0, &burst) < 0)				\
> +		return -EINVAL;						\
> +									\
> +	pdev->aer_info->ratelimit.burst =3D burst;			\
> +									\
> +	return count;							\
> +}									\
> +static DEVICE_ATTR_RW(name)
> +
> +aer_ratelimit_burst_attr(ratelimit_burst_cor_log, cor_log_ratelimit);
> +aer_ratelimit_burst_attr(ratelimit_burst_uncor_log, uncor_log_ratelimit);
> +
> +static struct attribute *aer_attrs[] =3D {
> +	&dev_attr_ratelimit_log_enable.attr,
> +	&dev_attr_ratelimit_burst_cor_log.attr,
> +	&dev_attr_ratelimit_burst_uncor_log.attr,
> +	NULL
> +};
> +
> +static umode_t aer_attrs_are_visible(struct kobject *kobj,
> +				     struct attribute *a, int n)
> +{
> +	struct device *dev =3D kobj_to_dev(kobj);
> +	struct pci_dev *pdev =3D to_pci_dev(dev);
> +
> +	if (!pdev->aer_info)
> +		return 0;
> +
> +	return a->mode;
> +}
> +
> +const struct attribute_group aer_attr_group =3D {
> +	.name =3D "aer",
> +	.attrs =3D aer_attrs,
> +	.is_visible =3D aer_attrs_are_visible,
> +};

There are a bunch of macros to simplify cases where
a whole group is either enabled or not and make the group
itself go away if there is nothing to be shown.

DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE() combined with
SYSFS_GROUP_VISIBLE() around the assignment does what we
want here I think.

Whilst we can't retrofit that stuff onto existing ABI
as someone may be assuming directory presence, we can
make sysfs less cluttered for new stuff.

Maybe I'm missing why that doesn't work here though!

J

> +
>  static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
>  				   struct aer_err_info *info)
>  {


