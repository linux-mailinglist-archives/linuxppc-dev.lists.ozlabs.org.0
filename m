Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE76487BB1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 18:59:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVrZy33JLz3bVW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jan 2022 04:59:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DW1OtPIl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DW1OtPIl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVrZC58W4z30MK
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jan 2022 04:58:59 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 207GLQZ1020948; 
 Fri, 7 Jan 2022 17:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=aExitICrkTAJ6L5fggvHU2TFfkxzUlAB3MmuLZEIi3M=;
 b=DW1OtPIl3IKn3Si2REWeYABrzesTNrFbPpn/vmHybKRdPP/q5Pj3FMm3cUylhlGUjTG8
 IdWrgHIFInfd3lrhmFjbVS2eIMQXHcQajtno+ndVJNmlw9s8teXMN6IyRMWvSUkeQ93y
 PVa/9eIBcav7EQ7KVa5yuvCGV+fw48WaCS2yzxDaAAc8EZ5tLpHtny6D9OETV8ur/Y/p
 D2uSTHog1pgsAu5rDil40Bg2lru3hHR9HhrRiKgJLTLXX0HWnY2ZJGQ0US5OALJp1A/h
 NSg2CWEJyXRgXBR5M68V3j11KJ1aY2U5816io13iHh/cSYBgYn1Ebc/rT53hZ0T8yMqK xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de59teepx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 17:58:51 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 207HofO8025081;
 Fri, 7 Jan 2022 17:58:51 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de59teeny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 17:58:51 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 207HcQHs029150;
 Fri, 7 Jan 2022 17:58:48 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3de4xx87e4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 17:58:48 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 207Hwksb43843964
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jan 2022 17:58:46 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CC9FA405B;
 Fri,  7 Jan 2022 17:58:46 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0633AA4060;
 Fri,  7 Jan 2022 17:58:46 +0000 (GMT)
Received: from localhost (unknown [9.43.90.227])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jan 2022 17:58:45 +0000 (GMT)
Date: Fri, 07 Jan 2022 23:28:44 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/3] powerpc/bpf: Reallocate BPF registers to volatile
 registers when possible on PPC64
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Jordan Niethe
 <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210727065539.299598-1-jniethe5@gmail.com>
 <20210727065539.299598-3-jniethe5@gmail.com>
 <0c70202c-54f7-78e7-0091-0dfa8e6ab207@csgroup.eu>
In-Reply-To: <0c70202c-54f7-78e7-0091-0dfa8e6ab207@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/v0.16-1-g4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1641576378.y0c7p3in1e.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -Cu8BhuwCo4SWqcrR7XmM4LeDlrwVhxD
X-Proofpoint-ORIG-GUID: otU9NgZcNGa8cXwWcawjWuF0EAC3zjif
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_07,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070114
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
>=20
> Maybe you could try and do as on PPC32, try to use r0 as much as possible=
 instead of TMP regs.
> r0 needs to be used carefully because for some instructions (ex: addi, lw=
z, etc) r0 means 0 instead=20
> of register 0, but it would help freeing one more register in several cas=
es.

Yes, but I think the utility of register re-mapping is debatable on=20
ppc64 since we are using NVRs only for BPF NVRs. Unlike the savings seen=20
with the test case shown in the commit description (and with other test=20
programs in test_bpf), most real world BPF programs will be generated by=20
llvm which will only use the NVRs if necessary. I also suspect that most=20
BPF programs will end up making at least one helper call.

On ppc32 though, there is value in re-mapping registers, especially=20
BPF_REG_AX and TMP_REG, and to a lesser extent, BPF_REG_5, since those=20
are volatile BPF registers and can be remapped regardless of a helper=20
call.


- Naveen

