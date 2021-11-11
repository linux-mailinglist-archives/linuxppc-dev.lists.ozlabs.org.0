Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E04EE44DDE2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 23:27:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqxDN5pdXz3c4h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Nov 2021 09:27:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GKWFGhvT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GKWFGhvT; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqxCd2fxfz2xsf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Nov 2021 09:26:53 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ABMCX0q009177; 
 Thu, 11 Nov 2021 22:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=QRK/rTjbhY0vQdZUiBg6R0OyspuOMP4XylACDp8XdSg=;
 b=GKWFGhvTTY2Wd7k6tNPC+ceTyT8fXL9MKH8fRB/Vhy0HX6yiBKzCL2siiyPqo4Gdfd4B
 1E6c7kgirNgRQoWYGnt7SIYL7h/Thn4QP2wT2rDGTtiVeWfdTxpryrSfNzA2j7auNmWF
 f1j+c795AxkWdyPUt+MedPqAbD51ItPmxatw7I50Sz+/nBp6lScUrU6Rphr48/MdlMCe
 A6sQfXGuycIXZAF26JU7WcnOWEu/4/pnYa1Z95nkdo33TOuXzYNjA4JMaGZIV7hs4rpC
 1xfNzpIISu6cUbtOLh/jK98nHSPUMhr2LC5BIAlDYduFrpUf0GiEzHKyPIY3SC/FSQEe Eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c9bs1r72w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 22:26:47 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ABMJjAg029423;
 Thu, 11 Nov 2021 22:26:46 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c9bs1r72h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 22:26:46 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ABMCABD003558;
 Thu, 11 Nov 2021 22:26:44 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 3c5hbdjyy1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 22:26:44 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ABMQhFm60948956
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Nov 2021 22:26:43 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C2766A063;
 Thu, 11 Nov 2021 22:26:43 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21A1F6A04D;
 Thu, 11 Nov 2021 22:26:42 +0000 (GMT)
Received: from [9.211.98.91] (unknown [9.211.98.91])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 11 Nov 2021 22:26:42 +0000 (GMT)
Message-ID: <56d2ae87-b9bf-c9fc-1395-db4769a424ea@linux.vnet.ibm.com>
Date: Thu, 11 Nov 2021 17:26:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/3] KEXEC_SIG with appended signature
Content-Language: en-US
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <cover.1635948742.git.msuchanek@suse.de>
 <87czneeurr.fsf@dja-thinkpad.axtens.net>
 <20211105131401.GL11195@kunlun.suse.cz>
 <87a6ifehin.fsf@dja-thinkpad.axtens.net>
 <20211108120500.GO11195@kunlun.suse.cz>
From: Nayna <nayna@linux.vnet.ibm.com>
In-Reply-To: <20211108120500.GO11195@kunlun.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JAzXdG16z-AHxLx4O3sfM63yJ2lHyuyW
X-Proofpoint-ORIG-GUID: oXUeZR3KTNF8EGyTdINRJMmNxAGMsc_P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-11_07,2021-11-11_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111110113
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
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 David Howells <dhowells@redhat.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Luis Chamberlain <mcgrof@kernel.org>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Frank van der Linden <fllinden@amazon.com>,
 Jessica Yu <jeyu@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 11/8/21 07:05, Michal Suchánek wrote:
> Hello,
>
> On Mon, Nov 08, 2021 at 09:18:56AM +1100, Daniel Axtens wrote:
>> Michal Suchánek <msuchanek@suse.de> writes:
>>
>>> On Fri, Nov 05, 2021 at 09:55:52PM +1100, Daniel Axtens wrote:
>>>> Michal Suchanek <msuchanek@suse.de> writes:
>>>>
>>>>> S390 uses appended signature for kernel but implements the check
>>>>> separately from module loader.
>>>>>
>>>>> Support for secure boot on powerpc with appended signature is planned -
>>>>> grub patches submitted upstream but not yet merged.
>>>> Power Non-Virtualised / OpenPower already supports secure boot via kexec
>>>> with signature verification via IMA. I think you have now sent a
>>>> follow-up series that merges some of the IMA implementation, I just
>>>> wanted to make sure it was clear that we actually already have support
>>> So is IMA_KEXEC and KEXEC_SIG redundant?
>>>
>>> I see some architectures have both. I also see there is a lot of overlap
>>> between the IMA framework and the KEXEC_SIG and MODULE_SIg.
>>
>> Mimi would be much better placed than me to answer this.
>>
>> The limits of my knowledge are basically that signature verification for
>> modules and kexec kernels can be enforced by IMA policies.
>>
>> For example a secure booted powerpc kernel with module support will have
>> the following IMA policy set at the arch level:
>>
>> "appraise func=KEXEC_KERNEL_CHECK appraise_flag=check_blacklist appraise_type=imasig|modsig",
>> (in arch/powerpc/kernel/ima_arch.c)
>>
>> Module signature enforcement can be set with either IMA (policy like
>> "appraise func=MODULE_CHECK appraise_flag=check_blacklist appraise_type=imasig|modsig" )
>> or with CONFIG_MODULE_SIG_FORCE/module.sig_enforce=1.
>>
>> Sometimes this leads to arguably unexpected interactions - for example
>> commit fa4f3f56ccd2 ("powerpc/ima: Fix secure boot rules in ima arch
>> policy"), so it might be interesting to see if we can make things easier
>> to understand.
> I suspect that is the root of the problem here. Until distributions pick
> up IMA and properly document step by step in detail how to implement,
> enable, and debug it the _SIG options are required for users to be able
> to make use of signatures.

For secureboot, IMA appraisal policies are configured in kernel at boot 
time based on secureboot state of the system, refer 
arch/powerpc/kernel/ima_arch.c and security/integrity/ima/ima_efi.c. 
This doesn't require any user configuration. Yes, I agree it would be 
helpful to update kernel documentation specifying steps to sign the 
kernel image using sign-file.

>
> The other part is that distributions apply 'lockdown' patches that change
> the security policy depending on secure boot status which were rejected
> by upstream which only hook into the _SIG options, and not into the IMA_
> options. Of course, I expect this to change when the IMA options are
> universally available across architectures and the support picked up by
> distributions.
>
> Which brings the third point: IMA features vary across architectures,
> and KEXEC_SIG is more common than IMA_KEXEC.
>
> config/arm64/default:CONFIG_HAVE_IMA_KEXEC=y
> config/ppc64le/default:CONFIG_HAVE_IMA_KEXEC=y
>
> config/arm64/default:CONFIG_KEXEC_SIG=y
> config/s390x/default:CONFIG_KEXEC_SIG=y
> config/x86_64/default:CONFIG_KEXEC_SIG=y
>
> KEXEC_SIG makes it much easier to get uniform features across
> architectures.

Architectures use KEXEC_SIG vs IMA_KEXEC based on their requirement. 
IMA_KEXEC is for the kernel images signed using sign-file (appended 
signatures, not PECOFF), provides measurement along with verification, 
and is tied to secureboot state of the system at boot time.

Thanks & Regards,

       - Nayna

