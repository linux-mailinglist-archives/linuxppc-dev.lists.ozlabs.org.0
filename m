Return-Path: <linuxppc-dev+bounces-11243-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DBBB33B24
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 11:31:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9QXR09mTz3cfL;
	Mon, 25 Aug 2025 19:31:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756114278;
	cv=none; b=ErcLvLPA9T+0EFkp7G7CHMthHOLOX6d+YGu7TOdo3JJ+0UPSFA5JbvBsQqYGaIXBhnSerTwWSTVExjRTZi0ma7pss6RL67rAWXvNF+kGTO5ahKUxbt9yBSfZ5BFKDIFmMmBckBk72fbxQlIWR1DpA36lON1otaA7mPFu4C5PEiAfjjCt6xPjIa3rZ4G9Wp6IoFfh+Q35rNNiMFYR7i8ba8fpyJbp3TbT9cXOfsWmsKXtkieg0OVhrATPNa8TH4mkjsvA4/DZzPYVblZ9GGYA4WAi+t5TQC03vLrtmJnobzXQSbgI9eQtk3zMk4f/+iNQTwShxRFiArvKXxuhwY2VVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756114278; c=relaxed/relaxed;
	bh=CtI74WEtnc9wbGrjrkKi18GFvtVwtx7Nrq3+uzsVTgw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JDE0WlgR7diMehj/Bl2NbT42iPX6Rn/hzq5GvTP3YWcT7zkS9/ZJRSkiiveelFvcSuGVFc5+yzdrFF86xSx+anfQjlWTntEVWx5OAbqM1Bxs/2eynRYgUMNUOgkjSugoW3Ehf8IGLKS+Vo0xccvIMCWdZip+rCzx5heVcffeh1lWgwkgjuf6oYG9SuhwaUblMrmYRhXJblsIthWtrBHKFq/Tgzl9Y5g6O4eth9n/asZ6jZcudPIgG/7+UQHmDgDlluh41xI96jrdPxZHZt5p31PGVYzAYcKgOCNIfIdEjbgFMV8lUiP87CaNdD3T74/lItt7zGVYL1Ia0DRrrxlbUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j+z8BQn8; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j+z8BQn8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9QXQ0HV9z3cfH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 19:31:17 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P7arDf025629;
	Mon, 25 Aug 2025 09:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=CtI74W
	Etnc9wbGrjrkKi18GFvtVwtx7Nrq3+uzsVTgw=; b=j+z8BQn8dPBLCOoE2jc3Hw
	Vt3BC6mReBgRnWOl17o2KRaks61cKmxqkCVr5BO5XKNmPwETQ1pDgPMqJ80DNZGY
	LqRicjIwSzbOhe6NPYx0wUC4CKCuryu1RFHPDLIR01JkU/rZg8cYX6gm4MxteNyd
	6acCp4pTamDnxChEBK68IdL9HCo00Ze2fGqaldnosJgjgJolXmZJjqwKSKuG1h+y
	Zg51G5YI0hxRpoHLMAWZHT0N7KYb/+r+pyMaT2Ecs2dW3jENTPIcfGDIiuuvSJG4
	fFW5EunFs13N+HxEzeFL8MvUOy4BCcMJ/WXBUEvt9MUZjemAu3fv0KksPqOGp7YQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5av8337-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 09:31:09 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57P9V89n019406;
	Mon, 25 Aug 2025 09:31:08 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5av8334-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 09:31:08 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57P71Gi2018006;
	Mon, 25 Aug 2025 09:31:07 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qtp34un7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 09:31:07 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57P9V5c630802668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Aug 2025 09:31:06 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B2FB85805A;
	Mon, 25 Aug 2025 09:31:05 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 06CD058051;
	Mon, 25 Aug 2025 09:31:05 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.165.221])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Aug 2025 09:31:04 +0000 (GMT)
Message-ID: <4433f9a4e8794b546d87e5651dd913e9049f878a.camel@linux.ibm.com>
Subject: Re: [PATCH v2 9/9] powerpc/pseries: HVPIPE changes to support
 migration
From: Haren Myneni <haren@linux.ibm.com>
To: mahesh@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        msuchanek@suse.de, tyreld@linux.ibm.com, npiggin@gmail.com,
        bjking1@linux.ibm.com
Date: Mon, 25 Aug 2025 02:31:04 -0700
In-Reply-To: <kcgdolrl7lpou4pw3wkpqmool2l6rk5lpw744w55imqqg5aokf@6tuzttzzvl7c>
References: <20250812225715.339225-1-haren@linux.ibm.com>
	 <20250812225715.339225-10-haren@linux.ibm.com>
	 <kcgdolrl7lpou4pw3wkpqmool2l6rk5lpw744w55imqqg5aokf@6tuzttzzvl7c>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
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
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: o3tGpP2W0e3Kq3Lt5Y79yIi0A_oMC3Ow
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfX2hGhkbiCsI1f
 HSw1j1Smta1pELrDly8L1noGMWoLAsC+BIsJ/pAq4vopEZZTAiKDt3qRFhUT6OlKd7EVMa0CPbF
 YEPvHT4jQQkeVS4VnCRbvvfb0DkXS0c+fw/yDe8U4znczqzZaDmgoCMmzQmJNBdaMuljipIcIaU
 3fpL3umil+G8q68Wi5ojmhdYnbDmNQ+Sy+v9WHn/PiYlI+7SRJwIgfIz482CfcdqKw1SEg6WTw7
 WNs7W6++Qb9QzGi/MGu9vDoARm8I/4V4I0z2P+AK1aXkKJMVGKIaUKT55Dp61C7LWQfUjADVF0W
 j65GbNYh/oPaytV/C+ltHqvCy0mEsTtvE7Fd5K8uY5/m/drPd1imSFacPvfVRlxOyPimBrns5fh
 H5OJXA8u
X-Proofpoint-ORIG-GUID: zv3rla91CO7RowaZHEMptDflm880KvFD
X-Authority-Analysis: v=2.4 cv=SNNCVPvH c=1 sm=1 tr=0 ts=68ac2d5d cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=XB04klxT0TWjefFwPNEA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 2025-08-25 at 14:10 +0530, Mahesh J Salgaonkar wrote:
> On 2025-08-12 15:57:13 Tue, Haren Myneni wrote:
> > The hypervisor assigns one pipe per partition for all sources and
> > assigns new pipe after migration. Also the partition ID that is
> > used by source as its target ID may be changed after the migration.
> > So disable hvpipe during SUSPEND event with =E2=80=98hvpipe enable=E2=
=80=99 system
> > parameter value =3D 0 and enable it after migration during RESUME
> > event with=C2=A0 hvpipe enable=E2=80=99 system parameter value =3D 1.
> >=20
> > The user space calls such as ioctl()/ read() / write() / poll()
> > returns=C2=A0 -ENXIO between SUSPEND and RESUME events. The user space
> > process can close FD and reestablish connection with new FD after
> > migration if needed (Example: source IDs are changed).
> >=20
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> > =C2=A0arch/powerpc/platforms/pseries/mobility.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 3 +
> > =C2=A0arch/powerpc/platforms/pseries/papr-hvpipe.c | 64
> > ++++++++++++++++++++
> > =C2=A0arch/powerpc/platforms/pseries/papr-hvpipe.h |=C2=A0 6 ++
> > =C2=A03 files changed, 73 insertions(+)
> >=20
> > diff --git a/arch/powerpc/platforms/pseries/mobility.c
> > b/arch/powerpc/platforms/pseries/mobility.c
> > index 62bd8e2d5d4c..95fe802ccdfd 100644
> > --- a/arch/powerpc/platforms/pseries/mobility.c
> > +++ b/arch/powerpc/platforms/pseries/mobility.c
> > @@ -28,6 +28,7 @@
> > =C2=A0#include <asm/rtas.h>
> > =C2=A0#include "pseries.h"
> > =C2=A0#include "vas.h"	/* vas_migration_handler() */
> > +#include "papr-hvpipe.h"	/* hvpipe_migration_handler() */
> > =C2=A0#include "../../kernel/cacheinfo.h"
> > =C2=A0
> > =C2=A0static struct kobject *mobility_kobj;
> > @@ -744,6 +745,7 @@ static int pseries_migrate_partition(u64
> > handle)
> > =C2=A0	 * by closing VAS windows at the beginning of this
> > function.
> > =C2=A0	 */
> > =C2=A0	vas_migration_handler(VAS_SUSPEND);
> > +	hvpipe_migration_handler(HVPIPE_SUSPEND);
> > =C2=A0
> > =C2=A0	ret =3D wait_for_vasi_session_suspending(handle);
> > =C2=A0	if (ret)
> > @@ -770,6 +772,7 @@ static int pseries_migrate_partition(u64
> > handle)
> > =C2=A0
> > =C2=A0out:
> > =C2=A0	vas_migration_handler(VAS_RESUME);
> > +	hvpipe_migration_handler(HVPIPE_RESUME);
> > =C2=A0
> > =C2=A0	return ret;
> > =C2=A0}
> > diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c
> > b/arch/powerpc/platforms/pseries/papr-hvpipe.c
> > index bc3d1f0b4491..0edc1a29d64d 100644
> > --- a/arch/powerpc/platforms/pseries/papr-hvpipe.c
> > +++ b/arch/powerpc/platforms/pseries/papr-hvpipe.c
> > @@ -27,6 +27,7 @@ static unsigned char
> > hvpipe_ras_buf[RTAS_ERROR_LOG_MAX];
> > =C2=A0static struct workqueue_struct *papr_hvpipe_wq;
> > =C2=A0static struct work_struct *papr_hvpipe_work =3D NULL;
> > =C2=A0static int hvpipe_check_exception_token;
> > +static bool hvpipe_feature;
> > =C2=A0
> > =C2=A0/*
> > =C2=A0 * New PowerPC FW provides support for partitions and various
> > @@ -233,6 +234,12 @@ static ssize_t papr_hvpipe_handle_write(struct
> > file *file,
> > =C2=A0	unsigned long ret, len;
> > =C2=A0	char *area_buf;
> > =C2=A0
> > +	/*
> > +	 * Return -ENXIO during migration
> > +	 */
> > +	if (!hvpipe_feature)
> > +		return -ENXIO;
> > +
> > =C2=A0	if (!src_info)
> > =C2=A0		return -EIO;
> > =C2=A0
> > @@ -325,6 +332,12 @@ static ssize_t papr_hvpipe_handle_read(struct
> > file *file,
> > =C2=A0	struct papr_hvpipe_hdr hdr;
> > =C2=A0	long ret;
> > =C2=A0
> > +	/*
> > +	 * Return -ENXIO during migration
> > +	 */
> > +	if (!hvpipe_feature)
> > +		return -ENXIO;
> > +
> > =C2=A0	if (!src_info)
> > =C2=A0		return -EIO;
> > =C2=A0
> > @@ -401,6 +414,12 @@ static unsigned int
> > papr_hvpipe_handle_poll(struct file *filp,
> > =C2=A0{
> > =C2=A0	struct hvpipe_source_info *src_info =3D filp->private_data;
> > =C2=A0
> > +	/*
> > +	 * Return -ENXIO during migration
> > +	 */
> > +	if (!hvpipe_feature)
> > +		return -ENXIO;
> > +
> > =C2=A0	if (!src_info)
> > =C2=A0		return -EIO;
> > =C2=A0
> > @@ -530,6 +549,12 @@ static long papr_hvpipe_dev_ioctl(struct file
> > *filp, unsigned int ioctl,
> > =C2=A0	u32 srcID;
> > =C2=A0	long ret;
> > =C2=A0
> > +	/*
> > +	 * Return -ENXIO during migration
> > +	 */
> > +	if (!hvpipe_feature)
> > +		return -ENXIO;
> > +
> > =C2=A0	if (get_user(srcID, argp))
> > =C2=A0		return -EFAULT;
> > =C2=A0
> > @@ -688,6 +713,44 @@ static int __init enable_hvpipe_IRQ(void)
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
> > +void hvpipe_migration_handler(int action)
> > +{
> > +	pr_info("hvpipe migration event %d\n", action);
> > +
> > +	/*
> > +	 * HVPIPE is not used (Failed to create /dev/papr-hvpipe).
> > +	 * So nothing to do for migration.
> > +	 */
> > +	if (!papr_hvpipe_work)
> > +		return;
> > +
> > +	switch (action) {
> > +	case HVPIPE_SUSPEND:
> > +		if (hvpipe_feature) {
> > +			/*
> > +			 * Disable hvpipe_feature to the user
> > space.
> > +			 * It will be enabled with RESUME event.
> > +			 */
> > +			hvpipe_feature =3D false;
> > +			/*
> > +			 * set system parameter hvpipe 'disable'
> > +			 */
> > +			set_hvpipe_sys_param(0);
> > +		}
> > +		break;
> > +	case HVPIPE_RESUME:
> > +		/*
> > +		 * set system parameter hvpipe 'enable'
> > +		 */
> > +		if (!set_hvpipe_sys_param(1))
> > +			hvpipe_feature =3D true;
> > +		else
> > +			pr_err("hvpipe is not enabled after
> > migration\n");
>=20
> So we will end up in else condtion if destination partition does not
> have hvpipe capability ?

Yes if the HVPIPE is not supported on the destination partition.

Generally we should not see this error message -  HMC is adding some
checks whether FW supports this capability and limits the migration
before upgrade the FW. But added this printk (else condition) in case.

Thanks
Haren

>=20
> Thanks,
> -Mahesh.
>=20
> > +
> > +		break;
> > +	}
> > +}
> > +
> > =C2=A0static const struct file_operations papr_hvpipe_ops =3D {
> > =C2=A0	.unlocked_ioctl	=3D	papr_hvpipe_dev_ioctl,
> > =C2=A0};
> > @@ -731,6 +794,7 @@ static int __init papr_hvpipe_init(void)
> > =C2=A0
> > =C2=A0	if (!ret) {
> > =C2=A0		pr_info("hvpipe feature is enabled\n");
> > +		hvpipe_feature =3D true;
> > =C2=A0		return 0;
> > =C2=A0	} else
> > =C2=A0		pr_err("hvpipe feature is not enabled %d\n", ret);
> > diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.h
> > b/arch/powerpc/platforms/pseries/papr-hvpipe.h
> > index aab7f77e087d..c343f4230865 100644
> > --- a/arch/powerpc/platforms/pseries/papr-hvpipe.h
> > +++ b/arch/powerpc/platforms/pseries/papr-hvpipe.h
> > @@ -11,6 +11,11 @@
> > =C2=A0
> > =C2=A0#define	HVPIPE_HDR_LEN	sizeof(struct papr_hvpipe_hdr)
> > =C2=A0
> > +enum hvpipe_migrate_action {
> > +	HVPIPE_SUSPEND,
> > +	HVPIPE_RESUME,
> > +};
> > +
> > =C2=A0struct hvpipe_source_info {
> > =C2=A0	struct list_head list;	/* list of sources */
> > =C2=A0	u32 srcID;
> > @@ -33,4 +38,5 @@ struct hvpipe_event_buf {
> > =C2=A0				/* with specified src ID */
> > =C2=A0};
> > =C2=A0
> > +void hvpipe_migration_handler(int action);
> > =C2=A0#endif /* _PAPR_HVPIPE_H */
> > --=20
> > 2.43.5
> >=20
> >=20

