Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 670DE284514
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 06:49:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C54l51YDNzDqJk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 15:49:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C54jL4psCzDqHK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Oct 2020 15:48:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=j9eMH2Xg; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4C54jL3YCqz8tX2
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Oct 2020 15:48:22 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4C54jL36pQz9sSs; Tue,  6 Oct 2020 15:48:22 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=j9eMH2Xg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4C54jK4jgTz9sS8
 for <linuxppc-dev@ozlabs.org>; Tue,  6 Oct 2020 15:48:21 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0964Wxt4100542
 for <linuxppc-dev@ozlabs.org>; Tue, 6 Oct 2020 00:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=GibEoFdobSYDpAOwCW26N09xZV5p+he45q3llEiEO2Q=;
 b=j9eMH2XgKXsJ5IxTrqgl0tiAlUkxnerubkiH0IT5m8quiZLIGn8LLw+b1zykx2Ldtg39
 Yhkz8cyGE+ZXPgke2JScUss5mFEt3VqcqNtFeqpQ4wx1iu/L182muUalxHLiyZRwD3jZ
 bKRjiaSZKHIly4w+Et8w57cefBgGn8OyLpH/f6EPCdkq7CK2QHc7IsQuPU/PY0wwhSAx
 yHlf2CeDuoMAxeKCJy0Y1zLB+/PY6RlHAslZo3lSMA3WZRQGGSHqovZEfuiXjmyM1wfC
 k3tlBJab23rgbqnLHtonqs7kTvQWiZL/ZQmKSeXZAqfbnITHHAPzsVF3jAE5U9ukS+YY Dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 340h898tjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 06 Oct 2020 00:48:19 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0964XNcp101480
 for <linuxppc-dev@ozlabs.org>; Tue, 6 Oct 2020 00:48:19 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 340h898thk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Oct 2020 00:48:19 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0964gY58010905;
 Tue, 6 Oct 2020 04:48:16 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 33xgx81fcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Oct 2020 04:48:16 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0964mDxI28901678
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Oct 2020 04:48:13 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B94B5A4066;
 Tue,  6 Oct 2020 04:48:13 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0F37A405C;
 Tue,  6 Oct 2020 04:48:12 +0000 (GMT)
Received: from [9.85.71.114] (unknown [9.85.71.114])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  6 Oct 2020 04:48:12 +0000 (GMT)
Subject: Re: [PATCH v2] powernv/elog: Fix the race while processing OPAL error
 log event.
To: "Oliver O'Halloran" <oohall@gmail.com>
References: <160187115555.1589942.2124270585910076829.stgit@jupiter>
 <CAOSf1CEx_vSrMNYCRrL7q168hXr+iEAG4jxhrjkXzqEMH5CkQA@mail.gmail.com>
From: Mahesh Jagannath Salgaonkar <mahesh@linux.ibm.com>
Message-ID: <8c5ffdae-f1b6-c501-13d4-f58baf24b990@linux.ibm.com>
Date: Tue, 6 Oct 2020 10:18:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAOSf1CEx_vSrMNYCRrL7q168hXr+iEAG4jxhrjkXzqEMH5CkQA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-06_01:2020-10-05,
 2020-10-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 adultscore=0 mlxscore=0
 priorityscore=1501 suspectscore=2 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2010060025
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
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Vasant Hegde <hegdevasant@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/6/20 5:55 AM, Oliver O'Halloran wrote:
> On Mon, Oct 5, 2020 at 3:12 PM Mahesh Salgaonkar <mahesh@linux.ibm.com> wrote:
>>
>> Every error log reported by OPAL is exported to userspace through a sysfs
>> interface and notified using kobject_uevent(). The userspace daemon
>> (opal_errd) then reads the error log and acknowledges it error log is saved
>> safely to disk. Once acknowledged the kernel removes the respective sysfs
>> file entry causing respective resources getting released including kobject.
>>
>> However there are chances where user daemon may already be scanning elog
>> entries while new sysfs elog entry is being created by kernel. User daemon
>> may read this new entry and ack it even before kernel can notify userspace
>> about it through kobject_uevent() call. If that happens then we have a
>> potential race between elog_ack_store->kobject_put() and kobject_uevent
>> which can lead to use-after-free issue of a kernfs object resulting into a
>> kernel crash. This patch fixes this race by protecting a sysfs file
>> creation/notification by holding an additional reference count on kobject
>> until we safely send kobject_uevent().
>>
>> Reported-by: Oliver O'Halloran <oohall@gmail.com>
>> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>> Change in v2:
>> - Instead of mutex and use extra reference count on kobject to avoid the
>>   race.
>> ---
>>  arch/powerpc/platforms/powernv/opal-elog.c |   15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/powerpc/platforms/powernv/opal-elog.c b/arch/powerpc/platforms/powernv/opal-elog.c
>> index 62ef7ad995da..230f102e87c0 100644
>> --- a/arch/powerpc/platforms/powernv/opal-elog.c
>> +++ b/arch/powerpc/platforms/powernv/opal-elog.c
>> @@ -222,13 +222,28 @@ static struct elog_obj *create_elog_obj(uint64_t id, size_t size, uint64_t type)
>>                 return NULL;
>>         }
>>
>> +       /*
>> +        * As soon as sysfs file for this elog is created/activated there is
>> +        * chance opal_errd daemon might read and acknowledge this elog before
>> +        * kobject_uevent() is called. If that happens then we have a potential
>> +        * race between elog_ack_store->kobject_put() and kobject_uevent which
>> +        * leads to use-after-free issue of a kernfs object resulting into
>> +        * kernel crash. To avoid this race take an additional reference count
>> +        * on kobject until we safely send kobject_uevent().
>> +        */
>> +
>> +       kobject_get(&elog->kobj);  /* extra reference count */
>>         rc = sysfs_create_bin_file(&elog->kobj, &elog->raw_attr);
>>         if (rc) {
>> +               kobject_put(&elog->kobj);
>> +               /* Drop the extra reference count  */
>>                 kobject_put(&elog->kobj);
>>                 return NULL;
>>         }
>>
>>         kobject_uevent(&elog->kobj, KOBJ_ADD);
>> +       /* Drop the extra reference count  */
>> +       kobject_put(&elog->kobj);
> 
> Makes sense,
> 
> Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
> 
>>
>>         return elog;
> 
> Does the returned value actually get used anywhere? We'd have a
> similar use-after-free problem if it does. This should probably return
> an error code rather than the object itself.
> 

Nope. It  isn't being used. I can make it function as void and send v3.

Thanks,
-Mahesh.
