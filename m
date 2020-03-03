Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2E617831B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 20:26:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48X6SN6QMgzDqW0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 06:26:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.172.75; helo=4.mo2.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 918 seconds by postgrey-1.36 at bilbo;
 Wed, 04 Mar 2020 06:24:36 AEDT
Received: from 4.mo2.mail-out.ovh.net (4.mo2.mail-out.ovh.net [87.98.172.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48X6QX4LGFzDqRg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 06:24:33 +1100 (AEDT)
Received: from player729.ha.ovh.net (unknown [10.110.171.125])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 0CDAE1CCE74
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 20:09:10 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player729.ha.ovh.net (Postfix) with ESMTPSA id 87FF910293524;
 Tue,  3 Mar 2020 19:08:54 +0000 (UTC)
Subject: Re: [EXTERNAL] Re: [RFC PATCH v1] powerpc/prom_init: disable XIVE in
 Secure VM.
To: Ram Pai <linuxram@us.ibm.com>
References: <1582962844-26333-1-git-send-email-linuxram@us.ibm.com>
 <20200302233240.GB35885@umbus.fritz.box>
 <8f0c3d41-d1f9-7e6d-276b-b95238715979@fr.ibm.com>
 <20200303170205.GA5416@oc0525413822.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6f7ea308-3505-6070-dde1-20fee8fdddc3@kaod.org>
Date: Tue, 3 Mar 2020 20:08:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200303170205.GA5416@oc0525413822.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 12346055429023107993
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedruddtiedguddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjedvledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>>>   4) I'm guessing the problem with XIVE in SVM mode is that XIVE needs
>>>      to write to event queues in guest memory, which would have to be
>>>      explicitly shared for secure mode.  That's true whether it's KVM
>>>      or qemu accessing the guest memory, so kernel_irqchip=on/off is
>>>      entirely irrelevant.
>>
>> This problem should be already fixed.
>> The XIVE event queues are shared 
>  	
> Yes i have a patch for the guest kernel that shares the event 
> queue page with the hypervisor. This is done using the
> UV_SHARE_PAGE ultracall. This patch is not sent out to any any mailing
> lists yet. However the patch by itself does not solve the xive problem
> for secure VM.

yes because you also need to share the XIVE TIMA and ESB pages mapped 
in xive_native_esb_fault() and xive_native_tima_fault(). 

>> and the remaining problem with XIVE is the KVM page fault handler 
>> populating the TIMA and ESB pages. Ultravisor doesn't seem to support
>> this feature and this breaks interrupt management in the guest. 
> 
> Yes. This is the bigger issue that needs to be fixed. When the secure guest
> accesses the page associated with the xive memslot, a page fault is
> generated, which the ultravisor reflects to the hypervisor. Hypervisor
> seems to be mapping Hardware-page to that GPA. Unforatunately it is not
> informing the ultravisor of that map.  I am trying to understand the
> root cause. But since I am not sure what more issues I might run into
> after chasing down that issue, I figured its better to disable xive
> support in SVM in the interim.

Is it possible to call uv_share_page() from the hypervisor ? 

> **** BTW: I figured, I dont need this intermin patch to disable xive for
> secure VM.  Just doing "svm=on xive=off" on the kernel command line is
> sufficient for now. *****

Yes. 

>> But, kernel_irqchip=off should work out of the box. It seems it doesn't. 
>> Something to investigate.
> 
> Dont know why. 

We need to understand why. 

You still need the patch to share the event queue page allocated by the 
guest OS because QEMU will enqueue events. But you should not need anything
else.

> Does this option, disable the chip from interrupting the
> guest directly; instead mediates the interrupt through the hypervisor?

Yes. The KVM backend is unused, the XIVE interrupt controller is deactivated
for the guest and QEMU notifies the vCPUs directly.  

The TIMA and ESB pages belong the QEMU process and the guest OS will do 
some load and store operations onto them for interrupt management. Is that 
OK from a UV perspective ?  

Thanks,

C.
