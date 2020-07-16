Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 740DC222E75
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 00:13:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B77nW75DlzDqND
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 08:13:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B77ln4n31zDqJs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 08:12:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B77ln48lsz8tD8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 08:12:21 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B77ln3ndXz9sRf; Fri, 17 Jul 2020 08:12:21 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B77ln07nvz9sRW
 for <linuxppc-dev@ozlabs.org>; Fri, 17 Jul 2020 08:12:20 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06GM0lYH105928; Thu, 16 Jul 2020 18:12:13 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32as6du8bg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 18:12:13 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06GM14ab107297;
 Thu, 16 Jul 2020 18:12:13 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32as6du8b5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 18:12:13 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06GM5LZh016382;
 Thu, 16 Jul 2020 22:12:12 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 32752943wk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 22:12:12 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06GMCB011049228
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jul 2020 22:12:11 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B8F77809F;
 Thu, 16 Jul 2020 22:12:11 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C156B7809C;
 Thu, 16 Jul 2020 22:12:07 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.8.110])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 16 Jul 2020 22:12:07 +0000 (GMT)
References: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
 <159466093748.24747.4655547403463921814.stgit@hbathini.in.ibm.com>
 <871rlc9upc.fsf@morokweng.localdomain>
 <6f64a18a-352e-fdec-c902-45aefc31cc0a@linux.ibm.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v3 07/12] ppc64/kexec_file: add support to relocate
 purgatory
In-reply-to: <6f64a18a-352e-fdec-c902-45aefc31cc0a@linux.ibm.com>
Date: Thu, 16 Jul 2020 19:12:04 -0300
Message-ID: <87365rcdor.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-16_11:2020-07-16,
 2020-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 mlxscore=100 bulkscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 spamscore=100 mlxlogscore=-1000 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007160142
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


Hari Bathini <hbathini@linux.ibm.com> writes:

> On 16/07/20 5:50 am, Thiago Jung Bauermann wrote:
>> 
>> Hari Bathini <hbathini@linux.ibm.com> writes:
>> 
>>> So, add support to relocate purgatory in kexec_file_load system call
>>> by setting up TOC pointer and applying RELA relocations as needed.
>> 
>> If we do want to use a C purgatory, Michael Ellerman had suggested
>> building it as a Position Independent Executable, which greatly reduces
>> the number and types of relocations that are needed. See patches 4 and 9
>> here:
>> 
>> https://lore.kernel.org/linuxppc-dev/1478748449-3894-1-git-send-email-bauerman@linux.vnet.ibm.com/
>> 
>> In the series above I hadn't converted x86 to PIE. If I had done that,
>> possibly Dave Young's opinion would have been different. :-)
>> 
>> If that's still not desirable, he suggested in that discussion lifting
>> some code from x86 to generic code, which I implemented and would
>> simplify this patch as well:
>> 
>> https://lore.kernel.org/linuxppc-dev/5009580.5GxAkTrMYA@morokweng/
>> 
>
> Agreed. But I prefer to work on PIE and/or moving common relocation_add code
> for x86 & s390 to generic code later when I try to build on these purgatory
> changes. So, a separate series later to rework purgatory with the things you
> mentioned above sounds ok?

Sounds ok to me. Let's see what the maintainers think, then.

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
