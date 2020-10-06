Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6311C284410
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 04:28:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C51c91QNLzDqGt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 13:28:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C51ZR42QnzDqGq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Oct 2020 13:27:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qNQITs7a; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4C51ZR3QYtz8tTy
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Oct 2020 13:27:11 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4C51ZR2pndz9sSs; Tue,  6 Oct 2020 13:27:11 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hegdevasant@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qNQITs7a; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4C51ZQ58Vjz9sSG
 for <linuxppc-dev@ozlabs.org>; Tue,  6 Oct 2020 13:27:09 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09626CeM053815
 for <linuxppc-dev@ozlabs.org>; Mon, 5 Oct 2020 22:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=jql7YcRcLv5ReAy69wLx8TXnPf8JVJja8BWCIaBPvZk=;
 b=qNQITs7aZ9Nz2ARcLDnIsPpk99rznmVQTBKBZVBnax5dx/c0OtW0UAU+l7Ij9D19rQlY
 nlqtDTyW9teioJGRi3MoaCka/mf9gWGx6RdHpUgAuDNuacBfzuTDCpCkWLzA8+PWZgga
 NNyL7JUjw6w26n0L/kEcS8AoFcAcnqXS6rMRmpfnIiEqUxVk66p5HI4MCmoVvKUPjSMl
 1V3MZ/awJpm67JRveD7Kyh6SWjwKdMk3p+e7H1lDXVcH2QcR4HHsUA0s37CU5lHdQEyq
 60rkyFgSj9eWYYH6WFUnVHo6bo0YlrEip2SeLkxDo5i8u8KiqrW30DShT7hRLZOFFyGJ JA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 340f5a8prb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 05 Oct 2020 22:27:06 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0962PsWD163826
 for <linuxppc-dev@ozlabs.org>; Mon, 5 Oct 2020 22:27:05 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 340f5a8pqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Oct 2020 22:27:05 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0962QfQJ026853;
 Tue, 6 Oct 2020 02:27:03 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 33xgjh9dk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Oct 2020 02:27:03 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0962R0bM30343568
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Oct 2020 02:27:00 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4F7D42045;
 Tue,  6 Oct 2020 02:27:00 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39D0742042;
 Tue,  6 Oct 2020 02:26:58 +0000 (GMT)
Received: from [9.199.50.102] (unknown [9.199.50.102])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  6 Oct 2020 02:26:57 +0000 (GMT)
Subject: Re: [PATCH v2] powernv/elog: Fix the race while processing OPAL error
 log event.
To: "Oliver O'Halloran" <oohall@gmail.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>
References: <160187115555.1589942.2124270585910076829.stgit@jupiter>
 <CAOSf1CEx_vSrMNYCRrL7q168hXr+iEAG4jxhrjkXzqEMH5CkQA@mail.gmail.com>
From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Message-ID: <7533c39e-be64-3c90-d96a-b642aee3e518@linux.vnet.ibm.com>
Date: Tue, 6 Oct 2020 07:56:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAOSf1CEx_vSrMNYCRrL7q168hXr+iEAG4jxhrjkXzqEMH5CkQA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-05_19:2020-10-05,
 2020-10-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=2
 lowpriorityscore=0 clxscore=1011 impostorscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010060004
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
>>    race.
>> ---
>>   arch/powerpc/platforms/powernv/opal-elog.c |   15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/powerpc/platforms/powernv/opal-elog.c b/arch/powerpc/platforms/powernv/opal-elog.c
>> index 62ef7ad995da..230f102e87c0 100644
>> --- a/arch/powerpc/platforms/powernv/opal-elog.c
>> +++ b/arch/powerpc/platforms/powernv/opal-elog.c
>> @@ -222,13 +222,28 @@ static struct elog_obj *create_elog_obj(uint64_t id, size_t size, uint64_t type)
>>                  return NULL;
>>          }
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
>>          rc = sysfs_create_bin_file(&elog->kobj, &elog->raw_attr);
>>          if (rc) {
>> +               kobject_put(&elog->kobj);
>> +               /* Drop the extra reference count  */
>>                  kobject_put(&elog->kobj);
>>                  return NULL;
>>          }
>>
>>          kobject_uevent(&elog->kobj, KOBJ_ADD);
>> +       /* Drop the extra reference count  */
>> +       kobject_put(&elog->kobj);
> 
> Makes sense,
> 
> Reviewed-by: Oliver O'Halloran <oohall@gmail.com>

Reviewed-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>

> 
>>
>>          return elog;
> 
> Does the returned value actually get used anywhere? We'd have a
> similar use-after-free problem if it does. This should probably return
> an error code rather than the object itself.

No one is using it today. May be we should just make it void function.

-Vasant
