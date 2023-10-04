Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 379A77B7E2D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 13:30:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FjJZ4EFD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0svG47yPz3vjK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 22:30:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FjJZ4EFD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=tasmiya@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0rDY67fQz3bZN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 21:15:41 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3949sFSG025808;
	Wed, 4 Oct 2023 10:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : to : cc : from : subject; s=pp1;
 bh=fs2M7VJ5RMUgPyg0gKrxo8w48/v2k1M88LOjr2O4P8U=;
 b=FjJZ4EFDAPQ1k1Hum8ratXf87ZM9xjYskT43mltc+jpE/G6dlpi4XbaPEnR+D4vhdmK0
 kRqCNZx6N/j2ujvQ6jJ5N6gRV9WCrqdNBc5IckayHUB//PY88pvPkWsKIM6KcvrRJH1F
 3NnZSpu8NiUZrcLUmiry5Pnw+2CahfsIJte3kw+qLsrIohnEsAPh2sjeG26Sb2M42bZi
 dxANRTZOjVKVMnJ//aIAXaE76r7M2JcNb7gTDBVcwhhKMOtsiq38NSIjLHhu/RLH8cTD
 +KCWowTY+PsEMaGVJKSb3ROKJCyjoJNE2kZzxi5Iu+VxypJquF09LmYWI3BAIuKw0W4B MA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3th5u0rhcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 10:15:25 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 394AA0xG025593;
	Wed, 4 Oct 2023 10:15:24 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3th5u0rhc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 10:15:24 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 394A0hCI006692;
	Wed, 4 Oct 2023 10:15:22 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tf07k2jp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 10:15:22 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 394AFMNI20251304
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Oct 2023 10:15:22 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 39F5158063;
	Wed,  4 Oct 2023 10:15:22 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E8D55805A;
	Wed,  4 Oct 2023 10:15:14 +0000 (GMT)
Received: from [9.171.38.44] (unknown [9.171.38.44])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  4 Oct 2023 10:15:13 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------5I0qkyN0XVAbRUFNms8ppK7L"
Message-ID: <d7e7997f-2cda-ec87-5bc9-8a1d95b378ab@linux.vnet.ibm.com>
Date: Wed, 4 Oct 2023 15:45:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
From: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
Subject: [Bisected] [commit 2ad56efa80dba89162106c06ebc00b611325e584]
 [linux-next] WARNING while booting to kernel 6.6.0-rc3-next-20230929
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 50Kjv5H21oMQ6rOQV0WcpKNzAFf1QjAp
X-Proofpoint-GUID: RoH14IDK4kClkX3ZKZH6rJq8yRaAyWyt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_01,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=731 mlxscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310040060
X-Mailman-Approved-At: Wed, 04 Oct 2023 22:28:01 +1100
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
Cc: jroedel@suse.de, gbatra@linux.vnet.ibm.com, abdhalee@linux.vnet.ibm.com, jsnitsel@redhat.com, sachinp@linux.vnet.com, jgg@ziepe.ca, npiggin@gmail.com, mputtash@linux.vnet.com, baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------5I0qkyN0XVAbRUFNms8ppK7L
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Greetings,

[linux-next] [6.6.0-rc3-next-20230929] [git bisect -> 
2ad56efa80dba89162106c06ebc00b611325e584]WARNING: CPU: 0 PID: 8 at 
arch/powerpc/kernel/iommu.c:407 __iommu_free+0x1e4/0x1f0

--- Traces ---

[   62.578338] WARNING: CPU: 0 PID: 8 at arch/powerpc/kernel/iommu.c:407 
__iommu_free+0x1e4/0x1f0
[   62.578345] Modules linked in: sd_mod t10_pi crc64_rocksoft crc64 sg 
ibmvfc mlx5_core(+) scsi_transport_fc ibmveth mlxfw psample dm_multipath 
dm_mirror dm_region_hash dm_log dm_mod fuse
[   62.578362] CPU: 0 PID: 8 Comm: kworker/0:0 Not tainted 
6.6.0-rc3-next-20230929-auto #1
[   62.578366] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 
0xf000006 of:IBM,FW1030.30 (NH1030_062) hv:phyp pSeries
[   62.578369] Workqueue: events work_for_cpu_fn
[   62.578374] NIP:  c00000000005f6d4 LR: c00000000005f6d0 CTR: 
00000000005ca81c
[   62.578377] REGS: c000000003a27890 TRAP: 0700   Not tainted 
(6.6.0-rc3-next-20230929-auto)
[   62.578381] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  
CR: 48000824  XER: 00000008
[   62.578391] CFAR: c00000000020f738 IRQMASK: 0
[   62.578391] GPR00: c00000000005f6d0 c000000003a27b30 c000000001481800 
0000000000000017
[   62.578391] GPR04: 00000000ffff7fff c000000003a27950 c000000003a27948 
0000000000000027
[   62.578391] GPR08: c000000c18c07c10 0000000000000001 0000000000000027 
c000000002ac8a08
[   62.578391] GPR12: 0000000000000000 c000000002ff0000 c00000000019cc88 
c000000003042300
[   62.578391] GPR16: 0000000000000000 0000000000000000 0000000000000000 
c000000003071ab0
[   62.578391] GPR20: c00000000349f80d c000000003215440 c000000003215480 
61c8864680b583eb
[   62.578391] GPR24: 0000000000000000 000000007fffffff 0800000020000000 
0000000000000010
[   62.578391] GPR28: 0000000000020000 0000800000020000 c00000000c5dc800 
c00000000c5dc880
[   62.578428] NIP [c00000000005f6d4] __iommu_free+0x1e4/0x1f0
[   62.578432] LR [c00000000005f6d0] __iommu_free+0x1e0/0x1f0
[   62.578435] Call Trace:
[   62.578437] [c000000003a27b30] [c00000000005f6d0] 
__iommu_free+0x1e0/0x1f0 (unreliable)
[   62.578442] [c000000003a27bc0] [c00000000005f848] iommu_free+0x28/0x70
[   62.578446] [c000000003a27bf0] [c000000000061518] 
iommu_free_coherent+0x68/0xa0
[   62.578450] [c000000003a27c20] [c00000000005e8d4] 
dma_iommu_free_coherent+0x24/0x40
[   62.578455] [c000000003a27c40] [c00000000024698c] 
dma_free_attrs+0x10c/0x140
[   62.578459] [c000000003a27c90] [c008000000dcb8d4] 
mlx5_cmd_cleanup+0x5c/0x90 [mlx5_core]
[   62.578512] [c000000003a27cc0] [c008000000dc45a0] 
mlx5_mdev_uninit+0xc8/0x100 [mlx5_core]
[   62.578558] [c000000003a27d00] [c008000000dc4ac4] 
probe_one+0x3ec/0x530 [mlx5_core]
[   62.578602] [c000000003a27d90] [c0000000008c5edc] 
local_pci_probe+0x6c/0x110
[   62.578607] [c000000003a27e10] [c000000000189c98] 
work_for_cpu_fn+0x38/0x60
[   62.578612] [c000000003a27e40] [c00000000018d1d0] 
process_scheduled_works+0x230/0x4f0
[   62.578616] [c000000003a27f10] [c00000000018ff14] 
worker_thread+0x1e4/0x500
[   62.578619] [c000000003a27f90] [c00000000019cdb8] kthread+0x138/0x140
[   62.578624] [c000000003a27fe0] [c00000000000df98] 
start_kernel_thread+0x14/0x18
[   62.578628] Code: 481b004d 60000000 e89e0028 3c62ffe0 3863dd20 
481b0039 60000000 e89e0038 3c62ffe0 3863dd38 481b0025 60000000 
<0fe00000> 4bffff20 60000000 3c4c0142
[   62.578640] ---[ end trace 0000000000000000 ]---
[   62.578646] iommu_free: invalid entry
[   62.578649]     entry     = 0x8000000203d0
[   62.578650]     dma_addr  = 0x8000000203d0000
[   62.578652]     Table     = 0xc00000000c5dc800
[   62.578654]     bus#      = 0x1
[   62.578655]     size      = 0x20000
[   62.578657]     startOff  = 0x800000000000
[   62.578658]     index     = 0x70200016
[   62.578660] ------------[ cut here ]------------

gitbisect is pointing to the below commit

commit 2ad56efa80dba89162106c06ebc00b611325e584
     powerpc/iommu: Setup a default domain and remove set_platform_dma_ops

-- 
Regards,
Tasmiya Nalatwad
IBM Linux Technology Center

--------------5I0qkyN0XVAbRUFNms8ppK7L
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Greetings,</p>
    <p>[linux-next] [6.6.0-rc3-next-20230929] [git bisect -&gt;
      2ad56efa80dba89162106c06ebc00b611325e584]WARNING: CPU: 0 PID: 8 at
      arch/powerpc/kernel/<a class="moz-txt-link-freetext"
        href="iommu.c:407">iommu.c:407</a> __iommu_free+0x1e4/0x1f0</p>
    <p>--- Traces ---</p>
    <p>[   62.578338] WARNING: CPU: 0 PID: 8 at arch/powerpc/kernel/<a
        class="moz-txt-link-freetext" href="iommu.c:407">iommu.c:407</a>
      __iommu_free+0x1e4/0x1f0<br>
      [   62.578345] Modules linked in: sd_mod t10_pi crc64_rocksoft
      crc64 sg ibmvfc mlx5_core(+) scsi_transport_fc ibmveth mlxfw
      psample dm_multipath dm_mirror dm_region_hash dm_log dm_mod fuse<br>
      [   62.578362] CPU: 0 PID: 8 Comm: kworker/0:0 Not tainted
      6.6.0-rc3-next-20230929-auto #1<br>
      [   62.578366] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200
      0xf000006 <a class="moz-txt-link-freetext"
        href="of:IBM,FW1030.30">of:IBM,FW1030.30</a> (NH1030_062) <a
        class="moz-txt-link-freetext" href="hv:phyp">hv:phyp</a> pSeries<br>
      [   62.578369] Workqueue: events work_for_cpu_fn<br>
      [   62.578374] NIP:  c00000000005f6d4 LR: c00000000005f6d0 CTR:
      00000000005ca81c<br>
      [   62.578377] REGS: c000000003a27890 TRAP: 0700   Not tainted 
      (6.6.0-rc3-next-20230929-auto)<br>
      [   62.578381] MSR:  800000000282b033
      &lt;SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE&gt;  CR: 48000824  XER:
      00000008<br>
      [   62.578391] CFAR: c00000000020f738 IRQMASK: 0 <br>
      [   62.578391] GPR00: c00000000005f6d0 c000000003a27b30
      c000000001481800 0000000000000017 <br>
      [   62.578391] GPR04: 00000000ffff7fff c000000003a27950
      c000000003a27948 0000000000000027 <br>
      [   62.578391] GPR08: c000000c18c07c10 0000000000000001
      0000000000000027 c000000002ac8a08 <br>
      [   62.578391] GPR12: 0000000000000000 c000000002ff0000
      c00000000019cc88 c000000003042300 <br>
      [   62.578391] GPR16: 0000000000000000 0000000000000000
      0000000000000000 c000000003071ab0 <br>
      [   62.578391] GPR20: c00000000349f80d c000000003215440
      c000000003215480 61c8864680b583eb <br>
      [   62.578391] GPR24: 0000000000000000 000000007fffffff
      0800000020000000 0000000000000010 <br>
      [   62.578391] GPR28: 0000000000020000 0000800000020000
      c00000000c5dc800 c00000000c5dc880 <br>
      [   62.578428] NIP [c00000000005f6d4] __iommu_free+0x1e4/0x1f0<br>
      [   62.578432] LR [c00000000005f6d0] __iommu_free+0x1e0/0x1f0<br>
      [   62.578435] Call Trace:<br>
      [   62.578437] [c000000003a27b30] [c00000000005f6d0]
      __iommu_free+0x1e0/0x1f0 (unreliable)<br>
      [   62.578442] [c000000003a27bc0] [c00000000005f848]
      iommu_free+0x28/0x70<br>
      [   62.578446] [c000000003a27bf0] [c000000000061518]
      iommu_free_coherent+0x68/0xa0<br>
      [   62.578450] [c000000003a27c20] [c00000000005e8d4]
      dma_iommu_free_coherent+0x24/0x40<br>
      [   62.578455] [c000000003a27c40] [c00000000024698c]
      dma_free_attrs+0x10c/0x140<br>
      [   62.578459] [c000000003a27c90] [c008000000dcb8d4]
      mlx5_cmd_cleanup+0x5c/0x90 [mlx5_core]<br>
      [   62.578512] [c000000003a27cc0] [c008000000dc45a0]
      mlx5_mdev_uninit+0xc8/0x100 [mlx5_core]<br>
      [   62.578558] [c000000003a27d00] [c008000000dc4ac4]
      probe_one+0x3ec/0x530 [mlx5_core]<br>
      [   62.578602] [c000000003a27d90] [c0000000008c5edc]
      local_pci_probe+0x6c/0x110<br>
      [   62.578607] [c000000003a27e10] [c000000000189c98]
      work_for_cpu_fn+0x38/0x60<br>
      [   62.578612] [c000000003a27e40] [c00000000018d1d0]
      process_scheduled_works+0x230/0x4f0<br>
      [   62.578616] [c000000003a27f10] [c00000000018ff14]
      worker_thread+0x1e4/0x500<br>
      [   62.578619] [c000000003a27f90] [c00000000019cdb8]
      kthread+0x138/0x140<br>
      [   62.578624] [c000000003a27fe0] [c00000000000df98]
      start_kernel_thread+0x14/0x18<br>
      [   62.578628] Code: 481b004d 60000000 e89e0028 3c62ffe0 3863dd20
      481b0039 60000000 e89e0038 3c62ffe0 3863dd38 481b0025 60000000
      &lt;0fe00000&gt; 4bffff20 60000000 3c4c0142 <br>
      [   62.578640] ---[ end trace 0000000000000000 ]---<br>
      [   62.578646] iommu_free: invalid entry<br>
      [   62.578649]     entry     = 0x8000000203d0<br>
      [   62.578650]     dma_addr  = 0x8000000203d0000<br>
      [   62.578652]     Table     = 0xc00000000c5dc800<br>
      [   62.578654]     bus#      = 0x1<br>
      [   62.578655]     size      = 0x20000<br>
      [   62.578657]     startOff  = 0x800000000000<br>
      [   62.578658]     index     = 0x70200016<br>
      [   62.578660] ------------[ cut here ]------------<br>
      <br class="Apple-interchange-newline">
    </p>
    <p>gitbisect is pointing to the below commit</p>
    commit 2ad56efa80dba89162106c06ebc00b611325e584<br>
        powerpc/iommu: Setup a default domain and remove
    set_platform_dma_ops<br>
    <p></p>
    <pre class="moz-signature" cols="72">-- 
Regards,
Tasmiya Nalatwad
IBM Linux Technology Center</pre>
  </body>
</html>

--------------5I0qkyN0XVAbRUFNms8ppK7L--

