Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07734218559
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 12:58:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1x9r4PnmzDr1G
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 20:58:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1x8057lhzDqP3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 20:56:48 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 068AXXqT091933; Wed, 8 Jul 2020 06:56:42 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 324y8sc7f3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 06:56:42 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 068AswA4023777;
 Wed, 8 Jul 2020 10:56:39 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 325cjwg06h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 10:56:39 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 068AuaBI61472768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jul 2020 10:56:36 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFA85A405C;
 Wed,  8 Jul 2020 10:56:36 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82A4FA4060;
 Wed,  8 Jul 2020 10:56:35 +0000 (GMT)
Received: from [9.199.55.23] (unknown [9.199.55.23])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed,  8 Jul 2020 10:56:35 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2 06/10] powerpc/perf: power10 Performance Monitoring
 support
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <babc98c50100bb2cc925a6518bdb885909f0c473.camel@neuling.org>
Date: Wed, 8 Jul 2020 16:26:32 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <A90735C5-0382-48CD-B3A4-E57BA0291938@linux.vnet.ibm.com>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1593595262-1433-7-git-send-email-atrajeev@linux.vnet.ibm.com>
 <babc98c50100bb2cc925a6518bdb885909f0c473.camel@neuling.org>
To: Michael Neuling <mikey@neuling.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_07:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 cotscore=-2147483648
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007080073
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 07-Jul-2020, at 12:20 PM, Michael Neuling <mikey@neuling.org> =
wrote:
>=20
>=20
>> @@ -480,6 +520,7 @@ int isa207_compute_mmcr(u64 event[], int n_ev,
>> 	mmcr[1] =3D mmcr1;
>> 	mmcr[2] =3D mmcra;
>> 	mmcr[3] =3D mmcr2;
>> +	mmcr[4] =3D mmcr3;
>=20
> This is fragile like the kvm vcpu case I commented on before but it =
gets passed
> in via a function parameter?! Can you create a struct to store these =
in rather
> than this odd ball numbering?

Mikey,
Yes, it gets passed as cpuhw->mmcr array=20
I will check on these cleanup changes for the kvm vcpu case as well as =
cpu_hw_events mmcr array

Thanks
Athira
>=20
> The cleanup should start in patch 1/10 here:
>=20
>        /*
>         * The order of the MMCR array is:
> -        *  - 64-bit, MMCR0, MMCR1, MMCRA, MMCR2
> +        *  - 64-bit, MMCR0, MMCR1, MMCRA, MMCR2, MMCR3
>         *  - 32-bit, MMCR0, MMCR1, MMCR2
>         */
> -       unsigned long mmcr[4];
> +       unsigned long mmcr[5];
>=20
>=20
>=20
> mikey

