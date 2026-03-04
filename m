Return-Path: <linuxppc-dev+bounces-17663-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDRrFNLFp2nTjgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17663-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 06:40:34 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 631BF1FAEC1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 06:40:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQhMy4rJmz3bt9;
	Wed, 04 Mar 2026 16:40:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772602830;
	cv=none; b=bJkKID0SPKrZyv8UNeowryFSlzfGIJRWrFcgGbSTS0KBvUVQWXhJc4PPQr3dPL8nqNyUnxlPfWeEOidwnirJaOoDhx3da2+1MyMItnqrPRnNtRzLeFapnyzVg77lAQXoORpKk1ToQ53zHGUstjcRAvTJbBBjRxqYQtLI/lG51bkaBtQR2D2l2Qet30XPxDiEBuo1Kmog/CkOcaCmR+6PSFyZXS3/lHnUOfSiq71aC2Kf8BOZO4q1WqWyspLfyKqEJyKU7skrrCQlzEaQo5xBg8pRbhdFGiWwN0zZhVra7erRSNnPRd+kvuuTD6evpngKSq5Jo47Ygc4RaEAcfsyDBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772602830; c=relaxed/relaxed;
	bh=67A3pg0hTc457nxQyZL20oNAkSnV71N39tvCJxtr63U=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=KH8XmqATSP96y2+rYP+EHVyF+ROP8GAWbWePd4j6OQ6/LfjgDMYhf7LCS28G7h5bQXwYdSJuaVKSqqfcHlg0AjvogzIaAjcxTxKIBxKLDxFzvtUBlzNmhu5wMgg5BtEWTnJJHduSlVd6KfeWEfD9bN+AhR1KZrAqgMaMF+DiIvIjzdqkpYaWBmcUuzvbgtZq2FA4bs7IlI6cX02d14N/VtRvxVU5pgrfQE1pj484KEavTsWOdfCV/Qt41PGuZ241md6DRU4MbHMS+cbDCvT/+dkncl0yLJ9TPGSlM31zDUsi1174VDq64PHxQq/7aQrOp3lpYmx5eR5uSehYlvvcVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J+6MjSuA; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sayalip@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J+6MjSuA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sayalip@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQhMx5Xxxz2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 16:40:29 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623DnGt1902068;
	Wed, 4 Mar 2026 05:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=67A3pg0hTc457nxQyZL20oNAkSnV71
	N39tvCJxtr63U=; b=J+6MjSuAOLSo0YGthDO8w7pAi5OL2BoATlix4Wh40WExTw
	tbZIiDg0t8qSqeyUguvv2USp8fCd4jlpTZeng6hLaJh13xiZQxwI0gFpWOZzrlBC
	l4TKjTJcBaV+00lkZq9ZxVq/VlQXN+TamnofaK9qkmny11CDAfc+v2dgwvgdE0Fu
	jCLbLX+xvjGGd/9XEQ5dBKo1zcZf4SU/gg3YaOSJsMaQYUIwRbtoXim4GRNLxO91
	gDCLJRzpCRitqWHplrWQwr3ttbah23yzLp3tvsy7fOFpevMWfDkf3Tsg186V+uB+
	se9fAuMJd1x9y9cBz91CuhwPJf4MjLuvOPHjJjUQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksk3wpye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 05:40:24 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6244CMTL029112;
	Wed, 4 Mar 2026 05:40:23 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cmaps5j10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 05:40:23 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6245eL7V16974544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Mar 2026 05:40:22 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C7B0B5805E;
	Wed,  4 Mar 2026 05:40:21 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 766795805A;
	Wed,  4 Mar 2026 05:40:18 +0000 (GMT)
Received: from [9.124.213.19] (unknown [9.124.213.19])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  4 Mar 2026 05:40:18 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------GHleoKl5wnNKoyutiC0QQZSY"
Message-ID: <54350add-111e-4905-b3ed-6f3771485769@linux.ibm.com>
Date: Wed, 4 Mar 2026 11:10:16 +0530
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
Subject: Re: [PATCH v2 1/2] powerpc: fix KUAP warning in VMX usercopy path
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com
Cc: aboorvad@linux.ibm.com, sshegde@linux.ibm.com, riteshh@linux.ibm.com,
        hbathini@linux.ibm.com, ming.lei@redhat.com, csander@purestorage.com,
        czhong@redhat.com, venkat88@linux.ibm.com
References: <20260228135319.238985-1-sayalip@linux.ibm.com>
 <d90efa16-932e-4c29-b8e1-1a4ef08db403@kernel.org>
 <c5138d29-e192-4a6f-b5d2-40d3a29d5bd4@linux.ibm.com>
 <65abe055-38b4-44ec-a7a0-7b4161677ead@kernel.org>
 <5eaa620f-17cb-4ecb-a1bd-eadc7df81574@kernel.org>
 <b605bdcf-fe10-4fe3-9a83-8c542e980a3e@kernel.org>
Content-Language: en-IN
From: Sayali Patil <sayalip@linux.ibm.com>
In-Reply-To: <b605bdcf-fe10-4fe3-9a83-8c542e980a3e@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Uz3yIKYWRfbamkjUZccu-4h6PO06FfPc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA0NCBTYWx0ZWRfX2UGNbVXtoyw7
 7ULRmKyqCG0AaXYD9QKOw0ahezD7HMBybb+oojbMGxFcseKHflOZJD2Nsoy8WvSpjYlN8K/LPCe
 dtxnnC+rlkCDW9HfFBvgDfIgSgFO+zQsVEiwX749uLBcPJ+oHSJSRowDz5en9/Wg0lHrFs64x9X
 DyuRTBIPeEYZaq7lN1Qjo94pnNBm9OKSl+k69tnvLZygCAuSi91KjsKGspFx7d8pmvQXdF0KYk6
 eV1SbYXEanEwgCtdq2dEbxSom7lwoaXacx3tRHjzbnyI0HpFkUi3b0tbKx+Y3q5taZ+y3PZEf+s
 r0KYKVwDBYxzjAUHLRyQJJnM7SCdOSoSrRm7MJaMxxBVsQCGUQXsHNN9qetkUN5AM2r0JbfJalM
 xMxzYSCzpqvc4WgSqxolJPF7Dmx8Sv7ofWOVr0TWQEK0vpnaSIq9eO0FPtqtalW0yrgcFIJ85yO
 kMZMhpr5oSJ1jKq3KBw==
X-Authority-Analysis: v=2.4 cv=csCWUl4i c=1 sm=1 tr=0 ts=69a7c5c8 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=r77TgQKjGQsHNAKrUKIA:9 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=GnkZ_gDUXG9Slg1T1qcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Ck1fYXvvQn9X3tL3HtgA:9 a=GaGYhJaVusYNV2fb:21 a=_W_S_7VecoQA:10
X-Proofpoint-GUID: Uz3yIKYWRfbamkjUZccu-4h6PO06FfPc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040044
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 631BF1FAEC1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-17663-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[sayalip@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:aboorvad@linux.ibm.com,m:sshegde@linux.ibm.com,m:riteshh@linux.ibm.com,m:hbathini@linux.ibm.com,m:ming.lei@redhat.com,m:csander@purestorage.com,m:czhong@redhat.com,m:venkat88@linux.ibm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[sayalip@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

This is a multi-part message in MIME format.
--------------GHleoKl5wnNKoyutiC0QQZSY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 03/03/26 20:47, Christophe Leroy (CS GROUP) wrote:
> Hi once more,
>
> Le 03/03/2026 à 16:10, Christophe Leroy (CS GROUP) a écrit :
>> Hi Again,
>>
>> Le 03/03/2026 à 15:57, Christophe Leroy (CS GROUP) a écrit :
>>> Hi,
>>>
>>> Le 03/03/2026 à 10:19, Sayali Patil a écrit :
>>>>
>>>> On 02/03/26 16:42, Christophe Leroy (CS GROUP) wrote:
>>>>>
>>>> Hi Christophe,
>>>> Thanks for the review.
>>>> With the suggested change, we are hitting a compilation error.
>>>>
>>>> The issue is related to how KUAP enforces the access direction.
>>>> allow_user_access() contains:
>>>>
>>>> BUILD_BUG_ON(!__builtin_constant_p(dir));
>>>>
>>>> which requires that the access direction is a compile-time constant.
>>>> If we pass a runtime value (for example, an unsigned long), the
>>>> __builtin_constant_p() check fails and triggers the following build 
>>>> error.
>>>>
>>>> Error:
>>>> In function 'allow_user_access', inlined from 
>>>> '__copy_tofrom_user_vmx' at arch/powerpc/lib/vmx-helper.c:19:3:
>>>> BUILD_BUG_ON failed: !__builtin_constant_p(dir) 706
>>>>
>>>>
>>>> The previous implementation worked because allow_user_access() was 
>>>> invoked with enum
>>>> constants (READ, WRITE, READ_WRITE), which satisfied the 
>>>> __builtin_constant_p() requirement.
>>>> So in this case, the function must be called with a compile-time 
>>>> constant to satisfy KUAP.
>>>>
>>>> Please let me know if you would prefer a different approach.
>>>>
>>>
>>> Ah, right, I missed that. The problem should only be in vmx-helper.c
>>>
>>
>> Thinking about it once more, I realised that powerpc does not define 
>> INLINE_COPY_FROM_USER nor INLINE_COPY_TO_USER.
>>
>> This means that raw_copy_from_user() and raw_copy_to_user() will in 
>> really not be called much. Therefore __copy_tofrom_user_vmx() could 
>> remain in uaccess.h as static __always_inline allthough it requires 
>> exporting enter_vmx_usercopy() and exit_vmx_usercopy().
>
> That would result in something like:
>
> static __always_inline bool will_use_vmx(unsigned long n)
> {
>     return IS_ENABLED(CONFIG_ALTIVEC) && 
> cpu_has_feature(CPU_FTR_VMX_COPY) &&
>            n > VMX_COPY_THRESHOLD;
> }
>
> static __always_inline unsigned long
> raw_copy_tofrom_user(void __user *to, const void __user *from, 
> unsigned long n, unsigned long dir)
> {
>     unsigned long ret;
>
>     if (will_use_vmx(n) && enter_vmx_usercopy()) {
>         allow_user_access(to, dir);
>         ret = __copy_tofrom_user_power7_vmx(to, from, size);
>         prevent_user_access(dir);
>         exit_vmx_usercopy();
>
>         if (unlikely(ret)) {
>             allow_user_access(to, dir);
>             ret = __copy_tofrom_user_base(to, from, size);
>             prevent_user_access(dir);
>         }
>         return ret;
>     }
>     allow_user_access(to, dir);
>     ret = __copy_tofrom_user(to, from, n);
>     prevent_user_access(dir);
>     return ret;
> }
>
>
> Christophe
>
Thanks Christophe for the review and suggestions. We have incorporated
  these changes in v3.

v3: 
https://lore.kernel.org/all/20260304053506.118632-1-sayalip@linux.ibm.com/
--------------GHleoKl5wnNKoyutiC0QQZSY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 03/03/26 20:47, Christophe Leroy (CS
      GROUP) wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b605bdcf-fe10-4fe3-9a83-8c542e980a3e@kernel.org">Hi once
      more,
      <br>
      <br>
      Le 03/03/2026 à 16:10, Christophe Leroy (CS GROUP) a écrit :
      <br>
      <blockquote type="cite">Hi Again,
        <br>
        <br>
        Le 03/03/2026 à 15:57, Christophe Leroy (CS GROUP) a écrit :
        <br>
        <blockquote type="cite">Hi,
          <br>
          <br>
          Le 03/03/2026 à 10:19, Sayali Patil a écrit :
          <br>
          <blockquote type="cite">
            <br>
            On 02/03/26 16:42, Christophe Leroy (CS GROUP) wrote:
            <br>
            <blockquote type="cite">
              <br>
            </blockquote>
            Hi Christophe,
            <br>
            Thanks for the review.
            <br>
            With the suggested change, we are hitting a compilation
            error.
            <br>
            <br>
            The issue is related to how KUAP enforces the access
            direction.
            <br>
            allow_user_access() contains:
            <br>
            <br>
            BUILD_BUG_ON(!__builtin_constant_p(dir));
            <br>
            <br>
            which requires that the access direction is a compile-time
            constant.
            <br>
            If we pass a runtime value (for example, an unsigned long),
            the
            <br>
            __builtin_constant_p() check fails and triggers the
            following build error.
            <br>
            <br>
            Error:
            <br>
            In function 'allow_user_access', inlined from
            '__copy_tofrom_user_vmx' at
            arch/powerpc/lib/vmx-helper.c:19:3:
            <br>
            BUILD_BUG_ON failed: !__builtin_constant_p(dir) 706
            <br>
            <br>
            <br>
            The previous implementation worked because
            allow_user_access() was invoked with enum
            <br>
            constants (READ, WRITE, READ_WRITE), which satisfied the
            __builtin_constant_p() requirement.
            <br>
            So in this case, the function must be called with a
            compile-time constant to satisfy KUAP.
            <br>
            <br>
            Please let me know if you would prefer a different approach.
            <br>
            <br>
          </blockquote>
          <br>
          Ah, right, I missed that. The problem should only be in
          vmx-helper.c
          <br>
          <br>
        </blockquote>
        <br>
        Thinking about it once more, I realised that powerpc does not
        define INLINE_COPY_FROM_USER nor INLINE_COPY_TO_USER.
        <br>
        <br>
        This means that raw_copy_from_user() and raw_copy_to_user() will
        in really not be called much. Therefore __copy_tofrom_user_vmx()
        could remain in uaccess.h as static __always_inline allthough it
        requires exporting enter_vmx_usercopy() and exit_vmx_usercopy().
        <br>
      </blockquote>
      <br>
      That would result in something like:
      <br>
      <br>
      static __always_inline bool will_use_vmx(unsigned long n)
      <br>
      {
      <br>
          return IS_ENABLED(CONFIG_ALTIVEC) &amp;&amp;
      cpu_has_feature(CPU_FTR_VMX_COPY) &amp;&amp;
      <br>
                 n &gt; VMX_COPY_THRESHOLD;
      <br>
      }
      <br>
      <br>
      static __always_inline unsigned long
      <br>
      raw_copy_tofrom_user(void __user *to, const void __user *from,
      unsigned long n, unsigned long dir)
      <br>
      {
      <br>
          unsigned long ret;
      <br>
      <br>
          if (will_use_vmx(n) &amp;&amp; enter_vmx_usercopy()) {
      <br>
              allow_user_access(to, dir);
      <br>
              ret = __copy_tofrom_user_power7_vmx(to, from, size);
      <br>
              prevent_user_access(dir);
      <br>
              exit_vmx_usercopy();
      <br>
      <br>
              if (unlikely(ret)) {
      <br>
                  allow_user_access(to, dir);
      <br>
                  ret = __copy_tofrom_user_base(to, from, size);
      <br>
                  prevent_user_access(dir);
      <br>
              }
      <br>
              return ret;
      <br>
          }
      <br>
          allow_user_access(to, dir);
      <br>
          ret = __copy_tofrom_user(to, from, n);
      <br>
          prevent_user_access(dir);
      <br>
          return ret;
      <br>
      }
      <br>
      <br>
      <br>
      Christophe <br>
      <br>
    </blockquote>
    <font face="monospace" size="4">Thanks Christophe for the review and
      suggestions. We have incorporated<br aria-hidden="true">
       these changes in v3.<br>
      <br aria-hidden="true">
      v3:
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/20260304053506.118632-1-sayalip@linux.ibm.com/">https://lore.kernel.org/all/20260304053506.118632-1-sayalip@linux.ibm.com/</a> </font>
  </body>
</html>

--------------GHleoKl5wnNKoyutiC0QQZSY--


