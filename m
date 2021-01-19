Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E55752FC1C1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 22:02:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DL1MC0s7pzDr2q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 08:02:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CEpaa6KR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DL1K45ZtPzDq7k
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 08:00:56 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10JKv5Vd033393; Tue, 19 Jan 2021 16:00:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=ZchYG6yr7O7lmZfuAmsSaKC/kbB5ljiGSYyFQnFfZys=;
 b=CEpaa6KRt9eyZIKQ8VHV1vmnYSA+Y5mFHtLdz2wDvNg4/jFijvE+4YVBRizBHiQUmXNm
 Wu9Xri//OT7Atzr8KmU+ZaW5SWHPbFDiyWxI6B7WLkxILIW+oQEET4jxZf0AO4/W/Emk
 Ipzh8t7qxui/n1MIXRl1h7Yl4PaFB9noQzTjQa5YmkoLtolH2taMTN3KRRc1jTaQAXoo
 dICt+SJp544+o2PorlrGWWKFoWqIEOP9PV9s4JDRnp2aq157dtvHTS3CDQWitt6Xunrd
 mvRD670Webk0bd0NIYM3LKRJ/7/q2sFvKyogK/Lv+nqMLag045PJTMyeMAqhF9FqHFfk zA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3666wmg2yf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 16:00:50 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10JKuvTa028439;
 Tue, 19 Jan 2021 21:00:50 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 363qs90xty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 21:00:49 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10JL0mPn21299484
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 21:00:48 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F1BC6E058;
 Tue, 19 Jan 2021 21:00:48 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70A356E053;
 Tue, 19 Jan 2021 21:00:48 +0000 (GMT)
Received: from localhost (unknown [9.211.72.22])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 19 Jan 2021 21:00:48 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 6/6] powerpc/rtas: constrain user region allocation to RMA
In-Reply-To: <87mtx5qp1g.fsf@mpe.ellerman.id.au>
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
 <20210114220004.1138993-7-nathanl@linux.ibm.com>
 <87mtx5qp1g.fsf@mpe.ellerman.id.au>
Date: Tue, 19 Jan 2021 15:00:48 -0600
Message-ID: <874kjcy73z.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_09:2021-01-18,
 2021-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 spamscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101190110
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
Cc: aik@ozlabs.ru, tyreld@linux.ibm.com, brking@linux.ibm.com,
 ajd@linux.ibm.com, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> Memory locations passed as arguments from the OS to RTAS usually need
>> to be addressable in 32-bit mode and must reside in the Real Mode
>> Area. On PAPR guests, the RMA starts at logical address 0 and is the
>> first logical memory block reported in the LPAR=E2=80=99s device tree.
>>
>> On powerpc targets with RTAS, Linux makes available to user space a
>> region of memory suitable for arguments to be passed to RTAS via
>> sys_rtas(). This region (rtas_rmo_buf) is allocated via the memblock
>> API during boot in order to ensure that it satisfies the requirements
>> described above.
>>
>> With radix MMU, the upper limit supplied to the memblock allocation
>> can exceed the bounds of the first logical memory block, since
>> ppc64_rma_size is ULONG_MAX and RTAS_INSTANTIATE_MAX is 1GB.
>
> Why does the size of the first memory block matter for radix?

Here is my understanding: in the platform architecture, the size of the
first memory block equals the RMA, regardless of the MMU mode. It just
so happens that when using radix, Linux can pass ibm,configure-connector
a work area address outside of the RMA because the allocation
constraints for the work area are computed differently. It would be
wrong of the OS to pass RTAS arguments outside of this region with hash
MMU as well.

> The 1GB limit is sufficient to make it accessible by 32-bit code.

But the requirement is that memory arguments passed to RTAS reside in
the RMA, which may be less than 1GB.


>> (512MB is a common size of the first memory block according to a small s=
ample of
>> LPARs I have checked.)
>
> That's the minimum we request, see prom_init.c:
>
> 	/* option vector 2: Open Firmware options supported */
> 	.vec2 =3D {
> 		.byte1 =3D OV2_REAL_MODE,
> 		.reserved =3D 0,
> 		.real_base =3D cpu_to_be32(0xffffffff),
> 		.real_size =3D cpu_to_be32(0xffffffff),
> 		.virt_base =3D cpu_to_be32(0xffffffff),
> 		.virt_size =3D cpu_to_be32(0xffffffff),
> 		.load_base =3D cpu_to_be32(0xffffffff),
> 		.min_rma =3D cpu_to_be32(512),		/* 512MB min RMA */
>
> Since v4.12 in 2017.

Thanks for the pointer, I had been trying to find this without success.
