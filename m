Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 675C286C34C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 09:20:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eKqqNXou;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlkg300g8z3bsJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 19:20:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eKqqNXou;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlkfL0RPQz3bmH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 19:19:38 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TlkfL00T0z4wyh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 19:19:38 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TlkfK73drz4wyl; Thu, 29 Feb 2024 19:19:37 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eKqqNXou;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TlkfK4cTDz4wyh
	for <linuxppc-dev@ozlabs.org>; Thu, 29 Feb 2024 19:19:37 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41T827nF014174;
	Thu, 29 Feb 2024 08:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ElgC3hdscpC8Q6xDACh7uLB0Blr3VI0u7yKwmhTRX/g=;
 b=eKqqNXou6j6F5yb07zs+OIQtmF68VZILUK9N3ePpXFOSZLpSAPc/pvYKmeTSp1PNryqL
 wWwznhI7TDUm/AN/3e1wwl0SDB6MCvSMzxqr+ElKAISUFXKFRhXeqbjJZC66pmN70GQh
 QJkudMwlGDvEXq5SIH2N+S/9nifBdQrxR/ncHO0t7ePdrxFW0BtvI+ode6PLYn6b2Ges
 mLq9bsAhm6/uXLn2uU9JuUSbhUxfNy29oHsXS8OBKbUiHS1w+3stwlHn50eeAaJbD/dx
 O14c8EeL6HiJt7NS/HPt7eMTlqdTSq5ED7QdFWTE/zJdHywV0L+mq5F7erdGHoVjoaYU Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wjp2crh5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 08:19:14 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41T82INs014816;
	Thu, 29 Feb 2024 08:19:13 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wjp2crgw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 08:19:13 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41T83RhS021762;
	Thu, 29 Feb 2024 08:17:07 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wfu60c3mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 08:17:07 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41T8H1Pj34734360
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Feb 2024 08:17:04 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E14C02004E;
	Thu, 29 Feb 2024 08:17:01 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 30E3D2004B;
	Thu, 29 Feb 2024 08:16:54 +0000 (GMT)
Received: from [9.43.0.70] (unknown [9.43.0.70])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 Feb 2024 08:16:53 +0000 (GMT)
Message-ID: <e68df310-6691-45c0-8264-ba36b9e71133@linux.ibm.com>
Date: Thu, 29 Feb 2024 13:46:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 3/6] powerpc/kexec: move *_memory_ranges functions to
 ranges.c
Content-Language: en-US
To: Baoquan He <bhe@redhat.com>
References: <20240226084118.16310-1-sourabhjain@linux.ibm.com>
 <20240226084118.16310-4-sourabhjain@linux.ibm.com>
 <ZeA8Fl7xVHly4Ma+@MiWiFi-R3L-srv>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <ZeA8Fl7xVHly4Ma+@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dn9SrOfzZfMe_dwJDfGA2Vm5LjmBgprJ
X-Proofpoint-GUID: DHp_b4dc7wWj4SDOfSLoxsWL3680WPQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_08,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 adultscore=0 mlxlogscore=629 lowpriorityscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402290064
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, linuxppc-dev@ozlabs.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Valentin Schneider <vschneid@redhat.com>, x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Naveen N Rao <naveen@kernel.org>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 29/02/24 13:41, Baoquan He wrote:
> On 02/26/24 at 02:11pm, Sourabh Jain wrote:
>> Move the following functions form kexec/{file_load_64.c => ranges.c} and
>> make them public so that components other KEXEC_FILE can also use these
>                                             ^
>                                            'than' missed?

Yes, I will update it.

Thanks,
Sourabh Jain

>> functions.
>> 1. get_exclude_memory_ranges
>> 2. get_reserved_memory_ranges
>> 3. get_crash_memory_ranges
>> 4. get_usable_memory_ranges
>>
>> Later in the series get_crash_memory_ranges function is utilized for
>> in-kernel updates to kdump image during CPU/Memory hotplug or
>> online/offline events for both kexec_load and kexec_file_load syscalls.
>>
>> Since the above functions are moved to ranges.c, some of the helper
>> functions in ranges.c are no longer required to be public. Mark them as
>> static and removed them from kexec_ranges.h header file.
>>
>> Finally, remove the CONFIG_KEXEC_FILE build dependency for range.c
>> because it is required for other config, such as CONFIG_CRASH_DUMP.
>>
>> No functional changes are intended.
> ......snip
>

