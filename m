Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 789BC361CD5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 11:34:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM9yd3F2Kz3c0D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 19:34:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fl4Lq67L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=srs0=sb2e=jn=linux.ibm.com=hbathini@ozlabs.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fl4Lq67L; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM9y96cN9z2yy9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 19:33:53 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4FM9y86wk8z9sW4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 19:33:52 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4FM9y86VDSz9sVb; Fri, 16 Apr 2021 19:33:52 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fl4Lq67L; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4FM9y75BYwz9sSC;
 Fri, 16 Apr 2021 19:33:50 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13G941Qt099018; Fri, 16 Apr 2021 05:33:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=WK9ZHnjIfRIuS8OH5gbd+xot7IxDbuuJKa54sA4gQv0=;
 b=fl4Lq67LkU6GCGLweF+x1bojrxO9r+WumF2LRwAp/mnnN3JzOc3CTq263MI43WP8TqWK
 /LqQSVMtrdGqCG5UtNsKtAiSAPmoTXFIeoTsKeq82WOFDsajP6IXkwqILz2ccHgLDcZe
 3FY46DyPewsmk9/Zhg9QBLRU2KUEtsaunXIBzJ+kgo06Uytpc0OPsmZKeM7Eao3vuhCk
 msOIdBV8sAtr24c517tgXusa651FiQBOtLH8gU2QqSPYbaOQYRE+vjpnRXg1AzIj/6vw
 uckkhNzkyewl+28mHndz8dAmp+iEDyt4LNYcYNklhMl5aJeddiJQUIIuCXBOHEJfd6en SQ== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37xtqa2vm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 05:33:48 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13G9RedB028803;
 Fri, 16 Apr 2021 09:33:46 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 37u39habvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 09:33:46 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13G9XhB358917288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 09:33:44 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2BE542045;
 Fri, 16 Apr 2021 09:33:43 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4680042041;
 Fri, 16 Apr 2021 09:33:41 +0000 (GMT)
Received: from [9.163.28.215] (unknown [9.163.28.215])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Apr 2021 09:33:40 +0000 (GMT)
Subject: Re: [PATCH] powerpc/kdump: fix kdump kernel hangup issue with hot add
 CPUs
To: Sourabh Jain <sourabhjain@linux.ibm.com>, mpe@ellerman.id.au
References: <20210416064749.657585-1-sourabhjain@linux.ibm.com>
From: Hari Bathini <hbathini@linux.ibm.com>
Message-ID: <b8f5fad8-3ea8-cb8d-84d2-8769ed41cc38@linux.ibm.com>
Date: Fri, 16 Apr 2021 15:03:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416064749.657585-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZyoryQs7cw4Cy4bfSmEWsACKD6B34kHb
X-Proofpoint-ORIG-GUID: ZyoryQs7cw4Cy4bfSmEWsACKD6B34kHb
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-16_05:2021-04-15,
 2021-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104160069
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
Cc: mahesh@linux.vnet.ibm.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 16/04/21 12:17 pm, Sourabh Jain wrote:
> With the kexec_file_load system call when system crashes on the hot add
> CPU the capture kernel hangs and failed to collect the vmcore.
> 
>   Kernel panic - not syncing: sysrq triggered crash
>   CPU: 24 PID: 6065 Comm: echo Kdump: loaded Not tainted 5.12.0-rc5upstream #54
>   Call Trace:
>   [c0000000e590fac0] [c0000000007b2400] dump_stack+0xc4/0x114 (unreliable)
>   [c0000000e590fb00] [c000000000145290] panic+0x16c/0x41c
>   [c0000000e590fba0] [c0000000008892e0] sysrq_handle_crash+0x30/0x40
>   [c0000000e590fc00] [c000000000889cdc] __handle_sysrq+0xcc/0x1f0
>   [c0000000e590fca0] [c00000000088a538] write_sysrq_trigger+0xd8/0x178
>   [c0000000e590fce0] [c0000000005e9b7c] proc_reg_write+0x10c/0x1b0
>   [c0000000e590fd10] [c0000000004f26d0] vfs_write+0xf0/0x330
>   [c0000000e590fd60] [c0000000004f2aec] ksys_write+0x7c/0x140
>   [c0000000e590fdb0] [c000000000031ee0] system_call_exception+0x150/0x290
>   [c0000000e590fe10] [c00000000000ca5c] system_call_common+0xec/0x278
>   --- interrupt: c00 at 0x7fff905b9664
>   NIP:  00007fff905b9664 LR: 00007fff905320c4 CTR: 0000000000000000
>   REGS: c0000000e590fe80 TRAP: 0c00   Not tainted  (5.12.0-rc5upstream)
>   MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28000242
>         XER: 00000000
>   IRQMASK: 0
>   GPR00: 0000000000000004 00007ffff5fedf30 00007fff906a7300 0000000000000001
>   GPR04: 000001002a7355b0 0000000000000002 0000000000000001 00007ffff5fef616
>   GPR08: 0000000000000001 0000000000000000 0000000000000000 0000000000000000
>   GPR12: 0000000000000000 00007fff9073a160 0000000000000000 0000000000000000
>   GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>   GPR20: 0000000000000000 00007fff906a4ee0 0000000000000002 0000000000000001
>   GPR24: 00007fff906a0898 0000000000000000 0000000000000002 000001002a7355b0
>   GPR28: 0000000000000002 00007fff906a1790 000001002a7355b0 0000000000000002
>   NIP [00007fff905b9664] 0x7fff905b9664
>   LR [00007fff905320c4] 0x7fff905320c4
>   --- interrupt: c00

<SNIP>

>   /**
>    * setup_new_fdt_ppc64 - Update the flattend device-tree of the kernel
>    *                       being loaded.
> @@ -1020,6 +1113,13 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
>   		}
>   	}
>   
> +	/* Update cpus nodes information to account hotplug CPUs. */
> +	if (image->type == KEXEC_TYPE_CRASH) {

Shouldn't this apply to regular kexec_file_load case as well? Yeah, 
there won't be a hang in regular kexec_file_load case but for 
correctness, that kernel should also not see stale CPU info in FDT?


Thanks
Hari
