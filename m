Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 788E63B6F13
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 10:09:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDcZS34MFz3bZY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 18:09:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lst/v2ML;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Lst/v2ML; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDcYy0Wtjz2yx9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 18:08:53 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15T84FU4073675; Tue, 29 Jun 2021 04:08:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=RsIMVnamhB6FYa7FfF0w4uQRw+Kcw3nQxnVdRE1/Fv4=;
 b=Lst/v2MLPzGLS81nSf7dPD3ptWkhy65uSDp30t/ejUH4GOrNf3Tvi2It5zcdul33J3TQ
 E+C3TN0yD3uFZfqIiVSqfrxEhhZTP3VS4xRkhxS/XobQeCqvLBx/OBv6KWqwOf0fAH4x
 E+uCcs7Wuqqu/R5RAbeW4fuENENIK29kDOJ4ZjomiTIv1KR3+naE8CFUgxXQItjajUTI
 3mX5bMkifhOgWjAmS4QEgjJfaWAq8IFYnX3t79wPYbP8PsYVNwDZlfld8gyNKGlH1acY
 yXEnQAQ08LPRi9TGOmx2sxVI9N2xSjTN1x5Ad1UCyY/0WS3bCMnQuccZAfz2OkdMfYkK mA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39fv03wc34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 04:08:44 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15T869hB084165;
 Tue, 29 Jun 2021 04:08:43 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39fv03wc2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 04:08:43 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15T86NDG021853;
 Tue, 29 Jun 2021 08:08:42 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 39duvbwbpr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 08:08:42 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15T88f1M27263300
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Jun 2021 08:08:41 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 503996E090;
 Tue, 29 Jun 2021 08:08:41 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 828826E05B;
 Tue, 29 Jun 2021 08:08:35 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.45.57])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 29 Jun 2021 08:08:35 +0000 (GMT)
Subject: Re: [PATCH] fpga: dfl: fme: Fix cpu hotplug issue in performance
 reporting
To: Greg KH <gregkh@linuxfoundation.org>
References: <20210628101721.188991-1-kjain@linux.ibm.com>
 <adc3b013-d39b-a183-dfce-86ca857949b8@linux.ibm.com>
 <YNrLRLyyUeDemxTS@kroah.com>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <8a70f71a-f75c-427b-cf6a-b63bf7682f36@linux.ibm.com>
Date: Tue, 29 Jun 2021 13:38:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <YNrLRLyyUeDemxTS@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hetGeLcYCXc8AdjqHgud-38bTHz1rVQn
X-Proofpoint-GUID: q5oo3cYrBGcZjkPfLbOJVvffHymg3jFJ
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-29_02:2021-06-25,
 2021-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 mlxlogscore=914 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106290056
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
Cc: mark.rutland@arm.com, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 trix@redhat.com, linux-fpga@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com, mdf@kernel.org,
 will@kernel.org, yilun.xu@intel.com, hao.wu@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/29/21 12:57 PM, Greg KH wrote:
> On Tue, Jun 29, 2021 at 12:45:20PM +0530, kajoljain wrote:
>>
>>
>> On 6/28/21 3:47 PM, Kajol Jain wrote:
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
>>
>> Adding stable@vger.kernel.org in cc list as suggested by Moritz Fischer.
> 
> 
> <formletter>
> 
> This is not the correct way to submit patches for inclusion in the
> stable kernel tree.  Please read:
>     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> for how to do this properly.

Thanks Greg for pointing it, I will take care in my next version.

Thanks,
Kajol Jain

> 
> </formletter>
> 
