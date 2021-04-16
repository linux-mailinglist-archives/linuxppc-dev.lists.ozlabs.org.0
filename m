Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E30361E9E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 13:28:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMDVS03jMz3c1W
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 21:28:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SYgRSr4+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=srs0=4g9g=jn=linux.ibm.com=sourabhjain@ozlabs.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SYgRSr4+; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMDTz5Jfsz2yYh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 21:28:07 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by ozlabs.org (Postfix) with ESMTP id 4FMDTy6L6Fz9sWD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 21:28:06 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4FMDTy60pNz9sW4; Fri, 16 Apr 2021 21:28:06 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SYgRSr4+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4FMDTy11L8z9sRK;
 Fri, 16 Apr 2021 21:28:05 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13GB2Tdk009250; Fri, 16 Apr 2021 07:28:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=9O8et4pERXF1K4Ech2qWxfajZI8JsCLHL85smprm4Cw=;
 b=SYgRSr4+0vQnb2DY364HUs3uvcj9/rPnOmukPICitdFhahKP+enruYSqSvRQTCTHAVP2
 +qvVdJtNMkV0qAyfkFBVMjQGj02KrT20EV5kXhkaxXGyZK9G9XQjHNY/adf/sBszec8p
 YZz99xHcKyXD8ckIdzGUI1uP5H5WsbOcQaFF52lGAXTq7gI5clZ+Pr8XWzs1xPyfuhIg
 49MV1aE27xtQnOEZcSY3fNjmP7xKnZjU9s6l9U8pWP6cepBhgBwF98Q7Ns2PRvp+Ins0
 fVfHl9XyrITGhVnnklcoEBM2rmGmO1vWOAutkisDnBtSmPJZXG9t3082jJv5vvGhKt/N zg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37y7wutyh9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 07:28:02 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13GBRLq3026901;
 Fri, 16 Apr 2021 11:28:00 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 37u39hmeet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 11:28:00 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13GBRvdR26673634
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 11:27:58 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF50FAE04D;
 Fri, 16 Apr 2021 11:27:57 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 971D3AE045;
 Fri, 16 Apr 2021 11:27:56 +0000 (GMT)
Received: from [9.85.105.90] (unknown [9.85.105.90])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Apr 2021 11:27:56 +0000 (GMT)
Subject: Re: [PATCH] powerpc/kdump: fix kdump kernel hangup issue with hot add
 CPUs
To: Hari Bathini <hbathini@linux.ibm.com>, mpe@ellerman.id.au
References: <20210416064749.657585-1-sourabhjain@linux.ibm.com>
 <b8f5fad8-3ea8-cb8d-84d2-8769ed41cc38@linux.ibm.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
Message-ID: <e478b65c-d41d-48e7-2d11-7cef8bb6f274@linux.ibm.com>
Date: Fri, 16 Apr 2021 16:57:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <b8f5fad8-3ea8-cb8d-84d2-8769ed41cc38@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UdCNW3Y-ypBMuu1CQoaXJjnk9xkFQfD7
X-Proofpoint-ORIG-GUID: UdCNW3Y-ypBMuu1CQoaXJjnk9xkFQfD7
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-16_06:2021-04-15,
 2021-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104160083
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


On 16/04/21 3:03 pm, Hari Bathini wrote:
>
>
> On 16/04/21 12:17 pm, Sourabh Jain wrote:
>> With the kexec_file_load system call when system crashes on the hot add
>> CPU the capture kernel hangs and failed to collect the vmcore.
>>
>>   Kernel panic - not syncing: sysrq triggered crash
>>   CPU: 24 PID: 6065 Comm: echo Kdump: loaded Not tainted 
>> 5.12.0-rc5upstream #54
>>   Call Trace:
>>   [c0000000e590fac0] [c0000000007b2400] dump_stack+0xc4/0x114 
>> (unreliable)
>>   [c0000000e590fb00] [c000000000145290] panic+0x16c/0x41c
>>   [c0000000e590fba0] [c0000000008892e0] sysrq_handle_crash+0x30/0x40
>>   [c0000000e590fc00] [c000000000889cdc] __handle_sysrq+0xcc/0x1f0
>>   [c0000000e590fca0] [c00000000088a538] write_sysrq_trigger+0xd8/0x178
>>   [c0000000e590fce0] [c0000000005e9b7c] proc_reg_write+0x10c/0x1b0
>>   [c0000000e590fd10] [c0000000004f26d0] vfs_write+0xf0/0x330
>>   [c0000000e590fd60] [c0000000004f2aec] ksys_write+0x7c/0x140
>>   [c0000000e590fdb0] [c000000000031ee0] 
>> system_call_exception+0x150/0x290
>>   [c0000000e590fe10] [c00000000000ca5c] system_call_common+0xec/0x278
>>   --- interrupt: c00 at 0x7fff905b9664
>>   NIP:  00007fff905b9664 LR: 00007fff905320c4 CTR: 0000000000000000
>>   REGS: c0000000e590fe80 TRAP: 0c00   Not tainted (5.12.0-rc5upstream)
>>   MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 
>> 28000242
>>         XER: 00000000
>>   IRQMASK: 0
>>   GPR00: 0000000000000004 00007ffff5fedf30 00007fff906a7300 
>> 0000000000000001
>>   GPR04: 000001002a7355b0 0000000000000002 0000000000000001 
>> 00007ffff5fef616
>>   GPR08: 0000000000000001 0000000000000000 0000000000000000 
>> 0000000000000000
>>   GPR12: 0000000000000000 00007fff9073a160 0000000000000000 
>> 0000000000000000
>>   GPR16: 0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>>   GPR20: 0000000000000000 00007fff906a4ee0 0000000000000002 
>> 0000000000000001
>>   GPR24: 00007fff906a0898 0000000000000000 0000000000000002 
>> 000001002a7355b0
>>   GPR28: 0000000000000002 00007fff906a1790 000001002a7355b0 
>> 0000000000000002
>>   NIP [00007fff905b9664] 0x7fff905b9664
>>   LR [00007fff905320c4] 0x7fff905320c4
>>   --- interrupt: c00
>
> <SNIP>
>
> I will update the commit message.
>
>>   /**
>>    * setup_new_fdt_ppc64 - Update the flattend device-tree of the kernel
>>    *                       being loaded.
>> @@ -1020,6 +1113,13 @@ int setup_new_fdt_ppc64(const struct kimage 
>> *image, void *fdt,
>>           }
>>       }
>>   +    /* Update cpus nodes information to account hotplug CPUs. */
>> +    if (image->type == KEXEC_TYPE_CRASH) {
>
> Shouldn't this apply to regular kexec_file_load case as well? Yeah, 
> there won't be a hang in regular kexec_file_load case but for 
> correctness, that kernel should also not see stale CPU info in FDT?
>
> Yes better to update the fdt for both kexec and kdump.
>
> Thanks for the review Hari.
>
> - Sourabh Jain
