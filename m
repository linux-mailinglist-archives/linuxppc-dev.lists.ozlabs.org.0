Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BF7788C7B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 17:31:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nyxyRRU3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXP711nm6z3cD1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 01:31:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nyxyRRU3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXP5M1TfJz2ytN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 01:29:42 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37PFOCGC006197;
	Fri, 25 Aug 2023 15:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=jsmLndngsCqxYPfjTpzrZ+eWdetmaikWUbUF90PIqrI=;
 b=nyxyRRU3z14NO2Y0zEppFbOiT7jHa+GsZXcEF3BAua8YgEIqq0MQzKzhu5CSms+GXs2Z
 gy6K4GMyiuA++AjGV3lO10IK6fkLs0ZNZpXjq7y1KGDmQghGVB23vrl7vOZOLzuztwnM
 reZZ3O+Ep+6QRp15O/ecCzLcajDD0wsNnn6tdI+oCfdpbnalP3dGxpWkMMLUB/McTneR
 7xKbJaBroIUpHYeYi9BQapExexmuUp/Kzm1au/aTDA2QA0QYufNEamtGahybGiBG3ibJ
 h8vbTgfIjGI+WEVMdAD/jywBvbAjR5JmaZLwmWAydeRB9+p9ml38CWc8AmF1QiFBSz++ NA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3spxwfg4rd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 15:29:25 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37PDKF9E010408;
	Fri, 25 Aug 2023 15:29:23 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sn21t8m3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 15:29:23 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37PFTLlL44761676
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Aug 2023 15:29:21 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 927DC2004B;
	Fri, 25 Aug 2023 15:29:21 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D61E420043;
	Fri, 25 Aug 2023 15:29:19 +0000 (GMT)
Received: from [9.43.75.97] (unknown [9.43.75.97])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Aug 2023 15:29:19 +0000 (GMT)
Message-ID: <a4ac6331-eef0-58d6-b8e2-fc27fefdd309@linux.ibm.com>
Date: Fri, 25 Aug 2023 20:59:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/4] powerpc/bpf: use
 bpf_jit_binary_pack_[alloc|finalize|free]
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "bpf@vger.kernel.org" <bpf@vger.kernel.org>
References: <20230309180213.180263-1-hbathini@linux.ibm.com>
 <20230309180213.180263-5-hbathini@linux.ibm.com>
 <dd13ab10-e488-18cb-2b68-d24d4d159747@csgroup.eu>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <dd13ab10-e488-18cb-2b68-d24d4d159747@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QAsrHSvoy8eDHF0WphXinrbh_qEpLcCb
X-Proofpoint-ORIG-GUID: QAsrHSvoy8eDHF0WphXinrbh_qEpLcCb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_13,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 mlxlogscore=872 suspectscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308250134
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/03/23 3:46 pm, Christophe Leroy wrote:
> 
> 
> Le 09/03/2023 à 19:02, Hari Bathini a écrit :
>> Use bpf_jit_binary_pack_alloc in powerpc jit. The jit engine first
>> writes the program to the rw buffer. When the jit is done, the program
>> is copied to the final location with bpf_jit_binary_pack_finalize.
>> With multiple jit_subprogs, bpf_jit_free is called on some subprograms
>> that haven't got bpf_jit_binary_pack_finalize() yet. Implement custom
>> bpf_jit_free() like in commit 1d5f82d9dd47 ("bpf, x86: fix freeing of
>> not-finalized bpf_prog_pack") to call bpf_jit_binary_pack_finalize(),
>> if necessary. While here, correct the misnomer powerpc64_jit_data to
>> powerpc_jit_data as it is meant for both ppc32 and ppc64.
> 
> root@vgoip:~# echo 1 > /proc/sys/net/core/bpf_jit_enable
> root@vgoip:~# insmod test_bpf.ko
> [  570.270983] kernel tried to execute exec-protected page (bd42c198) -
> exploit attempt? (uid: 0)
> [  570.279414] BUG: Unable to handle kernel instruction fetch
> [  570.284822] Faulting instruction address: 0xbd42c198
> [  570.289734] Oops: Kernel access of bad area, sig: 11 [#1]
> [  570.295062] BE PAGE_SIZE=16K PREEMPT CMPC885
> [  570.302811] Modules linked in: test_bpf(+) test_module
> [  570.307891] CPU: 0 PID: 559 Comm: insmod Not tainted
> 6.3.0-rc1-s3k-dev-g4ae0418b3500 #258
> [  570.315975] Hardware name: MIAE 8xx 0x500000 CMPC885
> [  570.320882] NIP:  bd42c198 LR: be8180ec CTR: be818010
> [  570.325873] REGS: cae2bc40 TRAP: 0400   Not tainted
> (6.3.0-rc1-s3k-dev-g4ae0418b3500)
> [  570.333704] MSR:  40009032 <EE,ME,IR,DR,RI>  CR: 88008222  XER: 00000000
> [  570.340503]
> [  570.340503] GPR00: be806eac cae2bd00 c2977340 00000000 c2c40900
> 00000000 c1a18a80 00000000
> [  570.340503] GPR08: 00000002 00000001 00000000 00000000 ffffffff
> 100d815e ca6a0000 00000001
> [  570.340503] GPR16: 1234aaaa ca242250 c1180000 00000001 1234aaab
> c9050030 00000000 00000000
> [  570.340503] GPR24: c2c40900 00000000 ffffffff 00000000 c1a18a80
> 00000000 00000002 ca24225c
> [  570.376819] NIP [bd42c198] 0xbd42c198
> [  570.380436] LR [be8180ec] 0xbe8180ec
> [  570.383965] Call Trace:
> [  570.386373] [cae2bd00] [0000000b] 0xb (unreliable)
> [  570.391107] [cae2bd50] [be806eac] __run_one+0x58/0x224 [test_bpf]
> [  570.397390] [cae2bd90] [be80ca94] test_bpf_init+0x8d8/0x1010 [test_bpf]
> [  570.404189] [cae2be20] [c00049f0] do_one_initcall+0x38/0x1e4
> [  570.409782] [cae2be80] [c0090aa8] do_init_module+0x50/0x234
> [  570.415291] [cae2bea0] [c0092e08] sys_finit_module+0xb4/0xf8
> [  570.420884] [cae2bf20] [c000e344] system_call_exception+0x94/0x150
> [  570.426995] [cae2bf30] [c00120a8] ret_from_syscall+0x0/0x28
> [  570.432502] --- interrupt: c00 at 0xfd5fca0
> [  570.436632] NIP:  0fd5fca0 LR: 10014568 CTR: 10013294
> [  570.441625] REGS: cae2bf40 TRAP: 0c00   Not tainted
> (6.3.0-rc1-s3k-dev-g4ae0418b3500)
> [  570.449455] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 44002224  XER:
> 00000000
> [  570.456513]
> [  570.456513] GPR00: 00000161 7f868d30 77ed34d0 00000003 100bc4ef
> 00000000 0fd51868 0000d032
> [  570.456513] GPR08: 000007b1 10013294 00000000 00000002 52454753
> 100d815e 100a44b8 00000000
> [  570.456513] GPR16: 100d167c 100b0000 1198426c 119854cd 100d0000
> 100d0000 00000000 100a4498
> [  570.456513] GPR24: ffffffa2 ffffffff 11984244 00000003 1198426c
> 100bc4ef 11984288 1198426c
> [  570.492828] NIP [0fd5fca0] 0xfd5fca0
> [  570.496358] LR [10014568] 0x10014568
> [  570.499887] --- interrupt: c00
> [  570.502902] Code: XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
> XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
> XXXXXXXX XXXXXXXX XXXXXXXX
> [  570.517973] ---[ end trace 0000000000000000 ]---
> [  570.522523]
> [  570.523986] note: insmod[559] exited with irqs disabled
> Segmentation fault

Thanks a lot for reviewing v2, Christophe.
Posted v3 for reviewing..

Thanks
Hari
