Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EA420DD1C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 23:24:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wgV10WX6zDqfX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 07:24:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wfWg1QF2zDqdD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 06:40:30 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05TKb6iu105954; Mon, 29 Jun 2020 16:40:25 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ydjxcy8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 16:40:25 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05TKeObh112150;
 Mon, 29 Jun 2020 16:40:24 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ydjxcy7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 16:40:24 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05TKYcpa000459;
 Mon, 29 Jun 2020 20:40:23 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 31wwr8yh59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 20:40:23 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05TKeMfe22741388
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Jun 2020 20:40:22 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 519A0136051;
 Mon, 29 Jun 2020 20:40:22 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4024C13604F;
 Mon, 29 Jun 2020 20:40:19 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.34.39])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 29 Jun 2020 20:40:18 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH v6 6/8] powerpc/pmem: Avoid the barrier in flush routines
In-Reply-To: <20200629160940.GU21462@kitsune.suse.cz>
References: <20200629135722.73558-1-aneesh.kumar@linux.ibm.com>
 <20200629135722.73558-7-aneesh.kumar@linux.ibm.com>
 <20200629160940.GU21462@kitsune.suse.cz>
Date: Tue, 30 Jun 2020 02:10:15 +0530
Message-ID: <87lfk5hahc.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-06-29_21:2020-06-29,
 2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 cotscore=-2147483648 bulkscore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006290130
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
> On Mon, Jun 29, 2020 at 07:27:20PM +0530, Aneesh Kumar K.V wrote:
>> nvdimm expect the flush routines to just mark the cache clean. The barri=
er
>> that mark the store globally visible is done in nvdimm_flush().
>>=20
>> Update the papr_scm driver to a simplified nvdim_flush callback that do
>> only the required barrier.
>>=20
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  arch/powerpc/lib/pmem.c                   |  6 ------
>>  arch/powerpc/platforms/pseries/papr_scm.c | 13 +++++++++++++
>>  2 files changed, 13 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/arch/powerpc/lib/pmem.c b/arch/powerpc/lib/pmem.c
>> index 5a61aaeb6930..21210fa676e5 100644
>> --- a/arch/powerpc/lib/pmem.c
>> +++ b/arch/powerpc/lib/pmem.c
>> @@ -19,9 +19,6 @@ static inline void __clean_pmem_range(unsigned long st=
art, unsigned long stop)
>>=20=20
>>  	for (i =3D 0; i < size >> shift; i++, addr +=3D bytes)
>>  		asm volatile(PPC_DCBSTPS(%0, %1): :"i"(0), "r"(addr): "memory");
>> -
>> -
>> -	asm volatile(PPC_PHWSYNC ::: "memory");
>>  }
>>=20=20
>>  static inline void __flush_pmem_range(unsigned long start, unsigned lon=
g stop)
>> @@ -34,9 +31,6 @@ static inline void __flush_pmem_range(unsigned long st=
art, unsigned long stop)
>>=20=20
>>  	for (i =3D 0; i < size >> shift; i++, addr +=3D bytes)
>>  		asm volatile(PPC_DCBFPS(%0, %1): :"i"(0), "r"(addr): "memory");
>> -
>> -
>> -	asm volatile(PPC_PHWSYNC ::: "memory");
>>  }
>>=20=20
>>  static inline void clean_pmem_range(unsigned long start, unsigned long =
stop)
>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/pl=
atforms/pseries/papr_scm.c
>> index 9c569078a09f..9a9a0766f8b6 100644
>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>> @@ -630,6 +630,18 @@ static int papr_scm_ndctl(struct nvdimm_bus_descrip=
tor *nd_desc,
>>=20=20
>>  	return 0;
>>  }
>> +/*
>> + * We have made sure the pmem writes are done such that before calling =
this
>> + * all the caches are flushed/clean. We use dcbf/dcbfps to ensure this.=
 Here
>> + * we just need to add the necessary barrier to make sure the above flu=
shes
>> + * are have updated persistent storage before any data access or data t=
ransfer
>> + * caused by subsequent instructions is initiated.
>> + */
>> +static int papr_scm_flush_sync(struct nd_region *nd_region, struct bio =
*bio)
>> +{
>> +	arch_pmem_flush_barrier();
>> +	return 0;
>> +}
>>=20=20
>>  static ssize_t flags_show(struct device *dev,
>>  			  struct device_attribute *attr, char *buf)
>> @@ -743,6 +755,7 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv=
 *p)
>>  	ndr_desc.mapping =3D &mapping;
>>  	ndr_desc.num_mappings =3D 1;
>>  	ndr_desc.nd_set =3D &p->nd_set;
>> +	ndr_desc.flush =3D papr_scm_flush_sync;
>
> AFAICT currently the only device that implements flush is virtio_pmem.
> How does the nfit driver get away without implementing flush?

generic_nvdimm_flush does the required barrier for nfit. The reason for
adding ndr_desc.flush call back for papr_scm was to avoid the usage
of iomem based deep flushing (ndr_region_data.flush_wpq) which is not
supported by papr_scm.

BTW we do return NULL for ndrd_get_flush_wpq() on power. So the upstream
code also does the same thing, but in a different way.


> Also the flush takes arguments that are completely unused but a user of
> the pmem region must assume they are used, and call flush() on the
> region rather than arch_pmem_flush_barrier() directly.

The bio argument can help a pmem driver to do range based flushing in
case of pmem_make_request. If bio is null then we must assume a full
device flush.=20

>This may not
> work well with md as discussed with earlier iteration of the patchest.
>

dm-writecache needs some major changes to work with asynchronous pmem
devices.=20

-aneesh
