Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF634CAAA6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 17:41:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K80HG2QsBz3c2m
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 03:40:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cPS4h7Pn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cPS4h7Pn; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K80GW30q1z3brF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 03:40:18 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222FmdiS036378; 
 Wed, 2 Mar 2022 16:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=WNt06/XR+OdT7Pz6h9Sni6bWV6A/DMwFVnFcYEFD7Rc=;
 b=cPS4h7PnJVkAQAh/5jiA6FhcSOeDZ/bt+Q1BhV5sKCS32D51Nzh5EQg5HTkpU9nby/59
 ZyjSonjrM/6V9LxwJz29HhKVIujS1sFN0ic8RjKqae82NrUgVWp7iIiN3Dmt2lx+bQiT
 4wSgSqGvpdTk28FCkU5mgbz05vsGOZBcE2bX97Sjp1HpE2yHI7tCXRFBpI71sykrQ0x3
 y84rQOoQlcoOgAM6u8NKNHwuPYFRKM16we1kuVA50+couDpf3wgh8QoXYabpdJcQNyX2
 7OAq3WCo/SZDz95z+PymbWtHDnqIpW14R9B50tAAiwUde4gSTijN2+rUGurQg6R6B0FS XQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ejbj4s44t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 16:40:10 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 222GPOiS006579;
 Wed, 2 Mar 2022 16:40:09 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ejbj4s445-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 16:40:09 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222GdKOU008519;
 Wed, 2 Mar 2022 16:40:08 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3efbu95upy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 16:40:07 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 222GTAMd52232450
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 16:29:10 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A06384C044;
 Wed,  2 Mar 2022 16:40:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 304544C050;
 Wed,  2 Mar 2022 16:40:05 +0000 (GMT)
Received: from localhost (unknown [9.43.109.149])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Mar 2022 16:40:05 +0000 (GMT)
Date: Wed, 02 Mar 2022 22:10:03 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/3] powerpc/bpf: Reallocate BPF registers to volatile
 registers when possible on PPC64
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Jordan Niethe
 <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210727065539.299598-1-jniethe5@gmail.com>
 <20210727065539.299598-3-jniethe5@gmail.com>
 <468b04e9-4fa6-883d-fb9a-96a1371c6d8d@csgroup.eu>
In-Reply-To: <468b04e9-4fa6-883d-fb9a-96a1371c6d8d@csgroup.eu>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1646238972.4ud3oenbsd.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uzrZ6ro364WIpn3wy4ohc-n8sqs9NwqZ
X-Proofpoint-GUID: HkRUq2vewPJoF0hQSTzjnBn51C2pCscy
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_12,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2203020073
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

Christophe Leroy wrote:
>=20
>=20
> Le 27/07/2021 =C3=A0 08:55, Jordan Niethe a =C3=A9crit=C2=A0:
>> Implement commit 40272035e1d0 ("powerpc/bpf: Reallocate BPF registers to
>> volatile registers when possible on PPC32") for PPC64.
>>=20
>> When the BPF routine doesn't call any function, the non volatile
>> registers can be reallocated to volatile registers in order to avoid
>> having to save them/restore on the stack. To keep track of which
>> registers can be reallocated to make sure registers are set seen when
>> used.
>>=20
>> Before this patch, the test #359 ADD default X is:
>>     0:   nop
>>     4:   nop
>>     8:   std     r27,-40(r1)
>>     c:   std     r28,-32(r1)
>>    10:   xor     r8,r8,r8
>>    14:   rotlwi  r8,r8,0
>>    18:   xor     r28,r28,r28
>>    1c:   rotlwi  r28,r28,0
>>    20:   mr      r27,r3
>>    24:   li      r8,66
>>    28:   add     r8,r8,r28
>>    2c:   rotlwi  r8,r8,0
>>    30:   ld      r27,-40(r1)
>>    34:   ld      r28,-32(r1)
>>    38:   mr      r3,r8
>>    3c:   blr
>>=20
>> After this patch, the same test has become:
>>     0:   nop
>>     4:   nop
>>     8:   xor     r8,r8,r8
>>     c:   rotlwi  r8,r8,0
>>    10:   xor     r5,r5,r5
>>    14:   rotlwi  r5,r5,0
>>    18:   mr      r4,r3
>>    1c:   li      r8,66
>>    20:   add     r8,r8,r5
>>    24:   rotlwi  r8,r8,0
>>    28:   mr      r3,r8
>>    2c:   blr
>>=20
>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>=20
> If this series is still applicable, it needs to be rebased of Naveen's=20
> series https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D2=
86000

Thanks for bringing this up. My apologies - I missed copying you and=20
Jordan on the new series.

I have included the first patch and a variant of the second patch in=20
this series, in the new series I posted. For patch 3/3, it might be=20
simpler to not track temp register usage on ppc64.


Thanks,
Naveen

