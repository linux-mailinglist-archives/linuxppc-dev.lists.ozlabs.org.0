Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7029462977
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 02:07:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J33wR4nC8z3cT5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 12:07:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DkkE+0fv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J33vf4FS9z2yZx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 12:06:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DkkE+0fv; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4J33vf401cz4xR7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 12:06:38 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4J33vf3xJBz4xR9; Tue, 30 Nov 2021 12:06:38 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DkkE+0fv; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4J33vf12YVz4xR7
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Nov 2021 12:06:37 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AU0KvY4022219
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Nov 2021 01:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=xJzXmIGMibKtHkZRoHPBZvHuj0a7wCgj+OruCvsR6fM=;
 b=DkkE+0fvS6lwuHCwMYGkwmbHlvwvDUcbZ/cXx+XODLwFNrhnUAWKkduvty1ZcTxj//zR
 85HfOv/AjTkeUQ156QCjO0AvzOPWmoPxn6rC03ubKE6T2fJfKS44r5PFm0BiC63/EL8F
 QpzwYovdiVjjmTzlN1OV+L5z/l5xQw0q2r+7oOumbdiTqT+qxg3x9bMOiC3k5GXy0xIc
 2OfuXNsNU3aERLuvAHDfXecP6LVOITuD8wm4s3NKAxzwfOrsBMjCCWkC1lllVtcRJWrS
 jDfkedQXFEKkJMNV1qznRrNXBS4hkDSDArhq82ATQDBRIa6wqR0PFMuOFAEH8VvPjn+i Ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cn9b90twh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Nov 2021 01:06:33 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AU0hlBq002148
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Nov 2021 01:06:33 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cn9b90twa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 01:06:33 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AU0vWST005940;
 Tue, 30 Nov 2021 01:06:32 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04wdc.us.ibm.com with ESMTP id 3ckcab0fw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 01:06:32 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AU16Urt61145462
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Nov 2021 01:06:30 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE949B2071;
 Tue, 30 Nov 2021 01:06:30 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89756B2066;
 Tue, 30 Nov 2021 01:06:30 +0000 (GMT)
Received: from localhost (unknown [9.163.19.234])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 30 Nov 2021 01:06:30 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>, Mahesh Salgaonkar
 <mahesh@linux.ibm.com>, linuxppc-dev <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH] powerpc/rtas: Introduce rtas_get_sensor_nonblocking()
 for pci hotplug driver.
In-Reply-To: <2083eff5-a00e-5a2b-4e83-20deb302a756@linux.ibm.com>
References: <163817631601.2016996.16085383012429651821.stgit@jupiter>
 <2083eff5-a00e-5a2b-4e83-20deb302a756@linux.ibm.com>
Date: Mon, 29 Nov 2021 19:06:29 -0600
Message-ID: <87sfveo3je.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AAl69O-UQA4uxzuTlsA5eHQ1xX1YHV0A
X-Proofpoint-GUID: 3ErJcuwZ3bCjW8jg50f1bmq0TIm5pAN1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_11,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1011 impostorscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111300004
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

Tyrel Datwyler <tyreld@linux.ibm.com> writes:
> On 11/29/21 12:58 AM, Mahesh Salgaonkar wrote:
>> -int rtas_get_sensor_fast(int sensor, int index, int *state)
>> +static int
>> +__rtas_get_sensor(int sensor, int index, int *state, bool warn_on)
>>  {
>>  	int token = rtas_token("get-sensor-state");
>>  	int rc;
>> @@ -618,14 +619,26 @@ int rtas_get_sensor_fast(int sensor, int index, int *state)
>>  		return -ENOENT;
>> 
>>  	rc = rtas_call(token, 2, 2, state, sensor, index);
>> -	WARN_ON(rc == RTAS_BUSY || (rc >= RTAS_EXTENDED_DELAY_MIN &&
>> -				    rc <= RTAS_EXTENDED_DELAY_MAX));
>> +	WARN_ON(warn_on &&
>> +		(rc == RTAS_BUSY || (rc >= RTAS_EXTENDED_DELAY_MIN &&
>> +				    rc <= RTAS_EXTENDED_DELAY_MAX)));
>
> The whole point of rtas_get_sensor_fast() is that on busy we will just let it
> error out because we don't want to wait. I'm not sure I see the point of the
> spurious WARN_ONs anytime we hit a BUSY or DELAY return code. Maybe converting
> that to a pr_debug() might be better and save expanding the API with a _fast and
> _nonblocking variant that do the same thing minus one surpressing a
> WARN_ON splat.

There is a subset of sensors that are specified to not ever return busy
or delay statuses. rtas_get_sensor_fast() is meant to be used with
those, and it would be an error to use it on a sensor not in that set.
So the WARN_ON() is appropriate IMO; if it triggers it indicates either
a misuse of the API or a firmware bug. See commit 1c2cb594441d
"powerpc/rtas: Introduce rtas_get_sensor_fast() for IRQ handlers"

