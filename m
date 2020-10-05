Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0D5283562
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Oct 2020 14:08:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C4fW91497zDqH6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Oct 2020 23:08:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ananth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Zo0WRq4G; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C4ck82k7gzDqFJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Oct 2020 21:47:21 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 095AVpUe170630
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 5 Oct 2020 06:47:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=reply-to : subject : to
 : references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=jCN7XCeIJbOmKn5HP8p/CUyobzvQBBSm6UVRqiZAwJE=;
 b=Zo0WRq4GuQX9rdWuDDwz/bq7+drAYTPSpJ2JwbTCzItPwt0glf8p5h0BPEjtRg+IEsxi
 yAC3z26n6/pnOS4Y/AuXqzZm7483jyUFl9HLfTKDkzzHUTQknLR2gxBeK+RqrMpGNqF0
 PA1fW1eLn6D4Ng+Rx346FVwy1jhlGEK41Dme5gCQZE5RltwtzdY1NRqshgrQ4QA4OoPA
 9wAHrchGj9+er9eOUMcCIbUJFXp3KgccfRUFtqr5gwKe8kaIPlP5m9tyNIeSXKtJ2oL2
 qCCGwbmEbzGG99rjCdVGnw9jIjhFCZYB0QNZtc7HgB5fJ3R5kb4fl7wdTHUbqVhok0Fm yw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3401p2rm8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Oct 2020 06:47:18 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 095AcGeK030535
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 5 Oct 2020 10:47:17 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 33xgx8et3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Oct 2020 10:47:17 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 095AlCjh14221994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 5 Oct 2020 10:47:12 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE2E1C6059
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Oct 2020 10:47:16 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18221C605B
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Oct 2020 10:47:16 +0000 (GMT)
Received: from [9.77.193.77] (unknown [9.77.193.77])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Oct 2020 10:47:15 +0000 (GMT)
Subject: Re: [PATCH v2] powernv/elog: Fix the race while processing OPAL error
 log event.
To: linuxppc-dev@lists.ozlabs.org
References: <160187115555.1589942.2124270585910076829.stgit@jupiter>
From: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
Organization: IBM
Message-ID: <df7cebd0-bec3-d716-5514-61c4043a6d30@linux.ibm.com>
Date: Mon, 5 Oct 2020 16:17:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <160187115555.1589942.2124270585910076829.stgit@jupiter>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-05_06:2020-10-02,
 2020-10-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=3 adultscore=0 clxscore=1011
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2010050075
X-Mailman-Approved-At: Mon, 05 Oct 2020 23:06:02 +1100
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
Reply-To: ananth@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/5/20 9:42 AM, Mahesh Salgaonkar wrote:
> Every error log reported by OPAL is exported to userspace through a sysfs
> interface and notified using kobject_uevent(). The userspace daemon
> (opal_errd) then reads the error log and acknowledges it error log is saved
> safely to disk. Once acknowledged the kernel removes the respective sysfs
> file entry causing respective resources getting released including kobject.
> 
> However there are chances where user daemon may already be scanning elog
> entries while new sysfs elog entry is being created by kernel. User daemon
> may read this new entry and ack it even before kernel can notify userspace
> about it through kobject_uevent() call. If that happens then we have a
> potential race between elog_ack_store->kobject_put() and kobject_uevent
> which can lead to use-after-free issue of a kernfs object resulting into a
> kernel crash. This patch fixes this race by protecting a sysfs file
> creation/notification by holding an additional reference count on kobject
> until we safely send kobject_uevent().
> 
> Reported-by: Oliver O'Halloran <oohall@gmail.com>
> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

cc stable?

-- 
Ananth
