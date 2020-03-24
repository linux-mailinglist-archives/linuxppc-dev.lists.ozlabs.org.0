Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ABC1909A1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 10:38:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mmQD5xdxzDr1D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 20:38:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mmNY0cYZzDqrN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 20:36:44 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02O9ZNTo065644
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 05:36:41 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywet3bt8j-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 05:36:41 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Tue, 24 Mar 2020 09:36:38 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 24 Mar 2020 09:36:34 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02O9aYB232964816
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Mar 2020 09:36:34 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D19842042;
 Tue, 24 Mar 2020 09:36:34 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18C7442041;
 Tue, 24 Mar 2020 09:36:33 +0000 (GMT)
Received: from [9.199.50.248] (unknown [9.199.50.248])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 24 Mar 2020 09:36:32 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [5.6.0-rc7] Kernel crash while running ndctl tests
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <87a746cdva.fsf@linux.ibm.com>
Date: Tue, 24 Mar 2020 15:06:31 +0530
Content-Transfer-Encoding: quoted-printable
References: <CF20E440-4DCB-4EFD-88B6-0AB98DC7FBD4@linux.vnet.ibm.com>
 <87a746cdva.fsf@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 20032409-0008-0000-0000-00000362E88A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032409-0009-0000-0000-00004A845422
Message-Id: <33E32320-C371-4A41-A3E1-4B9D2DDAFBFC@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_02:2020-03-23,
 2020-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxlogscore=897 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003240050
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
Cc: Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 LKML <linux-kernel@vger.kernel.org>, Baoquan He <bhe@redhat.com>,
 linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 24-Mar-2020, at 2:45 PM, Aneesh Kumar K.V =
<aneesh.kumar@linux.ibm.com> wrote:
>=20
> Sachin Sant <sachinp@linux.vnet.ibm.com> writes:
>=20
>> While running ndctl[1] tests against 5.6.0-rc7 following crash is =
encountered.
>>=20
>> Bisect leads me to  commit d41e2f3bd546=20
>> mm/hotplug: fix hot remove failure in SPARSEMEM|!VMEMMAP case
>>=20
>> Reverting this commit helps and the tests complete without any crash.
>=20
>=20
> Can you try this change?
>=20
> diff --git a/mm/sparse.c b/mm/sparse.c
> index aadb7298dcef..3012d1f3771a 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -781,6 +781,8 @@ static void section_deactivate(unsigned long pfn, =
unsigned long nr_pages,
> 			ms->usage =3D NULL;
> 		}
> 		memmap =3D sparse_decode_mem_map(ms->section_mem_map, =
section_nr);
> +		/* Mark the section invalid */
> +		ms->section_mem_map &=3D ~SECTION_HAS_MEM_MAP;
> 	}
>=20
> 	if (section_is_early && memmap)
>=20

This patch works for me. The test ran successfully without any =
crash/failure.

Thanks
-Sachin

> a pfn_valid check involves pnf_section_valid() check if section is
> having MEM_MAP. In this case we did end up  setting the ms->uage =3D =
NULL.
> So when we do that tupdate the section to not have MEM_MAP.
>=20
> -aneesh

