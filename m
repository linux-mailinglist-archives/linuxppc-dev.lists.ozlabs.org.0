Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 083E4495CB2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 10:19:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgDNK6XXvz3Wtr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 20:19:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=grrxCMpr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=grrxCMpr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgDMc14QBz2xXV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 20:18:51 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20L9HF2T009402; 
 Fri, 21 Jan 2022 09:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=F8+h4B4yfo7p6fG5uH4NfAg2lSXxcM1Zk5O/ri3eMXA=;
 b=grrxCMprn/0kZDsIZwbZ52fHHpeTBgsrNFmNpiN9nySiLCuTpmuX5D7GvRsT6eUkODsV
 Maq/by7MXI8Whpwm3UlcAIOXQzQCZo4J9ACdtq1dNXqq9VX3QxNWsAXwLSnmguWigQOF
 EMHryIofU4zDLAyOZLq5+d8ixsL76CvUO5p5e9slvGNTywQwvEpdSZirxuVzVJMtLh35
 eZ2k9jHSBWmF22uul1E8yciaad/dzs66TrW2SJO1yWvcpI+8Vqgt3/zE9TmMf4x/SjD8
 g9xftlEYBxTp9s/mC7q9wHXcrK/v+Pp3YQa9i9QnvQIDEnlaNreLKrdPB4YD9/In2ulF xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dqt2pg0e0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 09:18:40 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20L9IdZP012033;
 Fri, 21 Jan 2022 09:18:39 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dqt2pg0dq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 09:18:39 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20L9CO1V028231;
 Fri, 21 Jan 2022 09:18:38 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 3dqj1js713-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 09:18:38 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20L9Iblc35324172
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jan 2022 09:18:37 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7765D136061;
 Fri, 21 Jan 2022 09:18:37 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84FFE136060;
 Fri, 21 Jan 2022 09:18:34 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.32.214])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 21 Jan 2022 09:18:34 +0000 (GMT)
X-Mailer: emacs 28.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH v7 1/7] powerpc/pmem: Restrict papr_scm to P8 and above.
In-Reply-To: <20220121084056.GD3113@kunlun.suse.cz>
References: <20200701072235.223558-1-aneesh.kumar@linux.ibm.com>
 <20200701072235.223558-2-aneesh.kumar@linux.ibm.com>
 <20220121084056.GD3113@kunlun.suse.cz>
Date: Fri, 21 Jan 2022 14:48:32 +0530
Message-ID: <87pmolo39z.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: G3HGKIbT-g2LCINDjTzbtIQYe1F5Im3X
X-Proofpoint-ORIG-GUID: DxVX72VIX2cVhDyvW9Z1aOCCI93aJGbc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_06,2022-01-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201210060
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
Cc: Jan Kara <jack@suse.cz>, linux-nvdimm@lists.01.org,
 Jeff Moyer <jmoyer@redhat.com>, oohall@gmail.com, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:

> Hello,
>
> On Wed, Jul 01, 2020 at 12:52:29PM +0530, Aneesh Kumar K.V wrote:
>> The PAPR based virtualized persistent memory devices are only supported =
on
>> POWER9 and above. In the followup patch, the kernel will switch the pers=
istent
>> memory cache flush functions to use a new `dcbf` variant instruction. Th=
e new
>> instructions even though added in ISA 3.1 works even on P8 and P9 becaus=
e these
>> are implemented as a variant of existing `dcbf` and `hwsync` and on P8 a=
nd
>> P9 behaves as such.
>>=20
>> Considering these devices are only supported on P8 and above,  update th=
e driver
>> to prevent a P7-compat guest from using persistent memory devices.
>>=20
>> We don't update of_pmem driver with the same condition, because, on bare=
-metal,
>> the firmware enables pmem support only on P9 and above. There the kernel=
 depends
>> on OPAL firmware to restrict exposing persistent memory related device t=
ree
>> entries on older hardware. of_pmem.ko is written without any arch depend=
ency and
>> we don't want to add ppc64 specific cpu feature check in of_pmem driver.
>>=20
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  arch/powerpc/platforms/pseries/pmem.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>=20
>> diff --git a/arch/powerpc/platforms/pseries/pmem.c b/arch/powerpc/platfo=
rms/pseries/pmem.c
>> index f860a897a9e0..2347e1038f58 100644
>> --- a/arch/powerpc/platforms/pseries/pmem.c
>> +++ b/arch/powerpc/platforms/pseries/pmem.c
>> @@ -147,6 +147,12 @@ const struct of_device_id drc_pmem_match[] =3D {
>>=20=20
>>  static int pseries_pmem_init(void)
>>  {
>> +	/*
>> +	 * Only supported on POWER8 and above.
>> +	 */
>> +	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
>> +		return 0;
>> +
>
> This looks superfluous.
>
> The hypervisor is responsible for publishing the pmem in devicetree when
> present, kernel is responsible for using it when supported by the
> kernel.
>
> Or is there a problem that the flush instruction is not available in P7
> compat mode?

We want to avoid the usage of persistent memory on p7 compat mode
because such a guest can LPM migrate to p7 systems. Now ideally I would
expect hypervisor to avoid such migration, that is a p7 compat mode
guest running on p10 using persistence memory migrating to p7
(considering p7 never really had support for persistent memory).

There was also the complexity w.r.t what instructions the userspace will
use. So it was discussed at that point that we could comfortably state
and prevent the usage of persistent memory on p7 and below.=20

>
> Even then volatile regions should still work.

That is a different problem altogether. We could really kill the usage of
cache flush w.r.t volatile regions from the nvdimm driver right?=20

For all these reason, disabling pmem on p7 was found to be the simplest sol=
ution.=20

-aneesh
