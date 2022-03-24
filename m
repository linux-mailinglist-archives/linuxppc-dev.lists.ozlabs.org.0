Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 938694E5E81
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 07:08:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPFCR1MBNz3036
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 17:08:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qhWqKBou;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPFBd29cTz2xsc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 17:07:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qhWqKBou; dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KPFBZ3SLyz4xQv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 17:07:50 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KPFBZ3NBqz4xYh; Thu, 24 Mar 2022 17:07:50 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qhWqKBou; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KPFBZ11nQz4xQv
 for <linuxppc-dev@ozlabs.org>; Thu, 24 Mar 2022 17:07:49 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22O3KlWD016525; 
 Thu, 24 Mar 2022 06:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=EQZ6o82Vl3unVn7swQ8jNwIS6wXkASiF5Pc3VpJf7G0=;
 b=qhWqKBouANxyfQ4fKr9/CDGA/3QKYM4aVJduP0Fge3u1GwZUhlatrS+9C9zFBwDgE9u/
 gmmowYTXlifPSmr+9rTehXUFy4tOI/Iht1IbaH1cgajRHaGQ2TZwZSAz1xjXSn9aau6c
 M9K8y/MG0LNdpuEb4+W7TGDREccQpM0W6vsnWgvYhGgxKlL8HLxRqJEKjTJNY8ZDHCEY
 /lIXkfV4Jp1/HjiJ2Ran8DlBUxvMEiHixxE/NHG+4k7OtVAMIdEdITSazBgvfp55Chm4
 pmqeB0j0MWr4jvunm5dRChU1E4cXYFIJx6lIGf0YtOMzPdq9YJz9q4MTaySJ0ok0plze fA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f0gnj2dem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Mar 2022 06:07:36 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22O5s3YI029603;
 Thu, 24 Mar 2022 06:07:36 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f0gnj2ddh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Mar 2022 06:07:35 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22O640c0020761;
 Thu, 24 Mar 2022 06:07:33 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 3ew6t9gmtv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Mar 2022 06:07:32 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22O67Uph43909444
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Mar 2022 06:07:30 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 817F8A4040;
 Thu, 24 Mar 2022 06:07:30 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C5E7A404D;
 Thu, 24 Mar 2022 06:07:28 +0000 (GMT)
Received: from [9.43.103.31] (unknown [9.43.103.31])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 24 Mar 2022 06:07:28 +0000 (GMT)
Message-ID: <1d9a3eaf-191c-da35-3628-38e8c0ad54bc@linux.ibm.com>
Date: Thu, 24 Mar 2022 11:37:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC v3 PATCH 3/5] powrepc/crash hp: update kimage struct
Content-Language: en-US
To: Eric DeVolder <eric.devolder@oracle.com>, linuxppc-dev@ozlabs.org,
 mpe@ellerman.id.au
References: <20220321080422.56255-1-sourabhjain@linux.ibm.com>
 <20220321080422.56255-4-sourabhjain@linux.ibm.com>
 <8fc2d63d-97db-59ab-3043-d453fed1e7e3@oracle.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <8fc2d63d-97db-59ab-3043-d453fed1e7e3@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JZke7xewVR8F8G6YrCQ9RBNWk6j_OY3Y
X-Proofpoint-ORIG-GUID: bUvLyz-IMRZyvDdPPkdrMpqAcWMVDYaq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-23_08,2022-03-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203240036
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
Cc: kexec@lists.infradead.org, hbathini@linux.ibm.com, bhe@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Eric,

On 24/03/22 00:02, Eric DeVolder wrote:
>
>
> On 3/21/22 03:04, Sourabh Jain wrote:
>> Two new members fdt_index and fdt_index_valid are added in kimage_arch
>> struct to track the FDT kexec segment. These new members of kimage_arch
>> struct will help the crash hotplug handler to easily access the FDT
>> segment from the kexec segment array. Otherwise, we have to loop through
>> all kexec segments to find the FDT segments.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>
>> ---
>>   arch/powerpc/include/asm/kexec.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/kexec.h 
>> b/arch/powerpc/include/asm/kexec.h
>> index e1288826e22e..19c2cab6a880 100644
>> --- a/arch/powerpc/include/asm/kexec.h
>> +++ b/arch/powerpc/include/asm/kexec.h
>> @@ -104,6 +104,8 @@ extern const struct kexec_file_ops kexec_elf64_ops;
>>   struct kimage_arch {
>>       struct crash_mem *exclude_ranges;
>>   +    int fdt_index;
>> +    bool fdt_index_valid;
>>       unsigned long backup_start;
>>       void *backup_buf;
>>       void *fdt;
>>
>
> Question, for the kexec_file_load scenario, is there a need to have 
> the fdt_index segment excluded by kexec_calculate_store_digests() ?

On PowerPC, SHA verification is not done for kexec_file_load system 
call, so we might not need to exclude the FDT segment.

Thanks for the review.

- Sourabh Jain

