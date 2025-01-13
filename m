Return-Path: <linuxppc-dev+bounces-5153-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D44ECA0B943
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 15:19:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWvXQ1jyYz305m;
	Tue, 14 Jan 2025 01:19:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736777974;
	cv=none; b=HVPuvVfx2v1pLMkRDC+wS4dXhEQk1EbaWFMOSSBcHMwksiEwGeaKbcDIr5/MaxbZeOEFIImjOdwv6l6bZg1b037YAj6oIUPfHZdH4ftHaOGUneW0SF3Q+uMmXJitRQz1X7NniSqS6NOZKP+XVq6Mejc0b2/7eUNWscwMrXlehhasm1QF3hrznMtfikBA791+314xVuol5rYOHQ/xWKiVDXEsh4XBDurOy0ZuX+JfebxXJl8aafsZ5e6nXGfBJo5ryCYArcVY5iRH5w7b+ukn3nT+3qyvEbrhaVg8IyJx7WQVhyR0XcwfH2znTQ3D5zxI+pwu3p9wzRp/0SvnQ+qS0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736777974; c=relaxed/relaxed;
	bh=L1Hkahwn3Tu1sVj07GUocAsi8xoUwveZ+BSr9SpV9Ms=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=GGZgXJpymnqxUiKTuRxl8tG/9gwKcKNIspS0WCd+Rj8TQbhXVIEfnKDeTJ+/d6sBD0iBhYrdaMlpuezGnXpamx71NWQfLgiZjhuMYOhg9NODch7nlN5fiNvIMU/x/9N0RBmnORYnZ0Ve54GOJcz0AWngTJDyjospYzTFpRrW+bM4ux3zoxaEzJHs0pbaQU2L2Un3RNpzZV4ti0F6Taq+lQYzNUb2Ux+BiPqQyi4IBVWd6p+80Oxs1jFRGCrMc3gjHVL7IxNWCAMxa3V6S24Qd8Gp2cYktsBnjyGEpMIzAHaQufTu6NBjXFVldM/WkI+W6WV6TjI2aDA7g42TRnQGsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=awnAor2c; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=awnAor2c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWvXP0lf4z305c
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 01:19:32 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D3qM52031739
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 14:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=L1Hkah
	wn3Tu1sVj07GUocAsi8xoUwveZ+BSr9SpV9Ms=; b=awnAor2cGxJNZ+LLwt0ta1
	YxMpqkN6PosW23MJ5CT3SGKtPmC6sNMu7yBLZyqHztLcOwzxFCcn0u5yJIyf4Isv
	iYrr6KqAkeTVqLun/uocyN9ZJCHwhFASNJ5C2D0WbORdUWCYt/GcbHHYDqD0qXw4
	j8B/s62rbokvgBaDiqrbcygrlftg+7o9d3FYPr57piU/FudSNQiKIZtHL1KvD3in
	Z6PuEKPefqWextyvfGvoUCtoKPm16Q4cRuf8PiY1iTmHZZ/rxPDNIZC2EnBuWzoQ
	b1zYW5OcHYtdodfMRt/NS0VerMpEv/+DL4bmbIg9FPV00l0Iy9Co7YjfkOEtECCg
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 444uac2cny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 14:19:29 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50DC0l0Y002738
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 14:19:27 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4443bxxnh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 14:19:27 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50DEJN9718547152
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 14:19:24 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCD3F2004D;
	Mon, 13 Jan 2025 14:19:23 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 431C520040;
	Mon, 13 Jan 2025 14:19:21 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.243.204])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 13 Jan 2025 14:19:20 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH v6 2/3] powerpc/pseries: Export hardware trace macro dump
 via debugfs
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20250113104015.290566-2-adubey@linux.ibm.com>
Date: Mon, 13 Jan 2025 19:49:06 +0530
Cc: maddy@linux.ibm.com, atrajeev@linux.ibm.com, hbathini@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <85376DB1-B2EA-4E12-A2C5-CF24BAA50995@linux.vnet.ibm.com>
References: <20250113104015.290566-1-adubey@linux.ibm.com>
 <20250113104015.290566-2-adubey@linux.ibm.com>
To: adubey@linux.ibm.com
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KBGl0zJ-hHbDmrVXs15de5t8aY12ExFW
X-Proofpoint-ORIG-GUID: KBGl0zJ-hHbDmrVXs15de5t8aY12ExFW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130118
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 13 Jan 2025, at 4:10=E2=80=AFPM, adubey@linux.ibm.com wrote:
>=20
> From: Abhishek Dubey <adubey@linux.ibm.com>
>=20
> This patch adds debugfs interface to export Hardware Trace Macro (HTM)
> function data in a LPAR. New hypervisor call "H_HTM" has been
> defined to setup, configure, control and dump the HTM data.
> This patch supports only dumping of HTM data in a LPAR.
> New debugfs folder called "htmdump" has been added under
> /sys/kernel/debug/arch path which contains files need to
> pass required parameters for the H_HTM dump function. New Kconfig
> option called "CONFIG_HTMDUMP" is added in platform/pseries
> for the same.
>=20
> With this module loaded, list of files in debugfs path
>=20
> /sys/kernel/debug/powerpc/htmdump
> coreindexonchip  htmtype  nodalchipindex  nodeindex  trace
>=20
> Changelog:
>  v5->v6 : Header file inclusion
>  v4->v5 : Removed offset from available calculation, as offset is
>           always zero leading to buffur size reads.
>           Edited comments and commit message
>=20
> v3 patch:
>  =
https://lore.kernel.org/linuxppc-dev/20240828085223.42177-2-maddy@linux.ib=
m.com/

Please move the Changelog and v3 patch reference to below where it =
won=E2=80=99t come as part of git log

>=20
> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
> Co-developed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> =E2=80=94

Here we can add the changelog.

With that change,
Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Thanks
Athira
> arch/powerpc/platforms/pseries/Kconfig   |   9 ++
> arch/powerpc/platforms/pseries/Makefile  |   1 +
> arch/powerpc/platforms/pseries/htmdump.c | 121 +++++++++++++++++++++++
> 3 files changed, 131 insertions(+)
> create mode 100644 arch/powerpc/platforms/pseries/htmdump.c
>=20
> diff --git a/arch/powerpc/platforms/pseries/Kconfig =
b/arch/powerpc/platforms/pseries/Kconfig
> index 42fc66e97539..b839e87408aa 100644
> --- a/arch/powerpc/platforms/pseries/Kconfig
> +++ b/arch/powerpc/platforms/pseries/Kconfig
> @@ -128,6 +128,15 @@ config CMM
>  will be reused for other LPARs. The interface allows firmware to
>  balance memory across many LPARs.
>=20
> +config HTMDUMP
> + tristate "PowerVM data dumper"
> + depends on PPC_PSERIES && DEBUG_FS
> + default m
> + help
> +  Select this option, if you want to enable the kernel debugfs
> +  interface to dump the Hardware Trace Macro (HTM) function data
> +  in the LPAR.
> +
> config HV_PERF_CTRS
> bool "Hypervisor supplied PMU events (24x7 & GPCI)"
> default y
> diff --git a/arch/powerpc/platforms/pseries/Makefile =
b/arch/powerpc/platforms/pseries/Makefile
> index 7bf506f6b8c8..3f3e3492e436 100644
> --- a/arch/powerpc/platforms/pseries/Makefile
> +++ b/arch/powerpc/platforms/pseries/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_HVC_CONSOLE) +=3D hvconsole.o
> obj-$(CONFIG_HVCS) +=3D hvcserver.o
> obj-$(CONFIG_HCALL_STATS) +=3D hvCall_inst.o
> obj-$(CONFIG_CMM) +=3D cmm.o
> +obj-$(CONFIG_HTMDUMP) +=3D htmdump.o
> obj-$(CONFIG_IO_EVENT_IRQ) +=3D io_event_irq.o
> obj-$(CONFIG_LPARCFG) +=3D lparcfg.o
> obj-$(CONFIG_IBMVIO) +=3D vio.o
> diff --git a/arch/powerpc/platforms/pseries/htmdump.c =
b/arch/powerpc/platforms/pseries/htmdump.c
> new file mode 100644
> index 000000000000..57fc1700f604
> --- /dev/null
> +++ b/arch/powerpc/platforms/pseries/htmdump.c
> @@ -0,0 +1,121 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) IBM Corporation, 2024
> + */
> +
> +#define pr_fmt(fmt) "htmdump: " fmt
> +
> +#include <linux/debugfs.h>
> +#include <linux/module.h>
> +#include <asm/io.h>
> +#include <asm/machdep.h>
> +#include <asm/plpar_wrappers.h>
> +
> +static void *htm_buf;
> +static u32 nodeindex;
> +static u32 nodalchipindex;
> +static u32 coreindexonchip;
> +static u32 htmtype;
> +static struct dentry *htmdump_debugfs_dir;
> +
> +static ssize_t htmdump_read(struct file *filp, char __user *ubuf,
> +     size_t count, loff_t *ppos)
> +{
> + void *htm_buf =3D filp->private_data;
> + unsigned long page, read_size, available;
> + loff_t offset;
> + long rc;
> +
> + page =3D ALIGN_DOWN(*ppos, PAGE_SIZE);
> + offset =3D (*ppos) % PAGE_SIZE;
> +
> + rc =3D htm_get_dump_hardware(nodeindex, nodalchipindex, =
coreindexonchip,
> +   htmtype, virt_to_phys(htm_buf), PAGE_SIZE, page);
> +
> + switch (rc) {
> + case H_SUCCESS:
> + /* H_PARTIAL for the case where all available data can't be
> + * returned due to buffer size constraint.
> + */
> + case H_PARTIAL:
> + break;
> + /* H_NOT_AVAILABLE indicates reading from an offset outside the =
range,
> + * i.e. past end of file.
> + */
> + case H_NOT_AVAILABLE:
> + return 0;
> + case H_BUSY:
> + case H_LONG_BUSY_ORDER_1_MSEC:
> + case H_LONG_BUSY_ORDER_10_MSEC:
> + case H_LONG_BUSY_ORDER_100_MSEC:
> + case H_LONG_BUSY_ORDER_1_SEC:
> + case H_LONG_BUSY_ORDER_10_SEC:
> + case H_LONG_BUSY_ORDER_100_SEC:
> + return -EBUSY;
> + case H_PARAMETER:
> + case H_P2:
> + case H_P3:
> + case H_P4:
> + case H_P5:
> + case H_P6:
> + return -EINVAL;
> + case H_STATE:
> + return -EIO;
> + case H_AUTHORITY:
> + return -EPERM;
> + }
> +
> + available =3D PAGE_SIZE;
> + read_size =3D min(count, available);
> + *ppos +=3D read_size;
> + return simple_read_from_buffer(ubuf, count, &offset, htm_buf, =
available);
> +}
> +
> +static const struct file_operations htmdump_fops =3D {
> + .llseek =3D NULL,
> + .read =3D htmdump_read,
> + .open =3D simple_open,
> +};
> +
> +static int htmdump_init_debugfs(void)
> +{
> + htm_buf =3D kmalloc(PAGE_SIZE, GFP_KERNEL);
> + if (!htm_buf) {
> + pr_err("Failed to allocate htmdump buf\n");
> + return -ENOMEM;
> + }
> +
> + htmdump_debugfs_dir =3D debugfs_create_dir("htmdump",
> +  arch_debugfs_dir);
> +
> + debugfs_create_u32("nodeindex", 0600,
> + htmdump_debugfs_dir, &nodeindex);
> + debugfs_create_u32("nodalchipindex", 0600,
> + htmdump_debugfs_dir, &nodalchipindex);
> + debugfs_create_u32("coreindexonchip", 0600,
> + htmdump_debugfs_dir, &coreindexonchip);
> + debugfs_create_u32("htmtype", 0600,
> + htmdump_debugfs_dir, &htmtype);
> + debugfs_create_file("trace", 0400, htmdump_debugfs_dir, htm_buf, =
&htmdump_fops);
> +
> + return 0;
> +}
> +
> +static int __init htmdump_init(void)
> +{
> + if (htmdump_init_debugfs())
> + return -ENOMEM;
> +
> + return 0;
> +}
> +
> +static void __exit htmdump_exit(void)
> +{
> + debugfs_remove_recursive(htmdump_debugfs_dir);
> + kfree(htm_buf);
> +}
> +
> +module_init(htmdump_init);
> +module_exit(htmdump_exit);
> +MODULE_DESCRIPTION("PHYP Hardware Trace Macro (HTM) data dumper");
> +MODULE_LICENSE("GPL");
> --=20
> 2.39.3
>=20


