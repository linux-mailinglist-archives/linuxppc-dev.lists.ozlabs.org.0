Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A47AB417992
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Sep 2021 19:18:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HGJdL3zHWz30Bl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Sep 2021 03:17:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j6mdPAZC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=j6mdPAZC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HGJcd6YNWz2yNK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Sep 2021 03:17:21 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18OFAouS020656; 
 Fri, 24 Sep 2021 13:17:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=LGDl+7E/U6gZKY2oxjTnoA+YYK0Ll7Cp1H0S/Qzpw9E=;
 b=j6mdPAZCQIdpbDFkX+P5kJCnNPSqVVvLm3F5hwTlPErN8FjaChFuzwEy2Pu58QMHSX3n
 hivdtUgSQmoUjV7utpU5RfMq7DVePfujbff5wi93wE3E5Dt6dyYwLSq2fqyyyufqDW/g
 3cg0q+knPWOiegpeZ4pIiNx/0wKgwAc9ry246mrjgpxS8XPJyI+NJJGEii7DfP7z85Ne
 CzqkO7daH8W2j4OolUAngYdd0WUCCWIrAbVcSIxzlgI69luXu77ev1ID+i/G5FaeHv9/
 V9qa0PZUS1DSfw1PlscXrrSECzbdrtbnvfTgGxTTfxl6HyQccDRnoOySzjCRiJzgRCVj Ow== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b9f6cpp2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 13:17:16 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18OHC1t7030134;
 Fri, 24 Sep 2021 17:17:14 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3b93g704t4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 17:17:13 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18OHHBTF60031458
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Sep 2021 17:17:11 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CCB54C063;
 Fri, 24 Sep 2021 17:17:11 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26D604C04E;
 Fri, 24 Sep 2021 17:17:11 +0000 (GMT)
Received: from localhost (unknown [9.43.47.88])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 24 Sep 2021 17:17:10 +0000 (GMT)
Date: Fri, 24 Sep 2021 22:47:09 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: coherency issue observed after hotplug on POWER8
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 linuxppc-dev@lists.ozlabs.org
References: <YUpIqytZqpohq4EM@mussarela>
In-Reply-To: <YUpIqytZqpohq4EM@mussarela>
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1632500323.sp1p885nv8.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RhYD2bRw9zS-o2YDHq7C5V0IPjYhJFTS
X-Proofpoint-ORIG-GUID: RhYD2bRw9zS-o2YDHq7C5V0IPjYhJFTS
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-24_05,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1011 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109240108
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Cascardo,
Thanks for reporting this.


Thadeu Lima de Souza Cascardo wrote:
> Hi, there.
>=20
> We have been investigating an issue we have observed on POWER8 POWERNV sy=
stems.
> When running the kernel selftests reuseport_bpf_cpu after a CPU hotplug, =
we see
> crashes, in different forms. [1]

Just to re-confirm: you are only seeing this on P8 powernv, and not in a=20
P8 guest/LPAR? I haven't been able to reproduce this on a firestone --=20
can you share more details about your power8 machine?

Also, do you only see this with ubuntu kernels, or are you also able to=20
reproduce this with the upstream tree?

>=20
> I managed to get xmon on that trap, and did some debugging. [2] I tried t=
o dump
> the BPF JIT code, and it looks different when dumped from CPU#0 and CPU#0=
x9f
> (the one that was hotplugged, offlined, then onlined).

Next time you reproduce this, can you try dumping the SLBs for the cpus=20
(command 'u' in xmon)?

>=20
> Here is my partial analysis [3]. Basically, the BPF JIT fills a page with
> invalid instructions (traps, in ppc64 case), and puts the BPF program in a
> random offset of the page. In the case of the hotplugged CPU, which was t=
he one
> that compiled the program, the page had the expected contents (BPF program
> started at the offset used to run the program). On the other CPU (in many
> cases, CPU #0), the same memory address/page had different contents, with=
 the
> program starting at a different offset.

From [3], I think fp->aux->jit_data can be NULL if there are subprogs.=20=20
But, I find it interesting that you don't always see the correct=20
bpf_func, as reported in comment #25. Can you also try dumping the full=20
bpf_prog structure (prog/fp) from xmon?

>=20
> Is this a case of a bug in the micro-architecture or the firmware when=20
> doing the hotplug? Can someone chime in?

It's possible that something is going wrong when offlining the cpu. Can=20
you try booting the kernel with 'powersave=3Doff' and see if the problem=20
goes away?

>=20
> Notice that we can't reproduce the same issue on a POWER9 system.
>=20
> Thanks.
> Cascardo.
>=20
> [1] https://bugs.launchpad.net/ubuntu-kernel-tests/+bug/1927076
> [2] https://bugs.launchpad.net/ubuntu-kernel-tests/+bug/1927076/comments/=
29
> [3] https://bugs.launchpad.net/ubuntu-kernel-tests/+bug/1927076/comments/=
30
>=20

- Naveen

