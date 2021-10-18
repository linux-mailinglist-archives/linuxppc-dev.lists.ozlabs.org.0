Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 800C6432A3C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 01:17:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYCT306mrz3c5G
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 10:17:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FNXTiVPa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FNXTiVPa; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYCSD5TRgz2ymy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 10:16:43 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19ILLn0F024359
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 19:16:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=lX5bzybB8bhMyiSf9ypwZ6FcAIDEthXZB9a5rVSFXWo=;
 b=FNXTiVPay5yFFEl8F2MQm9SKVJsfxiI8nSGtYJmEGE9Q8BILZI20X0ugN2+8FrOWLEDu
 /v+aqLA9faopxsANUr7E837lxJEePgiu6QTtrZzsccQxp4cDK5oTTA+B0N4uBHEX+JJ7
 n2YzNAjCrDRN1iOOoXrrN/9M3Uv0FOsETVkHLRS+ujBvkosbGafgcdMYZhhKbj2HcGzE
 cwARxruMKPKB30+VdLxR6tPLlB6kmf7ZJ+ETkN3bX+/EClOLuKwidioyqmBJeKnaNpEa
 Lt5Pk17YEK40szzEdu/TEV9aZ4QSU3V38LKcAUG4tpBj1gRLSVgcPihJTR3DjkiESgLt eg== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bsgs99u5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 19:16:40 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19INE0w7023036
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 23:16:40 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 3bqpcahk02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 23:16:40 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19INGcb549152354
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Oct 2021 23:16:38 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA3AFC6083;
 Mon, 18 Oct 2021 23:16:38 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D8EDC607D;
 Mon, 18 Oct 2021 23:16:37 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.235.71])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 18 Oct 2021 23:16:37 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries/mobility: ignore ibm, platform-facilities
 updates
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20211018163424.2491472-1-nathanl@linux.ibm.com>
 <6de8b295-112f-651e-a18e-3ab3e499ad69@linux.ibm.com>
Message-ID: <822cbb54-ee68-df9a-da9f-3a25caeb72c8@linux.ibm.com>
Date: Mon, 18 Oct 2021 16:16:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6de8b295-112f-651e-a18e-3ab3e499ad69@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Bq3pz_jRWTA-KjL_NKuYAMuECJ_pwY46
X-Proofpoint-GUID: Bq3pz_jRWTA-KjL_NKuYAMuECJ_pwY46
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_07,2021-10-18_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 suspectscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110180122
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
Cc: cheloha@linux.ibm.com, ldufour@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/18/21 3:37 PM, Tyrel Datwyler wrote:
> On 10/18/21 9:34 AM, Nathan Lynch wrote:

<<snip>>

>>
>> One way to address that would be to make the drivers respond to node
>> removal notifications, so that node references can be dropped
>> appropriately. But this would likely force the drivers to disrupt active
>> clients for no useful purpose: equivalent nodes are immediately re-added.
>> And recall that the acceleration capabilities described by the nodes remain
>> available throughout the whole process.
> 
> See my comments above about its the vio bus more at fault here then the drivers
> themselves. I'm inclined to agree though that disrupting active operations with
> a driver unbind/rebind is a little extreme.
> 
> This also brings me back to firmware removing and re-adding the whole
> '/ibm,platform-facilities' node instead of simply updating changed properties
> could avoid this whole fiasco.
> 

Thinking more on this and trying to recall my discussion so very long ago with
firmware I now recall that I had complained that the idea of a node remove/add
is akin to a DLPAR operation which we have no notion of for platform facilities.
They know better than to do this with other virtual devices so I'm still not
sure why they insist on doing it here.

-Tyrel
