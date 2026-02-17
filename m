Return-Path: <linuxppc-dev+bounces-16890-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qO5oHlr2k2lz+AEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16890-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 06:02:18 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9BB148BF1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 06:02:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFSDk0tq8z2yS4;
	Tue, 17 Feb 2026 16:02:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771304533;
	cv=none; b=JrxVNh2EdB/FrzuB2m6gaDNUW6L5X7SLw4ZUSpcUjv1be79f6r4fTUY+slOrBuvCqSBBxMmo0E9YrpbbtjuhX+F5qYb903TU9CyjH6mIw1atJRVBwV2cveoZrFFgRsMN7XCFcaCa/KUBETWZA01FtdJvO0Qy+Ks8FxwWNn6SlFDL4i6QUDG7xRFV78fNFEE9wfn8FpfVJ0ldHNeddDrSeCS8xXCTZQBljLpCRuQKSS4DDArN8AZUWqFJ+M+vVH5JPChE/b+0FvNOrJi+ilp8iLbB32piCe3PtYza3L32hdaqRa3sV3VuYdjWR3/96/Nz7MX7OThhWQAqlN7Qe68Mgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771304533; c=relaxed/relaxed;
	bh=wBNenHw6cfEOAvQzXklgzBQ9ewTjhU1BT7mst5LVAQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/m4ohKoDcVTQLWJskb5nWXAoeaLgQHXfnVa9aRq90llYomfTWt8F8ux9jemFBqMMTKrrPSEYp02MLC7mhNEC7zdSPQS3PL2gGSOiuFvN/5l7RUwKKyj5ESANirsmLmpmKc0ZeSJ5IoLbgRLS0E+gD82BTO+q2lxQdI7I26rabdo9+OjcKBkiTPJNcpV6OUOHGY9+79rKiBJQC25FedYlWjsTB6ZJnWxHsUaDb8/yUFFZXxVQtEMU0URxlGEgk9omzm+44em4+2g6U6KbdzZxCqB1IGLoyGYa7tsubkefrYpInPsGi8RoU9GnULsSOy/pPmQe+85UrwuYpQdU9+0cQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hiKTU0G1; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hiKTU0G1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFSDh2hMJz2xN5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Feb 2026 16:02:11 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H0TFnY2169858;
	Tue, 17 Feb 2026 05:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=wBNenH
	w6cfEOAvQzXklgzBQ9ewTjhU1BT7mst5LVAQs=; b=hiKTU0G1VhxDo/dbjRYMbh
	TPYC6fx/Vd3tR3CXhY4fNDUpTDFENQknw/HwJC/B8eBXbxtO9lcoVD5VSr6us8LL
	j15snDe26nUsPSIpfbwKs+wTq63DF2+IoWx9PZTflcTm8UXsgJ+v886+QCJI3BPU
	iAEapIpHL9UW6tDVFqUCi4eWoHSCfF3YeMShLLdpc9WV/phZRO2dxmwRaZUFn7HI
	hdqjhrpiUVefPpf6V+lD8FC0/A4CIQk0kJUr7wmfj4EnxPwCO1OBBim22zTNpuDY
	cgzaX3J18zOXDvRuJZZgwCCd11lJ+wNaD0MBDUjrTCTvbHLlX8cUdb1HPrWwwyXw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4caj6rtgfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Feb 2026 05:02:08 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61H3HGmx001883;
	Tue, 17 Feb 2026 05:02:08 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ccb2b9483-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Feb 2026 05:02:07 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61H526AS40960292
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Feb 2026 05:02:06 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4BDD32004B;
	Tue, 17 Feb 2026 05:02:06 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FC7320043;
	Tue, 17 Feb 2026 05:02:04 +0000 (GMT)
Received: from [9.111.28.248] (unknown [9.111.28.248])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Feb 2026 05:02:04 +0000 (GMT)
Message-ID: <185d7a42-f7b4-44e1-a129-f5989d211c74@linux.ibm.com>
Date: Tue, 17 Feb 2026 10:32:03 +0530
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
        "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>
Cc: "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
        mad skateman <madskateman@gmail.com>,
        Christian Zigotzky <info@xenosoft.de>
References: <b897b0fd-90f2-4215-bcd4-3714e497d773@xenosoft.de>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <b897b0fd-90f2-4215-bcd4-3714e497d773@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=dvvWylg4 c=1 sm=1 tr=0 ts=6993f651 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=5H1sMmDSAAAA:20
 a=NEAV23lmAAAA:8 a=APaD-8RfXa1xi9PzJvEA:9 a=QEXdDO2ut3YA:10
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: GDtg5XZmQt2SZ8acK7rOhukiX0uZPPwS
X-Proofpoint-ORIG-GUID: uk-4j0MspZbrINpgX170yUzwRmc9VZY3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDAzNSBTYWx0ZWRfX7nrASHnQdK2k
 59MbhTyZW/Ve1H5/V38S/5fQibf5PEBljGTgqyLlPFE9cV8EYy5BDA62VhShY29x/G2bQQ05c0U
 FtkT4wYL7reXLRH7fyEMP4zuiv7RatFNpfC07gjxIIJXLXTQcUSYjg1nGWuozR0un0GfTORpiF+
 t/tDGGOOBOgIl4RSIeWomBcq+iNlIx/JNy6gaeUUZWOzbCwpvipybdXQFsNuMY5As9AnNHsXkxz
 raCNXZjOPTbRyfmsbahoifIV0Q+YFwHq223jIK+fN1TorZDHpIPnRqdkhdUa+lLd/LQ5WQv7vyY
 tLGMeXtVMuuJW06R4hSnOHHPF3YrVe3abatR0sVDHy1zVIYE2YBXcor9bEZi94VpafDAwHHTaN9
 e4G6UppvIsIHqvcgFaEFPVH13l+t1gBss5aseGIgImnx40rbPsw5iiCB9fuAlnWxqLWRpype4Nd
 yWyykFqlmXGwaoxF4nA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_08,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 clxscore=1011 malwarescore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170035
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16890-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chzigotzky@xenosoft.de,m:linuxppc-dev@lists.ozlabs.org,m:kvm-ppc@vger.kernel.org,m:rtd2@xtra.co.nz,m:hypexed@yahoo.com.au,m:madskateman@gmail.com,m:info@xenosoft.de,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[xtra.co.nz,yahoo.com.au,gmail.com,xenosoft.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7E9BB148BF1
X-Rspamd-Action: no action



On 2/14/26 7:32 PM, Christian Zigotzky wrote:
> Hello,
> 
> KVM PR and KVM HV do not work if the kernel was compiled with PREEMPT.
> 
> The entire FSL Cyrus+ board freezes when using KVM HV with PREEMPT.
> 
> The guest kernel doesn't boot if we use KVM PR with a PREEMPT kernel on 
> the PA Semi Nemo board.
> 
> We were previously able to disable PREEMPT in the kernel configuration, 
> but the latest git kernels now enable it by default and it is no longer 
> possible to disable it.
> 
> I created a patch for disabling PREEMPT today. [1]
> 
> Is it possible to let us decide whether to activate PREEMPT or not?
> 
> Thanks in advance,
> 
> Christian
> 
> [1] https://raw.githubusercontent.com/chzigotzky/kernels/ 
> a74fa6179eaeafcea7ad89f0e61c30ace038daf2/patches/X1000/ 
> Kconfig.preempt.patch
> [2] Bug report: https://github.com/chzigotzky/kernels/issues/19


Hi.

Do you have any trace why it is stuck? That would be useful.



My initial take is cond_resched is a nop. So we might be stuck there.
Eventually it should have come out though.

Could you please give the below patch a try and let me know?
Note: This likely still needs lazy bit handling. So keep in preempt=full.
(Not tested)


diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 7667563fb9ff..fe215d1177fe 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4901,7 +4901,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
         }
  
         if (need_resched())
-               cond_resched();
+               schedule();
  
         kvmppc_update_vpas(vcpu);
  
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 9a89a6d98f97..54963c1d8b58 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -86,7 +86,7 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
         while (true) {
                 if (need_resched()) {
                         local_irq_enable();
-                       cond_resched();
+                       schedule();
                         hard_irq_disable();
                         continue;
                 }

