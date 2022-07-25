Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E694257FEFC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 14:26:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LrzmV6CDpz3cjJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 22:26:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pXoNXmj6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pXoNXmj6;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LrzlZ6hmhz3cjL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 22:25:30 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26PCEp16024163;
	Mon, 25 Jul 2022 12:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+7hMN0q9bSC1Ax80dNPgUH6uvz9nFDik+dDQ/moFeyI=;
 b=pXoNXmj6ASPxcc2MUMkLCeOmtnC/wUQXinKKGQi4VSEHQlDeY16Aeu1dTYz5L8juWAPd
 dNiOq4fZ9m/rw7UAkoQGufY3wD8d47zO2s+CnIF7jjhzS5Xvc8oGQmxcHkMgddhSuIom
 xO2hGddaCD+Eg183ogh0fCxCTNp9zuyfIvW9HQmfcp7sq2t7Tr3Czp70C8nOi2EukZcZ
 xHKEQU88RILejBcui7SR/U/CecwadJD8RaaUIaaMaD22/+fNXl/2j4MTDjTwQsDOWDv+
 +Ke23KWOLnZuZnW5ymGRd3HvagLjwOvAULfMejJ8wiUUnGrfzPUgN2YdAIujIMX4LKKC UQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhu0m8bjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 12:25:13 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26PCFl7W027830;
	Mon, 25 Jul 2022 12:25:13 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhu0m8bhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 12:25:12 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26PCL3cF017397;
	Mon, 25 Jul 2022 12:25:11 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06ams.nl.ibm.com with ESMTP id 3hg97tadw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 12:25:10 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26PCNB4A23200028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Jul 2022 12:23:12 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 83B7011C050;
	Mon, 25 Jul 2022 12:25:08 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0DA8811C04C;
	Mon, 25 Jul 2022 12:25:08 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 25 Jul 2022 12:25:07 +0000 (GMT)
Message-ID: <4e366d73-fb9f-bd83-abd0-c624a737a0cd@linux.ibm.com>
Date: Mon, 25 Jul 2022 14:25:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [PATCH v5 4/4] pseries/mobility: set NMI watchdog factor during
 an LPM
To: Randy Dunlap <rdunlap@infradead.org>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, wim@linux-watchdog.org,
        linux@roeck-us.net, nathanl@linux.ibm.com
References: <20220713154729.80789-1-ldufour@linux.ibm.com>
 <20220713154729.80789-5-ldufour@linux.ibm.com>
 <e6232bb4-a8e5-8f33-e80e-06b1356565b7@infradead.org>
Content-Language: fr
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <e6232bb4-a8e5-8f33-e80e-06b1356565b7@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oaoX5aaD2obYHUM1BDYUNJcpyVzDgQkz
X-Proofpoint-GUID: 1K3Wa8DBSonxvU57zc15TRRFAuGltn2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-25_09,2022-07-25_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207250051
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
Cc: hch@infradead.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, haren@linux.vnet.ibm.com, linux-watchdog@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 13/07/2022 à 22:17, Randy Dunlap a écrit :
> Hi Laurent,
> 
> On 7/13/22 08:47, Laurent Dufour wrote:
>> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
>> index ddccd1077462..d73faa619c15 100644
>> --- a/Documentation/admin-guide/sysctl/kernel.rst
>> +++ b/Documentation/admin-guide/sysctl/kernel.rst
>> @@ -592,6 +592,18 @@ to the guest kernel command line (see
>>  Documentation/admin-guide/kernel-parameters.rst).
>>  
>>  
>> +nmi_wd_lpm_factor (PPC only)
>> +============================
>> +
>> +Factor apply to the NMI watchdog timeout (only when ``nmi_watchdog`` is
> 
>    Factor to apply to

Thanks, Randy.

Michael, could you fix that when applying the series?

Cheers,
Laurent

> 
>> +set to 1). This factor represents the percentage added to
>> +``watchdog_thresh`` when calculating the NMI watchdog timeout during an
>> +LPM. The soft lockup timeout is not impacted.
>> +
>> +A value of 0 means no change. The default value is 200 meaning the NMI
>> +watchdog is set to 30s (based on ``watchdog_thresh`` equal to 10).
> 

