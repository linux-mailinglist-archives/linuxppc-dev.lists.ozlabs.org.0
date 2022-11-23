Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 251636362CB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 16:07:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHPcB1xcJz3dvl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 02:07:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jQhcy4o6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nayna@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jQhcy4o6;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHPb93Cy6z3bP1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 02:06:12 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ANEbIsg023628;
	Wed, 23 Nov 2022 15:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=dGvd4VZd9FPa4CkPPRes0myKBlACTZGqM/g+x0F1vP4=;
 b=jQhcy4o6P2yR+/fb7Kao/F0nN5lNKZe1Zw85dS4c0GnvSEGFW/JmTYOPPW4YqqwZJEgr
 AEqr8ygDEo1Urnh36ZQEFOKHdnm10Gj+Y86H53AOsaD2VBTvS7gZdBc4azjL4ncKvoar
 SlAVK33+4RArfsCCVu3WzWgev9GgZnYHEnioBEtEaOF+U2yBScnbGZOgsrsXT0M3/aE3
 MqxHplD+0J4Zz1FNOJExSTwAg7AwLXuy1dbHRGehQsPYNbuoCquhctttk33ashMi90o1
 B22vIKK68PfSdy+J6yr6oIp2SFG4t7ah+mVZYZnFfMWc6P2qgaifMsMMBrzZjqeTfnfc jQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m10w5yav4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Nov 2022 15:05:55 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ANEc1gY026045;
	Wed, 23 Nov 2022 15:05:54 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m10w5yau6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Nov 2022 15:05:54 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ANF5BIh018975;
	Wed, 23 Nov 2022 15:05:53 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
	by ppma01wdc.us.ibm.com with ESMTP id 3kxps9ke0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Nov 2022 15:05:53 +0000
Received: from smtpav06.wdc07v.mail.ibm.com ([9.208.128.115])
	by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ANF5qv264160174
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Nov 2022 15:05:53 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E4DF75806A;
	Wed, 23 Nov 2022 15:05:51 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4FB0358064;
	Wed, 23 Nov 2022 15:05:50 +0000 (GMT)
Received: from [9.163.61.172] (unknown [9.163.61.172])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 23 Nov 2022 15:05:50 +0000 (GMT)
Message-ID: <a2752fdf-c89f-6f57-956e-ad035d32aec6@linux.vnet.ibm.com>
Date: Wed, 23 Nov 2022 10:05:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/4] fs: define a firmware security filesystem named
 fwsecurityfs
Content-Language: en-US
From: Nayna <nayna@linux.vnet.ibm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20221106210744.603240-1-nayna@linux.ibm.com>
 <20221106210744.603240-3-nayna@linux.ibm.com> <Y2uvUFQ9S2oaefSY@kroah.com>
 <8447a726-c45d-8ebb-2a74-a4d759631e64@linux.vnet.ibm.com>
 <20221119114234.nnfxsqx4zxiku2h6@riteshh-domain>
 <d3e8df29-d9b0-5e8e-4a53-d191762fe7f2@linux.vnet.ibm.com>
In-Reply-To: <d3e8df29-d9b0-5e8e-4a53-d191762fe7f2@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ADE2-NM2PMt6SFqJNMWDHHmcmzlLJstz
X-Proofpoint-ORIG-GUID: DH_smz6n-IN3MkQiEHn_FK2ti-X-FIHB
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_08,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211230112
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


On 11/22/22 18:21, Nayna wrote:
>
> From the perspective of our use case, we need to expose firmware 
> security objects to userspace for management. Not all of the objects 
> pre-exist and we would like to allow root to create them from userspace.
>
> From a unification perspective, I have considered a common location at 
> /sys/firmware/security for managing any platform's security objects. 
> And I've proposed a generic filesystem, which could be used by any 
> platform to represent firmware security objects via 
> /sys/firmware/security.
>
> Here are some alternatives to generic filesystem in discussion:
>
> 1. Start with a platform-specific filesystem. If more platforms would 
> like to use the approach, it can be made generic. We would still have 
> a common location of /sys/firmware/security and new code would live in 
> arch. This is my preference and would be the best fit for our use case.
>
> 2. Use securityfs.  This would mean modifying it to satisfy other use 
> cases, including supporting userspace file creation. I don't know if 
> the securityfs maintainer would find that acceptable. I would also 
> still want some way to expose variables at /sys/firmware/security.
>
> 3. Use a sysfs-based approach. This would be a platform-specific 
> implementation. However, sysfs has a similar issue to securityfs for 
> file creation. When I tried it in RFC v1[1], I had to implement a 
> workaround to achieve that.
>
> [1] 
> https://lore.kernel.org/linuxppc-dev/20220122005637.28199-3-nayna@linux.ibm.com/
>
Hi Greg,

Based on the discussions so far, is Option 1, described above, an 
acceptable next step?

Thanks & Regards,

       - Nayna

