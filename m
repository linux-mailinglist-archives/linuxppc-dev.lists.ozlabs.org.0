Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC2C447242
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Nov 2021 10:00:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hn7VR1sXfz2yyv
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Nov 2021 19:59:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=funmcszV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=funmcszV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hn7Tg3zS4z2xsm
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Nov 2021 19:59:18 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A73Ggu4034793
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 7 Nov 2021 08:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=taPOn3mx2V+GskIG5JxAuLweJQfU+RV2TSbVb8Ew5dY=;
 b=funmcszVayijc+FJ0z4lKKowgZQYwf22vR8GyEugMVe4J5HTNX3LAX3ofPNKjPowfZzs
 sQ8OzQyFTZU/f+1bmABA5c+agOLePwdgjqq9dChhS1AWawfpHqKEv0sj7LDUBwnFEsEq
 8aUq5C7Ch347TGUmCDMpUs2El538c6wIOWAa7WT9+/wfZ8DrxFGt1uFgaIjZFVp7sVAx
 EPVQYE97ttb2aySSFAyw3/6YMFbVmCAbFR4pi778uFcBURe3LZBmzbeaMCiRhcNHjcUB
 5PHWBoP2DL55Fp0t3xqdHvSKLG046svxG6WSRFp1cf9GELv5SJ7/bzUv/2GNBpsA9R6X Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c66rp3vty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Nov 2021 08:59:15 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A78sLxM033697
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 7 Nov 2021 08:59:14 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c66rp3vtm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 07 Nov 2021 08:59:14 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A78rlwF019368;
 Sun, 7 Nov 2021 08:59:12 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3c5gyhwh1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 07 Nov 2021 08:59:12 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A78x9c463177110
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 7 Nov 2021 08:59:10 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC76CA4051;
 Sun,  7 Nov 2021 08:59:09 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 067E2A4040;
 Sun,  7 Nov 2021 08:59:09 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.2.41])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun,  7 Nov 2021 08:59:08 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] powerpc/pseries: use slab context cpumask allocation in
 CPU hotplug init
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <20211105132923.1582514-1-npiggin@gmail.com>
Date: Sun, 7 Nov 2021 14:29:06 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <A6BC6E6D-C01D-4B8B-9B42-5A165A797BD2@linux.vnet.ibm.com>
References: <20211105132923.1582514-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5gqnzEfbCO4WBnuUPjXaq8aTDU-bJsXr
X-Proofpoint-GUID: MDjabB4Lqdjjb5GoltfraXEyZnQVtY_X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-07_03,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111070053
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



> On 05-Nov-2021, at 6:59 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> Slab is up at this point, using the bootmem allocator triggers a
> warning. Switch to using the regular cpumask allocator.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Fixes the warning for me. Thanks

Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>

>=20
> This only matters when CONFIG_CPUMASK_OFFNODE=3Dy, which has not been
> possible before on powerpc.
>=20
> Thanks,
> Nick
>=20
> arch/powerpc/platforms/pseries/hotplug-cpu.c | 9 +++++----
> 1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c =
b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> index d646c22e94ab..78a70ba60d24 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -1016,12 +1016,13 @@ static int __init =
pseries_cpu_hotplug_init(void)
> 	/* Processors can be added/removed only on LPAR */
> 	if (firmware_has_feature(FW_FEATURE_LPAR)) {
> 		for_each_node(node) {
> -			=
alloc_bootmem_cpumask_var(&node_recorded_ids_map[node]);
> +			if =
(!alloc_cpumask_var_node(&node_recorded_ids_map[node],
> +						    GFP_KERNEL, node))
> +				return -ENOMEM;
>=20
> 			/* Record ids of CPU added at boot time */
> -			cpumask_or(node_recorded_ids_map[node],
> -				   node_recorded_ids_map[node],
> -				   cpumask_of_node(node));
> +			cpumask_copy(node_recorded_ids_map[node],
> +				     cpumask_of_node(node));
> 		}
>=20
> 		of_reconfig_notifier_register(&pseries_smp_nb);
> --=20
> 2.23.0
>=20

