Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1835AD0B5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 12:56:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLlns4s61z3bgR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 20:56:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NoWBDane;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NoWBDane;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLln85c1Gz2xGK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 20:56:12 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 285Ad8wa028786;
	Mon, 5 Sep 2022 10:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=BLtgTU7RLqF4DIh4hpjso2OEbNRHLyA5WHWUcoN2Cxc=;
 b=NoWBDanezj0502lSFKu+OT1S2UeYFd9AJzSCEWZ/IwUQU9fWFgoyxhSBfJrYeBYoAnG4
 49iCPIxVZjqx33FTGPbib/ZsOQV4mUs6YO/jZnmVzjNAaS2ezZXh68wGsOrlV9d5T2N3
 uW37x+CBUUjKY3DenkOOPfdnk4tfw4swsfjFAJ1wLgdBX5/RmnT9Tunqmvnb4CK+QKvj
 BgyTMgetUGHkmEoBe60Yq61qCmBQxM0Z+yCSfTA4L+BzKvOzHGlEECzY/2W8GTMOgPoF
 Nv30ifBULWJiSXNhLmr3ijpluMDS0FePjuiN35kKcIo/WVsOUvqu6g0oUSaGohA88yIf BA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jde1sbmwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Sep 2022 10:55:49 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2859a8Ya020031;
	Mon, 5 Sep 2022 10:55:49 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jde1sbmw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Sep 2022 10:55:48 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 285AqLSs010767;
	Mon, 5 Sep 2022 10:55:46 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03ams.nl.ibm.com with ESMTP id 3jbxj8tbbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Sep 2022 10:55:46 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 285AtioQ25428364
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Sep 2022 10:55:44 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CD1211C050;
	Mon,  5 Sep 2022 10:55:44 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D9AAA11C054;
	Mon,  5 Sep 2022 10:55:43 +0000 (GMT)
Received: from localhost (unknown [9.43.114.209])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  5 Sep 2022 10:55:43 +0000 (GMT)
Date: Mon, 05 Sep 2022 16:25:42 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 11/16] objtool: Add --mnop as an option to --mcount
To: Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy
	<sv@linux.ibm.com>
References: <20220829055223.24767-1-sv@linux.ibm.com>
	<20220829055223.24767-12-sv@linux.ibm.com>
	<YxEHM8ZL1XAFsj4H@hirez.programming.kicks-ass.net>
In-Reply-To: <YxEHM8ZL1XAFsj4H@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1662374882.xll36f5qp9.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -ivhpHtwgOuKksI_EqLA-PE6EGqb9quV
X-Proofpoint-GUID: hQxC3vMDz6wa3zeQUJbX6AAjXuYDmZCb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-05_07,2022-09-05_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=920
 adultscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209050051
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
Cc: aik@ozlabs.ru, chenzhongjin@huawei.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, mingo@redhat.com, rostedt@goodmis.org, jpoimboe@redhat.com, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Peter Zijlstra wrote:
> On Mon, Aug 29, 2022 at 11:22:18AM +0530, Sathvika Vasireddy wrote:
>> Architectures can select HAVE_NOP_MCOUNT if they choose
>> to nop out mcount call sites. If that config option is
>> selected, then --mnop is passed as an option to objtool,
>> along with --mcount.
>>=20
>> Also, make sure that --mnop can be passed as an option
>> to objtool only when --mcount is passed.
>>=20
>> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
>=20
> IIRC you want to nop the things yourself because PLT entries or
> something?

For two reasons:
1. We want to maintain a pointer to 'struct module' as part of the=20
ftrace rec so that we can patch ftrace sites in modules to go to module=20
stubs.
2. We depend on compiler generated long branches to support large=20
kernels.

>=20
> Anyway, patch looks fine, even though the Changelog doesn't relaly
> justify the change.

Sure. We should add that powerpc kernel does not support nop'ed out=20
ftrace locations.

>=20
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>=20

Thanks,
Naveen
