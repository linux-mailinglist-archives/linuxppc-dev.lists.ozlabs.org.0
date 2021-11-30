Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F9346299C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 02:22:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J34GK0MQ6z3cT5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 12:22:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Aa0+KNAa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J34FT6HQnz304n
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 12:22:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Aa0+KNAa; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4J34FT11Rpz4xYy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 12:22:05 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4J34FT0z7kz4xRC; Tue, 30 Nov 2021 12:22:05 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Aa0+KNAa; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4J34FS57f1z4xRB
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Nov 2021 12:22:04 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AU0L7R4019481
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Nov 2021 01:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=9mHmO+e40+rD80NQwZBfNh4ToIshOEF/ElhYqMdIxx8=;
 b=Aa0+KNAaezdxiVvr62MFpltdZH4NpEvue3Gd7AP6eXfRQ4ouej83KHO32z9n9SpuAdff
 jsEvy7E5xDkxxGnLHXtGSlBgJ1lIjTtcqdziWslrGeuGaGH6esICvtviis4TqQ7DHw6S
 blYFM9ePXLIfdtdiNYn17EfrFwB0H94tKix/5UuxKwRrm5fZnso5lbgzEzykjHTsTW3+
 JOzAK+SDZpB+IC87Qq56+gPhWeXI5ld6mUQQPsetuXpZ2iGpUxeapc4mYfKEVGkwZGh1
 Q4A1/2qkJoLKDTMJ7m719pvYUgxznd83wlcnAyeS96xEzwsy0YcatDYFxElFNcGwOUsB qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cn9bas3w2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Nov 2021 01:22:02 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AU15XjX014975
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Nov 2021 01:22:01 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cn9bas3vw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 01:22:01 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AU1CprC018206;
 Tue, 30 Nov 2021 01:22:01 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 3cn3k18ctu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 01:22:01 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AU1LxUZ15008422
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Nov 2021 01:21:59 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59C6278063;
 Tue, 30 Nov 2021 01:21:59 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5ED5778066;
 Tue, 30 Nov 2021 01:21:58 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.210.85])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 30 Nov 2021 01:21:58 +0000 (GMT)
Subject: Re: [PATCH] powerpc/rtas: Introduce rtas_get_sensor_nonblocking() for
 pci hotplug driver.
To: Nathan Lynch <nathanl@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
References: <163817631601.2016996.16085383012429651821.stgit@jupiter>
 <2083eff5-a00e-5a2b-4e83-20deb302a756@linux.ibm.com>
 <87sfveo3je.fsf@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <9c25155f-00d4-8b09-7509-dff5df02ac47@linux.ibm.com>
Date: Mon, 29 Nov 2021 17:21:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87sfveo3je.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KcBr_d7yTVxxg7ZXrooGJfswLAWWHafD
X-Proofpoint-GUID: eBKcY6ORNP1DPBeZ5UhAlTGHW9lOiZfP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_11,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111300004
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
Cc: lxie@us.ibm.com, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/29/21 5:06 PM, Nathan Lynch wrote:
> Tyrel Datwyler <tyreld@linux.ibm.com> writes:
>> On 11/29/21 12:58 AM, Mahesh Salgaonkar wrote:
>>> -int rtas_get_sensor_fast(int sensor, int index, int *state)
>>> +static int
>>> +__rtas_get_sensor(int sensor, int index, int *state, bool warn_on)
>>>  {
>>>  	int token = rtas_token("get-sensor-state");
>>>  	int rc;
>>> @@ -618,14 +619,26 @@ int rtas_get_sensor_fast(int sensor, int index, int *state)
>>>  		return -ENOENT;
>>>
>>>  	rc = rtas_call(token, 2, 2, state, sensor, index);
>>> -	WARN_ON(rc == RTAS_BUSY || (rc >= RTAS_EXTENDED_DELAY_MIN &&
>>> -				    rc <= RTAS_EXTENDED_DELAY_MAX));
>>> +	WARN_ON(warn_on &&
>>> +		(rc == RTAS_BUSY || (rc >= RTAS_EXTENDED_DELAY_MIN &&
>>> +				    rc <= RTAS_EXTENDED_DELAY_MAX)));
>>
>> The whole point of rtas_get_sensor_fast() is that on busy we will just let it
>> error out because we don't want to wait. I'm not sure I see the point of the
>> spurious WARN_ONs anytime we hit a BUSY or DELAY return code. Maybe converting
>> that to a pr_debug() might be better and save expanding the API with a _fast and
>> _nonblocking variant that do the same thing minus one surpressing a
>> WARN_ON splat.
> 
> There is a subset of sensors that are specified to not ever return busy
> or delay statuses. rtas_get_sensor_fast() is meant to be used with
> those, and it would be an error to use it on a sensor not in that set.
> So the WARN_ON() is appropriate IMO; if it triggers it indicates either
> a misuse of the API or a firmware bug. See commit 1c2cb594441d
> "powerpc/rtas: Introduce rtas_get_sensor_fast() for IRQ handlers"
> 

Fair enough. Seems I misremembered the nature of the original problem and should
have looked back at the commit to completely jog my memory.
