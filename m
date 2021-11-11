Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C4F44DDDC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 23:24:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hqx8l57YZz305d
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Nov 2021 09:24:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bbQMFwYR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bbQMFwYR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hqx7z0BRPz2xF9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Nov 2021 09:23:42 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ABMHTv3015889; 
 Thu, 11 Nov 2021 22:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=uLAwCDGf/HOtWnlewCR9FROTROHM0YT5G86jPYrpHUM=;
 b=bbQMFwYRUMRosrODynNaCt/aXUuoDyEgGJE4fZCGTViJyK4/vnXqG638JNS3nHQ1x8GI
 qVY2ICnWYLYwYH/Ho6fDqG9dEIuNY671Li9o8UW9NvcKoWB0gFEYCmFXilX0pIOkk2It
 04UH3g8s2YXAR/0l8PIoi52Bbye5ylsvPvCunLpbv5bXRHgrJ0ZNAJD3pbxEMFvHTI5X
 m8OW08n3ixbTTzardmu48VfixlYlTRGCSrI2D3hdD1iIAWsU1cMm+ET4xMc6nixVSykW
 nuBBXxhksGSXD9l56fKqhxqg/9/GvPFOn8n848OyyYTTKdtZiKNqYGlcNCkD6Wq5m8MF lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c9bucr3kw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 22:23:36 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ABMIBdh017511;
 Thu, 11 Nov 2021 22:23:36 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c9bucr3kf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 22:23:35 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ABMCwMp030136;
 Thu, 11 Nov 2021 22:23:34 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 3c5hbdf9g9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 22:23:34 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ABMNX7329950340
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Nov 2021 22:23:33 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 495996A066;
 Thu, 11 Nov 2021 22:23:33 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D74B6A05A;
 Thu, 11 Nov 2021 22:23:32 +0000 (GMT)
Received: from [9.211.98.91] (unknown [9.211.98.91])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 11 Nov 2021 22:23:32 +0000 (GMT)
Message-ID: <bfccfb6d-376e-b66e-fb35-754f5e88d6a7@linux.vnet.ibm.com>
Date: Thu, 11 Nov 2021 17:23:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/3] KEXEC_SIG with appended signature
Content-Language: en-US
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <cover.1635948742.git.msuchanek@suse.de>
 <87czneeurr.fsf@dja-thinkpad.axtens.net>
 <20211105131401.GL11195@kunlun.suse.cz>
From: Nayna <nayna@linux.vnet.ibm.com>
In-Reply-To: <20211105131401.GL11195@kunlun.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8eQZjdlhZLss4qISeJhQrK406U_SuFkv
X-Proofpoint-GUID: wvHmZ4TLSiCokbzQbR5JlhZfVMEJZ6ow
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-11_07,2021-11-11_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 clxscore=1011 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0 mlxlogscore=961
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Luis Chamberlain <mcgrof@kernel.org>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Frank van der Linden <fllinden@amazon.com>,
 Jessica Yu <jeyu@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 11/5/21 09:14, Michal Suchánek wrote:
> On Fri, Nov 05, 2021 at 09:55:52PM +1100, Daniel Axtens wrote:
>> Michal Suchanek <msuchanek@suse.de> writes:
>>
>>> S390 uses appended signature for kernel but implements the check
>>> separately from module loader.
>>>
>>> Support for secure boot on powerpc with appended signature is planned -
>>> grub patches submitted upstream but not yet merged.
>> Power Non-Virtualised / OpenPower already supports secure boot via kexec
>> with signature verification via IMA. I think you have now sent a
>> follow-up series that merges some of the IMA implementation, I just
>> wanted to make sure it was clear that we actually already have support
> So is IMA_KEXEC and KEXEC_SIG redundant?
>
> I see some architectures have both. I also see there is a lot of overlap
> between the IMA framework and the KEXEC_SIG and MODULE_SIg.

Originally, KEXEC_SIG was meant for PECOFF based signatures, while 
IMA_KEXEC mainly supported xattr based signatures.

Power (Non-virtualized/OpenPOWER) doesn't support PECOFF. Extended 
attributes based signature verification doesn't work with netboot. 
That's when appended signature support was added to IMA.

Using IMA_KEXEC has the benefit of being able to enable both signature 
verification and measurement of the kernel image.

Thanks & Regards,

      - Nayna

