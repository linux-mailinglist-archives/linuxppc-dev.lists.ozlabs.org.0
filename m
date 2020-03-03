Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC5D176FCC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 08:15:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WpDv3ClWzDqdp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 18:15:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fr.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=clg@fr.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fr.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Wp9M5qd0zDqSL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 18:12:07 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0236gwCC071822
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 3 Mar 2020 01:50:17 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfknab47j-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2020 01:50:17 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <clg@fr.ibm.com>;
 Tue, 3 Mar 2020 06:50:15 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Mar 2020 06:50:11 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0236nAiL49086796
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Mar 2020 06:49:11 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E8A9A4059;
 Tue,  3 Mar 2020 06:50:09 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 901ACA406B;
 Tue,  3 Mar 2020 06:50:08 +0000 (GMT)
Received: from [9.145.182.89] (unknown [9.145.182.89])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Mar 2020 06:50:08 +0000 (GMT)
To: David Gibson <david@gibson.dropbear.id.au>, Ram Pai <linuxram@us.ibm.com>
References: <1582962844-26333-1-git-send-email-linuxram@us.ibm.com>
 <20200302233240.GB35885@umbus.fritz.box>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@fr.ibm.com>
Date: Tue, 3 Mar 2020 07:50:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200302233240.GB35885@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20030306-0020-0000-0000-000003AFE5EE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030306-0021-0000-0000-0000220813AC
Message-Id: <8f0c3d41-d1f9-7e6d-276b-b95238715979@fr.ibm.com>
Subject: RE: [RFC PATCH v1] powerpc/prom_init: disable XIVE in Secure VM.
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-03_01:2020-03-03,
 2020-03-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 clxscore=1011 mlxscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003030050
X-Mailman-Approved-At: Tue, 03 Mar 2020 18:13:44 +1100
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
Cc: aik@ozlabs.ru, andmike@linux.ibm.com, groug@kaod.org,
 kvm-ppc@vger.kernel.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/3/20 12:32 AM, David Gibson wrote:
> On Fri, Feb 28, 2020 at 11:54:04PM -0800, Ram Pai wrote:
>> XIVE is not correctly enabled for Secure VM in the KVM Hypervisor yet.
>>
>> Hence Secure VM, must always default to XICS interrupt controller.
>>
>> If XIVE is requested through kernel command line option "xive=on",
>> override and turn it off.
>>
>> If XIVE is the only supported platform interrupt controller; specified
>> through qemu option "ic-mode=xive", simply abort. Otherwise default to
>> XICS.
> 
> Uh... the discussion thread here seems to have gotten oddly off
> track.  

There seem to be multiple issues. It is difficult to have a clear status.

> So, to try to clean up some misunderstandings on both sides:
> 
>   1) The guest is the main thing that knows that it will be in secure
>      mode, so it's reasonable for it to conditionally use XIVE based
>      on that

FW support is required AFAIUI.

>   2) The mechanism by which we do it here isn't quite right.  Here the
>      guest is checking itself that the host only allows XIVE, but we
>      can't do XIVE and is panic()ing.  Instead, in the SVM case we
>      should force support->xive to false, and send that in the CAS
>      request to the host.  We expect the host to just terminate
>      us because of the mismatch, but this will interact better with
>      host side options setting policy for panic states and the like.
>      Essentially an SVM kernel should behave like an old kernel with
>      no XIVE support at all, at least w.r.t. the CAS irq mode flags.

Yes. XIVE shouldn't be requested by the guest. This is the last option 
I proposed but I thought there was some negotiation with the hypervisor
which is not the case. 

>   3) Although there are means by which the hypervisor can kind of know
>      a guest is in secure mode, there's not really an "svm=on" option
>      on the host side.  For the most part secure mode is based on
>      discussion directly between the guest and the ultravisor with
>      almost no hypervisor intervention.

Is there a negotiation with the ultravisor ? 

>   4) I'm guessing the problem with XIVE in SVM mode is that XIVE needs
>      to write to event queues in guest memory, which would have to be
>      explicitly shared for secure mode.  That's true whether it's KVM
>      or qemu accessing the guest memory, so kernel_irqchip=on/off is
>      entirely irrelevant.

This problem should be already fixed. The XIVE event queues are shared 
and the remaining problem with XIVE is the KVM page fault handler 
populating the TIMA and ESB pages. Ultravisor doesn't seem to support
this feature and this breaks interrupt management in the guest. 

But, kernel_irqchip=off should work out of the box. It seems it doesn't. 
Something to investigate.

> 
>   5) All the above said, having to use XICS is pretty crappy.  You
>      should really get working on XIVE support for secure VMs.

Yes. 

Thanks,

C.

