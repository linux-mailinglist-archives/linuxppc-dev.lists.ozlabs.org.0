Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B83C734979
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 02:28:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ddNIuuv+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QkrG71jcNz30fV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 10:28:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ddNIuuv+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QkrF86nrZz302F
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 10:27:24 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J0AMtV027983;
	Mon, 19 Jun 2023 00:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=dxiSW/Q5iJ1yg55cF0W2WtihdhUKeic4ECzsYMPueDg=;
 b=ddNIuuv+jebDfhKkYfQtQ8ab9/SmZiq64Mqvfy4VuCe5pzdNIfzi7muOH3ynORNLjTyy
 CUg0VEuDe6hSDazJS+Bs80+xvM1OC3aXHYDWZgNJfxT00zBsg4g2jSiNRKGfEboy3pko
 RBmk71uqr0kw/UGKD7YwzuoGYR5H1Hkx4O6HSkwkP2LNUbpS/Cw0izSiro+jYzVu2HIT
 +2FCzpkW16vyindDcVZXN0Gj3IG9tMjXVvkEHjlOD2FSqf55mtLpxH1lgVNJD5RPlGWm
 cDD/I9s3f2nBT2p4DX7TV55KEzEUrbPbJEwNu3BNQxq0izFS6sDzBm/z/+BMasyz6Mon sg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rab3ah3yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jun 2023 00:26:57 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35J0Bphc030856;
	Mon, 19 Jun 2023 00:26:56 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rab3ah3ys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jun 2023 00:26:56 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35INPhb8016226;
	Mon, 19 Jun 2023 00:26:55 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
	by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3r94f5r2tv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jun 2023 00:26:55 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35J0Qsa842336754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 00:26:54 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 773CE5805A;
	Mon, 19 Jun 2023 00:26:54 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 098A058051;
	Mon, 19 Jun 2023 00:26:54 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 19 Jun 2023 00:26:53 +0000 (GMT)
Message-ID: <bd7a10c8-a077-1c87-98f4-4c31aed2bf36@linux.ibm.com>
Date: Sun, 18 Jun 2023 20:26:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] powerpc/tpm: Reserve SML log when kexec'ing with
 kexec_file_load()
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20230615123703.4028156-1-mpe@ellerman.id.au>
 <20230615123703.4028156-2-mpe@ellerman.id.au>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230615123703.4028156-2-mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: d4GVSuT1t902Cq_ab-bXuEnXjvWOGxrJ
X-Proofpoint-GUID: pjB8ieEw8lie7mgqrp4cDfYHnmwhFDgu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-18_16,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306180229
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



On 6/15/23 08:37, Michael Ellerman wrote:
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
> 
> To fix the crash, add the SML region to the usable memory areas for the
> kdump kernel, so that the second kernel will map the region. To avoid
> corruption of the region, add the region to the reserved memory areas,

To me the 2nd paragraph and the one below seem to say that in general it does NOT 'avoid corruption of the region.'


> so that the second kernel does not use the memory for something else.
> 
> Note that when loading a kdump kernel with the regular kexec_load()
> syscall the SML may be overwritten by the kdump kernel, depending on
> where the SML is in memory in relation to the crashkernel region. That
> is a separate problem that is not solved by this patch.
> 
> Fixes: a0458284f062 ("powerpc: Add support code for kexec_file_load()")
> Reported-by: Stefan Berger <stefanb@linux.ibm.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

I agree to the code:

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

