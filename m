Return-Path: <linuxppc-dev+bounces-17019-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id F/zVIlrNm2nD7QMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17019-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 04:45:30 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C91171A8E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 04:45:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fK6FK5cfqz3bTf;
	Mon, 23 Feb 2026 14:45:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771818325;
	cv=none; b=cY/wFiJSd6GhYf3g7UdQQJXYC2ci1b24vBCze5iTVc//OkXm+FtbSwrfJKwY1fyWdv/zFgdENKBJ4QsJdkGEq+/8r+xyMFJqb0E8zjKkpqljgddrwcr/YMXe8KUFE3TVoWlYcvTbEPQb/8kS7iXndMosvBQTLBd9uBv7B2VlCwgyvlHQpX/EEzuFDC+2KDlXXz7cfFsTIP7Hj/7i1ejeWAHpV2pjJC8VkX7DYEnnvQ6bR3MOYz1aUWyjL7zH+IwneDbKVoG+rnCaHRmbg3w8lgIXmeEDVSLyIF4pgQ/AWIGQpMy70vi4n614Ykz71w3C1GQSCGMUwkFZq2YLnE15Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771818325; c=relaxed/relaxed;
	bh=RyYSL2ov6C3u3yqvGVc58oTwjWdV5IlojIEozCfjRo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PsTQcO2QccXw8m7LkThjt7NPDwD/LWlr2OI520auYzdfn8eq/HKYU7l589syFh43+RM0AWzxa5+oelB22fsBoI/hpx7Kg4I6jTYvMd0TOvwSflDfxVXIaj7VlvwEcRhn4KXmEtVvPGdcK+3CzPORnbcFx6tABwHisZGEZxaLUTd/169M7ydh38XmTNgFgB6/Izg2YjfVcs64OvAoKGom6deKPPNsUAq4O83yiz4O9T1qEhUv1tCJQIM1LVVusHFWAI6rEDy0hAIiHzLodN/vh9YPz+oMwKxoV/STVwBaUFZscCfdYCrmQsP96SNg0X1Kaj74arRCXGYTRtUwXObIdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aDW2PS3c; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aDW2PS3c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fK6FJ3wjMz2xlv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 14:45:23 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MJFcMa2615756;
	Mon, 23 Feb 2026 03:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=RyYSL2
	ov6C3u3yqvGVc58oTwjWdV5IlojIEozCfjRo8=; b=aDW2PS3cByWWhIvZ7L+Bk0
	21zT5Y94/sbIkDpo2M3s7CmUAxGVP2PCCN9JsUoSW1SKVZIclgIPSIez5SQ0IxX1
	Z41MiMf3QWDDVqGw/NTDIddgy2n65g6quADBSrLSV+YNx17n7pKGr02VgnOZ0nvZ
	rVGCUt4gyHnROxn+FnhJ4TxjY7gMJYvKojUKNDALHVQfJgxIlhrRxEhwhFWwD1cp
	F3KEFsgy8gl1jYHNIMl5Vam7vRbTaBtkqJZB4QXo3X5JLDB3+9TYeY8eyi7k4b0y
	FAqa0f8sBcncSuK4j0Yka+5zmdCv0W6thCLs41FocIWGbcWkOK386Fk/+33I+aLw
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf471nn0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 03:45:21 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61MN8P3r030385;
	Mon, 23 Feb 2026 03:45:20 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfrhk36gp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 03:45:20 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61N3jIMw45220136
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Feb 2026 03:45:18 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 26B9C20043;
	Mon, 23 Feb 2026 03:45:18 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA11020040;
	Mon, 23 Feb 2026 03:45:13 +0000 (GMT)
Received: from [9.124.222.94] (unknown [9.124.222.94])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Feb 2026 03:45:13 +0000 (GMT)
Message-ID: <d0342f0e-633f-4299-966a-27e4c0050da3@linux.ibm.com>
Date: Mon, 23 Feb 2026 09:15:12 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux PPC] KVM PR and KVM HV do not work if the kernel was
 compiled with PREEMPT
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
        mad skateman <madskateman@gmail.com>,
        Christian Zigotzky <info@xenosoft.de>
References: <b897b0fd-90f2-4215-bcd4-3714e497d773@xenosoft.de>
 <185d7a42-f7b4-44e1-a129-f5989d211c74@linux.ibm.com>
 <40154f6a-39da-959d-e039-5ab9ff62db3c@xenosoft.de>
 <709b864f-9daa-4a48-b3d6-39baedce63b2@linux.ibm.com>
 <dbbb7998-5245-170f-626b-81bc75a32591@xenosoft.de>
 <843b7c60-23f1-47d0-b4e8-2147c3e40c23@linux.ibm.com>
 <2a27e6fc-7eb4-41a5-ba88-58f6a22625b5@xenosoft.de>
 <1d79ec6f-ce7f-4432-80e0-a54fa1668642@linux.ibm.com>
 <caeed62f-0e36-4868-e593-887d7f33ce50@xenosoft.de>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <caeed62f-0e36-4868-e593-887d7f33ce50@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 3F2JuIXyLO7ZJjv4yYD4iiIXOi8YIsaV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDAyOSBTYWx0ZWRfXzrNJq3YQZKnY
 2hgb6pYpRSorP6VnZIiFzkrj0I1SJa6BXbe8AGOI5Eh3wc+kOv2kQ9XVDk7u8iFhSIC35EEcawj
 qUFeyDiv6vpk312XP2ZJIWtj+pIOHFCB7cT63zexMVGn6ihD4ZfXgM6ss+OnZLfRZX0trHlgwMp
 C3TcvZhgfyA0nRBKizJwTZpa17kgqXFLsH2oF3iQXGAqw4oRP/D438HUjHfdkxM1bpF7n7HTjIg
 sDm6JSIe/b0AK9PaawhiWXvD9DEL6Bd0JE9/CZhZ+weP7PpcpshJysGVQJKNFXq0NFX2Jp5mEvj
 pJQQvMWY4+kokNXelB3BBE/zhP9ftb30f0JGNT0jkEFuSXOzOdVODzD5kmLenDXVStQR8UpJNFm
 QQkuGdnURdANi36QkTYtuXzfhzkk/9eZXtUr2EhpR29FspK8VtP04RO2SLOa11gxPtyoW8l0FkD
 UrI74xpktUSvF6hYOpQ==
X-Authority-Analysis: v=2.4 cv=R7wO2NRX c=1 sm=1 tr=0 ts=699bcd51 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=LpcYUoi4WhtTY--kXmYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: AwVlqX4TNhBbZR4cJm0A8rsBXpk1O0Z2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602230029
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17019-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[xtra.co.nz,yahoo.com.au,gmail.com,xenosoft.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chzigotzky@xenosoft.de,m:linuxppc-dev@lists.ozlabs.org,m:kvm-ppc@vger.kernel.org,m:maddy@linux.ibm.com,m:rtd2@xtra.co.nz,m:hypexed@yahoo.com.au,m:madskateman@gmail.com,m:info@xenosoft.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C4C91171A8E
X-Rspamd-Action: no action


Hi Christian.


>> If possible give the below try.
>> (Note: Didn;t replicate your issue)
>>
>> ---
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 7667563fb9ff..bf0ca49c9915 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -4825,10 +4825,13 @@ static int kvmppc_run_vcpu(struct kvm_vcpu *vcpu)
>>          vc->runner = vcpu;
>>          if (n_ceded == vc->n_runnable) {
>>              kvmppc_vcore_blocked(vc);
>> -        } else if (need_resched()) {
>> +        } else if (need_resched() || spin_needbreak(&vc->lock)) {
>>              kvmppc_vcore_preempt(vc);
>>              /* Let something else run */
>> -            cond_resched_lock(&vc->lock);
>> +            spin_unlock(&vc->lock);
>> +            schedule();
>> +            //cond_resched_lock(&vc->lock);
>> +            spin_lock(&vc->lock);
>>              if (vc->vcore_state == VCORE_PREEMPT)
>>                  kvmppc_vcore_end_preempt(vc);
>>          } else {
>> @@ -4901,7 +4904,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, 
>> u64 time_limit,
>>      }
>>
>>      if (need_resched())
>> -        cond_resched();
>> +        schedule();
>>
>>      kvmppc_update_vpas(vcpu);
>>
>> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
>> index 9a89a6d98f97..54963c1d8b58 100644
>> --- a/arch/powerpc/kvm/powerpc.c
>> +++ b/arch/powerpc/kvm/powerpc.c
>> @@ -86,7 +86,7 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
>>      while (true) {
>>          if (need_resched()) {
>>              local_irq_enable();
>> -            cond_resched();
>> +            schedule();
>>              hard_irq_disable();
>>              continue;
>>          }
>>
> Hello Shrikanth,
> t
> I tested your patch today. The patched preempt kernel boots on my e5500 
> host and in an e5500 VM. Unfortunately my guest and host freeze after 
> loading the VirtIO-GPU.
> 
> Thanks for your help,
> 
> Christian

Glad it helps you to boot into.

Since you said even host freezes, host maybe crashing.
Do you have the console log when you load the VirtIO-GPU?

