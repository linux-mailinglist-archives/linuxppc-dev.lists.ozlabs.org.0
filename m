Return-Path: <linuxppc-dev+bounces-14714-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF634CB2DC7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Dec 2025 12:57:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRDjg5Cyzz2yHB;
	Wed, 10 Dec 2025 22:57:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765367847;
	cv=none; b=nYZUc+FKUT/T55uvCrVlGFJSa7ph5X9OQV8kucAIqYDu4qlN1dkq2NTVr3cOr/Bu/piofICJQK8YotP9RMT5QQ+GRZ7mKW3hSWaS9wxJBgGfJ9FMRLdZmHZhJMmt0Y8YeCkKH/wqMQDEv/S34pIBoPeRrVQrZkbbHSYivCc3NmMZ3nJUwKmwaN20Maqt3AGF4839NnGIYzrD5C1Ag71iG+CQV6Px3F/lnYjfzjFX1Ruta8Lxp4iGtJSpQbdWiXFPUd54UZmW3cNgtEvL+Tb+jqxKs9WSC13nMNb63gsMOndeZ3Mu4FKXilHNyS7cC/se2966bF9yRRbNClyFgcBxtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765367847; c=relaxed/relaxed;
	bh=ETRy+2ypvCJXF3A6U5P1copfBYu/3pizIMMdLHJyU+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mU+A1I8hR8esnoAWDbV6acr8tRt5ut+rvTSo1dHTwvUn6HHNsifvSv+G4x7TmUZyO7PmzxXpYuDFUB9hisI3SHS/KnifygAlwRPJabaPCck/Oh56tHJyxqjVDGQXWUQvMquu/Ja/wqiXI89Tr36IRmHOHLpka82Rt7RkYsaGaSwXRFMfRFGBdC4jP+qfhq8f0kCIQ3+zantIi8NyOCc1ZV//0SlF56OJ9eGAcuEr/fMQdVLVvulhtSlygd2stFa92l5mbOwETun39k5fSAF3rJn3De45tIcPbMI1SyRWgNa1/xAmTGFBlS7DRxfg1O3vF/8CMnzh9S8KkZCTLcsdZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Opv1Cv69; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Opv1Cv69;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRDjf2d5Xz2yDY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Dec 2025 22:57:25 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BA90gJK001890;
	Wed, 10 Dec 2025 11:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ETRy+2
	ypvCJXF3A6U5P1copfBYu/3pizIMMdLHJyU+0=; b=Opv1Cv69PW/8D/GVaUbSnR
	OWqM3g3VyXFxAf8GoIlmrq3gmFABWqvwqBjX1OBKzAfI4a6Kxo48Az7TKA7ydVih
	RDZTJagxFRvxidp2Z5nJAI3UwHlqFJb2TsabGD7skRmkZt/u0wM62Y2SqT/e//7e
	b7YWMJvcx1cfnVeshk90FwwBzpydy/zYy54/cOAfINLGXV58WomiREDjLms1sZDZ
	hMS4r6TDbCQNHmttyLVFR306bZqgWj0KQ+d3STRC0GpcQHlsFr10JVi9gOGue2QZ
	E1c/Mrei6DXvm5kM0PfpZHHonDnAckmLwfd5uKeBeo9b9Uu33hmCbjmkd6Umu+Vg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc53hhk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 11:57:21 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BABcjtr029338;
	Wed, 10 Dec 2025 11:57:21 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc53hhk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 11:57:21 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BAA2ADa002053;
	Wed, 10 Dec 2025 11:57:20 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4aw11jg6qw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 11:57:20 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BABvIPU24773078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Dec 2025 11:57:19 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D140B20043;
	Wed, 10 Dec 2025 11:57:18 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8193D20040;
	Wed, 10 Dec 2025 11:57:17 +0000 (GMT)
Received: from Gautams-MacBook-Pro.local (unknown [9.43.64.128])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 10 Dec 2025 11:57:17 +0000 (GMT)
Date: Wed, 10 Dec 2025 17:27:10 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        mad skateman <madskateman@gmail.com>,
        Christian Zigotzky <info@xenosoft.de>
Subject: Re: [PPC] [e5500] Boot issues after the PowerPC updates 6.19-1
Message-ID: <aTlgFi0m6GyZ0XUa@Gautams-MacBook-Pro.local>
References: <aTe7I_nVw8xp4az9@Gautams-MacBook-Pro.local>
 <E1392190-6049-4128-BC65-42C90DA95047@xenosoft.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E1392190-6049-4128-BC65-42C90DA95047@xenosoft.de>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyMCBTYWx0ZWRfX1seq6BPjjnOk
 XtqxmPqzzDReAQSCZ9vUZBE+VpO/vJhXtuuDkbm+5v8jCrsUAclJLR7VsDWQq77kpUDAH88oCr9
 3Fo0xXNbV+jbyB0FC40FrIRyYx9W6PLREyJjUPu7aalW0U12Dz6Uff/KmKhaEqu69vass9jgewW
 OHxbKWT6sVwqTG00Ywgk/VzhSWjhteo88KhzR6wiFraWndWbri1t8EOfVMKGmPPve6WlVPPd31O
 WYVlipmQzfV2MyGtzazEIt9P3TEGSwTrZs8DnJhZioTfqR/WOqkVj/wuKn+SLglW791kah52ib2
 AzWrlcIWzLiQbRCi4GaKnC8GCYvtHshpyQEEWB/0clvUEwFXnbxfxUcrwAqLCQNhH69y7H4TazS
 16bibDCuVZX+tEvu89npmGyI6Udj/g==
X-Authority-Analysis: v=2.4 cv=S/DUAYsP c=1 sm=1 tr=0 ts=69396021 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=jhone-cy8azpxuG5v6IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: hsCeQXNyWKgHmXZX5S_vRVPlUi0HULZg
X-Proofpoint-GUID: 4F5emLI9DMBR_WljzMrFS_TNtKNbbFGo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512060020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Dec 09, 2025 at 09:34:11AM +0100, Christian Zigotzky wrote:
> 
> 
> > On 09 December 2025 at 07:01 am, Gautam Menghani <gautam@linux.ibm.com> wrote:
> > 
> > ﻿On Mon, Dec 08, 2025 at 07:06:14AM +0100, Christian Zigotzky wrote:
> >> 
> >>>> On 08 December 2025 at 06:51 am, Gautam Menghani <gautam@linux.ibm.com> wrote:
> >>> 
> >>> ﻿Hi Christian,
> >>> 
> >>> Thanks for the report. Can you also please share the QEMU command line
> >>> you were using? That would be helpful.
> >>> 
> >>> Thanks,
> >>> Gautam
> >> 
> >> Hi Gautam,
> >> 
> >> Here is the command line:
> >> 
> >> qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 -kernel uImage -drive format=raw,file=void-live-powerpc-20230317.img,index=0,if=virtio -netdev user,id=mynet0 -device virtio-net,netdev=mynet0 -append "rw root=/dev/vda" -device virtio-gpu-pci -device virtio-mouse-pci -device virtio-keyboard-pci -device pci-ohci,id=newusb -audiodev id=sndbe,driver=pa,server=/run/user/1000/pulse/native -device usb-audio,bus=newusb.0 -enable-kvm -smp 4 -fsdev local,security_model=passthrough,id=fsdev0,path=/home/amigaone/Music -device virtio-9p-pci,id=fs0,fsdev=fsdev0,mount_tag=hostshare -display gtk
> > 
> > 
> > Were you running a KVM guest? Did you see the problem with the latest
> > kernel installed in the guest?
> 
> Yes, the latest git kernel doesn’t boot.
> 
> But the final kernel 6.18.0 boots without any problems.

I tried booting a TCG ppce500 guest with your config and I can see that
the commit 2997876c4a1a5 causes a boot failure. Reverting it works fine.

Command line used:

qemu-system-ppc64 -M ppce500 -cpu e5500 -smp 1 -m 4G \
    -display none -serial stdio \
    -kernel /home/gautam/src/linux/arch/powerpc/boot/uImage \
    -drive file=/home/gautam/src/qemu-ppc-boot/buildroot/qemu_ppc64_e5500-latest/rootfs.ext2,if=virtio,format=raw \
    -append "console=ttyS0 rootwait root=/dev/vda" \


But I was not able to boot a KVM guest on top of this TCG guest. I even
went back all the way to 5.15

./qemu-system-ppc64 \
        -M ppce500 -cpu e5500 \
        --enable-kvm  \
        -m 1024 -kernel uImage \
        -drive file=/tmp/rootfs.ext2,if=virtio,format=raw \
        -append "console=ttyS0 rootwait root=/dev/vda" -serial mon:stdio -nographic

Bad kernel stack pointer fffff8 at 0
Oops: Bad kernel stack pointer, sig: 6 [#1]
BE PAGE_SIZE=4K  SMP NR_CPUS=4 QEMU e500
Modules linked in:
CPU: 0 UID: 0 PID: 1508 Comm: qemu-system-ppc Not tainted 6.18.0-a4-powerpc64-smp #45 VOLUNTARY
Hardware name: QEMU ppce500 e5500 0x80240020 QEMU e500
NIP:  0000000000000000 LR: 0000000000000000 CTR: 0000000000000000
REGS: c00000003fffbd20 TRAP: 0400   Not tainted  (6.18.0-a4-powerpc64-smp)
MSR:  0000000010000000 <>  CR: 00000000  XER: 00000000
IRQMASK: 0
GPR00: 0000000000000000 0000000000fffff8 0000000000000000 0000000002c00000
GPR04: 0000000000000000 0000000000000000 0000000045504150 0000000004000000
GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR12: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR28: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
NIP [0000000000000000] 0x0
LR [0000000000000000] 0x0
Call Trace:
Code: XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
---[ end trace 0000000000000000 ]---

note: qemu-system-ppc[1508] exited with irqs disabled


Thanks,
Gautam

