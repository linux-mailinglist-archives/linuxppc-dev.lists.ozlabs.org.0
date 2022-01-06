Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6431485EC7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 03:28:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTqz025lmz30KW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 13:28:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Mi5cpy2j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Mi5cpy2j; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTqyB1hkTz2xCM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jan 2022 13:27:45 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 205NVlgM025068; 
 Thu, 6 Jan 2022 02:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=2bkmRI1o1Iio7qwcCZEeN0robRx1Vq/JzF/96Pt+6SE=;
 b=Mi5cpy2jx43WqWJwC8WT2qjJW06lJeydxr52hKpocFF6gCuJod7F0Lt07BPm143thjhl
 G88c4zV4xcGfyq1ThDnLTgrb7EQQNSNHer6NTICFo7XmZl7hirSmULNOvU1XQTbWeQ1E
 tGMzFKgZwPwTHN7tFLWcpfm2PvLyeE5xGCI5xViWrT2zfXdQdE3/AT3rFo5YEvoMidN1
 WS64sletc29AmhRy16FhSJ50dcJLVqUrQZ9QXNAo8Sh3wD8MWyR7Al7cAEf7ywJ6nXDw
 GpZXvPw/UvO0jGK80KVy8VOPvbMhZ42ShxtwPvyC4L9Mz02ioytk3Rvc/gluJNYC0HxY KA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ddn37jaqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 02:27:39 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2062RXFt010700;
 Thu, 6 Jan 2022 02:27:38 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04wdc.us.ibm.com with ESMTP id 3ddna6t7vt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 02:27:38 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2062RbVG21168516
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jan 2022 02:27:38 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E38F628059;
 Thu,  6 Jan 2022 02:27:37 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 396EE2805A;
 Thu,  6 Jan 2022 02:27:37 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.94.20])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jan 2022 02:27:37 +0000 (GMT)
Subject: Re: [PATCH v4] powerpc/pseries: read the lpar name from the firmware
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <20211207171109.22793-1-ldufour@linux.ibm.com>
 <25527544-b0ac-596c-3876-560493b99f6b@linux.ibm.com>
 <8735m1ixd6.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <ac208963-d334-1f46-0db2-4a8d073b2963@linux.ibm.com>
 <87ee5lve64.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <f9df21b5-00fe-f648-4cdb-3d4e7abc855f@linux.ibm.com>
Date: Wed, 5 Jan 2022 18:27:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87ee5lve64.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6Xl4ZTK77-D5CHdpfrAQbWfUZb2wTeMk
X-Proofpoint-GUID: 6Xl4ZTK77-D5CHdpfrAQbWfUZb2wTeMk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_08,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 priorityscore=1501 mlxlogscore=830 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2112160000 definitions=main-2201060009
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/5/22 5:36 PM, Nathan Lynch wrote:
> Tyrel Datwyler <tyreld@linux.ibm.com> writes:
>> On 1/5/22 3:19 PM, Nathan Lynch wrote:
>>>
>>
>> Is there benefit of adding a partition_name field/value pair to lparcfg? The
>> lparstat utility can just as easily make the get_sysparm call via librtas.
>> Further, rtas_filters allows this particular RTAS call from userspace.
> 
> The RTAS syscall is root-only, but we want the partition name (whether
> supplied by RTAS or the device tree) to be available to unprivileged
> programs.
> 

Ah, right. I recall this discussion now from previous iterations.

-Tyrel
