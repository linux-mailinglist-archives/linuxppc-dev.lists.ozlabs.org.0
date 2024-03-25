Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B658188B18C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 21:35:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RTtHgheI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3Pp03hJGz3vYs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 07:35:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RTtHgheI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3PnD55Qzz30hQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 07:34:55 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42PGsDaY004294;
	Mon, 25 Mar 2024 20:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=KlW/iZH0MVPVS2qjCipoBxhnKJWN2pRP1CBAvcdk8Yk=;
 b=RTtHgheIhZ6m2+vBlVW1wYwurSPlNFhQwceVg53w/2Psf1U7VYIfZFHfHMLTENzy5k22
 YDLFuDjBaamyNBM5hEowAaHfFT4S1f30yFeHwxmMvgwI7HNQD9GCtwbBDRf93gaQnEZS
 gYlKcz93HTil9VMNPoh5cOVMU528maY+9TT9PCurpp/fjpPvW2FjxzAWRHrcjdSbEXGz
 wFpKR2TDowh3FQ5lhqipWr7q9Qjd6PxE/uz10egX2BnpBU7DZI+Rof1D0IaEzoa0no6R
 hsWKCd2PeA3sGUCONpCUgjr0sXbGYaeO6kkXWPbehrvOOafk1CATM89fkXUmcsq/EuQy vA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x3aygrrxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 20:34:36 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42PKYamv024679;
	Mon, 25 Mar 2024 20:34:36 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x3aygrrxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 20:34:35 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42PIiQ6h003767;
	Mon, 25 Mar 2024 20:34:35 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x2c42k0gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 20:34:35 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42PKYWGc46793076
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Mar 2024 20:34:34 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 91AE65806C;
	Mon, 25 Mar 2024 20:34:30 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 732A25805A;
	Mon, 25 Mar 2024 20:34:30 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Mar 2024 20:34:30 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        paulmck
 <paulmck@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas
 Piggin <npiggin@gmail.com>,
        Christophe Leroy
 <christophe.leroy@csgroup.eu>,
        "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: Appropriate liburcu cache line size for Power
In-Reply-To: <19c3ea76-9e05-4552-8b93-6c42df105747@efficios.com>
References: <19c3ea76-9e05-4552-8b93-6c42df105747@efficios.com>
Date: Mon, 25 Mar 2024 15:34:30 -0500
Message-ID: <87jzlqqcdl.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -SF2m3cqkzzoH0wWCzD0THi0hwrFNMAy
X-Proofpoint-ORIG-GUID: mKrK3sg_mwt8hyQqKpPkt6w2m6r9oNMH
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_19,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 adultscore=0 mlxlogscore=818 malwarescore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403250125
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mathieu Desnoyers <mathieu.desnoyers@efficios.com> writes:
> In the powerpc architecture support within the liburcu project [1]
> we have a cache line size defined as 256 bytes with the following
> comment:
>
> /* Include size of POWER5+ L3 cache lines: 256 bytes */
> #define CAA_CACHE_LINE_SIZE     256
>
> I recently received a pull request on github [2] asking to
> change this to 128 bytes. All the material provided supports
> that the cache line sizes on powerpc are 128 bytes or less (even
> L3 on POWER7, POWER8, and POWER9) [3].
>
> I wonder where the 256 bytes L3 cache line size for POWER5+
> we have in liburcu comes from, and I wonder if it's the right choice
> for a cache line size on all powerpc, considering that the Linux
> kernel cache line size appear to use 128 bytes on recent Power
> architectures. I recall some benchmark experiments Paul and I did
> on a 64-core 1.9GHz POWER5+ machine that benefited from a 256 bytes
> cache line size, and I suppose this is why we came up with this
> value, but I don't have the detailed specs of that machine.
>
> Any feedback on this matter would be appreciated.

For what it's worth, I found a copy of an IBM Journal of Research &
Development article confirming that POWER5's L3 had a 256-byte line
size:

  Each slice [of the L3] is 12-way set-associative, with 4,096
  congruence classes of 256-byte lines managed as two 128-byte sectors
  to match the L2 line size.

https://www.eecg.utoronto.ca/~moshovos/ACA08/readings/power5.pdf

I don't know of any reason to prefer 256 over 128 for current Power
processors though.
