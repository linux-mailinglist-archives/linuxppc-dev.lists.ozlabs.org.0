Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B8528453E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 07:13:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C55Gc1HHGzDqJW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 16:13:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=szNJ4M5r; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C55DF5SfTzDqHY
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Oct 2020 16:11:40 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09652HQD106342
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 6 Oct 2020 01:11:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=jvPi6ADUh9sJzf5VYunSxWwnvfctaqEKtA+vEZLZhiE=;
 b=szNJ4M5r37en4th1L420641S/9B2Js3U6gZlmEiqfeWAeyF+f/wrB+jrH/zQSRAMO4mJ
 emqdeGtIDDC5L3MHgq14IvYQtCXafn6lnhB3l3fgKHgcTuWtAo1B9BOIs8N+l2Ra+YSF
 8XHLDDR+cJJrnuErfjoJ3gUrKCCke85rvP6pZDIAPUDFmfHGZoM6M05pUfIXzUoX+PPC
 4Fgk1n58+mEfImQUgsLrVkQjjNmw7ZoYe/eRPBUMiL6EJ2ibUVZdDN2rrS5gbRyiIS2o
 ujMHpWLV5dqGYpNmHs9qnQXVhNWU6Ihge7xmgiSPLOsrLAuAs/5rxtnVU9lK3OMFkLzI WA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 340hswgn0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Oct 2020 01:11:38 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0965797a026483
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 6 Oct 2020 05:11:37 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 33xgx7sfn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Oct 2020 05:11:36 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0965BXMs10224004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Oct 2020 05:11:33 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C24C7A4054;
 Tue,  6 Oct 2020 05:11:33 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4ECCDA405C;
 Tue,  6 Oct 2020 05:11:33 +0000 (GMT)
Received: from [9.85.71.114] (unknown [9.85.71.114])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  6 Oct 2020 05:11:33 +0000 (GMT)
Subject: Re: [PATCH v2] powernv/elog: Fix the race while processing OPAL error
 log event.
To: ananth@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
References: <160187115555.1589942.2124270585910076829.stgit@jupiter>
 <df7cebd0-bec3-d716-5514-61c4043a6d30@linux.ibm.com>
From: Mahesh Jagannath Salgaonkar <mahesh@linux.ibm.com>
Message-ID: <5a4a6e03-b2ae-5702-89ca-6656606c7a5e@linux.ibm.com>
Date: Tue, 6 Oct 2020 10:41:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <df7cebd0-bec3-d716-5514-61c4043a6d30@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-06_01:2020-10-05,
 2020-10-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010060025
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/5/20 4:17 PM, Ananth N Mavinakayanahalli wrote:
> On 10/5/20 9:42 AM, Mahesh Salgaonkar wrote:
>> Every error log reported by OPAL is exported to userspace through a sysfs
>> interface and notified using kobject_uevent(). The userspace daemon
>> (opal_errd) then reads the error log and acknowledges it error log is
>> saved
>> safely to disk. Once acknowledged the kernel removes the respective sysfs
>> file entry causing respective resources getting released including
>> kobject.
>>
>> However there are chances where user daemon may already be scanning elog
>> entries while new sysfs elog entry is being created by kernel. User
>> daemon
>> may read this new entry and ack it even before kernel can notify
>> userspace
>> about it through kobject_uevent() call. If that happens then we have a
>> potential race between elog_ack_store->kobject_put() and kobject_uevent
>> which can lead to use-after-free issue of a kernfs object resulting
>> into a
>> kernel crash. This patch fixes this race by protecting a sysfs file
>> creation/notification by holding an additional reference count on kobject
>> until we safely send kobject_uevent().
>>
>> Reported-by: Oliver O'Halloran <oohall@gmail.com>
>> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> 
> cc stable?
> 

Will add it in v3.

Thanks,
-Mahesh.
