Return-Path: <linuxppc-dev+bounces-10017-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A16AF0B3E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jul 2025 08:06:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bX8Xh2N6sz305n;
	Wed,  2 Jul 2025 16:06:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751436372;
	cv=none; b=nXIapcGwLeRY+S8oqxp2SlQBXXhOpVIiS8WrDig0tfgh+MmXYBjCvHXYKg/2mVusirFO2IMAO7FWu6Mi4LZ70FQzuCLHbUMkp0SD10yk3MNW0JS0w5vny2cSyqIN1x5sqOiHYVxzDQcUGh7HyUjuAlg9Ab3gktn2K6xEL/jQjLlJpfgo95KNlVKdQHYTbdc5mgRZnyRC+Ik0S1ec15x9ksZC6MwMXE18NVXsNzvQ9zlW5LRz3Pm6l1Ie/JvAvwELUamZOTtdtCSzHwRceiOljT1cnRsSn9oV5TSCQ7Xo0IvfHgFVwIxhkWVYsd/N9Pe77G5Pu+qnyKVsl36htm1Cjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751436372; c=relaxed/relaxed;
	bh=8SuNPg8qERA4rvyF2sBeuM1Dsb8OA1gOAdOuLv5899o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SinTByyOnN4cPIeXFLv7bHJwHnRn1JQsfTFZeZZVAbqY6H41MlT8pxzVrv+Pnv0vsXhs2GQ0tO0C5uyox+rqgrA5ljplgAbt8y/lL6gW7JrT9b3KzC6KbULLQWUsoPcdQEfcto4YWHIt2nE9OFIjBx9HyjGVdGTVSgt4Fw/N4E7sXcy5BSyf3Pgot8K8TTaI8fRcYTHlS1dliMoYoQkhy7B3z52boMGEQFuvW+AzCURzTJjEsdwhgCFMfIaJg9CsDI53bn5HitLFMBk2fgR6Qlo4ehECi7XUXrXq8tXyh/nvcn9Gxa0d8YLa+Fhg/ZDQsMbGHwNYNKICzlxxNVEj5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=joLhXADx; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=joLhXADx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bX8Xc6rY1z2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jul 2025 16:06:08 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56260ZZx030201;
	Wed, 2 Jul 2025 06:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=8SuNPg
	8qERA4rvyF2sBeuM1Dsb8OA1gOAdOuLv5899o=; b=joLhXADxzIVKvtvkfVc03D
	YeupR2n6ps7fI2LcN/ckbzwiy+TkpcnPfj7NsZPAf0kMNaOlo5YYxp5TJoMxBgsW
	Ldy5vDP/AnECWC4xHlPbn3yvXLLxFxDxHixW/b0q1N4aDNpgHRQtYHOIwnusCm3M
	QxEwxOAuUaDOthZ/TXoqluaVKi0jO0ZS10zh1HwZ6WDQrc5knIOA1t1h9YdYcC0r
	RhGVf++nhG/DtXNrecbG+ZIql21YPuEwcNFlxSSsljH5iy10MquTpmouyL+Anyzb
	2EApTwRo2CGutUG/xKebmnv02RoVAKW1rEqOwE/U+swCcoKTsCqwHBcSF4baAN7A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j6u1ud15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 06:05:39 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5625peU5029410;
	Wed, 2 Jul 2025 06:05:38 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j6u1ud12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 06:05:38 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56220pVP006881;
	Wed, 2 Jul 2025 06:05:37 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 47jvxmdyjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 06:05:37 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56265YrP60031468
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Jul 2025 06:05:34 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C34A20043;
	Wed,  2 Jul 2025 06:05:34 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C961420040;
	Wed,  2 Jul 2025 06:05:30 +0000 (GMT)
Received: from [9.124.214.139] (unknown [9.124.214.139])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  2 Jul 2025 06:05:30 +0000 (GMT)
Message-ID: <fb543b23-74f7-4491-94a4-136b5505f5c3@linux.ibm.com>
Date: Wed, 2 Jul 2025 11:35:29 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 8/9] sysfs: Add cpu_avoid file
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com, vschneid@redhat.com, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, kprateek.nayak@amd.com, huschle@linux.ibm.com,
        srikar@linux.ibm.com, linux-kernel@vger.kernel.org,
        christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org
References: <20250625191108.1646208-1-sshegde@linux.ibm.com>
 <20250625191108.1646208-9-sshegde@linux.ibm.com>
 <2025070123-riveting-struggle-ae98@gregkh>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <2025070123-riveting-struggle-ae98@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RvU1GCM43HbROhue6Ew3Ddy-yYIrNZEs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA0NCBTYWx0ZWRfX1iMgU9QXQCe+ vy9MlT7fck91V8lNCjM1wcRAzHjNO8BH5WyfFoQrukw0u5dNtHeYIYXN9heBqpqaI9UhNc4FWg+ kYNXGnIq5yMVPtrlS9P3CwUZzL5uLXY/TwPGE5XsJpVyBnhvYabjkumj+dIvssBoiQxBosMiEPy
 Fs2PB3U9RVP0Fxa/DxnRqg3MHtow0rXTlasREEkPUFg2UM8s+H1Mi2fBPI2a3ZsBFfpXlEFW5vM N4djU+7lDo3Hb7Lx06vl9wAA6TzK2FEi2Lmog03YC2rnGl+ph039+voEeh/H8I4CGIQE5fJeGU4 gh90CEj/v8TP0BRdQ/xamv3GRl3wE2ITFsoHrvixgKQnJ2j2X6lmk/WFRQot9/q7kn98kcUvX8e
 UMCQGKc68CE2NO0oevmrZmN+CsvYg+9+SX9FeD/v3ZTmkl1L9cLTU/2AuhcU4cI/vntvyiNR
X-Proofpoint-GUID: if4mLuzy8R3Te5vEAEgjWaJZYSiPWYkz
X-Authority-Analysis: v=2.4 cv=GrRC+l1C c=1 sm=1 tr=0 ts=6864cc33 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=NUYthbmcbSaDmYBkEQYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxlogscore=872 mlxscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020044
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Hi Greg, Thanks for looking into the patches.

> On Thu, Jun 26, 2025 at 12:41:07AM +0530, Shrikanth Hegde wrote:
>> Add a sysfs file called "avoid" which prints the current CPUs
>> makred as avoid.
>>
>> This could be used by userspace components or tools such as irqbalance.
>>
>> /sys/devices/system/cpu # cat avoid
>> 70-479
> 
> You forgot to document the new sysfs file in Documentation/ABI/ :( 

Sorry, didn't realize that. Will fix it in v2.

> 
> Also, you have trailing whitespace in your changelog here, was that
> intentional?
> 

My bad, didn't realize it while editing. Will fix it too.


Also checkpatch --strict doesn't complain if there is a trailing whitespace
in changelog.

> thanks,
> 
> greg k-h


