Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D635637510
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 10:24:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHsyh4b7pz3f57
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 20:24:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=46.105.54.81; helo=smtpout3.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 1801 seconds by postgrey-1.36 at boromir; Thu, 24 Nov 2022 20:24:12 AEDT
Received: from smtpout3.mo529.mail-out.ovh.net (smtpout3.mo529.mail-out.ovh.net [46.105.54.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHsy40NSjz3cG9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 20:24:08 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.6])
	by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 9203014341765;
	Thu, 24 Nov 2022 09:44:51 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 24 Nov
 2022 09:44:50 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-97G0028fd172a9-085e-468d-a07b-13a5fc366bfd,
                    6D26B16FDA19C88FA8EEDD5DCE2FF0553E2274F5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1d5614e4-4726-c066-db43-039ce2656767@kaod.org>
Date: Thu, 24 Nov 2022 09:44:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: // a kdump hang caused by PPC pci patch series
Content-Language: en-US
To: Pingfan Liu <kernelfans@gmail.com>
References: <CAFgQCTuz3n5uNKwOOXaL9xT-ftJT0nfo4OfdNepvMGbi0Zqh7Q@mail.gmail.com>
 <CAFgQCTv6R_P0W16ak=9D481NKWqaXwd26CKHHqRbuMygP1u4Aw@mail.gmail.com>
 <61dc96ad-f60e-932f-c063-d1b377006b78@kaod.org>
 <CAFgQCTsincoTxrcW-C6=5Ao5ZLUkZjYeJxtmFP7H_7+J-fTRiQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFgQCTsincoTxrcW-C6=5Ao5ZLUkZjYeJxtmFP7H_7+J-fTRiQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: d912ba44-2fb1-415a-a969-4a602ca75647
X-Ovh-Tracer-Id: 3387551348986055645
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedriedvgdduvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehkvghrnhgvlhhfrghnshesghhmrghilhdrtghomhdplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdptghogihusehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
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
Cc: Coiby Xu <coxu@redhat.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/24/22 09:31, Pingfan Liu wrote:
> On Mon, Nov 21, 2022 at 8:57 PM Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 11/21/22 12:57, Pingfan Liu wrote:
>>> Sorry that forget a subject.
>>>
>>> On Mon, Nov 21, 2022 at 7:54 PM Pingfan Liu <kernelfans@gmail.com> wrote:
>>>>
>>>> Hello Powerpc folks,
>>>>
>>>> I encounter an kdump bug, which I bisect and pin commit 174db9e7f775
>>>> ("powerpc/pseries/pci: Add support of MSI domains to PHB hotplug")
>>>> In that case, using Fedora 36 as host, the mentioned commit as the
>>>> guest kernel, and virto-block disk, the kdump kernel will hang:
>>
>> The host kernel should be using the PowerNV platform and not pseries
>> or are you running a nested L2 guest on KVM/pseries L1 ?
>>
>> And as far as I remember, the patch above only impacts the IBM PowerVM
>> hypervisor, not KVM, and PHB hotplug, or kdump induces some hot-plugging
>> I am not aware of.
>>
>> Also, if indeed, this is a L2 guest, the XIVE interrupt controller is
>> emulated in QEMU, "info pic" should return:
>>
>>     ...
>>     irqchip: emulated
>>
>>>>
>>>> [    0.000000] Kernel command line: elfcorehdr=0x22c00000
>>>> no_timer_check net.ifnames=0 console=tty0 console=hvc0,115200n8
>>>> irqpoll maxcpus=1 noirqdistrib reset_devices cgroup_disable=memory
>>>>        numa=off udev.children-max=2 ehea.use_mcs=0 panic=10
>>>> kvm_cma_resv_ratio=0 transparent_hugepage=never novmcoredd
>>>> hugetlb_cma=0
>>>>       ...
>>>>       [    7.763260] virtio_blk virtio2: 32/0/0 default/read/poll queues
>>>>       [    7.771391] virtio_blk virtio2: [vda] 20971520 512-byte logical
>>>> blocks (10.7 GB/10.0 GiB)
>>>>       [   68.398234] systemd-udevd[187]: virtio2: Worker [190]
>>>> processing SEQNUM=1193 is taking a long time
>>>>       [  188.398258] systemd-udevd[187]: virtio2: Worker [190]
>>>> processing SEQNUM=1193 killed
>>>>
>>>>
>>>> During my test, I found that in very rare cases, the kdump can success
>>>> (I guess it may be due to the cpu id).  And if using either maxcpus=2
>>>> or using scsi-disk, then kdump can also success.  And before the
>>>> mentioned commit, kdump can also success.
>>>>
>>>> The attachment contains the xml to reproduce that bug.
>>>>
>>>> Do you have any ideas?
>>
>> Most certainly an interrupt not being delivered. You can check the status
>> on the host with :
>>
>>     virsh qemu-monitor-command --hmp <domain>  "info pic"
>>
> 
> Please pick it up from the attachment.

Nothing wrong on the guest side. No pending interrupts. Not before or
after kdump. Next step is to look at KVM. I suggest you file a bug.

Thanks,

C.

