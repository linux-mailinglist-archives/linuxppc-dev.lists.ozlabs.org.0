Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CDC5066D7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 10:22:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjGyH2LQjz2yhD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 18:22:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WcyCztQc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjGxW5RB2z2xDw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 18:22:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WcyCztQc; dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KjGxW3HJHz4xNl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 18:22:07 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KjGxW3Dfgz4xXS; Tue, 19 Apr 2022 18:22:07 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WcyCztQc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KjGxW0Hjkz4xNl
 for <linuxppc-dev@ozlabs.org>; Tue, 19 Apr 2022 18:22:06 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23J6kYUM017696; 
 Tue, 19 Apr 2022 08:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=xtjR1I71UpbRZ1/K54RWAKezt8EaxSk2iZdJTEPVnZY=;
 b=WcyCztQcyDXhaOwCMkOh5EEX00AHlO2ZPoRoZJbonFKaQ1E+u4H3VsHuokq7PSqUYdG+
 OnFOhufvKaLGcZFJ/580yyY/t8zPLdnaY0Mgs5LylA2dlq4ktzk2g5TrNsFfK7CvqZ7Q
 yFTvLL9nu/nWvlpRTFIf3vrLP94OmnyzA1qWPiZMfl7woA37eF0K705yn4EuegHGHfaR
 zAnC2+WzEr9W6YkG2HdlWIY/wPi0cyfbFFmhwvXubt7dQ6xVp++COwgUodcnB9WvmNWK
 hj0T0K0wp2uQLZC/v41PGA3ggxP5flgoXVhWTWEcJbUpT1hBQTvXTaXF8zz3Y3L1TQK6 vA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fhr3yj30f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 08:21:57 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23J8LvhG002767;
 Tue, 19 Apr 2022 08:21:57 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fhr3yj302-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 08:21:57 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23J8CujL015359;
 Tue, 19 Apr 2022 08:21:55 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3ffne8u4th-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 08:21:55 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23J8Lqfo10223940
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 08:21:52 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CF89AE053;
 Tue, 19 Apr 2022 08:21:52 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C45D3AE04D;
 Tue, 19 Apr 2022 08:21:49 +0000 (GMT)
Received: from [9.43.16.51] (unknown [9.43.16.51])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 19 Apr 2022 08:21:49 +0000 (GMT)
Message-ID: <44105142-5a4b-28c9-243a-e116cd1c3c36@linux.ibm.com>
Date: Tue, 19 Apr 2022 13:51:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC v4 PATCH 3/5] powrepc/crash hp: update kimage_arch struct
Content-Language: en-US
To: Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 mpe@ellerman.id.au
References: <20220411084357.157308-1-sourabhjain@linux.ibm.com>
 <20220411084357.157308-4-sourabhjain@linux.ibm.com>
 <57f1960f-4fc7-6061-0fc2-b2bfd09b334f@linux.ibm.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <57f1960f-4fc7-6061-0fc2-b2bfd09b334f@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7eFXORv8dX_iZnTM9gQ8zM7oEcmNGqK5
X-Proofpoint-ORIG-GUID: 7FYiUy4SQakOxZiznH35uz-HganZ0Yc4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-19_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204190045
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
Cc: mahesh@linux.vnet.ibm.com, eric.devolder@oracle.com,
 kexec@lists.infradead.org, hbathini@linux.ibm.com, bhe@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 14/04/22 22:05, Laurent Dufour wrote:
> On 11/04/2022, 10:43:55, Sourabh Jain wrote:
>> Two new members fdt_index and fdt_index_valid are added in kimage_arch
>> struct to track the FDT kexec segment. These new members of kimage_arch
>> struct will help the crash hotplug handler to easily access the FDT
>> segment from the kexec segment array. Otherwise, we have to loop through
>> all kexec segments to find the FDT segments.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/kexec.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
>> index e1288826e22e..19c2cab6a880 100644
>> --- a/arch/powerpc/include/asm/kexec.h
>> +++ b/arch/powerpc/include/asm/kexec.h
>> @@ -104,6 +104,8 @@ extern const struct kexec_file_ops kexec_elf64_ops;
>>   struct kimage_arch {
>>   	struct crash_mem *exclude_ranges;
>>   
> #ifdef CONFIG_CRASH_HOTPLUG ?
>> +	int fdt_index;
>> +	bool fdt_index_valid;
> #endif
>
> It seems that this is only used when CONFIG_CRASH_HOTPLUG is defined, isn't it?

Yes it should be kept under CONFIG_CRASH_HOTPLUG config.

Thanks,
Sourabh Jain

>
>>   	unsigned long backup_start;
>>   	void *backup_buf;
>>   	void *fdt;
