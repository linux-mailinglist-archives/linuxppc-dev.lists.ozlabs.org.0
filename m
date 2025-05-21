Return-Path: <linuxppc-dev+bounces-8836-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78498ABF25D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 13:06:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2TBK0HHQz3c4h;
	Wed, 21 May 2025 21:06:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747825576;
	cv=none; b=f+mrOpD6SAFx7TJ0Vo0xzZAfxBmgAhycURSK0UlLjuQUH4D5DOFNKEryQuDD5L0T/DX2SKN+HqfUsGTCcKLKihtXlRam/Qjorv2wU6V0A3v0kZeV92du+hPMrQU1wCRkIgEVP7JT+L6PXLcV2drPHfydHvmKRKP9ynqdA6NkmK/eIhNBFyY6PDh3KEJYOKa1gh2JMHkdkXmU/vj6e/436Dt9KV7jKU+4hN72hQI+W0WXfv29Z6/ndk7FuG6p0+NmnMzR6Hg5iOfDflED3PMucQrBueH8613sgId1bp7hLOkuS1SFe6rm/cUTMVQd6o0iuMgvQAZHB1UzJLDFbu1GQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747825576; c=relaxed/relaxed;
	bh=5YhFi0PXHb3rimYYyyaABI3HZ4ORFe4+4GmgT1dCE3I=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CY/9Feyg446DDH+pkN8AEG1uTtvW0VBbd85qTvLByTpRDtjaJZaqMz61LEY/JLQYi5E0fHgFisNdjiPCEPtqI7Sv47Jkbgc0Enwa8mBfK5L7OC8M2lig+3Sgd6Jt0MF3JM8RCNnwMgmJkpHEnoKp2Fw7cz+I4ss+7rUXMkeQC1L2TcbjYd9pbWo72hT8lgFyIDRqvGGIYd6QziJRARZR5TqkLcL3lawuNoeXnYy3jmtGuZTIXyWECOHZ95UwjLH0fVuBGIcB9Nqd8IT+jNRHrRltf2If82JOlLMsAXUl5068CLKUWTVWhROpm/X1WymvCa2vRRztCxEOte10Tgt+2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lHVigTNx; dkim-atps=neutral; spf=none (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lHVigTNx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2TBG0XFKz3c4M
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 21:06:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747825574; x=1779361574;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=utfKUeejFLvJbdLWTRYs6J3vHpGRVnI8RSEnIEARCWQ=;
  b=lHVigTNx4SZrPNJ/kVX/aNZafyd1A7jAQpLYjk22VQrqKOQmzOjedz+l
   E6p2UKlLEeVFVtLxAF1TwPgGcmM0JXxmzcZUYFS4oY4n6AsnGus5I/9KP
   yyzjvOzuFuBDhoHmTy2esb0yUSmQ31TA8iRpx/hASGisdJ5EE7T/5nC+D
   Gt8poWMycG0zuqPxsxHAi5J+hmUT0ZKW1mHZqMBJ6acKdrHAHeNpV1iDU
   sjnBkCHbfi0KFON9BwdDeA2tiG7KwCUz4LfciKauP6cQ7ye4leoG2MsIR
   9JiK/h+AEJiVoojH9V3P9uLPWAooMWoyE+83zJmqrtcCupxohcJbtnROG
   g==;
X-CSE-ConnectionGUID: LViX6hkXQJ2pkyvKkfn2oA==
X-CSE-MsgGUID: W0sQ81WoSrSAIjbIOk9FdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="37418479"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="37418479"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 04:06:10 -0700
X-CSE-ConnectionGUID: dafv0W/nR22u+DF84vjbWQ==
X-CSE-MsgGUID: DqV9Ekb3RyGrP/3IuGZTHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="140529464"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.221])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 04:06:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 21 May 2025 14:05:57 +0300 (EEST)
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
cc: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org, 
    Jon Pan-Doh <pandoh@google.com>, 
    Karolina Stolarek <karolina.stolarek@oracle.com>, 
    Weinan Liu <wnliu@google.com>, 
    Martin Petersen <martin.petersen@oracle.com>, 
    Ben Fuller <ben.fuller@oracle.com>, Drew Walton <drewwalton@microsoft.com>, 
    Anil Agrawal <anilagrawal@meta.com>, Tony Luck <tony.luck@intel.com>, 
    Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, 
    Lukas Wunner <lukas@wunner.de>, Sargun Dhillon <sargun@meta.com>, 
    "Paul E . McKenney" <paulmck@kernel.org>, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, Kai-Heng Feng <kaihengf@nvidia.com>, 
    Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>, 
    Terry Bowman <terry.bowman@amd.com>, Shiju Jose <shiju.jose@huawei.com>, 
    Dave Jiang <dave.jiang@intel.com>, LKML <linux-kernel@vger.kernel.org>, 
    linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v7 17/17] PCI/AER: Add sysfs attributes for log
 ratelimits
In-Reply-To: <20250521114600.00007010@huawei.com>
Message-ID: <5f9fee34-1db6-d30b-688f-040570cc651a@linux.intel.com>
References: <20250520215047.1350603-1-helgaas@kernel.org> <20250520215047.1350603-18-helgaas@kernel.org> <20250521114600.00007010@huawei.com>
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
Content-Type: multipart/mixed; boundary="8323328-1454175955-1747825557=:946"
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1454175955-1747825557=:946
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 21 May 2025, Jonathan Cameron wrote:

> On Tue, 20 May 2025 16:50:34 -0500
> Bjorn Helgaas <helgaas@kernel.org> wrote:
>=20
> > From: Jon Pan-Doh <pandoh@google.com>
> >=20
> > Allow userspace to read/write log ratelimits per device (including
> > enable/disable). Create aer/ sysfs directory to store them and any
> > future aer configs.
> >=20
> > Update AER sysfs ABI filename to reflect the broader scope of AER sysfs
> > attributes (e.g. stats and ratelimits).
> >=20
> >   Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats ->
> >     sysfs-bus-pci-devices-aer
> >=20
> > Tested using aer-inject[1]. Configured correctable log ratelimit to 5.
> > Sent 6 AER errors. Observed 5 errors logged while AER stats
> > (cat /sys/bus/pci/devices/<dev>/aer_dev_correctable) shows 6.
> >=20
> > Disabled ratelimiting and sent 6 more AER errors. Observed all 6 errors
> > logged and accounted in AER stats (12 total errors).
> >=20
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-injec=
t.git
> >=20
> > [bhelgaas: note fatal errors are not ratelimited, "aer_report" -> "aer_=
info"]
> > Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
> > Signed-off-by: Jon Pan-Doh <pandoh@google.com>
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > Tested-by: Krzysztof Wilczy=C5=84ski <kwilczynski@kernel.org>
>=20
> There is some relatively new SYSFS infra that I think will help
> make this slightly nicer by getting rid of the extra directory when
> there is nothing to be done with it.
>=20
> > ---
> >  ...es-aer_stats =3D> sysfs-bus-pci-devices-aer} | 34 +++++++
> >  Documentation/PCI/pcieaer-howto.rst           |  5 +-
> >  drivers/pci/pci-sysfs.c                       |  1 +
> >  drivers/pci/pci.h                             |  1 +
> >  drivers/pci/pcie/aer.c                        | 99 +++++++++++++++++++
> >  5 files changed, 139 insertions(+), 1 deletion(-)
> >  rename Documentation/ABI/testing/{sysfs-bus-pci-devices-aer_stats =3D>=
 sysfs-bus-pci-devices-aer} (77%)
>=20
>=20
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index f9e684ac7878..9b8dea317a79 100644
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@ -627,6 +627,105 @@ const struct attribute_group aer_stats_attr_group=
 =3D {
> >  =09.is_visible =3D aer_stats_attrs_are_visible,
> >  };
>=20
> > +#define aer_ratelimit_burst_attr(name, ratelimit)=09=09=09\
> > +=09static ssize_t=09=09=09=09=09=09=09\
> > +=09name##_show(struct device *dev, struct device_attribute *attr,=09\
> > +=09=09    char *buf)=09=09=09=09=09=09\
> > +{=09=09=09=09=09=09=09=09=09\
>=20
> A little odd looking to indent this less than the line above.
>=20
> > +=09struct pci_dev *pdev =3D to_pci_dev(dev);=09=09=09=09\
> > +=09=09=09=09=09=09=09=09=09\
> > +=09return sysfs_emit(buf, "%d\n",=09=09=09=09=09\
> > +=09=09=09  pdev->aer_info->ratelimit.burst);=09=09\
> > +}=09=09=09=09=09=09=09=09=09\
> > +=09=09=09=09=09=09=09=09=09\
> > +=09static ssize_t=09=09=09=09=09=09=09\
> > +=09name##_store(struct device *dev, struct device_attribute *attr,=09\
> > +=09=09     const char *buf, size_t count)=09=09=09\
> > +{=09=09=09=09=09=09=09=09=09\
> > +=09struct pci_dev *pdev =3D to_pci_dev(dev);=09=09=09=09\
> > +=09int burst;=09=09=09=09=09=09=09\
> > +=09=09=09=09=09=09=09=09=09\
> > +=09if (!capable(CAP_SYS_ADMIN))=09=09=09=09=09\
> > +=09=09return -EPERM;=09=09=09=09=09=09\
> > +=09=09=09=09=09=09=09=09=09\
> > +=09if (kstrtoint(buf, 0, &burst) < 0)=09=09=09=09\
> > +=09=09return -EINVAL;=09=09=09=09=09=09\
> > +=09=09=09=09=09=09=09=09=09\
> > +=09pdev->aer_info->ratelimit.burst =3D burst;=09=09=09\
> > +=09=09=09=09=09=09=09=09=09\
> > +=09return count;=09=09=09=09=09=09=09\
> > +}=09=09=09=09=09=09=09=09=09\
> > +static DEVICE_ATTR_RW(name)
> > +
> > +aer_ratelimit_burst_attr(ratelimit_burst_cor_log, cor_log_ratelimit);
> > +aer_ratelimit_burst_attr(ratelimit_burst_uncor_log, uncor_log_ratelimi=
t);
> > +
> > +static struct attribute *aer_attrs[] =3D {
> > +=09&dev_attr_ratelimit_log_enable.attr,
> > +=09&dev_attr_ratelimit_burst_cor_log.attr,
> > +=09&dev_attr_ratelimit_burst_uncor_log.attr,
> > +=09NULL
> > +};
> > +
> > +static umode_t aer_attrs_are_visible(struct kobject *kobj,
> > +=09=09=09=09     struct attribute *a, int n)
> > +{
> > +=09struct device *dev =3D kobj_to_dev(kobj);
> > +=09struct pci_dev *pdev =3D to_pci_dev(dev);
> > +
> > +=09if (!pdev->aer_info)
> > +=09=09return 0;
> > +
> > +=09return a->mode;
> > +}
> > +
> > +const struct attribute_group aer_attr_group =3D {
> > +=09.name =3D "aer",
> > +=09.attrs =3D aer_attrs,
> > +=09.is_visible =3D aer_attrs_are_visible,
> > +};
>=20
> There are a bunch of macros to simplify cases where
> a whole group is either enabled or not and make the group
> itself go away if there is nothing to be shown.
>=20
> DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE() combined with
> SYSFS_GROUP_VISIBLE() around the assignment does what we
> want here I think.
>=20
> Whilst we can't retrofit that stuff onto existing ABI
> as someone may be assuming directory presence,

Are you sure about this? That empty directories are part of ABI as well?
Are any of these directories listed under Documentation/ABI ?

I can see somebody could in theory rely on the existance of empty=20
directories but it's not like it contains any real substance without
a file with the actual content of interest so it seems somewhat strange
to check for directory and not the file of interest itself.

> we can make sysfs less cluttered for new stuff.
>=20
> Maybe I'm missing why that doesn't work here though!
>=20
> J
>=20
> > +
> >  static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
> >  =09=09=09=09   struct aer_err_info *info)
> >  {
>=20

--=20
 i.

--8323328-1454175955-1747825557=:946--

