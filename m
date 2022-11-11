Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 837A1625A54
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 13:13:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7yK83CNpz3cNg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 23:13:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IU4iKNhq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IU4iKNhq;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7yJ919Dqz3cH9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Nov 2022 23:12:23 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2ABBdDBb033785;
	Fri, 11 Nov 2022 12:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=5fxO2XXG1q6EgEfIA4PG3xVu5GvIdI6fwOZa3jvSFnc=;
 b=IU4iKNhqdmpAUJR059GJX0JdkNrQXK2Kb3UEl7baBEkidDTL4ZhZpfZdKktEDaLZs0sn
 lwpnoEnaiT5uCOk/G8tdkUTI8RtMPP/1vwnal6+2XulE+dtXIOa0TGbPTLUHvQja4sIH
 GlJVuSXiBsTSCneO9E+iQsBTDb3Hi/WQKsUH6buf3kRIPsbsOHK3al1bqMVmKi01A2gi
 exuziGvcOpivWzcjA6/Kuu2hiftk8OlgvcNJn+vK8gnA+GfGNYwyMJ3fv1i7BgIEef5z
 yIvxTU7T2CLJBsc1NtnQAtPzIz/J+k6hBJ5ID9jgDhmboMvxaNop6TMG7fij7QYQRDtc JA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ksnd512nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Nov 2022 12:12:09 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ABBetEM038546;
	Fri, 11 Nov 2022 12:12:09 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ksnd512mu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Nov 2022 12:12:09 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ABC6afx009588;
	Fri, 11 Nov 2022 12:12:07 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma05wdc.us.ibm.com with ESMTP id 3kngpmje7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Nov 2022 12:12:07 +0000
Received: from smtpav01.dal12v.mail.ibm.com ([9.208.128.133])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ABCC5t926935552
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Nov 2022 12:12:05 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D3B658061;
	Fri, 11 Nov 2022 12:12:06 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F65B58059;
	Fri, 11 Nov 2022 12:12:05 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 11 Nov 2022 12:12:05 +0000 (GMT)
Message-ID: <569c30f7-5dda-4ce2-e2c9-ce4041a74c8e@linux.ibm.com>
Date: Fri, 11 Nov 2022 07:12:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v8 0/4] tpm: Preserve TPM measurement log across kexec
 (ppc64)
Content-Language: en-US
To: Coiby Xu <coxu@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20220901214610.768645-1-stefanb@linux.ibm.com>
 <20221111022143.xvpi3pfwwrw4qda2@Rk>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20221111022143.xvpi3pfwwrw4qda2@Rk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7XaGLry-dChDSYeNDXy6AbCJBpJEBkVY
X-Proofpoint-GUID: TFAPSigYsZEZ_FQvINgy1j1zHKOjnma1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_06,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 spamscore=0 mlxscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1011 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211110081
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
Cc: devicetree@vger.kernel.org, Baoquan He <bhe@redhat.com>, nayna@linux.ibm.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, nasastry@in.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/10/22 21:21, Coiby Xu wrote:
> Hi Michael,
> 
> Could the PowerPC tree take this patch set which resolves a
> PowerVM/KVM-specific issue?

Michael has (shown me) an alternative approach that protects the already allocated memory to carry it across the kexec. This seems like a good and potentially better alternative, also from the perspective of the changes need, which is a lot less , and it's already used for other stuff as well.

    Stefan

> 
> On Thu, Sep 01, 2022 at 05:46:06PM -0400, Stefan Berger wrote:
>> The of-tree subsystem does not currently preserve the IBM vTPM 1.2 and
>> vTPM 2.0 measurement logs across a kexec on PowerVM and PowerKVM. This
>> series fixes this for the kexec_file_load() syscall using the flattened
>> device tree (fdt) to carry the TPM measurement log's buffer across kexec.
>>
>>   Stefan
>>
>> v8:
>> - Added Jarkko's, Coiby's, and Rob's tags
>> - Rebase on v6.0-rc3 that absorbed 2 already upstreamed patches
>>
>> v7:
>> - Added Nageswara's Tested-by tags
>> - Added back original comment to inline function and removed Jarkko's R-b tag
>>
>> v6:
>> - Add __init to get_kexec_buffer as suggested by Jonathan
>> - Fixed issue detected by kernel test robot
>>
>> v5:
>> - Rebased on 1 more patch that would otherwise create merge conflicts
>>
>> v4:
>> - Rebased on 2 patches that would otherwise create merge conflicts;
>>   posting these patches in this series with several tags removed so
>>   krobot can test the series already
>> - Changes to individual patches documented in patch descripitons
>>
>> v3:
>> - Moved TPM Open Firmware related function to drivers/char/tpm/eventlog/tpm_of.c
>>
>> v2:
>> - rearranged patches
>> - fixed compilation issues for x86
>>
>> Palmer Dabbelt (1):
>>  drivers: of: kexec ima: Support 32-bit platforms
>>
>> Stefan Berger (3):
>>  tpm: of: Make of-tree specific function commonly available
>>  of: kexec: Refactor IMA buffer related functions to make them reusable
>>  tpm/kexec: Duplicate TPM measurement log in of-tree for kexec
>>
>> drivers/char/tpm/eventlog/of.c |  31 +--
>> drivers/of/kexec.c             | 336 ++++++++++++++++++++++++++++-----
>> include/linux/kexec.h          |   6 +
>> include/linux/of.h             |   9 +-
>> include/linux/tpm.h            |  36 ++++
>> kernel/kexec_file.c            |   6 +
>> 6 files changed, 346 insertions(+), 78 deletions(-)
>>
>>
>> base-commit: b90cb1053190353cc30f0fef0ef1f378ccc063c5
>> -- 
>> 2.35.1
>>
> 
