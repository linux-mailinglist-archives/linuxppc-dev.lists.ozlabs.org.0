Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7542D63695E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 19:59:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHVlx2Wq0z3dvF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 05:59:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q4bGZ/Sw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nayna@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q4bGZ/Sw;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHVl10hYSz2xl5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 05:58:20 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ANI3vju030703;
	Wed, 23 Nov 2022 18:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=OWd1TMAtI9YXm3ugWju/m0erSY+DisOV9bmg4+k/m3k=;
 b=q4bGZ/SwCdcxMTCDce8bjFBUoDMN0CZ31q6DI7oTd3Lf9e8FOZgCgHZQ48zOuuWvzCUO
 g65mPRAX6xpkXngwmP/wW2GD7kRr8pBWi2zh25utGJupBCeSK8g2Bmri4qiorULyb0Qb
 l2lA14Gg2WxhPDnONXZDVVOXVwiFAvhq8uROjB5r8tWrD96R7LXyRZsTdvmb8I76XwXL
 7vVlWY8kND9j0qkhpFUgym5pBE3b+hqvo6qmV5+7CivPva8+Xj8Dc4HsLsSzR6hg2QFm
 2FGPRDZBXW/QdGmFtJBOtR5PtYtTO6s3vgGSnrKfZyvQ6qG+yzPHRYuSxvw5Tg+dp7lY Wg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0x813evb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Nov 2022 18:58:04 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ANIvaif024504;
	Wed, 23 Nov 2022 18:58:03 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0x813ev0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Nov 2022 18:58:03 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ANIpeoh007133;
	Wed, 23 Nov 2022 18:58:02 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
	by ppma03dal.us.ibm.com with ESMTP id 3kxpsakr3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Nov 2022 18:58:02 +0000
Received: from smtpav04.wdc07v.mail.ibm.com ([9.208.128.116])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ANIw0Ji6030060
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Nov 2022 18:58:01 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C7C4258045;
	Wed, 23 Nov 2022 18:58:00 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A7DC5805F;
	Wed, 23 Nov 2022 18:57:59 +0000 (GMT)
Received: from [9.163.61.172] (unknown [9.163.61.172])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 23 Nov 2022 18:57:58 +0000 (GMT)
Message-ID: <6f2a4a5f-ab5b-8c1b-47d5-d4e6dca5fc3a@linux.vnet.ibm.com>
Date: Wed, 23 Nov 2022 13:57:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/4] fs: define a firmware security filesystem named
 fwsecurityfs
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20221106210744.603240-1-nayna@linux.ibm.com>
 <20221106210744.603240-3-nayna@linux.ibm.com> <Y2uvUFQ9S2oaefSY@kroah.com>
 <8447a726-c45d-8ebb-2a74-a4d759631e64@linux.vnet.ibm.com>
 <20221119114234.nnfxsqx4zxiku2h6@riteshh-domain>
 <d3e8df29-d9b0-5e8e-4a53-d191762fe7f2@linux.vnet.ibm.com>
 <a2752fdf-c89f-6f57-956e-ad035d32aec6@linux.vnet.ibm.com>
 <Y35C9O27J29bUDjA@kroah.com>
From: Nayna <nayna@linux.vnet.ibm.com>
In-Reply-To: <Y35C9O27J29bUDjA@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2YrEmH-Vwbi1pRZxNLbmgvdX-b8wwU50
X-Proofpoint-ORIG-GUID: _wOu0IfhLy4hU6MJ6gGyX-1HjXY9bgsf
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_10,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211230137
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
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, linux-efi@vger.kernel.org, Andrew Donnellan <ajd@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>, "Ritesh Harjani \(IBM\)" <ritesh.list@gmail.com>, linux-kernel@vger.kernel.org, npiggin@gmail.com, Dov Murik <dovmurik@linux.ibm.com>, Dave Hansen <dave.hansen@intel.com>, linux-security-module <linux-security-module@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linux-fsdevel@vger.kernel.org, George Wilson <gcwilson@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, "Serge E. Hallyn" <serge@hallyn.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 11/23/22 10:57, Greg Kroah-Hartman wrote:
> On Wed, Nov 23, 2022 at 10:05:49AM -0500, Nayna wrote:
>> On 11/22/22 18:21, Nayna wrote:
>>>  From the perspective of our use case, we need to expose firmware
>>> security objects to userspace for management. Not all of the objects
>>> pre-exist and we would like to allow root to create them from userspace.
>>>
>>>  From a unification perspective, I have considered a common location at
>>> /sys/firmware/security for managing any platform's security objects. And
>>> I've proposed a generic filesystem, which could be used by any platform
>>> to represent firmware security objects via /sys/firmware/security.
>>>
>>> Here are some alternatives to generic filesystem in discussion:
>>>
>>> 1. Start with a platform-specific filesystem. If more platforms would
>>> like to use the approach, it can be made generic. We would still have a
>>> common location of /sys/firmware/security and new code would live in
>>> arch. This is my preference and would be the best fit for our use case.
>>>
>>> 2. Use securityfs.  This would mean modifying it to satisfy other use
>>> cases, including supporting userspace file creation. I don't know if the
>>> securityfs maintainer would find that acceptable. I would also still
>>> want some way to expose variables at /sys/firmware/security.
>>>
>>> 3. Use a sysfs-based approach. This would be a platform-specific
>>> implementation. However, sysfs has a similar issue to securityfs for
>>> file creation. When I tried it in RFC v1[1], I had to implement a
>>> workaround to achieve that.
>>>
>>> [1] https://lore.kernel.org/linuxppc-dev/20220122005637.28199-3-nayna@linux.ibm.com/
>>>
>> Hi Greg,
>>
>> Based on the discussions so far, is Option 1, described above, an acceptable
>> next step?
> No, as I said almost a year ago, I do not want to see platform-only
> filesystems going and implementing stuff that should be shared by all
> platforms.

Given there are no other exploiters for fwsecurityfs and there should be 
no platform-specific fs, would modifying sysfs now to let userspace 
create files cleanly be the way forward? Or, if we should strongly 
consider securityfs, which would result in updating securityfs to allow 
userspace creation of files and then expose variables via a more 
platform-specific directory /sys/kernel/security/pks? We want to pick 
the best available option and would find some hints on direction helpful 
before we develop the next patch.

Thanks & Regards,

       - Nayna

