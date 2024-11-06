Return-Path: <linuxppc-dev+bounces-2942-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7C29BF8C5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 22:55:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkJsq0L93z2yRZ;
	Thu,  7 Nov 2024 08:55:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730921773;
	cv=none; b=g59w1AQ0KpiKZg9mhMmGYwgSwGr7XaeFbv09I/1/y+ITSBFkiNcqWaFW7SU7YA4xgzUQ4xp0lkvrVTKcRQxGuSwVkHpYpn4vxQuBRFaSoxt6BpvPt7d2sWhE5dINdDJWQ4avrYs16HDVcdZgdZnrUtQVG6ZRqVLbk1QLVR+EH7R+dX5T8NV66kWNygpQQdMJNF9Rs2yoGN6/VI40aUJtPR9pMAVXvPvAJeNBF0YNKEC5G9EtFroTyKN2FC01I1OK6KpV5MLoaaGBf7G/uiFCu2DS5zJYZdIYxSS00k6AgsNxsT9EMOgwbx+gT/iMJbUYxoZADE0ddlduLn7V9qBgJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730921773; c=relaxed/relaxed;
	bh=KPIsoyhsws8Agp7wgFRMdaTpDymEbvSb3Owgwg6CKMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VwrUNUiEEdwhS5DmXsWQtCmdwKWMXs46jacTizsKVYE1AFM22jOQh7V6iSkkxaIIbFwq/9okntfrIuO7+GFMwoPYgUBj3e3mgMB0yrdFE1XhcA2LswWtYZl0hcCrUnOkL477w2FBgw3gsKP1waeEGDV8dsnHiT/AsUa5aUYFS2Zv+aXWy2uH2/oy1PcwmEK3GD4v1tNiFtSf8bwGcI7Lc5h4PTvBp0NsHV13Dzd33OuTUsshhJScV3LUMscfegBqvE4SEdjFqT/1mfpDeWvd55c7/08UUVgRd0zFVvuvqdiO0Hzw6BbIEEAcbhT+PuxKFPBRKAN2hGnU540kKGAY6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=JdOSSW5h; dkim-atps=neutral; spf=pass (client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=w_armin@gmx.de; receiver=lists.ozlabs.org) smtp.mailfrom=gmx.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=JdOSSW5h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=w_armin@gmx.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 373 seconds by postgrey-1.37 at boromir; Thu, 07 Nov 2024 06:36:07 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkFn31Ybzz3bbn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 06:36:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1730921755; x=1731526555; i=w_armin@gmx.de;
	bh=KPIsoyhsws8Agp7wgFRMdaTpDymEbvSb3Owgwg6CKMI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JdOSSW5h0qNKRn4UCW3H04dYzy+ISCrSleRHZl9kCGPxRCSDXMHMPIc+oYDMU4T/
	 1ZxHPsHfXDKcS8wpVlHuIi1ED5R/CHyK/kwhcIEqCOXWm2E0VlgSCvpLsG3GTU5lV
	 yCVrQe9Ks3R7+YDkMUA95gsJj2tudke1Uwz2uRKPkkulpeaEnV5Z2tx5ppVPEz5rR
	 cx+/Af0uOVCTArCJQYVMHQVYMLOScb029xYwMxbA/Savg6I9rsblgjhLyhpY7lVPE
	 I8NxpnRNLE6xOLzaA7n/b3sLJkOjuy38wbudvUXXX3S2cX6vO+Fkk2hgDhiBoRggT
	 Eoy4ZNmP0iU6f9NWbA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MG9kC-1t3KhK2USC-003gaQ; Wed, 06
 Nov 2024 20:27:54 +0100
Message-ID: <da774e71-39f3-43ec-a366-c8c893132447@gmx.de>
Date: Wed, 6 Nov 2024 20:27:44 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] sysfs: introduce callback
 attribute_group::bin_size
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "David E. Box" <david.e.box@linux.intel.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Logan Gunthorpe <logang@deltatee.com>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, linux-mtd@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
 <20241103-sysfs-const-bin_attr-v2-2-71110628844c@weissschuh.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-2-71110628844c@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:44YqvEvciDnAZyVj6z6AwMwirIfHL0Pzp3XFOKxQKNiQ7tHWySC
 RxktlrVaqsSUg5C4VvLrzKpoqlhjiHyHgejaek9khmsio9KiFm5QCv2KXv29eAcNsGR1hIr
 /Q5ILnqj229v3epEt6qEr+soHYvezbTam1hICVuVYB5Diy3yXhaNodiu0nfX7EP/suGwHuw
 I6p5H1JUB0YrJzn4YZJQA==
UI-OutboundReport: notjunk:1;M01:P0:nUIEbYCZKow=;cbF5RAWkqu0FgA7YnwKsrmL3Wq2
 PARPSQ5XdmVH8D13YZ685Aanc0Pp8IBdYuvHrNEJAjDVuoD8bzJeoCw7gES8vQG+5xNVbjUtn
 N16wtsyuJ5hKRvF+JDUxS7DCYXZHujiR2XZ2Wj71Z7GKTZyOFflKKFllGtt7yPStbgKwK8y1e
 kKuxhrrW7g+vGQOqlHUdUFfCqpxUIunaaFrtLf4zKFHLiWURsXDX+/dAubCIi5bnW0tg0q6Mr
 775Y4mqf02TSWsYjlSpnTSDxNrA22dtZZb7dkvaMkNG/zRSm62KYyFq9v8tr0XR0Zt3gfuGB5
 x41bjuaNWMqrDte/paiVIp9Njn5eSwZzkVzkPOysMwdmCuixPOEBNjfX0bOLZSbfJN3meBe0Z
 vY/Tx6MT/Ruf7F6wNn5CHWqFOciM7Tz58wr+0jc0eNT/kbqfbsgVvqXL3zsUBYpMDuIiA2iIN
 pCBP9Emn4mFDO+k5qI1XYImVaHpF7dwlyKoV7V8DrJ6IVCih4adw4mp0ZC/Istl0pX60MK6a9
 r6fXfr26bRIW7zIqnJcIKqYqX5y0944q8sdsz4O/bphvSpCC6g6SFCvxy06Co4wSZHn5Cj1bM
 pZPpdLXMFI1QtplFXJ9YZCUGmFujWr5gVSKr8yoX5KkiodYq+fbHYF+zppibExYsBEnJAhHvP
 gQuIyYBQCNMcITrdVKzhU4O3kOqDx3yxXoyA2MLBJ0xeWrokgtnYvFA7zCGR/8MoWfPxut96o
 OxJUQs7X1m2G517vWfvXMZaQ1WY0jRpxr+kvAyMP4+JTacbeO/sOccg8HfF/+eOkIWjQIYLk3
 QvzVfatsuxFXp1FVTcN5Vn6g==
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Am 03.11.24 um 18:03 schrieb Thomas Wei=C3=9Fschuh:

> Several drivers need to dynamically calculate the size of an binary
> attribute. Currently this is done by assigning attr->size from the
> is_bin_visible() callback.

Hi,

i really like your idea of introducing this new callback, it will be very
useful for the wmi-bmof driver :).

Thanks,
Armin Wolf

>
> This has drawbacks:
> * It is not documented.
> * A single attribute can be instantiated multiple times, overwriting the
>    shared size field.
> * It prevents the structure to be moved to read-only memory.
>
> Introduce a new dedicated callback to calculate the size of the
> attribute.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>   fs/sysfs/group.c      | 2 ++
>   include/linux/sysfs.h | 8 ++++++++
>   2 files changed, 10 insertions(+)
>
> diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
> index 45b2e92941da1f49dcc71af3781317c61480c956..8b01a7eda5fb3239e1383724=
17d01967c7a3f122 100644
> --- a/fs/sysfs/group.c
> +++ b/fs/sysfs/group.c
> @@ -98,6 +98,8 @@ static int create_files(struct kernfs_node *parent, st=
ruct kobject *kobj,
>   				if (!mode)
>   					continue;
>   			}
> +			if (grp->bin_size)
> +				size =3D grp->bin_size(kobj, *bin_attr, i);
>
>   			WARN(mode & ~(SYSFS_PREALLOC | 0664),
>   			     "Attribute %s: Invalid permissions 0%o\n",
> diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> index c4e64dc112063f7cb89bf66059d0338716089e87..4746cccb95898b24df6f53de=
9421ea7649b5568f 100644
> --- a/include/linux/sysfs.h
> +++ b/include/linux/sysfs.h
> @@ -87,6 +87,11 @@ do {							\
>    *		SYSFS_GROUP_VISIBLE() when assigning this callback to
>    *		specify separate _group_visible() and _attr_visible()
>    *		handlers.
> + * @bin_size:
> + *		Optional: Function to return the size of a binary attribute
> + *		of the group. Will be called repeatedly for each binary
> + *		attribute in the group. Overwrites the size field embedded
> + *		inside the attribute itself.
>    * @attrs:	Pointer to NULL terminated list of attributes.
>    * @bin_attrs:	Pointer to NULL terminated list of binary attributes.
>    *		Either attrs or bin_attrs or both must be provided.
> @@ -97,6 +102,9 @@ struct attribute_group {
>   					      struct attribute *, int);
>   	umode_t			(*is_bin_visible)(struct kobject *,
>   						  struct bin_attribute *, int);
> +	size_t			(*bin_size)(struct kobject *,
> +					    const struct bin_attribute *,
> +					    int);
>   	struct attribute	**attrs;
>   	struct bin_attribute	**bin_attrs;
>   };
>

