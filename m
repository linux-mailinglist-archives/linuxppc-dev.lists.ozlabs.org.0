Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D4683EFA1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jan 2024 20:02:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WphpEBKA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TMkT30BtLz3cX1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jan 2024 06:02:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WphpEBKA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TMkSC4QrMz2yps
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jan 2024 06:01:31 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40RHkO2t015815;
	Sat, 27 Jan 2024 19:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=59PMulcY3pqe8BDslGC5YObvNEZUMHILGpB4QMwJvTM=;
 b=WphpEBKArip93dY6TMi9bGcPtffdTcLzquXt4qc1SsaABRGIJE3WbwgD8N0TkRM75WQz
 KBryb22MAdWrZl0oi/BiXn5905dvucbwLM9eEXNnPQlkkrXu+wYEz68L0kgAi0XaKOSK
 Ozd+eu+vphSB+RnIGcUvQuYqZt3smZnJ/vS5EpxEsDpX4OeGS4Kj77ey65SI3vUaWdry
 UguwxK1h0QHakKe/wH9eBYcFr7OdhWW++EfLwdK4XYZfJl+QK4eLj6E536oU5sqjQnaa
 nC73ghH8GyNdtnrWW4r5sF++AtST0HOsPdxRfXs3WVGvsZ6/SF0t9A6KHKraGv4vbseB KQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vvvn81khp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 19:01:20 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40RISrNj025276;
	Sat, 27 Jan 2024 19:01:19 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vrtqm2c3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 19:01:19 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40RJ1HoJ23593500
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 27 Jan 2024 19:01:17 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED73D20043;
	Sat, 27 Jan 2024 19:01:16 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 650DC20040;
	Sat, 27 Jan 2024 19:01:13 +0000 (GMT)
Received: from [9.43.106.56] (unknown [9.43.106.56])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 27 Jan 2024 19:01:13 +0000 (GMT)
Message-ID: <bb645372-b40a-4326-91e9-ac8cdad0dd29@linux.ibm.com>
Date: Sun, 28 Jan 2024 00:31:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/papr_scm: Move duplicate definitions to common
 header files
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <165025666388.2927278.9540058958498766114.stgit@lep8c.aus.stglabs.ibm.com>
 <af106986-68e3-401e-8290-f13cc564dce1@csgroup.eu>
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
In-Reply-To: <af106986-68e3-401e-8290-f13cc564dce1@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mHpKuPT7OyiZLO4IVinUAygwAyg5B5OG
X-Proofpoint-GUID: mHpKuPT7OyiZLO4IVinUAygwAyg5B5OG
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=841 mlxscore=0 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401270144
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
Cc: "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>, "ira.weiny@intel.com" <ira.weiny@intel.com>, "vaibhav@linux.ibm.com" <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/26/24 02:46, Christophe Leroy wrote:
>
> Le 18/04/2022 à 06:38, Shivaprasad G Bhat a écrit :
>> papr_scm and ndtest share common PDSM payload structs like
>> nd_papr_pdsm_health. Presently these structs are duplicated across
>> papr_pdsm.h and ndtest.h header files. Since 'ndtest' is essentially
>> arch independent and can run on platforms other than PPC64, a way
>> needs to be deviced to avoid redundancy and duplication of PDSM
>> structs in future.
>>
>> So the patch proposes moving the PDSM header from arch/powerpc/include-
>> -/uapi/ to the generic include/uapi/linux directory. Also, there are
>> some #defines common between papr_scm and ndtest which are not exported
>> to the user space. So, move them to a header file which can be shared
>> across ndtest and papr_scm via newly introduced include/linux/papr_scm.h.
>>
>> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
>> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>> Suggested-by: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
> This patch doesn't apply, if still relevant can you please rebase and
> re-submit ?

Thanks for taking a look.


I have rebased and reposted the patch here

https://lore.kernel.org/nvdimm/170638176942.112443.2937254675538057083.stgit@ltcd48-lp2.aus.stglab.ibm.com/T/#u


Thanks!

Shivaprasad

<snip>

