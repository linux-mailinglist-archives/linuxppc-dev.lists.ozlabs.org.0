Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F75D6951C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 21:22:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFwjf0Tk7z3c83
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 07:21:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dbn/npnw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dbn/npnw;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFwhd0TFNz30hh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 07:21:04 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31DK7bHh016883;
	Mon, 13 Feb 2023 20:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=DffA4kpsYTqIRrt75/Ils1Jw5H10geV8Lrmt+xvTIZ8=;
 b=Dbn/npnwXaU3S2HRVLwjTp4jNsevSTgdxSzWWmTiEzHAEVy3MbDk5ttTxuDiwdrBCbBD
 KUiepXGQpdPzJOMsdqm0Zte4l3CCDs5evtMf2x0/+phLEko/pSpp3mC9vrDRl1T+2VpQ
 cdf8EIN9Ow2kSJOCTol6dF9+/Udl6e2A6yzFjhzf+asFSYvc2F4dB52H5kYX6uysK3cU
 Gbfz7v4E5wAVBL/r7W9ZmnbSIv4TC7wHkeis7hzjWSrsdPPHmxbjRoFzpcuZHuXFQD4r
 rCaRUs1AfBSwK93KJETt47Cb41vGC8iMW6Pn7IJ8Dtc/gc+duW0R4sNn3wDPJJgIgoCn GQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqtvdst3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Feb 2023 20:20:56 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31DKBZWV029516;
	Mon, 13 Feb 2023 20:20:56 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqtvdst3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Feb 2023 20:20:56 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31DGg7DX016681;
	Mon, 13 Feb 2023 20:20:55 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3np2n749me-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Feb 2023 20:20:54 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31DKKs0R8782454
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Feb 2023 20:20:54 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF58358065;
	Mon, 13 Feb 2023 20:20:53 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B927558059;
	Mon, 13 Feb 2023 20:20:53 +0000 (GMT)
Received: from localhost (unknown [9.211.96.43])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Feb 2023 20:20:53 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman
 <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/machdep: warn when machine_is() used too early
In-Reply-To: <3ee6023e-5ee8-e448-5f6c-4e44912e8400@csgroup.eu>
References: <20230210-warn-on-machine-is-before-probe-machine-v2-1-b57f8243c51c@linux.ibm.com>
 <3ee6023e-5ee8-e448-5f6c-4e44912e8400@csgroup.eu>
Date: Mon, 13 Feb 2023 14:20:53 -0600
Message-ID: <87cz6d9v16.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HLY7-CHTp8AXLGOZrsVY_EIhSUCMG09J
X-Proofpoint-GUID: nMfCF822-cLmOlE8oEp2IDS-jUcRoHLE
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_12,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=837 malwarescore=0 bulkscore=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302130176
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 13/02/2023 =C3=A0 20:23, Nathan Lynch via B4 Submission Endpoint a =C3=
=A9crit=C2=A0:
>> From: Nathan Lynch <nathanl@linux.ibm.com>
>>=20
>> machine_is() can't provide correct results before probe_machine() has
>> run. Warn when it's used too early in boot, placing the WARN_ON() in a
>> helper function so the reported file:line indicates exactly what went
>> wrong.
>>=20
>> checkpatch complains about __attribute__((weak)) in the patch, so
>> change that to __weak, and align the line continuations as well.
>>=20
>> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

thanks!

>> @@ -220,11 +221,16 @@ extern struct machdep_calls *machine_id;
>>   	EXPORT_SYMBOL(mach_##name);				\
>>   	struct machdep_calls mach_##name __machine_desc =3D
>>=20=20=20
>> -#define machine_is(name) \
>> -	({ \
>> -		extern struct machdep_calls mach_##name \
>> -			__attribute__((weak));		 \
>> -		machine_id =3D=3D &mach_##name; \
>> +static inline bool __machine_is(const struct machdep_calls *md)
>> +{
>> +	WARN_ON(!machine_id); // complain if used before probe_machine()
>> +	return machine_id =3D=3D md;
>> +}
>> +
>> +#define machine_is(name)                                        \
>
> Misaligned back-slash ?

An artifact of the patch format + tabs for indentation. It should be
aligned with the rest when looking at the file itself after the patch is
applied.

>
>> +	({                                                      \
>> +		extern struct machdep_calls mach_##name __weak; \
>> +		__machine_is(&mach_##name);                     \
>>   	})
>>=20=20=20
>>   static inline void log_error(char *buf, unsigned int err_type, int fat=
al)
