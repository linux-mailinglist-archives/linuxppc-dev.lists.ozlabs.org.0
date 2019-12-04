Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A20112D19
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 14:59:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SgSV2mVxzDqD9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 00:59:06 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SgDh4VK1zDqX7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2019 00:48:51 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB4Dl2cr093411
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 4 Dec 2019 08:48:48 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wnsvj4adt-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Dec 2019 08:48:47 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Wed, 4 Dec 2019 13:48:46 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 4 Dec 2019 13:48:45 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB4Dmh9g59572374
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Dec 2019 13:48:43 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BC3D52051;
 Wed,  4 Dec 2019 13:48:43 +0000 (GMT)
Received: from [9.85.95.134] (unknown [9.85.95.134])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id C583B5204E;
 Wed,  4 Dec 2019 13:48:42 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] powerpc/pmem: Fix kernel crash due to wrong range value
 usage in flush_dcache_range
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <20191204052909.59145-1-aneesh.kumar@linux.ibm.com>
Date: Wed, 4 Dec 2019 19:18:41 +0530
Content-Transfer-Encoding: quoted-printable
References: <20191204052909.59145-1-aneesh.kumar@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 19120413-0020-0000-0000-00000393B9ED
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120413-0021-0000-0000-000021EAE208
Message-Id: <0CA599BB-8C7F-44B7-9A75-8C7A80201234@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-04_03:2019-12-04,2019-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912040113
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>=20
> Fixes: 076265907cf9 ("powerpc: Chunk calls to flush_dcache_range in =
arch_*_memory")
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
> arch/powerpc/mm/mem.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20

It took a while to setup environment on a replacement machine.=20
Was able to test the fix. With this fix applied I no longer see the =
problem.

Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>

Thanks
-Sachin
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index ad299e72ec30..9488b63dfc87 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -121,7 +121,7 @@ static void flush_dcache_range_chunked(unsigned =
long start, unsigned long stop,
> 	unsigned long i;
>=20
> 	for (i =3D start; i < stop; i +=3D chunk) {
> -		flush_dcache_range(i, min(stop, start + chunk));
> +		flush_dcache_range(i, min(stop, i + chunk));
> 		cond_resched();
> 	}
> }
> --=20
> 2.23.0
>=20

