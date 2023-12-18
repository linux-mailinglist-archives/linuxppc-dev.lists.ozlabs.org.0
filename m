Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B91488166FA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Dec 2023 08:03:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XtIYXEFC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4StrQb2twQz3c96
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Dec 2023 18:03:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XtIYXEFC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4StrPl1dTfz2yDY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Dec 2023 18:03:06 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BI4Kdkh013496;
	Mon, 18 Dec 2023 07:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=wdBcFg9IHbEgDm/zWm1Sykzq4/1nQfZkY2q+2Yq2Arg=;
 b=XtIYXEFCj6qyDd55FrM7qnPU/w1bAAa1hy9Qa9ytFy48YUngXF1Ce8v2BuplhUj9GCkY
 8tn8t9vD3q2H5vx4ehMk6bufZj06HbSzLLAamzu2cvGzcwCSI/UWxtJnEtxKQeD5Z5OS
 AxsbexOffAwmJn/KrDU3KU7S0V8IKU98KQsOrmulRCYWIlnBusMFTTTpjgkmr2c0jRdh
 LPgxkSBrWu6LKjoJMCUO1Yw25pYvAhUFZdcRIa5lRlEBfAF7DXIrTQsdORssYmTQCt+S
 x1mbETuFXIHRpShzPe1yzwdpkuvq9eiUemXV14PKDRPpT0OhZUvGIxrqOY3rdCyMBTva qw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v2d5m5x4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 07:02:53 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BI6siGa003983;
	Mon, 18 Dec 2023 07:02:53 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v2d5m5x3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 07:02:53 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BI6hROb013890;
	Mon, 18 Dec 2023 07:02:51 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3v1qqjy33d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 07:02:51 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BI72mIG14877274
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Dec 2023 07:02:48 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D06D2004D;
	Mon, 18 Dec 2023 07:02:48 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9FA882004B;
	Mon, 18 Dec 2023 07:02:41 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.67.29.237])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon, 18 Dec 2023 07:02:41 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Mon, 18 Dec 2023 12:32:39 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
        linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org
Subject: Re: [PATCH 09/12] KVM: PPC: Book3S HV nestedv2: Do not call
 H_COPY_TOFROM_GUEST
In-Reply-To: <086fb48f-ea7c-4b4e-b3b5-c930aa74bbb2@kernel.org>
References: <20231201132618.555031-1-vaibhav@linux.ibm.com>
 <20231201132618.555031-10-vaibhav@linux.ibm.com>
 <87sf4dun37.fsf@kernel.org> <87jzplmlx5.fsf@vajain21.in.ibm.com>
 <086fb48f-ea7c-4b4e-b3b5-c930aa74bbb2@kernel.org>
Date: Mon, 18 Dec 2023 12:32:39 +0530
Message-ID: <87zfy89enk.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: w0f2WWGEW9ZO6hI9HB8Gddt-XJl100cV
X-Proofpoint-GUID: eIFA4nS3Ix1QTcwrkV5m9SMGFvSDbg1F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-18_03,2023-12-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 mlxlogscore=917
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312180049
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, amachhiw@linux.vnet.ibm.com, gautam@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, David.Laight@ACULAB.COM, kconsul@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Aneesh,

"Aneesh Kumar K.V" <aneesh.kumar@kernel.org> writes:

<snip>
>> Yes, Agreed and thats a nice suggestion. However ATM the hypervisor 
>> supporting Nestedv2 doesnt have support for this hcall. In future
>> once we have support for this hcall for nestedv2 from the hypervisor
>> we can replace this branch with a firmware_has_feature() test.
>> 
>
> What I am suggesting is we convert that conditional to firmware_has_feature so that
> later when hypervisor supports this hcall all older kernel can make
> use of the copy_tofrom_guest without any code change.

AFAIK for firmware_has_feature to work we either need:
- A way to call this hcall with some invalid args. However lpid/pid for
guest arent allocated during boot.

- A way for hypervisor to advertise support for this hcall before the L1
kernel boots.

ATM L0 dosent support for any of these two ways. I can do a follow up
patch later when we have a clarity on how we want to advertise support
for this hcall. For now current kernel supporting nestedv2 wont be
using this hcall assuming its not supported. Future kernels can use one
of the two ways above to set the firmware_has_feature flag to take
advantage of this hcall.


-- 
Cheers
~ Vaibhav
