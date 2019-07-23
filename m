Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6017259A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 05:55:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45thMc311DzDqJL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 13:55:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tLcY27WDzDqP7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 00:35:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45tLcW6QsYz8t3y
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 00:35:39 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45tLcW65qFz9s7T; Wed, 24 Jul 2019 00:35:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nayna@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45tLcW2nKTz9s3l;
 Wed, 24 Jul 2019 00:35:39 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6NEVEkd023990; Tue, 23 Jul 2019 10:35:27 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tx2eqw34c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jul 2019 10:35:26 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x6NEWHn3032587;
 Tue, 23 Jul 2019 10:35:26 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tx2eqw33b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jul 2019 10:35:25 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x6NEYbu5003257;
 Tue, 23 Jul 2019 14:35:24 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 2twhrb60qc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jul 2019 14:35:24 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6NEZNpH49283478
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jul 2019 14:35:23 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD1D8B2066;
 Tue, 23 Jul 2019 14:35:23 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6065B205F;
 Tue, 23 Jul 2019 14:35:22 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.85.152.234])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 23 Jul 2019 14:35:22 +0000 (GMT)
Subject: Re: [PATCH 2/2] powerpc: expose secure variables via sysfs
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org,
 linux-efi@vger.kernel.org, "Oliver O'Halloran" <oohall@gmail.com>
References: <1560459027-5248-1-git-send-email-nayna@linux.ibm.com>
 <1560459027-5248-3-git-send-email-nayna@linux.ibm.com>
 <87o92910fg.fsf@concordia.ellerman.id.au>
From: Nayna <nayna@linux.vnet.ibm.com>
Message-ID: <6d2988c1-9b89-448b-4537-c3c6673b6dd1@linux.vnet.ibm.com>
Date: Tue, 23 Jul 2019 10:35:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <87o92910fg.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-23_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907230144
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, Paul Mackerras <paulus@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, Elaine Palmer <erpalmer@us.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-integrity@vger.kernel.org, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 07/05/2019 02:05 AM, Michael Ellerman wrote:
> Hi Nayna,

Hi Michael, Oliver,


>
> Nayna Jain <nayna@linux.ibm.com> writes:
>> As part of PowerNV secure boot support, OS verification keys are stored
>> and controlled by OPAL as secure variables. These need to be exposed to
>> the userspace so that sysadmins can perform key management tasks.
>>
>> This patch adds the support to expose secure variables via a sysfs
>> interface It reuses the the existing efi defined hooks and backend in
>> order to maintain the compatibility with the userspace tools.
> Which tools? Can you include a log demonstrating how they're used, ie.
> so that I can test the sequence of commands.
>
>> Though it reuses a great deal of efi, POWER platforms do not use EFI.
>> A new config, POWER_SECVAR_SYSFS, is defined to enable this new sysfs
>> interface.
> Sorry I haven't been able to keep up with all the discussions, but I
> thought the consensus was that pretending to be EFI-like was a bad idea,
> because we don't have actual EFI and we're not implementing an entirely
> compatible scheme to EFI anyway.
>
> Greg suggested just putting the variables in sysfs, why does that not
> work? Matthew mentioned "complex semantics around variable deletion and
> immutability" but do we have to emulate those semantics on powerpc?

Sorry for the delay in the response.

Yes, I agree. The purpose of the v2 version of the patchset was to try 
and quickly address Matthew's concerns. This version of the patchset:
* is not using any EFI configs
* is not exposing secure variables via efivarfs
* is based on Greg's suggestion to use sysfs
* is STILL using some of the existing EFI code, that is used by EFI to 
expose its variables via sysfs, to avoid code duplication.
* is using efivar hooks to expose secure variables for tool compatibility

Assuming we all are in agreement, the next version of this patchset will 
further improve upon these changes. It will refactor some of the sysfs 
code from drivers/firmware/efi that is common to both EFI and POWER.  
Since we do not have to emulate the complex semantics of efi on powerpc, 
the sysfs interface should work for us.

As per the tool, it will be efivar. I will provide the log demonstrating 
how it is used with the next version.

Is there something I missed in my understanding ?

Thanks & Regards,
      - Nayna
