Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3513222DCE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 23:24:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B76hC5ZlFzDqSh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 07:24:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B76RX4lwjzDr6L
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 07:13:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B76RX3xKZz8tWg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 07:13:12 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B76RX2CsYz9sRW; Fri, 17 Jul 2020 07:13:12 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B76RW3LYqz9sRf
 for <linuxppc-dev@ozlabs.org>; Fri, 17 Jul 2020 07:13:11 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06GL3Wp1055617; Thu, 16 Jul 2020 17:13:07 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32aq0xykbs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 17:13:07 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06GL3cOk056268;
 Thu, 16 Jul 2020 17:13:06 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32aq0xykb0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 17:13:06 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06GL9iaa021043;
 Thu, 16 Jul 2020 21:13:05 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 327527x5dh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 21:13:04 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06GLBlfT28049892
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jul 2020 21:11:47 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D319AE045;
 Thu, 16 Jul 2020 21:11:47 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB9B4AE051;
 Thu, 16 Jul 2020 21:11:43 +0000 (GMT)
Received: from [9.102.2.181] (unknown [9.102.2.181])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 16 Jul 2020 21:11:43 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v3 07/12] ppc64/kexec_file: add support to relocate
 purgatory
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
References: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
 <159466093748.24747.4655547403463921814.stgit@hbathini.in.ibm.com>
 <871rlc9upc.fsf@morokweng.localdomain>
Message-ID: <6f64a18a-352e-fdec-c902-45aefc31cc0a@linux.ibm.com>
Date: Fri, 17 Jul 2020 02:41:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <871rlc9upc.fsf@morokweng.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-16_11:2020-07-16,
 2020-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 malwarescore=0
 spamscore=100 mlxlogscore=-1000 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=100 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007160139
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
Cc: kernel test robot <lkp@intel.com>, Pingfan Liu <piliu@redhat.com>,
 Petr Tesarik <ptesarik@suse.cz>, Nayna Jain <nayna@linux.ibm.com>,
 Kexec-ml <kexec@lists.infradead.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 16/07/20 5:50 am, Thiago Jung Bauermann wrote:
> 
> Hari Bathini <hbathini@linux.ibm.com> writes:
> 
>> Right now purgatory implementation is only minimal. But if purgatory
>> code is to be enhanced to copy memory to the backup region and verify
> 
> Can't the memcpy be done in asm? We have arch/powerpc/lib/memcpy_64.S
> for example, perhaps it could be linked in with the purgatory?

I wanted to avoid touching common code to make it work for purgatory
for now.

> 
>> sha256 digest, relocations may have to be applied to the purgatory.
> 
> Do we want to do the sha256 verification? My original patch series for
> kexec_file_load() had a purgatory in C from kexec-tools which did the
> sha256 verification but Michael Ellerman thought it was unnecessary and
> decided to use the simpler purgatory in asm from kexec-lite.

kexec_file_load could as well be used without IMA or secureboot. With sha256 digest
calculated anyway, verifying it would make sense to accommodate that case as well.

> 
>> So, add support to relocate purgatory in kexec_file_load system call
>> by setting up TOC pointer and applying RELA relocations as needed.
> 
> If we do want to use a C purgatory, Michael Ellerman had suggested
> building it as a Position Independent Executable, which greatly reduces
> the number and types of relocations that are needed. See patches 4 and 9
> here:
> 
> https://lore.kernel.org/linuxppc-dev/1478748449-3894-1-git-send-email-bauerman@linux.vnet.ibm.com/
> 
> In the series above I hadn't converted x86 to PIE. If I had done that,
> possibly Dave Young's opinion would have been different. :-)
> 
> If that's still not desirable, he suggested in that discussion lifting
> some code from x86 to generic code, which I implemented and would
> simplify this patch as well:
> 
> https://lore.kernel.org/linuxppc-dev/5009580.5GxAkTrMYA@morokweng/
> 

Agreed. But I prefer to work on PIE and/or moving common relocation_add code
for x86 & s390 to generic code later when I try to build on these purgatory
changes. So, a separate series later to rework purgatory with the things you
mentioned above sounds ok?

Thanks
Hari

