Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA221652C74
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Dec 2022 06:40:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NcMhw4G3fz3c9L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Dec 2022 16:40:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Uz+lH6HH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NcMgv21DKz307T
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Dec 2022 16:39:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Uz+lH6HH;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4NcMgt06Bvz4xZ3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Dec 2022 16:39:06 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4NcMgs730Lz4xVS; Wed, 21 Dec 2022 16:39:05 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Uz+lH6HH;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4NcMgr708tz4xND;
	Wed, 21 Dec 2022 16:39:04 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BL5Df7I022160;
	Wed, 21 Dec 2022 05:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=b74xOeegbOs8t5xa8oiCdeSCUkcBH1chJrv+NG8rWWU=;
 b=Uz+lH6HHG6I7wq5jrXs7GJ3l/1NJZXCr+iqa4tuX095ZXhEP3mEw1AC4A5acyXSdrXW6
 f3B4mSKKFq1cLKkWbc70WPm7Sbr6c7JDJ6MFW5JX1j/pBadJHXUOTj+l+zEmPdpNTQqD
 G70ER5vu7o8hxVBd8ciJ0LqRHYDZ+E8NXBNacJdFoyaI52bw+38A3CCfEI+Dcb8012Ik
 /WFkK0ircF/z+oaL1GKrR5wzjtPdBZyVVujpwidhOwIbYuofT5OT2PWgd4ZLI0vFfdQq
 J0BpvJBv1aCnc4DDgmqVKRZrFjCyzcRMmDrK/Isi3TSoSeYT016CHVol+vbxq71EDVfo Og== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mkut8ru08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Dec 2022 05:39:00 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BKJdMi3014033;
	Wed, 21 Dec 2022 05:38:58 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3mh6yw50wp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Dec 2022 05:38:58 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2BL5ctG235455318
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Dec 2022 05:38:55 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA3BC20043;
	Wed, 21 Dec 2022 05:38:55 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A78B220040;
	Wed, 21 Dec 2022 05:38:54 +0000 (GMT)
Received: from [9.43.117.153] (unknown [9.43.117.153])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 Dec 2022 05:38:54 +0000 (GMT)
Message-ID: <c821613d-bb7c-31ae-821e-95b0e86df452@linux.ibm.com>
Date: Wed, 21 Dec 2022 11:08:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] powerpc/kexec_file: print error string on usable memory
 property update failure
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20221216122708.182154-1-sourabhjain@linux.ibm.com>
 <7118ca5c-f83a-007f-20f0-2fd65c1ef5a7@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <7118ca5c-f83a-007f-20f0-2fd65c1ef5a7@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NhuPTrQ-IPIWHDMEJ2uqSqAbTB-O8jOp
X-Proofpoint-ORIG-GUID: NhuPTrQ-IPIWHDMEJ2uqSqAbTB-O8jOp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_01,2022-12-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 mlxlogscore=829
 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212210038
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
Cc: mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 19/12/22 14:16, Hari Bathini wrote:
>
>
> On 16/12/22 5:57 pm, Sourabh Jain wrote:
>> Print the FDT error description along with the error message if failed
>> to set the "linux,drconf-usable-memory" property in the kdump kernel's
>> FDT.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>
> LGTM
>
> Acked-by: Hari Bathini <hbathini@linux.ibm.com>

Thanks!

- Sourabh Jain
