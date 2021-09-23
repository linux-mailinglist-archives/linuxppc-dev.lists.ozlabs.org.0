Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE2841678C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 23:36:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFpQb4ZPkz307l
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Sep 2021 07:36:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oirhiuQy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oirhiuQy; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFk6D6RWMz2ymq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 04:22:28 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18NHeWE8002014
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 14:22:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=pp1; bh=AkJuUJCPcMDHyUM4+j+e0hcxbEBV8IYDKne3G6Qi6YE=;
 b=oirhiuQyTYqrdTGUVMGKenMKnT5Wwb895s/PxRIlD55WTcEoriiHZELu75dJbvf4uCUo
 RADEp7L4vwwPNI4paagnJWXJF6RAbJL4G+luIThrlVTxuuBkCnCaBqQc74dtbgg1V97O
 UC/AZJO2KMXMuaHvIw52ZMCrQOn7eJnqFEnn+0U3qM10MqH32Ha7MKvTbwCAjRG8Ndup
 kPuMZUJXXL6Kg7udmNtzfVefwZTW0aWf9xpDSezE4LhC5tE8qWCGEWIyCh4vetbvAkxn
 heN/79LdZ7zcLgKdvel7IKzecITVtGP6T0ZkBhQJ66U2xtVYuqrYzTBvng1C4YLGDFTo kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b8rsa2vkm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 14:22:25 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18NHoT0R026164
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 14:22:24 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b8rsa2vjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 14:22:23 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18NIDlPH007827;
 Thu, 23 Sep 2021 18:22:22 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3b7q6jvpbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 18:22:22 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18NIMJLf54460724
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Sep 2021 18:22:19 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32B575204E;
 Thu, 23 Sep 2021 18:22:19 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com (unknown
 [9.43.109.228])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 082885205A;
 Thu, 23 Sep 2021 18:22:17 +0000 (GMT)
Subject: Re: [PATCH v1] powerpc/64s: Fix unrecoverable MCE crash
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210922020247.209409-1-npiggin@gmail.com>
From: Ganesh <ganeshgr@linux.ibm.com>
Message-ID: <de062f8e-e99b-04ec-5d9d-0c31d3cd4c2a@linux.ibm.com>
Date: Thu, 23 Sep 2021 23:52:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210922020247.209409-1-npiggin@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------05143280F09BE4B28505B5CD"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jtB3o-vbWpzmOHyIeJd88vS4LrCaKVj7
X-Proofpoint-ORIG-GUID: Krv0Ti2Z7TtNCfCIbtkekGs5gJKvH3aV
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_05,2021-09-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=794
 mlxscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109200000
 definitions=main-2109230107
X-Mailman-Approved-At: Fri, 24 Sep 2021 07:35:26 +1000
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------05143280F09BE4B28505B5CD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/21 7:32 AM, Nicholas Piggin wrote:

> The machine check handler is not considered NMI on 64s. The early
> handler is the true NMI handler, and then it schedules the
> machine_check_exception handler to run when interrupts are enabled.
>
> This works fine except the case of an unrecoverable MCE, where the true
> NMI is taken when MSR[RI] is clear, it can not recover to schedule the
> next handler, so it calls machine_check_exception directly so something
> might be done about it.
>
> Calling an async handler from NMI context can result in irq state and
> other things getting corrupted. This can also trigger the BUG at
> arch/powerpc/include/asm/interrupt.h:168.
>
> Fix this by just making the 64s machine_check_exception handler an NMI
> like it is on other subarchs.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Hi Nick,

If I inject control memory access error in LPAR on top of this patch
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210906084303.183921-1-ganeshgr@linux.ibm.com/

I see the following warning trace

WARNING: CPU: 130 PID: 7122 at arch/powerpc/include/asm/interrupt.h:319 machine_check_exception+0x310/0x340
  Modules linked in:
  CPU: 130 PID: 7122 Comm: inj_access_err Kdump: loaded Tainted: G   M              5.15.0-rc2-cma-00054-g4a0d59fbaf71-dirty #22
  NIP:  c00000000002f980 LR: c00000000002f7e8 CTR: c000000000a31860
  REGS: c0000039fe51bb20 TRAP: 0700   Tainted: G   M               (5.15.0-rc2-cma-00054-g4a0d59fbaf71-dirty)
  MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 88000222  XER: 20040000
  CFAR: c00000000002f844 IRQMASK: 0
  GPR00: c00000000002f798 c0000039fe51bdc0 c0000000020d0000 0000000000000001
  GPR04: 0000000000000000 4000000000000002 4000000000000000 00000000000019af
  GPR08: 00000077e5ad0000 0000000000000000 c0000077ee16c700 0000000000000080
  GPR12: 0000000088000222 c0000077ee16c700 0000000000000000 0000000000000000
  GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR24: 0000000000000000 0000000000000000 c0000000020fecd8 0000000000000000
  GPR28: 0000000000000000 0000000000000001 0000000000000001 c0000039fe51be80
  NIP [c00000000002f980] machine_check_exception+0x310/0x340
  LR [c00000000002f7e8] machine_check_exception+0x178/0x340
  Call Trace:
  [c0000039fe51bdc0] [c00000000002f798] machine_check_exception+0x128/0x340 (unreliable)
  [c0000039fe51be10] [c0000000000086ec] machine_check_common+0x1ac/0x1b0
  --- interrupt: 200 at 0x10000968
  NIP:  0000000010000968 LR: 0000000010000958 CTR: 0000000000000000
  REGS: c0000039fe51be80 TRAP: 0200   Tainted: G   M               (5.15.0-rc2-cma-00054-g4a0d59fbaf71-dirty)
  MSR:  8000000002a0f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 22000824  XER: 00000000
  CFAR: 000000000000021c DAR: 00007fffb00c0000 DSISR: 02000008 IRQMASK: 0
  GPR00: 0000000022000824 00007fffc9647770 0000000010027f00 00007fffb00c0000
  GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR08: 0000000000000000 00007fffb00c0000 0000000000000001 0000000000000000
  GPR12: 0000000000000000 00007fffb015a330 0000000000000000 0000000000000000
  GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR24: 0000000000000000 0000000000000000 0000000000000000 000000001000085c
  GPR28: 00007fffc9647d18 0000000000000001 00000000100009b0 00007fffc9647770
  NIP [0000000010000968] 0x10000968
  LR [0000000010000958] 0x10000958
  --- interrupt: 200


--------------05143280F09BE4B28505B5CD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">
      <pre>On 9/22/21 7:32 AM, Nicholas Piggin wrote:</pre>
    </div>
    <blockquote type="cite"
      cite="mid:20210922020247.209409-1-npiggin@gmail.com">
      <pre class="moz-quote-pre" wrap="">The machine check handler is not considered NMI on 64s. The early
handler is the true NMI handler, and then it schedules the
machine_check_exception handler to run when interrupts are enabled.

This works fine except the case of an unrecoverable MCE, where the true
NMI is taken when MSR[RI] is clear, it can not recover to schedule the
next handler, so it calls machine_check_exception directly so something
might be done about it.

Calling an async handler from NMI context can result in irq state and
other things getting corrupted. This can also trigger the BUG at
arch/powerpc/include/asm/interrupt.h:168.

Fix this by just making the 64s machine_check_exception handler an NMI
like it is on other subarchs.

Signed-off-by: Nicholas Piggin <a class="moz-txt-link-rfc2396E" href="mailto:npiggin@gmail.com">&lt;npiggin@gmail.com&gt;</a>
---
</pre>
    </blockquote>
    <pre>Hi Nick,

If I inject control memory access error in LPAR on top of this patch
<a class="moz-txt-link-freetext" href="https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210906084303.183921-1-ganeshgr@linux.ibm.com/">https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210906084303.183921-1-ganeshgr@linux.ibm.com/</a>

I see the following warning trace

WARNING: CPU: 130 PID: 7122 at arch/powerpc/include/asm/interrupt.h:319 machine_check_exception+0x310/0x340
 Modules linked in:
 CPU: 130 PID: 7122 Comm: inj_access_err Kdump: loaded Tainted: G   M              5.15.0-rc2-cma-00054-g4a0d59fbaf71-dirty #22
 NIP:  c00000000002f980 LR: c00000000002f7e8 CTR: c000000000a31860
 REGS: c0000039fe51bb20 TRAP: 0700   Tainted: G   M               (5.15.0-rc2-cma-00054-g4a0d59fbaf71-dirty)
 MSR:  8000000000029033 &lt;SF,EE,ME,IR,DR,RI,LE&gt;  CR: 88000222  XER: 20040000 
 CFAR: c00000000002f844 IRQMASK: 0 
 GPR00: c00000000002f798 c0000039fe51bdc0 c0000000020d0000 0000000000000001 
 GPR04: 0000000000000000 4000000000000002 4000000000000000 00000000000019af 
 GPR08: 00000077e5ad0000 0000000000000000 c0000077ee16c700 0000000000000080 
 GPR12: 0000000088000222 c0000077ee16c700 0000000000000000 0000000000000000 
 GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
 GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
 GPR24: 0000000000000000 0000000000000000 c0000000020fecd8 0000000000000000 
 GPR28: 0000000000000000 0000000000000001 0000000000000001 c0000039fe51be80 
 NIP [c00000000002f980] machine_check_exception+0x310/0x340
 LR [c00000000002f7e8] machine_check_exception+0x178/0x340
 Call Trace:
 [c0000039fe51bdc0] [c00000000002f798] machine_check_exception+0x128/0x340 (unreliable)
 [c0000039fe51be10] [c0000000000086ec] machine_check_common+0x1ac/0x1b0
 --- interrupt: 200 at 0x10000968 
 NIP:  0000000010000968 LR: 0000000010000958 CTR: 0000000000000000
 REGS: c0000039fe51be80 TRAP: 0200   Tainted: G   M               (5.15.0-rc2-cma-00054-g4a0d59fbaf71-dirty)
 MSR:  8000000002a0f033 &lt;SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE&gt;  CR: 22000824  XER: 00000000 
 CFAR: 000000000000021c DAR: 00007fffb00c0000 DSISR: 02000008 IRQMASK: 0 
 GPR00: 0000000022000824 00007fffc9647770 0000000010027f00 00007fffb00c0000 
 GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
 GPR08: 0000000000000000 00007fffb00c0000 0000000000000001 0000000000000000
 GPR12: 0000000000000000 00007fffb015a330 0000000000000000 0000000000000000
 GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
 GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
 GPR24: 0000000000000000 0000000000000000 0000000000000000 000000001000085c
 GPR28: 00007fffc9647d18 0000000000000001 00000000100009b0 00007fffc9647770
 NIP [0000000010000968] 0x10000968
 LR [0000000010000958] 0x10000958
 --- interrupt: 200

</pre>
  </body>
</html>

--------------05143280F09BE4B28505B5CD--

