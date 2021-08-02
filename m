Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1B13DD4E5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 13:47:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdbpR5DVCz3cJH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 21:47:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aSJ3jH42;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aSJ3jH42; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gdbnx6Hrcz2yNG
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Aug 2021 21:47:01 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 172BYQLU020153; Mon, 2 Aug 2021 07:46:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=u+Y6F5QtBSt4VUckLV0sPWwGGN6ZjKtKBgxX2XNTfig=;
 b=aSJ3jH42W5k2fcz4VyHSJiozCmgoAVVfnTyTpehvQ9q9u5rGk35j41crgeupZZfQABC8
 g1FPETQIS/VOHGzo89u9HyFJZWOqHLZaLkLOk2MfKPljlH+Kv+QXoVC+OExS5/1tjhvN
 Cyi65WBzZAicyXbxRMBHF6vCxG64Qrc7gsqmrC6MmeEWRgpILcmS7H6SFxH9yf6OljIo
 F5Dv2Un9OjuAsvtLkvWusrYOx4E7hpge0nH7OfswJaJDXK0GJsQBINoEsFywMIIDrFZb
 QQwqNe4hBD1ixeJ+MZWAPsyg3mzWaH3AJNFnzmfBbNZT0dZ0zmmPG8ZbNTAy23Y/diiI HQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a5ke59mba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 07:46:53 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 172BZqjF025050;
 Mon, 2 Aug 2021 07:46:53 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a5ke59may-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 07:46:53 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 172BkaTP027039;
 Mon, 2 Aug 2021 11:46:52 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 3a4x5aww6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 11:46:52 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 172Bkp1C52560244
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Aug 2021 11:46:51 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A9A9124075;
 Mon,  2 Aug 2021 11:46:51 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08EC6124052;
 Mon,  2 Aug 2021 11:46:46 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.34.7])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  2 Aug 2021 11:46:45 +0000 (GMT)
Subject: Re: [PATCH v3] fpga: dfl: fme: Fix cpu hotplug issue in performance
 reporting
To: Moritz Fischer <mdf@kernel.org>
References: <20210713074216.208391-1-kjain@linux.ibm.com>
 <61495dc0-f496-992c-1d2a-9229a04e6e44@linux.ibm.com>
 <YQezqZcOrePV/FnW@archbook>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <0d31afc5-b86e-4da6-878c-be4ba7b4a23a@linux.ibm.com>
Date: Mon, 2 Aug 2021 17:16:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YQezqZcOrePV/FnW@archbook>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1Gca7qDh268Hhxr5iv5qsOpjYdAOm4rx
X-Proofpoint-ORIG-GUID: 1UMGX8qImnvnJCp0cj0jdn-uhbyA4gR0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-02_05:2021-08-02,
 2021-08-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108020077
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
Cc: mark.rutland@arm.com, maddy@linux.ibm.com, rnsastry@linux.ibm.com,
 trix@redhat.com, linux-fpga@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com, will@kernel.org,
 yilun.xu@intel.com, hao.wu@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/2/21 2:28 PM, Moritz Fischer wrote:
> On Mon, Aug 02, 2021 at 01:15:00PM +0530, kajoljain wrote:
>>
>>
>> On 7/13/21 1:12 PM, Kajol Jain wrote:
>>> The performance reporting driver added cpu hotplug
>>> feature but it didn't add pmu migration call in cpu
>>> offline function.
>>> This can create an issue incase the current designated
>>> cpu being used to collect fme pmu data got offline,
>>> as based on current code we are not migrating fme pmu to
>>> new target cpu. Because of that perf will still try to
>>> fetch data from that offline cpu and hence we will not
>>> get counter data.
>>>
>>> Patch fixed this issue by adding pmu_migrate_context call
>>> in fme_perf_offline_cpu function.
>>>
>>> Fixes: 724142f8c42a ("fpga: dfl: fme: add performance reporting support")
>>> Tested-by: Xu Yilun <yilun.xu@intel.com>
>>> Acked-by: Wu Hao <hao.wu@intel.com>
>>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>>> Cc: stable@vger.kernel.org
>>> ---
>>
>> Any update on this patch? Please let me know if any changes required.
>>
>> Thanks,
>> Kajol Jain
> 
> It's in my 'fixes' branch.

Thanks Moritz for informing me.

Thanks,
Kajol Jain

> 
> - Moritz
> 
