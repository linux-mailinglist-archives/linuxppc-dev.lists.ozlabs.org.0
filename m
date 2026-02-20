Return-Path: <linuxppc-dev+bounces-16988-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGtqETwTmGkA/wIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16988-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 08:54:36 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5CE1656F9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 08:54:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fHMw64zRSz30Lv;
	Fri, 20 Feb 2026 18:54:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771574070;
	cv=none; b=I0zLIJZzg8V0F15ytQ2MO1C4dRsyql+nxkLwzXeI/mphNcsC8TldDgwAU5mEtU4v7UOIszhPrrsnuOlGObwgiuaYJDYZsTWmakut8yVwSpXp/LHSR6015tDZz3Jnl0Ofy/FKgTG4KgoEgmKHxFCFlSovPaNO+bd3AIsh2kCaXQAbzwyfJtneYxeW1zCgzfnn2MPvMLrN+5IHHOWCyQXTF3vpdtVtsl35h/fwh8ifLwC/dAqniz+cb+D1lHLW1uUFPISJrO8TlwO50RzlwZ4gZ16ehq0lyhSAGLl2AAMmIvFWIvitVxKFMgzBCFPflcyqKO+OA8kk6tfS8njV/KU0cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771574070; c=relaxed/relaxed;
	bh=9B/7hb8qnzchjXpMRMoTAJ6Z/aC5V/uWzL6mg+l56lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UD6D+sTtmO6fBP3q2ydNM/awarLFCj/xNiMXik1JZLKbIEz0k2ZxRov57Qtcq6D1AobPcYmUUoGPMCCyKFXPzrvfu8l8oUfKgSwtqXbEePbjudZzHLcicQKuX8khbEPqeZG2be8ogfNI2as6B2TS0fupAsjMDAhOHshcD5b183MYFfz3xf0JNGx0BG/p+mSapFxRvsr24+/14YbMGLNbowVjTziWCztGl2YPnEeuQ88k+8e/4IzKtxVA5bV98kQ4BfzrADpLRoLskkLMfJqWxMvsdgI0UvgekRnyd3mJAUV/P4OhvUjx9g3UVrGaR1Xj5JHMMjJS87Ixht5Ly48jyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BqMeMoVb; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BqMeMoVb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fHMw409kRz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 18:54:27 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JLd8mD1272946;
	Fri, 20 Feb 2026 07:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=9B/7hb
	8qnzchjXpMRMoTAJ6Z/aC5V/uWzL6mg+l56lw=; b=BqMeMoVbtUOsYxqaObDlBe
	Wr8GPvvUmPWoH8BxPikpqtVcHwJCLQg7y4bF+PQkcM9mT/QObjuxVtplwu5PrUce
	yvJWUYpxtO8rnpbhgQdNgNfC/1D9QjSCSbPXrnckRfUKAd+YX93DIMzJNmZDX8PU
	P4t5J2BzZ1hz3Ue7hmqWlUumOgpnEMZPUZaKWF9F4qAarWhYyS1CtA9Kqq4lVWFw
	L07WNWNLgkpwg0aAtRemsai33R/Ooqgp5HRDRjMI/du95/RmC3zJL6ZdIOkEXYu8
	O1euAxOFmveDot0tyyiZY/c39DcZ5SScuGUC8EA7MlrdQrOgR30V0jMT8F9QtRcA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4caj6v1yr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Feb 2026 07:54:13 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61K3LrLH001381;
	Fri, 20 Feb 2026 07:54:12 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ccb2bqjux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Feb 2026 07:54:12 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61K7sBAg43974914
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Feb 2026 07:54:11 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0531D2004F;
	Fri, 20 Feb 2026 07:54:11 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7697D20040;
	Fri, 20 Feb 2026 07:54:09 +0000 (GMT)
Received: from [9.43.64.63] (unknown [9.43.64.63])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Feb 2026 07:54:09 +0000 (GMT)
Message-ID: <38e1160d-26ea-4432-9ca4-1c606dd187ac@linux.ibm.com>
Date: Fri, 20 Feb 2026 13:24:08 +0530
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
Subject: Re: [**EXTERNAL**] Re: [PPC][Tracing] Missing syscalls:* ftrace/perf
 events on PowerPC vs x86
To: "Nassiri, Mohammad" <mnassiri@ciena.com>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Cc: "linux-trace-users@vger.kernel.org" <linux-trace-users@vger.kernel.org>,
        "michael@ellerman.id.au" <michael@ellerman.id.au>,
        "masami.hiramatsu@linaro.org" <masami.hiramatsu@linaro.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>,
        "rostedt@goodmis.org" <rostedt@goodmis.org>
References: <CH2PR04MB6821DAF7C6684BB990A0288BC56DA@CH2PR04MB6821.namprd04.prod.outlook.com>
 <b9ddf051-f6eb-489a-b199-6d47f5a21395@linux.ibm.com>
 <CH2PR04MB682162D39BB7E7EB0F0695AFC56AA@CH2PR04MB6821.namprd04.prod.outlook.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <CH2PR04MB682162D39BB7E7EB0F0695AFC56AA@CH2PR04MB6821.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=E+/AZKdl c=1 sm=1 tr=0 ts=69981326 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=LLT6BWlwgZta6rkdNHgA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA2NSBTYWx0ZWRfX6Le9XcDDB8Tp
 J+94kwDeNddJlL7HMdPkti/io7zUTECmmlkWC7AQ/vLSxEhrgoio6SH6lwJz7R9pcUj5qKCuUyj
 AJrkW640I+sdQBtMGBezMW5FRNItZQMLHUzvBYx3V7Y8xAhdLXNbb9rTZ8qWgRGInSw7/kVJiVw
 emsnH6X0NHowIYsS3fsMy1nRg0z+51cgFyUpxLpOZcuR8X4lPszlPOTZhJxv2+8yuSHb2KGLX56
 ASWLeKuLPbejKeVMppoH7DE3w6awOjL0UwOweCef+FHdkj14EoLo8uVsIZOwc7hWJD+UHbHYYAW
 RrAx8lJb5TQVcP6ZdGgQh0LbcDgndkAA7tEtYp67/PbemPrB0d/p3XoN4UY7kQs857bE68/Y0Ri
 uuJVnPRjcXd+tnYEthyyyZi4Z72KIhwJdXomKpaORlszXIU9OJjtWSX6IBV1F4A4SEkzITWLXSb
 LN9M/xqkK2DU4+BgGlA==
X-Proofpoint-ORIG-GUID: qzl4K7hNP99o3BV7NJJ0dQgqHGvZ9M3Q
X-Proofpoint-GUID: xbpv6gywsATTZen3E-gHKUxudlViQETg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200065
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
	TAGGED_FROM(0.00)[bounces-16988-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,ellerman.id.au,linaro.org,csgroup.eu,gmail.com,goodmis.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mnassiri@ciena.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-trace-users@vger.kernel.org,m:michael@ellerman.id.au,m:masami.hiramatsu@linaro.org,m:christophe.leroy@csgroup.eu,m:npiggin@gmail.com,m:rostedt@goodmis.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8F5CE1656F9
X-Rspamd-Action: no action



On 18/02/26 7:26 pm, Nassiri, Mohammad wrote:
>> You should see syscall enter/exit tracepoints on v5.10.x without syscall
>> wrapper patchset referred above. Are you using v5.10.250 ?
>> Also, would help, if you can share the .config you used.
> Hi Hari,

Hi Mohammad,

> 
> No, I'm not using the latest v5.10.250. I tested on two versions --- v5.10.174 and v5.10.239 --- and I still see the issue on both.
> For your reference, here is a grep from my .config showing most of the tracing options I enabled while troubleshooting this issue.

OK. Tried v5.10.250 as well as v5.10.174 with the similar config
options. Could see syscall enter/exit tracepoints..

- Hari

