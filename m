Return-Path: <linuxppc-dev+bounces-5908-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF26A2B135
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2025 19:35:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ypm433Nkxz30MM;
	Fri,  7 Feb 2025 05:34:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738866899;
	cv=none; b=ClHVK+iTemLWTeZXI+VlQoRhovKn9tlmZxwboVpmqblGsJRWAZ4skBrmQE7pxF+1hpPKw1U+ZSxElC0hn9bwcZQAUhgp6DQedANW8W05HCcIArK2qMOrGCsTCY9BdQt7QDl3//w6iY3zBhSXG1o5ztXs27kZ118mTvOTV17GhxRTG3k8u2uPzE9YLDZltYqz+EkuutlIpg7WSktr4UDlum4WcaWPJdVyz3DoJ+YOCvpd+va/8Op5an8LSFcN5MpmF4ma0Q/l07jbh39ecOwI2ALgOlZs8q+jEaa53cx5zPjjsiYo7jGsNsa3EV0YeL6iPa5Fxf9nGW5ML9WGl9csYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738866899; c=relaxed/relaxed;
	bh=WIOJaZaN91s6rJoVqS0R08+AZFYikS1L/ppYMG2qdL0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=FGrJNxCAg3jTTT+gV0/MnNjE07XlNGroBP+Ef4YxMegYd3aiTNzi7m8755WtzpDM4+e1Op+bpngRn+6RAK/qqFjz+wAHFOUP4nOPL6qZV3d3NZERoQnW69rbNXih//B8vsCIA7fdLDJDf4mVNDVyi/RJ7J12K9idpZ0s9Y+sOL/9/M8j6YE7OJDA4Dzdm3s7QlGtrNf1a2J7wN6dsyeCQBEaU6o4UlHgNSWIMAViD7Ub88I8kcu3u5rycBK6ovTIsK12H7c1LJAaMKYG5hg3JQSuFfjC8o+kwMXRggj8rVy+jf1DVLZGb1LDsM4poOAcvoviK712cYu2JeQF/AXSKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UtzAsVPc; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UtzAsVPc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ypm423M5tz30Lt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 05:34:58 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516ESLZf009658;
	Thu, 6 Feb 2025 18:34:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=WIOJaZ
	aN91s6rJoVqS0R08+AZFYikS1L/ppYMG2qdL0=; b=UtzAsVPcLGq3JSFOJjrGns
	J1LtD6CjgvH5tNOctg9pFtxwR+kHX7EtKqhKBjp2kvEC6zS++e18p/Vt/qsrPMOn
	agwo92zsD+e/1+jXYm5q6tb8XURnPTJauWB0vrOS4pXITB4mu1X9cEKBZcfG5lgO
	jtTZnyf9s6RC5WoQOcJ9HXp8fwwAtqw9Ydjfr4K2VAXalAVJBB8fRVohk2QR9nrB
	BG5n87AiHRKe1k5Lp/V4HZ2Tt9HKGNqcfflKUsoBKU0A4mpXZ89z+p7sh861B7TU
	6ni+Tm7Td08oKT+9/7xToIjVNcYGe6dSD/1M2LccV6OJq+rzrybn/XHXOXzjd+fA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44mk5a4xhd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 18:34:49 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 516IUP53027964;
	Thu, 6 Feb 2025 18:34:49 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44mk5a4xh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 18:34:49 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 516FPUJw006516;
	Thu, 6 Feb 2025 18:34:48 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44hyekqmrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 18:34:48 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 516IYiQA58196414
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 18:34:44 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5257E58058;
	Thu,  6 Feb 2025 18:34:44 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89C3B58057;
	Thu,  6 Feb 2025 18:34:43 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com (unknown [9.61.90.73])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Feb 2025 18:34:43 +0000 (GMT)
Message-ID: <63702395ffbbb9362a7290dc87f5504969c1a67e.camel@linux.ibm.com>
Subject: Re: [PATCH v2 6/6] powerpc/pseries: Add papr-platform-dump
 character driver for dump retrieval
From: Haren Myneni <haren@linux.ibm.com>
To: Michal =?ISO-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com
Date: Thu, 06 Feb 2025 10:34:42 -0800
In-Reply-To: <Z6TV8q-IsJ5XGOgN@kitsune.suse.cz>
References: <20250111003010.2147021-1-haren@linux.ibm.com>
	 <20250111003010.2147021-7-haren@linux.ibm.com>
	 <Z6N1pDdLbcFXg3bi@kitsune.suse.cz>
	 <d9341cf39ff817e7c1a47f0f793ac6e61dd1d2fc.camel@linux.ibm.com>
	 <Z6R-WEfBCBpMQpey@kitsune.suse.cz>
	 <9a1b6a0accb80b2824037f93ffb120a3aabd02a5.camel@linux.ibm.com>
	 <Z6TV8q-IsJ5XGOgN@kitsune.suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-27.el8_10) 
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
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: C86_I1UozarPMqtFkOXn1uYrZeXh3fL2
X-Proofpoint-ORIG-GUID: X6_tHryD5zRGaqJKpmZ0f_egH88dABNk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_05,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060148
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 2025-02-06 at 16:32 +0100, Michal Suchánek wrote:
> On Thu, Feb 06, 2025 at 07:28:14AM -0800, Haren Myneni wrote:
> > On Thu, 2025-02-06 at 10:18 +0100, Michal Suchánek wrote:
> > > On Wed, Feb 05, 2025 at 11:51:19PM -0800, Haren Myneni wrote:
> > > > On Wed, 2025-02-05 at 15:28 +0100, Michal Suchánek wrote:
> > > > > Hello,
> > > > > 
> > > > > thanks for working on this!
> > > > > 
> > > > > I see in thes version you ended up reusing the existing RTAS
> > > > > call
> > > > > code
> > > > > which looks better.
> > > > > 
> > > > > From the past discussion it sounds like the get-indices call
> > > > > can
> > > > > list
> > > > > the available dumps, and I do not see this connection
> > > > > documented.
> > > > > 
> > > > > Also the part about it not being used in practice by the
> > > > > service
> > > > > that
> > > > > retrieves the dumps because it gets a message from the
> > > > > hypervisor
> > > > > with
> > > > > the dump id when a dump is available.
> > > > 
> > > > ibm,get-indices is used to obtain data based on indicator and
> > > > sensor,
> > > > not related to platform dump. ibm,platform-dump is used only on
> > > > non-HMC 
> > > > based systems and BMC interface initiates manually to save the
> > > > dump
> > > > on
> > > > tne partition. Sorry in case caused confusion in the previous
> > > > discussion.
> > > > 
> > > > > On Fri, Jan 10, 2025 at 04:30:08PM -0800, Haren Myneni wrote:
> > > > > > ibm,platform-dump RTAS call in combination with writable
> > > > > > mapping
> > > > > > /dev/mem is issued to collect platform dump from the
> > > > > > hypervisor
> > > > > > and may need multiple calls to get the complete dump. The
> > > > > > current
> > > > > > implementation uses rtas_platform_dump() API provided by
> > > > > > librtas
> > > > > > library to issue these RTAS calls. But /dev/mem access by
> > > > > > the
> > > > > > user space is prohibited under system lockdown.
> > > > > > 
> > > > > > The solution should be to restrict access to RTAS function
> > > > > > in
> > > > > > user
> > > > > > space and provide kernel interfaces to collect dump. This
> > > > > > patch
> > > > > > adds papr-platform-dump character driver and expose
> > > > > > standard
> > > > > > interfaces such as open / ioctl/ read to user space in ways
> > > > > > that
> > > > > > are compatible with lockdown.
> > > > > > 
> > > > > > PAPR (7.3.3.4.1 ibm,platform-dump) provides a method to
> > > > > > obtain
> > > > > > the complete dump:
> > > > > > - Each dump will be identified by ID called dump tag.
> > > > > > - A sequence of RTAS calls have to be issued until retrieve
> > > > > > the
> > > > > >   complete dump. The hypervisor expects the first RTAS call
> > > > > > with
> > > > > >   the sequence 0 and the subsequent calls with the sequence
> > > > > >   number returned from the previous calls.
> > > > > > - The hypervisor returns "dump complete" status once the
> > > > > > complete
> > > > > >   dump is retrieved. But expects one more RTAS call from
> > > > > > the
> > > > > >   partition with the NULL buffer to invalidate dump which
> > > > > > means
> > > > > >   the dump will be removed in the hypervisor.
> > > > > > - Sequence of calls are allowed with different dump IDs at
> > > > > > the
> > > > > >   same time but not with the same dump ID.
> > > > > > 
> > > > > > Expose these interfaces to user space with a /dev/papr-
> > > > > > platform-
> > > > > > dump
> > > > > > character device using the following programming model:
> > > > > > 
> > > > > >    int devfd = open("/dev/papr-platform-dump", O_RDONLY);
> > > > > >    int fd =
> > > > > > ioctl(devfd,PAPR_PLATFORM_DUMP_IOC_CREATE_HANDLE,
> > > > > > &dump_id)
> > > > > > 	- Restrict user space to access with the same dump ID.
> > > > > >           Typically we do not expect user space requests
> > > > > > the
> > > > > > dump
> > > > > >           again for the same dump ID.
> > > > > >    char *buf = malloc(size);
> > > > > >    length = read(fd, buf, size);
> > > > > >         - size should be minimum 1K based on PAPR and  <=
> > > > > > 4K
> > > > > > based
> > > > > >           on RTAS work area size. It will be restrict to
> > > > > > RTAS
> > > > > > work
> > > > > >           area size. Using 4K work area based on the
> > > > > > current
> > > > > >           implementation in librtas library
> > > > > >         - Each read call issue RTAS call to get the data
> > > > > > based
> > > > > > on
> > > > > >           the size requirement and returns bytes returned
> > > > > > from
> > > > > > the
> > > > > >           hypervisor
> > > > > >         - If the previous call returns dump complete
> > > > > > status,
> > > > > > the
> > > > > >           next read returns 0 like EOF.
> > > > > >    ret = ioctl(PAPR_PLATFORM_DUMP_IOC_INVALIDATE, &dump_id)
> > > > > > 	- RTAS call with NULL buffer to invalidates the dump.
> > > > > > 
> > > > > > The read API should use the file descriptor obtained from
> > > > > > ioctl
> > > > > > based on dump ID so that gets dump contents for the
> > > > > > corresponding
> > > > > > dump ID. Implemented support in librtas
> > > > > > (rtas_platform_dump())
> > > > > > for
> > > > > > this new ABI to support system lockdown.
> > > > > > 
> > > > > > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > > > > > ---
> > > > > >  .../include/uapi/asm/papr-platform-dump.h     |  15 +
> > > > > >  arch/powerpc/platforms/pseries/Makefile       |   1 +
> > > > > >  .../platforms/pseries/papr-platform-dump.c    | 408
> > > > > > ++++++++++++++++++
> > > > > >  3 files changed, 424 insertions(+)
> > > > > >  create mode 100644 arch/powerpc/include/uapi/asm/papr-
> > > > > > platform-
> > > > > > dump.h
> > > > > >  create mode 100644 arch/powerpc/platforms/pseries/papr-
> > > > > > platform-
> > > > > > dump.c
> > > > > > 
> > > > > > diff --git a/arch/powerpc/include/uapi/asm/papr-platform-
> > > > > > dump.h
> > > > > > b/arch/powerpc/include/uapi/asm/papr-platform-dump.h
> > > > > > new file mode 100644
> > > > > > index 000000000000..3a0f152e3ce8
> > > > > > --- /dev/null
> > > > > > +++ b/arch/powerpc/include/uapi/asm/papr-platform-dump.h
> > > > > > @@ -0,0 +1,15 @@
> > > > > > +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-
> > > > > > note */
> > > > > > +#ifndef _UAPI_PAPR_PLATFORM_DUMP_H_
> > > > > > +#define _UAPI_PAPR_PLATFORM_DUMP_H_
> > > > > > +
> > > > > > +#include <asm/ioctl.h>
> > > > > > +#include <asm/papr-miscdev.h>
> > > > > > +
> > > > > > +/*
> > > > > > + * ioctl for /dev/papr-platform-dump. Returns a VPD handle
> > > > > > fd
> > > > > > corresponding to
> > > > > > + * the location code.
> > > > > > + */
> > > > > > +#define PAPR_PLATFORM_DUMP_IOC_CREATE_HANDLE
> > > > > > _IOW(PAPR_MISCDEV_IOC_ID, 6, __u64)
> > > > > > +#define
> > > > > > PAPR_PLATFORM_DUMP_IOC_INVALIDATE    _IOW(PAPR_MISCDEV_IOC_
> > > > > > ID,
> > > > > > 7,
> > > > > > __u64)
> > > > > > +
> > > > > > +#endif /* _UAPI_PAPR_PLATFORM_DUMP_H_ */
> > > > > > diff --git a/arch/powerpc/platforms/pseries/Makefile
> > > > > > b/arch/powerpc/platforms/pseries/Makefile
> > > > > > index e1db61877bb9..c82c94e0a73c 100644
> > > > > > --- a/arch/powerpc/platforms/pseries/Makefile
> > > > > > +++ b/arch/powerpc/platforms/pseries/Makefile
> > > > > > @@ -4,6 +4,7 @@ ccflags-$(CONFIG_PPC_PSERIES_DEBUG)	+=
> > > > > > -DDEBUG
> > > > > >  obj-y			:= lpar.o hvCall.o nvram.o
> > > > > > reconfig.o \
> > > > > >  			   of_helpers.o rtas-work-area.o papr-
> > > > > > sysparm.o 
> > > > > > \
> > > > > >  			   papr-rtas-common.o papr-vpd.o papr-
> > > > > > indices.o 
> > > > > > \
> > > > > > +			   papr-platform-dump.o \
> > > > > >  			   setup.o iommu.o event_sources.o
> > > > > > ras.o \
> > > > > >  			   firmware.o power.o dlpar.o
> > > > > > mobility.o rng.o
> > > > > > \
> > > > > >  			   pci.o pci_dlpar.o eeh_pseries.o
> > > > > > msi.o \
> > > > > > diff --git a/arch/powerpc/platforms/pseries/papr-platform-
> > > > > > dump.c
> > > > > > b/arch/powerpc/platforms/pseries/papr-platform-dump.c
> > > > > > new file mode 100644
> > > > > > index 000000000000..13a418d7c37e
> > > > > > --- /dev/null
> > > > > > +++ b/arch/powerpc/platforms/pseries/papr-platform-dump.c
> > > > > > @@ -0,0 +1,408 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > > +
> > > > > > +#define pr_fmt(fmt) "papr-platform-dump: " fmt
> > > > > > +
> > > > > > +#include <linux/anon_inodes.h>
> > > > > > +#include <linux/file.h>
> > > > > > +#include <linux/fs.h>
> > > > > > +#include <linux/init.h>
> > > > > > +#include <linux/kernel.h>
> > > > > > +#include <linux/miscdevice.h>
> > > > > > +#include <asm/machdep.h>
> > > > > > +#include <asm/rtas-work-area.h>
> > > > > > +#include <asm/rtas.h>
> > > > > > +#include <uapi/asm/papr-platform-dump.h>
> > > > > > +
> > > > > > +/*
> > > > > > + * Function-specific return values for ibm,platform-dump,
> > > > > > derived
> > > > > > from
> > > > > > + * PAPR+ v2.13 7.3.3.4.1 "ibm,platform-dump RTAS Call".
> > > > > > + */
> > > > > > +#define	RTAS_IBM_PLATFORM_DUMP_COMPLETE	0	/*
> > > > > > Complete
> > > > > > dump retrieved. */
> > > > > > +#define	RTAS_IBM_PLATFORM_DUMP_CONTINUE	1	/*
> > > > > > Continue
> > > > > > dump */
> > > > > > +#define	RTAS_NOT_AUTHORIZED		-9002	/* Not
> > > > > > Authorized
> > > > > > */
> > > > > > +
> > > > > > +#define	RTAS_IBM_PLATFORM_DUMP_START	2 /* Linux
> > > > > > status
> > > > > > to start dump */
> > > > > > +
> > > > > > +/**
> > > > > > + * struct ibm_platform_dump_params - Parameters (in and
> > > > > > out)
> > > > > > for
> > > > > > +
> > > > > > *                                              ibm,platform
> > > > > > -
> > > > > > dump
> > > > > > + * @work_area:		In: work area buffer for
> > > > > > results.
> > > > > > + * @buf_length:		In: work area buffer length in
> > > > > > bytes
> > > > > > + * @dump_tag_hi:	In: Most-significant 32 bits of a
> > > > > > Dump_Tag
> > > > > > representing
> > > > > > + *                      an id of the dump being processed.
> > > > > > + * @dump_tag_lo:	In: Least-significant 32 bits of a
> > > > > > Dump_Tag
> > > > > > representing
> > > > > > + *                      an id of the dump being processed.
> > > > > > + * @sequence_hi:	In: Sequence number in most-
> > > > > > significant 
> > > > > > 32
> > > > > > bits.
> > > > > > + *                      Out: Next sequence number in most-
> > > > > > significant 32 bits.
> > > > > > + * @sequence_lo:	In: Sequence number in Least-
> > > > > > significant 32
> > > > > > bits
> > > > > > + *                      Out: Next sequence number in
> > > > > > Least-
> > > > > > significant 32 bits.
> > > > > > + * @bytes_ret_hi:	Out: Bytes written in most-significant
> > > > > > 32 bits.
> > > > > > + * @bytes_ret_lo:	Out: Bytes written in Least-
> > > > > > significant 
> > > > > > 32
> > > > > > bits.
> > > > > > + * @status:		Out: RTAS call status.
> > > > > > + * @list:		Maintain the list of dumps are in
> > > > > > progress. Can
> > > > > > + *                      retrieve multiple dumps with
> > > > > > different
> > > > > > dump IDs at
> > > > > > + *                      the same time but not with the
> > > > > > same
> > > > > > dump
> > > > > > ID. This list
> > > > > > + *                      is used to determine whether the
> > > > > > dump
> > > > > > for
> > > > > > the same ID
> > > > > > + *                      is in progress.
> > > > > > + */
> > > > > > +struct ibm_platform_dump_params {
> > > > > > +	struct rtas_work_area	*work_area;
> > > > > > +	u32			buf_length;
> > > > > > +	u32			dump_tag_hi;
> > > > > > +	u32			dump_tag_lo;
> > > > > > +	u32			sequence_hi;
> > > > > > +	u32			sequence_lo;
> > > > > > +	u32			bytes_ret_hi;
> > > > > > +	u32			bytes_ret_lo;
> > > > > > +	s32			status;
> > > > > > +	struct list_head	list;
> > > > > > +};
> > > > > > +
> > > > > > +/*
> > > > > > + * Multiple dumps with different dump IDs can be retrieved
> > > > > > at
> > > > > > the
> > > > > > same
> > > > > > + * time, but not with dame dump ID.
> > > > > > platform_dump_list_mutex
> > > > > > and
> > > > > > + * platform_dump_list are used to prevent this behavior.
> > > > > > + */
> > > > > > +static DEFINE_MUTEX(platform_dump_list_mutex);
> > > > > > +static LIST_HEAD(platform_dump_list);
> > > > > > +
> > > > > > +/**
> > > > > > + * rtas_ibm_platform_dump() - Call ibm,platform-dump to
> > > > > > fill a
> > > > > > work area
> > > > > > + * buffer.
> > > > > > + * @params: See &struct ibm_platform_dump_params.
> > > > > > + * @buf_addr: Address of dump buffer (work_area)
> > > > > > + * @buf_length: Length of the buffer in bytes (min. 1024)
> > > > > > + *
> > > > > > + * Calls ibm,platform-dump until it errors or successfully
> > > > > > deposits data
> > > > > > + * into the supplied work area. Handles RTAS retry
> > > > > > statuses.
> > > > > > Maps
> > > > > > RTAS
> > > > > > + * error statuses to reasonable errno values.
> > > > > > + *
> > > > > > + * Can request multiple dumps with different dump IDs at
> > > > > > the
> > > > > > same
> > > > > > time,
> > > > > > + * but not with the same dump ID which is prevented with
> > > > > > the
> > > > > > check
> > > > > > in
> > > > > > + * the ioctl code (papr_platform_dump_create_handle()).
> > > > > > + *
> > > > > > + * The caller should inspect @params.status to determine
> > > > > > whether
> > > > > > more
> > > > > > + * calls are needed to complete the sequence.
> > > > > > + *
> > > > > > + * Context: May sleep.
> > > > > > + * Return: -ve on error, 0 for dump complete and 1 for
> > > > > > continue
> > > > > > dump
> > > > > > + */
> > > > > > +static int rtas_ibm_platform_dump(struct
> > > > > > ibm_platform_dump_params
> > > > > > *params,
> > > > > > +				phys_addr_t buf_addr, u32
> > > > > > buf_length)
> > > > > > +{
> > > > > > +	u32 rets[4];
> > > > > > +	s32 fwrc;
> > > > > > +	int ret = 0;
> > > > > > +
> > > > > > +	do {
> > > > > > +		fwrc =
> > > > > > rtas_call(rtas_function_token(RTAS_FN_IBM_PLATFORM_DUMP),
> > > > > > +				6, 5,
> > > > > > +				rets,
> > > > > > +				params->dump_tag_hi,
> > > > > > +				params->dump_tag_lo,
> > > > > > +				params->sequence_hi,
> > > > > > +				params->sequence_lo,
> > > > > > +				buf_addr,
> > > > > > +				buf_length);
> > > > > > +	} while (rtas_busy_delay(fwrc));
> > > > > > +
> > > > > > +	switch (fwrc) {
> > > > > > +	case RTAS_HARDWARE_ERROR:
> > > > > > +		ret = -EIO;
> > > > > > +		break;
> > > > > > +	case RTAS_NOT_AUTHORIZED:
> > > > > > +		ret = -EPERM;
> > > > > > +		break;
> > > > > > +	case RTAS_IBM_PLATFORM_DUMP_CONTINUE:
> > > > > > +	case RTAS_IBM_PLATFORM_DUMP_COMPLETE:
> > > > > > +		params->sequence_hi = rets[0];
> > > > > > +		params->sequence_lo = rets[1];
> > > > > > +		params->bytes_ret_hi = rets[2];
> > > > > > +		params->bytes_ret_lo = rets[3];
> > > > > > +		break;
> > > > > > +	default:
> > > > > > +		ret = -EIO;
> > > > > > +		pr_err_ratelimited("unexpected ibm,platform-
> > > > > > dump status
> > > > > > %d\n",
> > > > > > +				fwrc);
> > > > > > +		break;
> > > > > > +	}
> > > > > > +
> > > > > > +	params->status = fwrc;
> > > > > > +	return ret;
> > > > > > +}
> > > > > > +
> > > > > > +/*
> > > > > > + * Platform dump is used with multiple RTAS calls to
> > > > > > retrieve
> > > > > > the
> > > > > > + * complete dump for the provided dump ID. Once the
> > > > > > complete
> > > > > > dump
> > > > > > is
> > > > > > + * retrieved, the hypervisor returns dump complete status
> > > > > > (0)
> > > > > > for
> > > > > > the
> > > > > > + * last RTAS call and expects the caller issues one more
> > > > > > call
> > > > > > with
> > > > > > + * NULL buffer to invalidate the dump so that the
> > > > > > hypervisor
> > > > > > can
> > > > > > remove
> > > > > > + * the dump.
> > > > > > + *
> > > > > > + * After the specific dump is invalidated in the
> > > > > > hypervisor,
> > > > > > expect the
> > > > > > + * dump complete status for the new sequence - the user
> > > > > > space
> > > > > > initiates
> > > > > > + * new request for the same dump ID.
> > > > > > + */
> > > > > > +static ssize_t papr_platform_dump_handle_read(struct file
> > > > > > *file,
> > > > > > +		char __user *buf, size_t size, loff_t *off)
> > > > > > +{
> > > > > > +	struct ibm_platform_dump_params *params = file-
> > > > > > > private_data;
> > > > > > +	u64 total_bytes;
> > > > > > +	s32 fwrc;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * Dump already completed with the previous read calls.
> > > > > > +	 * In case if the user space issues further reads,
> > > > > > returns
> > > > > > +	 * -EINVAL.
> > > > > > +	 */
> > > > > > +	if (!params->buf_length) {
> > > > > > +		pr_warn_once("Platform dump completed for dump
> > > > > > ID
> > > > > > %llu\n",
> > > > > > +			(u64) (((u64)params->dump_tag_hi << 32)
> > > > > > +				params->dump_tag_lo));
> > > > > > +		return -EINVAL;
> > > > > > +	}
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * The hypervisor returns status 0 if no more data
> > > > > > available to
> > > > > > +	 * download. The dump will be invalidated with ioctl
> > > > > > (see
> > > > > > below).
> > > > > > +	 */
> > > > > > +	if (params->status == RTAS_IBM_PLATFORM_DUMP_COMPLETE)
> > > > > > {
> > > > > > +		params->buf_length = 0;
> > > > > > +		/*
> > > > > > +		 * Returns 0 to the user space so that user
> > > > > > +		 * space read stops.
> > > > > > +		 */
> > > > > > +		return 0;
> > > > > > +	}
> > > > > > +
> > > > > > +	if (size < SZ_1K) {
> > > > > > +		pr_err_once("Buffer length should be minimum
> > > > > > 1024
> > > > > > bytes\n");
> > > > > > +		return -EINVAL;
> > > > > > +	} else if (size > params->buf_length) {
> > > > > > +		/*
> > > > > > +		 * Allocate 4K work area. So if the user
> > > > > > requests > 4K,
> > > > > > +		 * resize the buffer length.
> > > > > > +		 */
> > > > > > +		size = params->buf_length;
> > > > > > +	}
> > > > > > +
> > > > > > +	fwrc = rtas_ibm_platform_dump(params,
> > > > > > +			rtas_work_area_phys(params->work_area),
> > > > > > +			size);
> > > > > > +	if (fwrc < 0)
> > > > > > +		return fwrc;
> > > > > > +
> > > > > > +	total_bytes = (u64) (((u64)params->bytes_ret_hi << 32)
> > > > > > +			params->bytes_ret_lo);
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * Kernel or firmware bug, do not continue.
> > > > > > +	 */
> > > > > > +	if (WARN(total_bytes > size, "possible write beyond end
> > > > > > of work
> > > > > > area"))
> > > > > > +		return -EFAULT;
> > > > > > +
> > > > > > +	if (copy_to_user(buf, rtas_work_area_raw_buf(params-
> > > > > > > work_area),
> > > > > > +			total_bytes))
> > > > > > +		return -EFAULT;
> > > > > > +
> > > > > > +	return total_bytes;
> > > > > > +}
> > > > > > +
> > > > > > +static int papr_platform_dump_handle_release(struct inode
> > > > > > *inode,
> > > > > > +					struct file *file)
> > > > > > +{
> > > > > > +	struct ibm_platform_dump_params *params = file-
> > > > > > > private_data;
> > > > > > +
> > > > > > +	if (params->work_area)
> > > > > > +		rtas_work_area_free(params->work_area);
> > > > > > +
> > > > > > +	mutex_lock(&platform_dump_list_mutex);
> > > > > > +	list_del(&params->list);
> > > > > > +	mutex_unlock(&platform_dump_list_mutex);
> > > > > > +
> > > > > > +	kfree(params);
> > > > > > +	file->private_data = NULL;
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +
> > > > > > +/*
> > > > > > + * This ioctl is used to invalidate the dump assuming the
> > > > > > user
> > > > > > space
> > > > > > + * issue this ioctl after obtain the complete dump.
> > > > > > + * Issue the last RTAS call with NULL buffer to invalidate
> > > > > > the
> > > > > > dump
> > > > > > + * which means dump will be freed in the hypervisor.
> > > > > > + */
> > > > > > +static long papr_platform_dump_invalidate_ioctl(struct
> > > > > > file
> > > > > > *file,
> > > > > > +				unsigned int ioctl, unsigned
> > > > > > long arg)
> > > > > > +{
> > > > > > +	struct ibm_platform_dump_params *params;
> > > > > > +	u64 __user *argp = (void __user *)arg;
> > > > > > +	u64 param_dump_tag, dump_tag;
> > > > > > +
> > > > > > +	if (ioctl != PAPR_PLATFORM_DUMP_IOC_INVALIDATE)
> > > > > > +		return -ENOIOCTLCMD;
> > > > > > +
> > > > > > +	if (get_user(dump_tag, argp))
> > > > > > +		return -EFAULT;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * private_data is freeded during release(), so should
> > > > > > not
> > > > > 			   freed?
> > > > > > +	 * happen.
> > > > > > +	 */
> > > > > > +	if (!file->private_data) {
> > > > > > +		pr_err("No valid FD to invalidate dump for the
> > > > > > ID(%llu)\n",
> > > > > > +				dump_tag);
> > > > > > +		return -EINVAL;
> > > > > > +	}
> > > > > > +
> > > > > > +	params = file->private_data;
> > > > > > +	param_dump_tag = (u64) (((u64)params->dump_tag_hi <<
> > > > > > 32) |
> > > > > > +				params->dump_tag_lo);
> > > > > > +	if (dump_tag != param_dump_tag) {
> > > > > > +		pr_err("Invalid dump ID(%llu) to invalidate
> > > > > > dump\n",
> > > > > > +				dump_tag);
> > > > > > +		return -EINVAL;
> > > > > > +	}
> > > > > > +
> > > > > > +	if (params->status != RTAS_IBM_PLATFORM_DUMP_COMPLETE)
> > > > > > +		pr_warn("Platform dump is not complete, but
> > > > > > requested "
> > > > > > +			"to invalidate dump for ID(%llu)\n",
> > > > > > +			dump_tag);
> > > > > 
> > > > > Not sure if something should be done here or if relying on
> > > > > translation
> > > > > of the error from the RTAS call is advisable.
> > > > 
> > > > This check just diplays message in case if the user initiated
> > > > to
> > > > invalidate the dump without saving it completely. Then
> > > > invalidates
> > > > the
> > > > dump with RTAS call and retuns the RTAS return value. 
> > > > 
> > > > As mentioned above, platform-dump is available only on non-HMC
> > > > based
> > > > systems. So invoke the collection of dump by BMC based
> > > > interface,
> > > > not
> > > > widely used. I can remove this check if preferred.
> > > 
> > > From the previous discussion it sounds like trying to invalidate
> > > the
> > > dump without first reading it in full is an error.
> > 
> > Thanks for your suggestions.
> > 
> > Yes, it was doing as part of read() calls. But explicit ioctl to
> > invalidate here. I was thinking like user space removing FD without
> > reading or writing operation.
> 
> And is it possible to invalidate the dump without reading it fully
> first?
> 
> If not then there is no point trying to do the call that is known to
> fail anyway.

Generally not possible if uses librtas API rtas_platform_dump() which
reads the dump completely and then the application calls this API
explicitly to invalidate the dump (with buffer NULL - as doing in the
current implementation). The current use case is extract_platdump
command (ppc64-diag package)

extract_platdump() {   /* we are not chamging this implementation */
 
status = rtas_platform_dump() - initial call
while !dump_complete {
	status = rtas_platform_dump()
	if (status < 0) failure
	if (status == 0) dump_complete = 1
}

status = rtas_platform_dump() -  to invalidate dump by passing buffer =
NULL

We should not expect using any command other than extract_platdump
since the use case of collecting platform dump is narrow and is only on
non-hmc based systems.

Hence added warning message if the dump is not completely read and
invalidate the dump like removing file by mistake.

But I like your suggestion of returning an error (-EPERM) if not saved
the dump completely.

Thanks
Haren

> 
> Thanks
> 
> Michal
> 
> > > The state to detect this error is tracked which makes it possible
> > > to
> > > produce this warning.
> > > 
> > > Then it's also possible to handle the error without roundtrip to
> > > the
> > > hypervisor.
> > 
> > Do you prefer return en error without invalidating if the dump is
> > not
> > read completely? Sure we can.
> > 
> > if (params->status != RTAS_IBM_PLATFORM_DUMP_COMPLETE) {
> > 	pr_err("Platform dump is not complete, but requested "
> > 		"to invalidate dump for ID(%llu)\n",
> > 		dump_tag);
> > 	return -EPERM;
> > }
> > 
> > Thanks
> > Haren
> > 
> > > Thanks
> > > 
> > > Michal
> > > 
> > > > Thanks
> > > > Haren
> > > > 
> > > > > Thanks
> > > > > 
> > > > > Michal


