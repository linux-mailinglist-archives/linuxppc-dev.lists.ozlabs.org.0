Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C92934DAE47
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 11:31:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJRQ44jSkz3081
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 21:31:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gXrVZg7x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gXrVZg7x; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJRPM0t6Yz2yMj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 21:30:30 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22GAOYwF007991; 
 Wed, 16 Mar 2022 10:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=eq07JzFKgeZdckIPECz1243DvjZTcOaq+CkPUajOd7Y=;
 b=gXrVZg7x63o7+iC5HAdB4TMuRUH3QvtxggPwztzJnrBwVEr+pVDVSam95K3O8V1X+ZKR
 D6/ktFJKUwpTrKUkft/pur1ay1kAgU+hO1efOUayLl24J4MFrvp6VPCT7MWx5bPvKHMa
 GKf+DN+KvkPK+3Whmp45y0s4QI3Ne0IMoOGqgQSfvJAx7bK4TTR3F43xGCRqbFsrb0FF
 a0JjlN99P7v6abpnWeANKIOBxjt8Guu4kepCdLnI0PuGjcqHBYOeqzXJ9RmR3gq9wUNK
 6cpTlyhw5MMMWNKLRLTiQ9/1XP6Yr3SKWM+aYqRIVxeU5XfDG8my+UF1Mg4zs/qP4ejV hg== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eue4802gn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Mar 2022 10:30:28 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22GARGMD018591;
 Wed, 16 Mar 2022 10:30:25 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3erk58qehs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Mar 2022 10:30:25 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22GAIuNi48431460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Mar 2022 10:18:56 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9407542041;
 Wed, 16 Mar 2022 10:30:23 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97F9F42042;
 Wed, 16 Mar 2022 10:30:22 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.79.177.2])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 16 Mar 2022 10:30:22 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [powerpc]Kernel crash while running LTP (execveat03)
 [next-20220315]
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20220316100621.c5vpouz6cvyu6l7h@riteshh-domain>
Date: Wed, 16 Mar 2022 16:00:21 +0530
Message-Id: <948D5C15-1FEA-4533-AA09-90B150B6AAE6@linux.ibm.com>
References: <19C0AAEE-43C1-4A17-83DC-5EC24BB1E0BE@linux.ibm.com>
 <20220316100621.c5vpouz6cvyu6l7h@riteshh-domain>
To: Ritesh Harjani <riteshh@linux.ibm.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: O0Gy4cFgLxLw2RjsMOYUly5g8dBP5C29
X-Proofpoint-ORIG-GUID: O0Gy4cFgLxLw2RjsMOYUly5g8dBP5C29
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-16_03,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 spamscore=0 mlxlogscore=983 adultscore=0 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203160062
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
Cc: Ext4 Developers List <linux-ext4@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>> Bisect points to following commit:
>> commit 9d5623d7ef8765f21f629e4ac636c19ec245e254
>>    ext4: return early for non-eligible fast_commit track events
>>=20
>> Reverting this commit allows the test to run successfully.
>=20
> Hi Sachin,
>=20
> Thanks so much for the report. Yes, this was discussed today here [1].
> Ted mentioned, he had to add a change to fix this crash.
> Once that is in, this should be fixed.
>=20
> If you like you can apply below change and continue with your testing.
>=20
Thanks. Yes this patch fixes the reported problem for me.

fwiw Tested-by: Sachin Sant <sachinp@linux.ibm.com>

> [1]: https://lore.kernel.org/linux-ext4/164714672856.1260831.166713237373=
69796834.b4-ty@mit.edu/T/#mdeff2bbdf0d107021514a9c44478d642936c4f9c
>=20
> -ritesh

- Sachin=
