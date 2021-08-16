Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D13553ED9D4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 17:26:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpJ0b5827z3bXX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 01:26:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gwd4G61y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gwd4G61y; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpHzr3KPCz303x
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 01:25:43 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GF2i9F073163; Mon, 16 Aug 2021 11:25:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=F8rtMGKAGflzPs0uMRoZN+bSle26Ow3LeTsMYeDtHHc=;
 b=gwd4G61yP1gqIw3ukPKBi52byhA7M43FwtM7rTlQjKOO0dNhcRSeD7g5toGHInxPMN89
 NFpBRTosXjtZxYMPqTgKctJFP6szVVJbRiDYD0dk5Oe/BIXQ35HTUlDIzooXPVioC5l+
 ePQNlgx8X3KXB7QZg2CuGaYKoBRwbAQOYlPHWf1BY8OQDd2qwNRDOsiWo4rOhf2JuHTt
 7VOK5PqJ8AZTg3bLOq6GNYrEndegjgoA51vIxg6DIHJZWbUdWe3+4THfaZiVQ8hWWMA0
 3R5y5LLDI4j2lQpqYGdtFQ/MkxIUP35WjBTCmXJ8c1Yy5Ccvv4o7dcU3uewT7uTXDKAL 9w== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aeua03h1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 11:25:33 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17GFCnXb022188;
 Mon, 16 Aug 2021 15:25:33 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 3ae5fbd01f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 15:25:33 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17GFPVJs26411336
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 15:25:31 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C52D8C605A;
 Mon, 16 Aug 2021 15:25:31 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D947C6057;
 Mon, 16 Aug 2021 15:25:31 +0000 (GMT)
Received: from localhost (unknown [9.211.33.17])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 16 Aug 2021 15:25:31 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries/cpuhp: fix non-NUMA build
In-Reply-To: <e9935336-43e3-228d-57f9-40cec438a23f@csgroup.eu>
References: <20210816151705.2786296-1-nathanl@linux.ibm.com>
 <e9935336-43e3-228d-57f9-40cec438a23f@csgroup.eu>
Date: Mon, 16 Aug 2021 10:25:31 -0500
Message-ID: <87bl5x8l90.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GSCGW-7EnPhRs0nm4hxxhEjDss9YQZUs
X-Proofpoint-ORIG-GUID: GSCGW-7EnPhRs0nm4hxxhEjDss9YQZUs
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-16_05:2021-08-16,
 2021-08-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=927 phishscore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108160096
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
Cc: ldufour@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 16/08/2021 =C3=A0 17:17, Nathan Lynch a =C3=A9crit=C2=A0:
>> With CONFIG_NUMA unset, direct references to node_to_cpumask_map don't
>> work:
>>=20
>>     arch/powerpc/platforms/pseries/hotplug-cpu.c: In function 'pseries_c=
pu_hotplug_init':
>>>> arch/powerpc/platforms/pseries/hotplug-cpu.c:1022:8: error: 'node_to_c=
pumask_map' undeclared (first use in this
>>>> function)
>>      1022 |        node_to_cpumask_map[node]);
>> 	 |        ^~~~~~~~~~~~~~~~~~~
>>=20
>> Use cpumask_of_node() here instead.
>
>
> Isn't it the same as=20
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210816041032.28=
39343-1-mpe@ellerman.id.au/ ?

Yes, thanks.
