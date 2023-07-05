Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC797483A4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 13:59:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oIvsG515;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwyrP2FzVz3bsS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 21:59:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oIvsG515;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwyqY3Z5bz306t
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 21:58:49 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365Bg82M031939;
	Wed, 5 Jul 2023 11:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=mlqW7T2WWtSe4Qrhml1zXvjURCYlhdIQEK4xvx10nPc=;
 b=oIvsG5159Eku/aDHkLs9Io3OnyUue+XUUI3ZW9pUz8E4IrdA7JaQaozpesTjlJfTITs0
 Py34f5r8uxX+L6zMSTKSWiqpd/3atdpX0IwUL8IIJVfPKCMtRXDOJHAChFbq4V6xDFhf
 lPycNDRKZa+yPNB7CHU1Wi0dI/ZwFuvHat6ELPTxg+LwSceXOCub8nUaIgtnafRkVpKv
 UUMB17sCTbUCr36gMDhwNvTcuGCotyKN/KyH1KG8oE7smz2SnNlqgMIx9bHBC3jdtVPd
 ucGh2I49tJ70Ce+acVE7SgfjoMnEmlDmio9V7Rp0CppduxmfHYEg43fuI5CQ028ysoHB EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rn7vbrd5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jul 2023 11:58:36 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 365Bge3o032706;
	Wed, 5 Jul 2023 11:58:35 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rn7vbrd54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jul 2023 11:58:35 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3658lBvo028370;
	Wed, 5 Jul 2023 11:58:33 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3rjbs4svkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jul 2023 11:58:33 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 365BwUmM24445640
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jul 2023 11:58:30 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BF3520043;
	Wed,  5 Jul 2023 11:58:30 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B574E20040;
	Wed,  5 Jul 2023 11:58:29 +0000 (GMT)
Received: from [9.171.79.178] (unknown [9.171.79.178])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jul 2023 11:58:29 +0000 (GMT)
Message-ID: <b596ffda-01a2-8c88-3977-d85126b329c6@linux.ibm.com>
Date: Wed, 5 Jul 2023 13:58:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 3/9] cpu/SMT: Store the current/max number of threads
Content-Language: en-US
To: "Zhang, Rui" <rui.zhang@intel.com>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20230629143149.79073-1-ldufour@linux.ibm.com>
 <20230629143149.79073-4-ldufour@linux.ibm.com>
 <f7f8726fcab00fa7436867c58eba1032159c4af8.camel@intel.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <f7f8726fcab00fa7436867c58eba1032159c4af8.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nMgcbT_ZgRd5DK9uOcan_cIUwDzpLOIq
X-Proofpoint-ORIG-GUID: Zb6IiVDtBqEXccinMMT474GaV4PT7o6m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_02,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=688
 mlxscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307050102
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "tglx@linutronix.de" <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/07/2023 à 05:05, Zhang, Rui a écrit :
> On Thu, 2023-06-29 at 16:31 +0200, Laurent Dufour wrote:
>> From: Michael Ellerman <mpe@ellerman.id.au>
>>
>> Some architectures allows partial SMT states at boot time,
> 
> s/allows/allow.

Thanks Rui !
