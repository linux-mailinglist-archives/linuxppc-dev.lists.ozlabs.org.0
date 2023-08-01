Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C8176AD79
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 11:29:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NSCQSb5P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFVF45Mbzz30fd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 19:29:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NSCQSb5P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFVD63VxMz2yVL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 19:28:54 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3719C0ZX015459;
	Tue, 1 Aug 2023 09:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=3JBNBlm2gelY24TVuJBd0+kw6KPDn0i+mZhVYFkgK50=;
 b=NSCQSb5PETAcN79dC+XgN/vEkZbOFoqFlbd4QifJoaL+CGtABF9xTG5v9rpJw16mI2Vu
 SIOI8u1N5FKFfyEHJNlPln9sN6aNbaBWAQcsAJXE9DMrZt/N+lXIlatci3LYRj5JLT4N
 Dp+g4pkIVfK2kti89vFi0Xlvmd9v9AdQ9vGOhzG7h581jbwjwgntC4vZw7AG2FREPv+B
 jHMgF7r52VAw/UK79ju36PncfHNeCgyWJpgr5RSDUUBR9iE/R74/S9l9f9SjEHHD3B8b
 b3WcyJDjJEp5jLrTzzkGCyZ8NfIOa7akqXa4wi3wMHorYz9h14d79rs/GahO+WpipkmE 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6y73gf3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Aug 2023 09:28:37 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3719CVIm017878;
	Tue, 1 Aug 2023 09:28:36 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6y73gf30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Aug 2023 09:28:36 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3718Jf4E014530;
	Tue, 1 Aug 2023 09:28:34 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s5ft19yeh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Aug 2023 09:28:34 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3719SWTK11338278
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Aug 2023 09:28:33 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB4612004B;
	Tue,  1 Aug 2023 09:28:32 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E44220043;
	Tue,  1 Aug 2023 09:28:30 +0000 (GMT)
Received: from [9.43.52.167] (unknown [9.43.52.167])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  1 Aug 2023 09:28:30 +0000 (GMT)
Message-ID: <a32fe748-fa18-bd92-3a10-5da8dbad96e6@linux.ibm.com>
Date: Tue, 1 Aug 2023 14:58:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 7/7] mm/memory_hotplug: Enable runtime update of
 memmap_on_memory parameter
To: Michal Hocko <mhocko@suse.com>
References: <20230801044116.10674-1-aneesh.kumar@linux.ibm.com>
 <20230801044116.10674-8-aneesh.kumar@linux.ibm.com>
 <ZMjJPFcXlt+aeCUB@dhcp22.suse.cz>
Content-Language: en-US
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <ZMjJPFcXlt+aeCUB@dhcp22.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fCwk6B3C8CVsWbV82uf81AkO2vq9Jwjy
X-Proofpoint-GUID: 9GIdpCQkNLtnf3QJy6rfiC7G64hIHQLH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_03,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=552 lowpriorityscore=0
 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308010082
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
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org, npiggin@gmail.com, Vishal Verma <vishal.l.verma@intel.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/1/23 2:28 PM, Michal Hocko wrote:
> On Tue 01-08-23 10:11:16, Aneesh Kumar K.V wrote:
>> Allow updating memmap_on_memory mode after the kernel boot. Memory
>> hotplug done after the mode update will use the new mmemap_on_memory
>> value.
> 
> Well, this is a user space kABI extension and as such you should spend
> more words about the usecase. Why we could live with this static and now
> need dynamic?
> 

This enables easy testing of memmap_on_memory feature without a kernel reboot.
I also expect people wanting to use that when they find dax kmem memory online
failing because of struct page allocation failures[1]. User could reboot back with
memmap_on_memory=y kernel parameter. But being able to enable it via sysfs makes
the feature much more useful.

-aneesh
