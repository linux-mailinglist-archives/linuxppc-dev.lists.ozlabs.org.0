Return-Path: <linuxppc-dev+bounces-5892-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF9DA2A2A4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2025 08:51:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YpTnj3YtFz306J;
	Thu,  6 Feb 2025 18:51:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738828297;
	cv=none; b=nsU3aDWyrMl1tzctlLJA/qPVoUWCmEXt2VkoQsxWbPv85j1/xh1SniAmDFnaGhISJFvkUNFmDlJgkjBkdOVBYqyfUVTxp25OyXXp1nfWKKPIxVlFAx65GvI0qHWKn8BlNAL7sascytAbIXUex9uPl637GhQJ4N+EOChB810PDi1ygqT6I6uY2u4j2dTZJ2gspMlB534BCruIXsKY4AM63bfJaBF1uPQ83Tkg7FFIQPv35HofOfMiXw+LQGVfrZs6tSce2NZVZTFdPME743pJpZm7F84WdZpzo2LnxZhCRLLf2ESgAxElhGSrhd6EPgn3607xg1zoL+sM/JFFmBYlCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738828297; c=relaxed/relaxed;
	bh=Hsv6v9bfAOHQdfyZvbvT/6w/W8odBlj0A/8a++6Lx2c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=W5bEud2Dzd4plS9tkCaRuUBIPWFBaRhjKNlviLi6UAvzuQfxRlu67896BDWSvwO0KR83u9ZEAzJuZT5QbvKuHy0khWO52eiVVUyolRvtp+/bWbCuJxJp4NecysnvIyELhSSVNxNey6olvAvGiAPkPRnSsQB8T3AOJzA+TQJDMzif2RA5IqJzsmZLNjpURCo/rN+P/kTNhG0j7TiUD+oH3CnyNCuD8kCiV7zUg96Xv+r2YdPDPmAsgusvCGHNvFupLlvAYKWG8hIkAsHH7iTSHm5myxHBpQOtg8jcGgvWLKVU4XEJE2IESQkqJW8t+qJz9hRO/C+e1CoOlvGEy/8cqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K9D1LnsB; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K9D1LnsB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YpTnh3Mm7z305S
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2025 18:51:35 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5167XnVu006858;
	Thu, 6 Feb 2025 07:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Hsv6v9
	bfAOHQdfyZvbvT/6w/W8odBlj0A/8a++6Lx2c=; b=K9D1LnsBOf2fG0n6u/PcB/
	NxylLDBQqmT7/65CYe57wqRry/54OEw95DoI43kPNB9c7qRIq6GEfe07djRZZrXe
	Tg3Fb9IZ3dlYjo3lP89zEvRrJmzrt2XOVxm+jDtRCWi1nk4T0w6UkL+wCpjyDm9B
	5PWnGpbyvySQ92DP4XG9LuABGI22QB8N1PkybF3MyOPIs88X6+BHfK08M6UTX1u1
	fur0Jg62KaiSqfD6zDcaqZ23rhsJVJX0GZxGDflWvBAU6GVxXGpGMojPQajwnBBe
	zYwiuF6nhUw8UngySpRsYedDJUyJr47fjBhIJ41KjhDcd/KV052MfGpzXZdmEg1w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44mrsp028j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 07:51:26 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5167ldqA003433;
	Thu, 6 Feb 2025 07:51:26 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44mrsp028e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 07:51:26 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5164j1Cu006525;
	Thu, 6 Feb 2025 07:51:25 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44hyekn1wy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 07:51:25 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5167pLLW20251202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 07:51:21 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA6A95804B;
	Thu,  6 Feb 2025 07:51:21 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCFB15805B;
	Thu,  6 Feb 2025 07:51:20 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com (unknown [9.61.90.73])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Feb 2025 07:51:20 +0000 (GMT)
Message-ID: <d9341cf39ff817e7c1a47f0f793ac6e61dd1d2fc.camel@linux.ibm.com>
Subject: Re: [PATCH v2 6/6] powerpc/pseries: Add papr-platform-dump
 character driver for dump retrieval
From: Haren Myneni <haren@linux.ibm.com>
To: Michal =?ISO-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com
Date: Wed, 05 Feb 2025 23:51:19 -0800
In-Reply-To: <Z6N1pDdLbcFXg3bi@kitsune.suse.cz>
References: <20250111003010.2147021-1-haren@linux.ibm.com>
	 <20250111003010.2147021-7-haren@linux.ibm.com>
	 <Z6N1pDdLbcFXg3bi@kitsune.suse.cz>
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
X-Proofpoint-GUID: -1L4-UZ1SaiCpCYpiyxCQ_Pw296EyQTJ
X-Proofpoint-ORIG-GUID: KzYXe24VX0OYS31OytlFEQnh3wF5adzr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502060061
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 2025-02-05 at 15:28 +0100, Michal Suchánek wrote:
> Hello,
> 
> thanks for working on this!
> 
> I see in thes version you ended up reusing the existing RTAS call
> code
> which looks better.
> 
> From the past discussion it sounds like the get-indices call can list
> the available dumps, and I do not see this connection documented.
> 
> Also the part about it not being used in practice by the service that
> retrieves the dumps because it gets a message from the hypervisor
> with
> the dump id when a dump is available.

ibm,get-indices is used to obtain data based on indicator and sensor,
not related to platform dump. ibm,platform-dump is used only on non-HMC 
based systems and BMC interface initiates manually to save the dump on
tne partition. Sorry in case caused confusion in the previous
discussion.

> 
> 
> On Fri, Jan 10, 2025 at 04:30:08PM -0800, Haren Myneni wrote:
> > ibm,platform-dump RTAS call in combination with writable mapping
> > /dev/mem is issued to collect platform dump from the hypervisor
> > and may need multiple calls to get the complete dump. The current
> > implementation uses rtas_platform_dump() API provided by librtas
> > library to issue these RTAS calls. But /dev/mem access by the
> > user space is prohibited under system lockdown.
> > 
> > The solution should be to restrict access to RTAS function in user
> > space and provide kernel interfaces to collect dump. This patch
> > adds papr-platform-dump character driver and expose standard
> > interfaces such as open / ioctl/ read to user space in ways that
> > are compatible with lockdown.
> > 
> > PAPR (7.3.3.4.1 ibm,platform-dump) provides a method to obtain
> > the complete dump:
> > - Each dump will be identified by ID called dump tag.
> > - A sequence of RTAS calls have to be issued until retrieve the
> >   complete dump. The hypervisor expects the first RTAS call with
> >   the sequence 0 and the subsequent calls with the sequence
> >   number returned from the previous calls.
> > - The hypervisor returns "dump complete" status once the complete
> >   dump is retrieved. But expects one more RTAS call from the
> >   partition with the NULL buffer to invalidate dump which means
> >   the dump will be removed in the hypervisor.
> > - Sequence of calls are allowed with different dump IDs at the
> >   same time but not with the same dump ID.
> > 
> > Expose these interfaces to user space with a /dev/papr-platform-
> > dump
> > character device using the following programming model:
> > 
> >    int devfd = open("/dev/papr-platform-dump", O_RDONLY);
> >    int fd = ioctl(devfd,PAPR_PLATFORM_DUMP_IOC_CREATE_HANDLE,
> > &dump_id)
> > 	- Restrict user space to access with the same dump ID.
> >           Typically we do not expect user space requests the dump
> >           again for the same dump ID.
> >    char *buf = malloc(size);
> >    length = read(fd, buf, size);
> >         - size should be minimum 1K based on PAPR and  <= 4K based
> >           on RTAS work area size. It will be restrict to RTAS work
> >           area size. Using 4K work area based on the current
> >           implementation in librtas library
> >         - Each read call issue RTAS call to get the data based on
> >           the size requirement and returns bytes returned from the
> >           hypervisor
> >         - If the previous call returns dump complete status, the
> >           next read returns 0 like EOF.
> >    ret = ioctl(PAPR_PLATFORM_DUMP_IOC_INVALIDATE, &dump_id)
> > 	- RTAS call with NULL buffer to invalidates the dump.
> > 
> > The read API should use the file descriptor obtained from ioctl
> > based on dump ID so that gets dump contents for the corresponding
> > dump ID. Implemented support in librtas (rtas_platform_dump()) for
> > this new ABI to support system lockdown.
> > 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  .../include/uapi/asm/papr-platform-dump.h     |  15 +
> >  arch/powerpc/platforms/pseries/Makefile       |   1 +
> >  .../platforms/pseries/papr-platform-dump.c    | 408
> > ++++++++++++++++++
> >  3 files changed, 424 insertions(+)
> >  create mode 100644 arch/powerpc/include/uapi/asm/papr-platform-
> > dump.h
> >  create mode 100644 arch/powerpc/platforms/pseries/papr-platform-
> > dump.c
> > 
> > diff --git a/arch/powerpc/include/uapi/asm/papr-platform-dump.h
> > b/arch/powerpc/include/uapi/asm/papr-platform-dump.h
> > new file mode 100644
> > index 000000000000..3a0f152e3ce8
> > --- /dev/null
> > +++ b/arch/powerpc/include/uapi/asm/papr-platform-dump.h
> > @@ -0,0 +1,15 @@
> > +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > +#ifndef _UAPI_PAPR_PLATFORM_DUMP_H_
> > +#define _UAPI_PAPR_PLATFORM_DUMP_H_
> > +
> > +#include <asm/ioctl.h>
> > +#include <asm/papr-miscdev.h>
> > +
> > +/*
> > + * ioctl for /dev/papr-platform-dump. Returns a VPD handle fd
> > corresponding to
> > + * the location code.
> > + */
> > +#define PAPR_PLATFORM_DUMP_IOC_CREATE_HANDLE
> > _IOW(PAPR_MISCDEV_IOC_ID, 6, __u64)
> > +#define
> > PAPR_PLATFORM_DUMP_IOC_INVALIDATE    _IOW(PAPR_MISCDEV_IOC_ID, 7,
> > __u64)
> > +
> > +#endif /* _UAPI_PAPR_PLATFORM_DUMP_H_ */
> > diff --git a/arch/powerpc/platforms/pseries/Makefile
> > b/arch/powerpc/platforms/pseries/Makefile
> > index e1db61877bb9..c82c94e0a73c 100644
> > --- a/arch/powerpc/platforms/pseries/Makefile
> > +++ b/arch/powerpc/platforms/pseries/Makefile
> > @@ -4,6 +4,7 @@ ccflags-$(CONFIG_PPC_PSERIES_DEBUG)	+= -DDEBUG
> >  obj-y			:= lpar.o hvCall.o nvram.o reconfig.o \
> >  			   of_helpers.o rtas-work-area.o papr-sysparm.o 
> > \
> >  			   papr-rtas-common.o papr-vpd.o papr-indices.o 
> > \
> > +			   papr-platform-dump.o \
> >  			   setup.o iommu.o event_sources.o ras.o \
> >  			   firmware.o power.o dlpar.o mobility.o rng.o
> > \
> >  			   pci.o pci_dlpar.o eeh_pseries.o msi.o \
> > diff --git a/arch/powerpc/platforms/pseries/papr-platform-dump.c
> > b/arch/powerpc/platforms/pseries/papr-platform-dump.c
> > new file mode 100644
> > index 000000000000..13a418d7c37e
> > --- /dev/null
> > +++ b/arch/powerpc/platforms/pseries/papr-platform-dump.c
> > @@ -0,0 +1,408 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#define pr_fmt(fmt) "papr-platform-dump: " fmt
> > +
> > +#include <linux/anon_inodes.h>
> > +#include <linux/file.h>
> > +#include <linux/fs.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/miscdevice.h>
> > +#include <asm/machdep.h>
> > +#include <asm/rtas-work-area.h>
> > +#include <asm/rtas.h>
> > +#include <uapi/asm/papr-platform-dump.h>
> > +
> > +/*
> > + * Function-specific return values for ibm,platform-dump, derived
> > from
> > + * PAPR+ v2.13 7.3.3.4.1 "ibm,platform-dump RTAS Call".
> > + */
> > +#define	RTAS_IBM_PLATFORM_DUMP_COMPLETE	0	/* Complete
> > dump retrieved. */
> > +#define	RTAS_IBM_PLATFORM_DUMP_CONTINUE	1	/* Continue
> > dump */
> > +#define	RTAS_NOT_AUTHORIZED		-9002	/* Not Authorized
> > */
> > +
> > +#define	RTAS_IBM_PLATFORM_DUMP_START	2 /* Linux status
> > to start dump */
> > +
> > +/**
> > + * struct ibm_platform_dump_params - Parameters (in and out) for
> > + *                                              ibm,platform-dump
> > + * @work_area:		In: work area buffer for results.
> > + * @buf_length:		In: work area buffer length in bytes
> > + * @dump_tag_hi:	In: Most-significant 32 bits of a Dump_Tag
> > representing
> > + *                      an id of the dump being processed.
> > + * @dump_tag_lo:	In: Least-significant 32 bits of a Dump_Tag
> > representing
> > + *                      an id of the dump being processed.
> > + * @sequence_hi:	In: Sequence number in most-significant 32
> > bits.
> > + *                      Out: Next sequence number in most-
> > significant 32 bits.
> > + * @sequence_lo:	In: Sequence number in Least-significant 32
> > bits
> > + *                      Out: Next sequence number in Least-
> > significant 32 bits.
> > + * @bytes_ret_hi:	Out: Bytes written in most-significant 32 bits.
> > + * @bytes_ret_lo:	Out: Bytes written in Least-significant 32
> > bits.
> > + * @status:		Out: RTAS call status.
> > + * @list:		Maintain the list of dumps are in progress. Can
> > + *                      retrieve multiple dumps with different
> > dump IDs at
> > + *                      the same time but not with the same dump
> > ID. This list
> > + *                      is used to determine whether the dump for
> > the same ID
> > + *                      is in progress.
> > + */
> > +struct ibm_platform_dump_params {
> > +	struct rtas_work_area	*work_area;
> > +	u32			buf_length;
> > +	u32			dump_tag_hi;
> > +	u32			dump_tag_lo;
> > +	u32			sequence_hi;
> > +	u32			sequence_lo;
> > +	u32			bytes_ret_hi;
> > +	u32			bytes_ret_lo;
> > +	s32			status;
> > +	struct list_head	list;
> > +};
> > +
> > +/*
> > + * Multiple dumps with different dump IDs can be retrieved at the
> > same
> > + * time, but not with dame dump ID. platform_dump_list_mutex and
> > + * platform_dump_list are used to prevent this behavior.
> > + */
> > +static DEFINE_MUTEX(platform_dump_list_mutex);
> > +static LIST_HEAD(platform_dump_list);
> > +
> > +/**
> > + * rtas_ibm_platform_dump() - Call ibm,platform-dump to fill a
> > work area
> > + * buffer.
> > + * @params: See &struct ibm_platform_dump_params.
> > + * @buf_addr: Address of dump buffer (work_area)
> > + * @buf_length: Length of the buffer in bytes (min. 1024)
> > + *
> > + * Calls ibm,platform-dump until it errors or successfully
> > deposits data
> > + * into the supplied work area. Handles RTAS retry statuses. Maps
> > RTAS
> > + * error statuses to reasonable errno values.
> > + *
> > + * Can request multiple dumps with different dump IDs at the same
> > time,
> > + * but not with the same dump ID which is prevented with the check
> > in
> > + * the ioctl code (papr_platform_dump_create_handle()).
> > + *
> > + * The caller should inspect @params.status to determine whether
> > more
> > + * calls are needed to complete the sequence.
> > + *
> > + * Context: May sleep.
> > + * Return: -ve on error, 0 for dump complete and 1 for continue
> > dump
> > + */
> > +static int rtas_ibm_platform_dump(struct ibm_platform_dump_params
> > *params,
> > +				phys_addr_t buf_addr, u32 buf_length)
> > +{
> > +	u32 rets[4];
> > +	s32 fwrc;
> > +	int ret = 0;
> > +
> > +	do {
> > +		fwrc =
> > rtas_call(rtas_function_token(RTAS_FN_IBM_PLATFORM_DUMP),
> > +				6, 5,
> > +				rets,
> > +				params->dump_tag_hi,
> > +				params->dump_tag_lo,
> > +				params->sequence_hi,
> > +				params->sequence_lo,
> > +				buf_addr,
> > +				buf_length);
> > +	} while (rtas_busy_delay(fwrc));
> > +
> > +	switch (fwrc) {
> > +	case RTAS_HARDWARE_ERROR:
> > +		ret = -EIO;
> > +		break;
> > +	case RTAS_NOT_AUTHORIZED:
> > +		ret = -EPERM;
> > +		break;
> > +	case RTAS_IBM_PLATFORM_DUMP_CONTINUE:
> > +	case RTAS_IBM_PLATFORM_DUMP_COMPLETE:
> > +		params->sequence_hi = rets[0];
> > +		params->sequence_lo = rets[1];
> > +		params->bytes_ret_hi = rets[2];
> > +		params->bytes_ret_lo = rets[3];
> > +		break;
> > +	default:
> > +		ret = -EIO;
> > +		pr_err_ratelimited("unexpected ibm,platform-dump status
> > %d\n",
> > +				fwrc);
> > +		break;
> > +	}
> > +
> > +	params->status = fwrc;
> > +	return ret;
> > +}
> > +
> > +/*
> > + * Platform dump is used with multiple RTAS calls to retrieve the
> > + * complete dump for the provided dump ID. Once the complete dump
> > is
> > + * retrieved, the hypervisor returns dump complete status (0) for
> > the
> > + * last RTAS call and expects the caller issues one more call with
> > + * NULL buffer to invalidate the dump so that the hypervisor can
> > remove
> > + * the dump.
> > + *
> > + * After the specific dump is invalidated in the hypervisor,
> > expect the
> > + * dump complete status for the new sequence - the user space
> > initiates
> > + * new request for the same dump ID.
> > + */
> > +static ssize_t papr_platform_dump_handle_read(struct file *file,
> > +		char __user *buf, size_t size, loff_t *off)
> > +{
> > +	struct ibm_platform_dump_params *params = file->private_data;
> > +	u64 total_bytes;
> > +	s32 fwrc;
> > +
> > +	/*
> > +	 * Dump already completed with the previous read calls.
> > +	 * In case if the user space issues further reads, returns
> > +	 * -EINVAL.
> > +	 */
> > +	if (!params->buf_length) {
> > +		pr_warn_once("Platform dump completed for dump ID
> > %llu\n",
> > +			(u64) (((u64)params->dump_tag_hi << 32) |
> > +				params->dump_tag_lo));
> > +		return -EINVAL;
> > +	}
> > +
> > +	/*
> > +	 * The hypervisor returns status 0 if no more data available to
> > +	 * download. The dump will be invalidated with ioctl (see
> > below).
> > +	 */
> > +	if (params->status == RTAS_IBM_PLATFORM_DUMP_COMPLETE) {
> > +		params->buf_length = 0;
> > +		/*
> > +		 * Returns 0 to the user space so that user
> > +		 * space read stops.
> > +		 */
> > +		return 0;
> > +	}
> > +
> > +	if (size < SZ_1K) {
> > +		pr_err_once("Buffer length should be minimum 1024
> > bytes\n");
> > +		return -EINVAL;
> > +	} else if (size > params->buf_length) {
> > +		/*
> > +		 * Allocate 4K work area. So if the user requests > 4K,
> > +		 * resize the buffer length.
> > +		 */
> > +		size = params->buf_length;
> > +	}
> > +
> > +	fwrc = rtas_ibm_platform_dump(params,
> > +			rtas_work_area_phys(params->work_area),
> > +			size);
> > +	if (fwrc < 0)
> > +		return fwrc;
> > +
> > +	total_bytes = (u64) (((u64)params->bytes_ret_hi << 32) |
> > +			params->bytes_ret_lo);
> > +
> > +	/*
> > +	 * Kernel or firmware bug, do not continue.
> > +	 */
> > +	if (WARN(total_bytes > size, "possible write beyond end of work
> > area"))
> > +		return -EFAULT;
> > +
> > +	if (copy_to_user(buf, rtas_work_area_raw_buf(params-
> > >work_area),
> > +			total_bytes))
> > +		return -EFAULT;
> > +
> > +	return total_bytes;
> > +}
> > +
> > +static int papr_platform_dump_handle_release(struct inode *inode,
> > +					struct file *file)
> > +{
> > +	struct ibm_platform_dump_params *params = file->private_data;
> > +
> > +	if (params->work_area)
> > +		rtas_work_area_free(params->work_area);
> > +
> > +	mutex_lock(&platform_dump_list_mutex);
> > +	list_del(&params->list);
> > +	mutex_unlock(&platform_dump_list_mutex);
> > +
> > +	kfree(params);
> > +	file->private_data = NULL;
> > +	return 0;
> > +}
> > +
> > +/*
> > + * This ioctl is used to invalidate the dump assuming the user
> > space
> > + * issue this ioctl after obtain the complete dump.
> > + * Issue the last RTAS call with NULL buffer to invalidate the
> > dump
> > + * which means dump will be freed in the hypervisor.
> > + */
> > +static long papr_platform_dump_invalidate_ioctl(struct file *file,
> > +				unsigned int ioctl, unsigned long arg)
> > +{
> > +	struct ibm_platform_dump_params *params;
> > +	u64 __user *argp = (void __user *)arg;
> > +	u64 param_dump_tag, dump_tag;
> > +
> > +	if (ioctl != PAPR_PLATFORM_DUMP_IOC_INVALIDATE)
> > +		return -ENOIOCTLCMD;
> > +
> > +	if (get_user(dump_tag, argp))
> > +		return -EFAULT;
> > +
> > +	/*
> > +	 * private_data is freeded during release(), so should not
> 			   freed?
> > +	 * happen.
> > +	 */
> > +	if (!file->private_data) {
> > +		pr_err("No valid FD to invalidate dump for the
> > ID(%llu)\n",
> > +				dump_tag);
> > +		return -EINVAL;
> > +	}
> > +
> > +	params = file->private_data;
> > +	param_dump_tag = (u64) (((u64)params->dump_tag_hi << 32) |
> > +				params->dump_tag_lo);
> > +	if (dump_tag != param_dump_tag) {
> > +		pr_err("Invalid dump ID(%llu) to invalidate dump\n",
> > +				dump_tag);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (params->status != RTAS_IBM_PLATFORM_DUMP_COMPLETE)
> > +		pr_warn("Platform dump is not complete, but requested "
> > +			"to invalidate dump for ID(%llu)\n",
> > +			dump_tag);
> 
> Not sure if something should be done here or if relying on
> translation
> of the error from the RTAS call is advisable.

This check just diplays message in case if the user initiated to
invalidate the dump without saving it completely. Then invalidates the
dump with RTAS call and retuns the RTAS return value. 

As mentioned above, platform-dump is available only on non-HMC based
systems. So invoke the collection of dump by BMC based interface, not
widely used. I can remove this check if preferred.

Thanks
Haren

> 
> Thanks
> 
> Michal


