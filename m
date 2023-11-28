Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DDA7FBE40
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 16:38:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AHOX7zX+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sfmp81lxcz3dLG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 02:38:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AHOX7zX+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SfmnK2fFhz3cVZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 02:38:12 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ASF9Tg8006294;
	Tue, 28 Nov 2023 15:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=i087F9hPhRw/IkURkL+V7YhA3IXta7GKJcrrAdlEabI=;
 b=AHOX7zX+ZJGweQnIzahWOTU8BT3UyJ/5NCUaI2ubizKg8cSjsIV3CaiW/5BZ8rghzxW3
 v55x7QVLvAL1eFXQCWaKl7Q2/MmAF1njypcc37rqwOtF1IZojuhQTJ8ITz2f21C01eAz
 c3Q3ZGFxQZy9tvcHvbIecIwio2oqEiqO0LA/N4K9oE451QlqXHfCPZ28jnJ/CNlv9au3
 92lI7lRyB/lZMjAZGlHrlc+jZbr6zjjINLueaUQhUegNSH2tJ+7RNBHIihS2ybFclaIF
 ZxCYU1bOovJ3dLIHAYjsRV/OzyZsOVUi4nEugwpggCBE/rmYohegg1o9FGkznYJSjtA1 Pw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3unjkprudn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 15:38:03 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3ASF9pm3009521;
	Tue, 28 Nov 2023 15:38:03 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3unjkprud4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 15:38:03 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3ASDQLlo012197;
	Tue, 28 Nov 2023 15:38:02 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ukvrkgfw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 15:38:02 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3ASFc19V61473112
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Nov 2023 15:38:01 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6398C58062;
	Tue, 28 Nov 2023 15:38:01 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A8F45805E;
	Tue, 28 Nov 2023 15:38:01 +0000 (GMT)
Received: from localhost (unknown [9.61.20.55])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 Nov 2023 15:38:01 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH v4 09/13] powerpc/pseries: Add papr-vpd character driver
 for VPD retrieval
In-Reply-To: <20231121083101.GK9696@kitsune.suse.cz>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-9-b794d8cb8502@linux.ibm.com>
 <20231121083101.GK9696@kitsune.suse.cz>
Date: Tue, 28 Nov 2023 09:38:01 -0600
Message-ID: <87ttp528iu.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KKYJON61omDPBLO_XpG4U5t6FhZt5Mfw
X-Proofpoint-ORIG-GUID: UB5jqn8JW3vJCBWvdFvypLmLqStLzQwB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_17,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 mlxlogscore=700 mlxscore=0 suspectscore=0 adultscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280125
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
Cc: gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
>
> On Fri, Nov 17, 2023 at 11:14:27PM -0600, Nathan Lynch via B4 Relay wrote:
>> +	do {
>> +		blob =3D papr_vpd_run_sequence(loc_code);
>> +		if (!IS_ERR(blob)) /* Success. */
>> +			break;
>> +		if (PTR_ERR(blob) !=3D -EAGAIN) /* Hard error. */
>> +			break;
>> +		pr_info_ratelimited("VPD changed during retrieval, retrying\n");
>> +		cond_resched();
>> +	} while (!fatal_signal_pending(current));
>
> this is defined in linux/sched/signal.h which is not included.
>


>> +static long papr_vpd_create_handle(struct papr_location_code __user *ul=
c)
>> +{
>> +	struct papr_location_code klc;
>> +	const struct vpd_blob *blob;
>> +	struct file *file;
>> +	long err;
>> +	int fd;
>> +
>> +	if (copy_from_user(&klc, ulc, sizeof(klc)))
>> +		return -EFAULT;
>
> This is defined in linux/uaccess.h which is not included.
>
> Same for the sysparm driver.
>
> Tested-by: Michal Such=C3=A1nek <msuchanek@suse.de>

Thanks, I'll fix these issues and add your T-B to this patch.
