Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A30A03FD7BE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 12:33:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H00kf3N3lz2yJh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 20:32:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rZIxJiPs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=abdhalee@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rZIxJiPs; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H00jv52qMz2yHD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Sep 2021 20:32:19 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 181A3OtI112646; Wed, 1 Sep 2021 06:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=DD/RMIEhWsi0QqJcl0lEqHkwy1Ons24H0yosxSxLVRE=;
 b=rZIxJiPsfED1vHBQlztGqTHJZncmuXwc2CQM0BtybtUhcFDuE4TI1S9w8uuibxQ+mAyu
 XLw2L3Ril2mrcpcOdRhPBsTlIjTlZ+3g6Uap0tE2dOJ+aHSRNMJzt/g9gOtifqM/rpJQ
 XWX0r8RF8epdGQwht0CFs7DvcztCOEkhstJTvUsAZ2LzRA+gpiFVEnf6ZiBs8Y3wtJBo
 zxeTeCCgaM53PgFnWHbO4ydMN3AzEz8gbTLCY6awFl0jtGEjvdTvFKupjbccZwi+7s4N
 T6COuIg+UYQbjmhx9hB1em0DXrsKgqUu3J4r4Z0Ef5EfUSqZ2vNmGn1wF7B/BRNVRWem yA== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3at6ghtnt5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 06:32:06 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 181AMjrl012918;
 Wed, 1 Sep 2021 10:32:05 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 3aqcsd4aaf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 10:32:05 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 181AW40j30736780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Sep 2021 10:32:04 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91814124070;
 Wed,  1 Sep 2021 10:32:04 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1FC2124074;
 Wed,  1 Sep 2021 10:32:01 +0000 (GMT)
Received: from [9.43.110.185] (unknown [9.43.110.185])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  1 Sep 2021 10:32:01 +0000 (GMT)
Subject: Re: [next-20210820][ppc][nvme/raid] pci unbind WARNS at
 fs/kernfs/dir.c:1524 kernfs_remove_by_name_ns+
To: Christoph Hellwig <hch@infradead.org>
References: <063e6cf0-94ab-26f2-4fed-aebf1499127c@linux.vnet.ibm.com>
 <YSfBwj1zo/w2GCH4@infradead.org>
From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Message-ID: <0b1c2dac-91ca-b033-7196-bb182f549e12@linux.vnet.ibm.com>
Date: Wed, 1 Sep 2021 16:00:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSfBwj1zo/w2GCH4@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZkAtlmv5YCb2bMRqMOBPuMSXnb8Y3Vcu
X-Proofpoint-ORIG-GUID: ZkAtlmv5YCb2bMRqMOBPuMSXnb8Y3Vcu
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-01_03:2021-09-01,
 2021-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011
 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=885 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2109010058
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
Cc: Brian King <brking@linux.vnet.ibm.com>,
 linux-next <linux-next@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks Christoph,

The problem is fixed with below commit and tested on next-20210823

Tested-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>

On 8/26/21 10:00 PM, Christoph Hellwig wrote:

> Are you sure this is the very latest linux-next?  This should hav been
> fixed by:
>
>      "block: add back the bd_holder_dir reference in bd_link_disk_holder"

-- 
Regard's

Abdul Haleem
IBM Linux Technology Center

