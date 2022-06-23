Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D26C55701B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 03:51:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LT3C10m60z3bqg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 11:51:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bY4gNorD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bY4gNorD;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LT3BF6Bxzz3bk8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 11:51:01 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25N1FPnN029418;
	Thu, 23 Jun 2022 01:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=TsI+ILPUKVz3yg7piZ6IP0m7tWX8TJEnXWgNEGMDWNc=;
 b=bY4gNorDsHYNJG2Bf7vLFZ9c7LcQJRlzLlHQz6IP10ZnGAfNcqnbh0O1IuDT8cLTS7Lt
 1nYfP7kdHEM1Lw4ozSdfDo3PWjcfmwa2pobiTI7dFCJciaHxLFjnx6U6CDeCEB1Nu/tk
 VrVoa4J39NN56aQOFrgcjqvsJH45Lhz7wkMMdcK+W6Ya3+SD+xpQvil4WsOCUn8Ac8cP
 gBdgo+Ie6cD9STH9X2471OYHcYpaYBAUsSb5HMaeQa8kYqsrbjmNBeF24EnqX24Uxr08
 PC5z8qPq6ekKDxxDQGQyGsBXEfU3yFv9cPy6N43LUd3l4K2d3SQ4IhVlctaPb5TKZZcW QA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gvebm0q3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jun 2022 01:50:48 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25N1aPW6003841;
	Thu, 23 Jun 2022 01:50:47 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by ppma01dal.us.ibm.com with ESMTP id 3guk92kbnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jun 2022 01:50:47 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25N1okmM35651890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jun 2022 01:50:46 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 54C0AC605A;
	Thu, 23 Jun 2022 01:50:46 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7AAF7C6057;
	Thu, 23 Jun 2022 01:50:45 +0000 (GMT)
Received: from [9.211.125.38] (unknown [9.211.125.38])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jun 2022 01:50:45 +0000 (GMT)
Message-ID: <e200854b-116a-cbf3-256d-92a9c490b9bc@linux.vnet.ibm.com>
Date: Wed, 22 Jun 2022 21:50:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH v2 2/3] fs: define a firmware security filesystem
 named fwsecurityfs
Content-Language: en-US
To: Casey Schaufler <casey@schaufler-ca.com>,
        Nayna Jain
 <nayna@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-fsdevel@vger.kernel.org
References: <20220622215648.96723-1-nayna@linux.ibm.com>
 <20220622215648.96723-3-nayna@linux.ibm.com>
 <e5399b47-5382-99e6-9a79-c0947a696917@schaufler-ca.com>
From: Nayna <nayna@linux.vnet.ibm.com>
In-Reply-To: <e5399b47-5382-99e6-9a79-c0947a696917@schaufler-ca.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xCCZ1rp5CwqPjADRXKVg0nEJScoazKR5
X-Proofpoint-GUID: xCCZ1rp5CwqPjADRXKVg0nEJScoazKR5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-22_08,2022-06-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=835 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 clxscore=1011 adultscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206230004
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
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, linux-efi@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Dov Murik <dovmurik@linux.ibm.com>, Dave Hansen <dave.hansen@intel.com>, linux-security-module <linux-security-module@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, George Wilson <gcwilson@linux.ibm.com>, gjoyce@ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 6/22/22 18:29, Casey Schaufler wrote:
> On 6/22/2022 2:56 PM, Nayna Jain wrote:
>> securityfs is meant for linux security subsystems to expose 
>> policies/logs
>> or any other information. However, there are various firmware security
>> features which expose their variables for user management via kernel.
>> There is currently no single place to expose these variables. Different
>> platforms use sysfs/platform specific filesystem(efivarfs)/securityfs
>> interface as find appropriate. Thus, there is a gap in kernel interfaces
>> to expose variables for security features.
>
> Why not put the firmware entries under /sys/kernel/security/firmware?

 From man 5 sysfs page:

/sys/firmware: This subdirectory contains interfaces for viewing and 
manipulating firmware-specific objects and attributes.

/sys/kernel: This subdirectory contains various files and subdirectories 
that provide information about the running kernel.

The security variables which are supposed to be exposed via fwsecurityfs 
are managed by firmware, stored in firmware managed space and also often 
consumed by firmware for enabling various security features.

 From git commit b67dbf9d4c1987c370fd18fdc4cf9d8aaea604c2, the purpose 
of securityfs(/sys/kernel/security) is to provide a common place for all 
kernel LSMs to use a common place. The idea of 
fwsecurityfs(/sys/firmware/security) is to similarly provide a common 
place for all firmware security objects.

By having another firmware directory within /sys/kernel/security would 
mean scattering firmware objects at multiple places and confusing the 
purpose of /sys/kernel and /sys/firmware.

Thanks & Regards,

      - Nayna

