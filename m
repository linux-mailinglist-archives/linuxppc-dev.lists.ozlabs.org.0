Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC396A5F88
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 20:19:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PR6ct2K6Kz3cFw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 06:19:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fNabr5wR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fNabr5wR;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PR6bt6clMz2ym7
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 06:18:50 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31SIqdi0024231;
	Tue, 28 Feb 2023 19:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=1uYtUmeLjXxvpwSwrKnDulwYZWUAsHrozzBIjD0dS2w=;
 b=fNabr5wRiFZSTorP+KicyFb7JZCVVW2Q5Aq6jAaH6+Z5fJnwi9SlYM8i6tNZ4xjTKsbU
 l2+atbOH/WofFzj6SK1f9v5tyqTr2z4jAdyZQOBqMm2lfw3IrT1FzjMehZ8csD0qFiAe
 TDM764IM9BDBU150CLINJwzwm9D/6gLbpmVia/qFnvUl3xghUg2Fik7/XpaWriokvLVc
 XffTvTEvR948ZetXmO0RuxcG0/Xlcp2VijRACWco3YIATXahTq54xfiCe0le/j/xvOGB
 Sifqpa3sWB/GjrmdiPtq6is3TOrkCv9FdnXEXKd88LFPcrB3ckos5ZJ/u8Ie2pgHh0j+ dg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p1q9d937t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Feb 2023 19:18:35 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31SIrDBv030050;
	Tue, 28 Feb 2023 19:18:34 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p1q9d937d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Feb 2023 19:18:34 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31SIkkr3019435;
	Tue, 28 Feb 2023 19:18:33 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
	by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3nybduambh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Feb 2023 19:18:33 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31SJIWcc65339872
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Feb 2023 19:18:32 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A113B58063;
	Tue, 28 Feb 2023 19:18:32 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 26CEB5803F;
	Tue, 28 Feb 2023 19:18:32 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 Feb 2023 19:18:32 +0000 (GMT)
Message-ID: <6c5ee8fe-9970-54cb-263e-b8af7a25ed95@linux.ibm.com>
Date: Tue, 28 Feb 2023 14:18:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] powerpc/tpm: Reserve SML log when kexec'ing
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20230224032508.3331281-1-mpe@ellerman.id.au>
 <20230224032508.3331281-2-mpe@ellerman.id.au>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230224032508.3331281-2-mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: F6mHc830B77du2h7S83jhAh1xXG68-_e
X-Proofpoint-ORIG-GUID: LsMpndg8WfiCOH_cUprh422g3aMeyqeK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-02-28_15,2023-02-28_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302280159
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
Cc: eajames@linux.ibm.com, jgg@ziepe.ca, jarkko@kernel.org, yangyingliang@huawei.com, linux-integrity@vger.kernel.org, peterhuewe@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/23/23 22:25, Michael Ellerman wrote:
> The TPM code in prom_init.c creates a small buffer of memory to store
> the TPM's SML (Stored Measurement Log). It's communicated to Linux via
> the linux,sml-base/size device tree properties of the TPM node.
> 
> When kexec'ing that buffer can be overwritten, or when kdump'ing it may
> not be mapped by the second kernel. The latter can lead to a crash when
> booting the second kernel such as:
> 
>    tpm_ibmvtpm 71000003: CRQ initialization completed
>    BUG: Unable to handle kernel data access on read at 0xc00000002ffb0000
>    Faulting instruction address: 0xc0000000200a70e0
>    Oops: Kernel access of bad area, sig: 11 [#1]
>    LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
>    Modules linked in:
>    CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.2.0-rc2-00134-g9307ce092f5d #314
>    Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1200 0xf000005 of:SLOF,git-5b4c5a pSeries
>    NIP:  c0000000200a70e0 LR: c0000000203dd5dc CTR: 0000000000000800
>    REGS: c000000024543280 TRAP: 0300   Not tainted  (6.2.0-rc2-00134-g9307ce092f5d)
>    MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 24002280  XER: 00000006
>    CFAR: c0000000200a70c8 DAR: c00000002ffb0000 DSISR: 40000000 IRQMASK: 0
>    ...
>    NIP memcpy_power7+0x400/0x7d0
>    LR  kmemdup+0x5c/0x80
>    Call Trace:
>      memcpy_power7+0x274/0x7d0 (unreliable)
>      kmemdup+0x5c/0x80
>      tpm_read_log_of+0xe8/0x1b0
>      tpm_bios_log_setup+0x60/0x210
>      tpm_chip_register+0x134/0x320
>      tpm_ibmvtpm_probe+0x520/0x7d0
>      vio_bus_probe+0x9c/0x460
>      really_probe+0x104/0x420
>      __driver_probe_device+0xb0/0x170
>      driver_probe_device+0x58/0x180
>      __driver_attach+0xd8/0x250
>      bus_for_each_dev+0xb4/0x140
>      driver_attach+0x34/0x50
>      bus_add_driver+0x1e8/0x2d0
>      driver_register+0xb4/0x1c0
>      __vio_register_driver+0x74/0x9c
>      ibmvtpm_module_init+0x34/0x48
>      do_one_initcall+0x80/0x320
>      kernel_init_freeable+0x304/0x3ac
>      kernel_init+0x30/0x1a0
>      ret_from_kernel_thread+0x5c/0x64

I have not been able to reproduce this particular crash issue with a 6.2 kernel running on P10 PowerVM when NOT applying your patches.

For my tests I have used the following parameter with the 16GB VM: crashkernel=2G-4G:384M,4G-16G:1G,16G-64G:2G,64G-128G:2G,128G-:4G

What I noticed is that the log gets corrupted when the 2 patches are applied:

After fresh boot:

> cp /sys/kernel/security/tpm0/binary_bios_measurements ./
> ls -l binary_bios_measurements
-r--r-----. 1 root root 10051 Feb 28 12:09 binary_bios_measurements


> kexec -l /boot/vmlinuz-6.2.0+ --initrd /boot/initramfs-6.2.0+.img '--append=BOOT_IMAGE=/vmlinuz-6.2.0+ root=/dev/mapper/rhel_XYZ ro crashkernel=2G-4G:384M,4G-16G:1G,16G-64G:2G,64G-128G:2G,128G-:4G rd.lvm.lv=rhel_XYZ/root rd.lvm.lv=rhel_XYZ/swap biosdevname=0' -s
> kexec -e

> cp /sys/kernel/security/tpm0/binary_bios_measurements ./
> ls -l binary_bios_measurements
-r--r-----. 1 root root 32 Feb 28 12:10 binary_bios_measurements

> od -t x1 < binary_bios_measurements
0000000 d0 0d fe ed 00 00 77 80 00 00 00 a0 00 00 4f 4c
0000020 00 00 00 28 00 00 00 11 00 00 00 11 00 00 00 00
0000040


The contents have changed and these first 4 bytes of it are always the same once it has become this 32 byte file, otherwise they would be zero.

The address and size parameters passed around in this patch seem good, though.

     Stefan
