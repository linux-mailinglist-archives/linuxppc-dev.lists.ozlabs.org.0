Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADABE7FBE38
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 16:36:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U3Da0Tc4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SfmlL1HVCz3d8W
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 02:36:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U3Da0Tc4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SfmkT3Stmz3cV1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 02:35:45 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ASFHKgM001327;
	Tue, 28 Nov 2023 15:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=mSXKAmnKifhDTCOr/i4VcaHocPshf/Xa8urSb7KJQ1Y=;
 b=U3Da0Tc4LHdFoCypvYxDrZfgm7b1QoiljclA7qG6o1CeuFrTAMtVTWaB0U7FQp36cjlt
 DPbMZ/7PhIGrIDjCocsxsI/gradCB77AX86ZuHn9ReJtPOuKnJy1DIvkh49CvrVCaTvP
 5YXlr2gaCt9twxyU/FSpMzXr259KMVxyoOcJvELUixGyaRMKP6eo6J/c3DZ++6509dBQ
 axLmn9jES8xbukN5+SabTkY9VqmBpMh3M7GinMG3ex9JfocFtXX/49FA7OUh+xQO/xEG
 BlFU9zwWuDAK0gwGUvT1KbegesgyvZHFDV+SVmLPpab08KPAGW33DPSmZJ9/WKw/I+k7 jg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3unhywj9np-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 15:35:36 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3ASEdaKp022622;
	Tue, 28 Nov 2023 15:35:36 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3unhywj9mm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 15:35:36 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3ASDQoLu028303;
	Tue, 28 Nov 2023 15:35:34 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ukv8ngkkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 15:35:34 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3ASFZXwJ9503386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Nov 2023 15:35:34 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4BD158056;
	Tue, 28 Nov 2023 15:35:33 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BBDC658052;
	Tue, 28 Nov 2023 15:35:33 +0000 (GMT)
Received: from localhost (unknown [9.61.20.55])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 Nov 2023 15:35:33 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: "Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org>,
        Nathan Lynch via B4
 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
        Michael Ellerman
 <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 05/13] powerpc/rtas: Facilitate high-level call
 sequences
In-Reply-To: <878r6slua9.fsf@kernel.org>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-5-b794d8cb8502@linux.ibm.com>
 <878r6slua9.fsf@kernel.org>
Date: Tue, 28 Nov 2023 09:35:33 -0600
Message-ID: <87wmu128my.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WHPkILD8bdVs4tIXoR59jmCH1Dej8nnQ
X-Proofpoint-GUID: 2F1YkUIFKaC_uspWcnxoT-RrH26w2mJH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_17,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 mlxlogscore=740 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311280124
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
Cc: tyreld@linux.ibm.com, Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org> writes:
> Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
> writes:
>> There should be no perceivable change introduced here except that
>> concurrent callers of the same RTAS function via sys_rtas() may block
>> on a mutex instead of spinning on rtas_lock. Changes to follow will
>> add rtas_function_lock()/unlock() pairs to kernel-based call
>> sequences.
>>
>
> Can you add an example of the last part. I did look at to find 06 to
> find the details
>
> 	rtas_function_lock(RTAS_FN_IBM_ACTIVATE_FIRMWARE);
>
> 	do {
> 		fwrc = rtas_call(token, 0, 1, NULL);
> 	} while (rtas_busy_delay(fwrc));
>
> 	rtas_function_unlock(RTAS_FN_IBM_ACTIVATE_FIRMWARE);

Sure, I'll add a simple example of the API usage in the commit message,
thanks.
