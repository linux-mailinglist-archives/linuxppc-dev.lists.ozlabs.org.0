Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B778927B6B8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Sep 2020 22:53:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0ZVS5cHtzDqJs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 06:53:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iIb6HO+7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0ZRs0q24zDqJW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 06:51:04 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08SKWhJ6057792; Mon, 28 Sep 2020 16:50:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6nvkd4IYaV6CN/DpdVRxB7tAXyADtIgoHebrk1fBt80=;
 b=iIb6HO+7dhFLIkDCU3NwRXfNkSojgauFG6ylwIRlGBnuLBc8qWIUJB/LlG8FlyfiP7m7
 iwe11jUXTFyoMD4VCLDglKkkbcHBW5G9ghOQd2JVEvFWTB/2HR6gbIEB4vQm5Ls5iFUh
 2KbrQcs3eG8bM9Ey8tbJ7H94sosMCEy+vzWxCW4Ciz3Xh8j2vHQIYp4T1MwolmCmdIg5
 9Ox6rpAkIdZc0Ap1jUrO16KCEDG87/j0FdLu3ohYTVbHBS02SaEH37yRgNeCIDgLsBGN
 hXcSdH/vFnmJ1FJRacKTmEgAX/xYYaSRFJiEnWmQd+CP+Wp5iBbQROFVNuYxJSTRnviR fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33umwwm3d9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Sep 2020 16:50:57 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08SKbaH6073636;
 Mon, 28 Sep 2020 16:50:57 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33umwwm3d1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Sep 2020 16:50:57 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08SKm0vs026261;
 Mon, 28 Sep 2020 20:50:56 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 33sw98uu3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Sep 2020 20:50:56 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08SKotwl52691406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Sep 2020 20:50:55 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6859AAC05F;
 Mon, 28 Sep 2020 20:50:55 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CD0FAC064;
 Mon, 28 Sep 2020 20:50:53 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.36.142])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 28 Sep 2020 20:50:53 +0000 (GMT)
Subject: Re: [PATCH] rpadlpar_io:Add MODULE_DESCRIPTION entries to kernel
 modules
To: "Oliver O'Halloran" <oohall@gmail.com>,
 Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
References: <20200924051343.16052.9571.stgit@localhost.localdomain>
 <CAOSf1CEv3v940FR_we70qCBME0qFXPizPT8EFbf3XyK2-fPDrw@mail.gmail.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <ff6a8c97-4a6a-c82b-bd35-e09fa44f8e20@linux.ibm.com>
Date: Mon, 28 Sep 2020 13:50:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAOSf1CEv3v940FR_we70qCBME0qFXPizPT8EFbf3XyK2-fPDrw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-28_22:2020-09-28,
 2020-09-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 spamscore=0 phishscore=0 mlxscore=0 adultscore=0
 clxscore=1011 bulkscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009280158
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
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/23/20 11:41 PM, Oliver O'Halloran wrote:
> On Thu, Sep 24, 2020 at 3:15 PM Mamatha Inamdar
> <mamatha4@linux.vnet.ibm.com> wrote:
>>
>> This patch adds a brief MODULE_DESCRIPTION to rpadlpar_io kernel modules
>> (descriptions taken from Kconfig file)
>>
>> Signed-off-by: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
>> ---
>>  drivers/pci/hotplug/rpadlpar_core.c |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/pci/hotplug/rpadlpar_core.c b/drivers/pci/hotplug/rpadlpar_core.c
>> index f979b70..bac65ed 100644
>> --- a/drivers/pci/hotplug/rpadlpar_core.c
>> +++ b/drivers/pci/hotplug/rpadlpar_core.c
>> @@ -478,3 +478,4 @@ static void __exit rpadlpar_io_exit(void)
>>  module_init(rpadlpar_io_init);
>>  module_exit(rpadlpar_io_exit);
>>  MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("RPA Dynamic Logical Partitioning driver for I/O slots");
> 
> RPA as a spec was superseded by PAPR in the early 2000s. Can we rename
> this already?

I seem to recall Michael and I discussed the naming briefly when I added the
maintainer entries for the drivers and that the PAPR acronym is almost as
meaningless to most as the original RPA. While, IBM no longer uses the term
pseries for Power hardware marketing it is the defacto platform identifier in
the Linux kernel tree for what we would call PAPR compliant. All in all I have
no problem with renaming, but maybe we should consider pseries_dlpar or even
simpler ibmdlpar.

> 
> The only potential problem I can see is scripts doing: modprobe
> rpadlpar_io or similar
> 
> However, we should be able to fix that with a module alias.

Agreed.

-Tyrel

> 
> Oliver
> 

