Return-Path: <linuxppc-dev+bounces-12946-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 173F3BE3E9C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Oct 2025 16:30:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnVk74D6xz3bvd;
	Fri, 17 Oct 2025 01:30:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760625055;
	cv=none; b=dMcwOC32bh5HvqlAPp9cLf6wb/fahyiR0T8pqwF/haDCQp5h2jTveXfgYMdlAf6JnstufzhFR6RC13rgs3QtjTbX8EmTVSLTik0Y/oHDu900TgpEwhV/k0j0xSKnICu/ZMO7rpT34TcU3JXbnEUmv1SMXX+JAHRWojXSO5SONqkQ+PhceWGNS1ewr4XK3fZ0M2usBQcvVIXZvX+rvCnuAmxlbegspQm8Aaejcm9C9dJLvBPiMK+3G2+NMKOkb7WFch/gYP8Ho5S2CukflXqjCaUio4B+mBM3cGEOGEZ/tj40r8gMg7GyuGP7FFxjonNoKApAv+DAYBzkKQomR7Y0mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760625055; c=relaxed/relaxed;
	bh=OJ5tOUw8/UzVF1GEEaRRUCl/HTRiZBZEsYxOJDd0WXg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=ifRkM65PUMs4G770slLZjD/sonlwjFDhMTc6KXE5sil1yP4TPvVudKkEwAghydbcgK1XtRwaLb8IXMfGV5vrqW/MYZuxxex2bgRvAGEgWl0PgfjEEltaQIAI7hPBDACjO2dQfCMdAwGhs5ENx9R/H7MGHThO1AXAkDo2kNwu2Xs7ZqtIRVabyWjZshgFeHfras71I7CRzvJkx/Zx3O5S+Ui1ZIuD8B2QGECIMJYhcUB7svDpgnY/uBTne18jCZI3p12PEFfJTBzVP0v9q5RX3AxFyOe67zl1iXuC3hCiq058egsbeINUGfhXbhcQr135JvZ/f3Zdy/ckw+60QbPYsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CmxDICrl; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CmxDICrl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnVk64jbbz2yQH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 01:30:54 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GDSjuM021062;
	Thu, 16 Oct 2025 14:30:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=OJ5tOU
	w8/UzVF1GEEaRRUCl/HTRiZBZEsYxOJDd0WXg=; b=CmxDICrlv3hQMiAYcaUoPc
	ZnEXYlxVBI5MKnCb37hW5nw8nVTZKdCKpuG2oGwcOHa+9EKWPqBdFet2oTwI7h32
	UIBFtOjrk3LdLz5X1kjQ8eHdIWQ+aHlBx7Y/u6yxhrEWG5/5N3R85R5zcovoFnXG
	frHF/d04VkH1PFUnd0epu6xpzym+PhQ5Ji9Ey1Ooe3eg2RinNAjuOUlSJJLPuT5M
	5mjTqm2CV9/+Eh8rxpQi1nGw6O67H6qx6FpIWcx+40mc0A7iWjwIkgZoZFzoLw7/
	YWTyvxR4ynhWW3zYHj2KfNnDgtMqg1vmBUBT3iQVbiWOfa1X5Hpflyf4Pkq8bucw
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49qew0a3xq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Oct 2025 14:30:51 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59GEBnSf028069;
	Thu, 16 Oct 2025 14:30:50 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 49tdg9dcts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Oct 2025 14:30:50 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59GEUlE850725338
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Oct 2025 14:30:47 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5600E200D9;
	Thu, 16 Oct 2025 14:30:47 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B074200DD;
	Thu, 16 Oct 2025 14:30:46 +0000 (GMT)
Received: from [9.109.204.116] (unknown [9.109.204.116])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 Oct 2025 14:30:45 +0000 (GMT)
Message-ID: <6f213521-6baa-47a3-91bd-6ec54acca076@linux.ibm.com>
Date: Thu, 16 Oct 2025 20:00:45 +0530
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
Subject: Re: [mainline]Kernel Boot Warings at arch/powerpc/mm/mem.c:341
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>, Baoquan He <bhe@redhat.com>
References: <90937fe0-2e76-4c82-b27e-7b8a7fe3ac69@linux.ibm.com>
 <7b9f9ca0-a6d8-40d0-8195-bbf81377e866@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <7b9f9ca0-a6d8-40d0-8195-bbf81377e866@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XWs6YeKTHds7XJr-JvTYslgJYu5Zc9bq
X-Authority-Analysis: v=2.4 cv=eJkeTXp1 c=1 sm=1 tr=0 ts=68f1019b cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=fuU_RVYCY8Oo3qyU2PcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNCBTYWx0ZWRfX5dJQRUVl/9N6
 5GFzd2QvX26vCvv4nUnVv6ftSNHQNJ2uD3+lhu7dcW2Y8gcnsp8tyEeWUIHOvetbuXx+aNcuX2d
 usG1++ngxzaR2/l2YquEg7Aux9biW8IM/gVWyHTOWXEIOyDB2rSasWGXGVVs2whbBNvFLyoflYO
 Ohcg4x76Y0LyaOc+QDJ+H1ADf3lsZZSsrr+t8ZEQV0C8sexTpLjTJ8C1otD3DKR5LAXnxRYLUX6
 v+cTnPQ9289H7bKSZrXXf2ydtjTqkDR4kbsPsBpkkfZEwzdCh3EhNwUtY3cyNY/bnYfwQJtw/Qm
 Bc1SO6lGji+5k6HCgyIjBnSY7vEQMCkkKOAFK9azN9l0vhsYG7dg5lwNXiMteTKpzd0VjsJi/BR
 ic1u5aB0BmlLdO3KSKhVTUAwhkNNRg==
X-Proofpoint-GUID: XWs6YeKTHds7XJr-JvTYslgJYu5Zc9bq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110014
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Venkat,

On 16/10/25 15:21, Sourabh Jain wrote:
>
>
> On 10/10/25 11:15, Venkat Rao Bagalkote wrote:
>> Greetings!!!
>>
>>
>> IBM CI has reported kernel boot warnings on the mainline kernel on 
>> IBM Power11 system.
>>
>>
>> Attached is the .config file.
>>
>> Traces:
>>
>>
>> [    0.040098] plpks: POWER LPAR Platform KeyStore is not supported 
>> or enabled
>> [    0.043041] ------------[ cut here ]------------
>> [    0.043045] WARNING: CPU: 0 PID: 1 at arch/powerpc/mm/mem.c:341 
>> add_system_ram_resources+0xfc/0x180
>> [    0.043058] Modules linked in:
>> [    0.043065] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 
>> 6.17.0-auto-12607-g5472d60c129f #1 VOLUNTARY
>> [    0.043072] Hardware name: IBM,9080-HEX Power11 (architected) 
>> 0x820200 0xf000007 of:IBM,FW1110.01 (NH1110_069) hv:phyp pSeries
>> [    0.043078] NIP:  c00000000201de3c LR: c00000000201de34 CTR: 
>> 0000000000000000
>> [    0.043082] REGS: c000000127cef8a0 TRAP: 0700   Not tainted 
>> (6.17.0-auto-12607-g5472d60c129f)
>> [    0.043088] MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 
>> 84000840  XER: 20040010
>> [    0.043099] CFAR: c00000000017eed0 IRQMASK: 0
>> [    0.043099] GPR00: c00000000201de34 c000000127cefb40 
>> c0000000016a8100 0000000000000001
>> [    0.043099] GPR04: c00000012005aa00 0000000020000000 
>> c000000002b705c8 0000000000000000
>> [    0.043099] GPR08: 000000007fffffff fffffffffffffff0 
>> c000000002db8100 000000011fffffff
>> [    0.043099] GPR12: c00000000201dd40 c000000002ff0000 
>> c0000000000112bc 0000000000000000
>> [    0.043099] GPR16: 0000000000000000 0000000000000000 
>> 0000000000000000 0000000000000000
>> [    0.043099] GPR20: 0000000000000000 0000000000000000 
>> 0000000000000000 c0000000015a3808
>> [    0.043099] GPR24: c00000000200468c c000000001699888 
>> 0000000000000106 c0000000020d1950
>> [    0.043099] GPR28: c0000000014683f8 0000000081000200 
>> c0000000015c1868 c000000002b9f710
>> [    0.043138] NIP [c00000000201de3c] 
>> add_system_ram_resources+0xfc/0x180
>> [    0.043143] LR [c00000000201de34] add_system_ram_resources+0xf4/0x180
>> [    0.043148] Call Trace:
>> [    0.043150] [c000000127cefb40] [c00000000201de34] 
>> add_system_ram_resources+0xf4/0x180 (unreliable)
>> [    0.043157] [c000000127cefba0] [c000000000010eb4] 
>> do_one_initcall+0x60/0x36c
>> [    0.043162] [c000000127cefc80] [c0000000020068cc] 
>> do_initcalls+0x120/0x220
>> [    0.043169] [c000000127cefd30] [c000000002006cbc] 
>> kernel_init_freeable+0x23c/0x390
>> [    0.043174] [c000000127cefde0] [c0000000000112e8] 
>> kernel_init+0x34/0x26c
>> [    0.043178] [c000000127cefe50] [c00000000000df7c] 
>> ret_from_kernel_user_thread+0x14/0x1c
>> [    0.043181] ---- interrupt: 0 at 0x0
>> [    0.043186] Code: 3d02010c e9210028 e9410020 fb840010 fba40018 
>> 38685b48 3929ffff f9440000 f9240008 4a161035 60000000 54630ffe 
>> <0b030000> 39210028 39400000 39010020
>> [    0.043197] ---[ end trace 0000000000000000 ]---
>> [    0.043202] ------------[ cut here ]------------
>> [    0.043203] WARNING: CPU: 0 PID: 1 at arch/powerpc/mm/mem.c:341 
>> add_system_ram_resources+0xfc/0x180
>> [    0.043209] Modules linked in:
>> [    0.043212] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G W      
>>      6.17.0-auto-12607-g5472d60c129f #1 VOLUNTARY
>> [    0.043217] Tainted: [W]=WARN
>> [    0.043219] Hardware name: IBM,9080-HEX Power11 (architected) 
>> 0x820200 0xf000007 of:IBM,FW1110.01 (NH1110_069) hv:phyp pSeries
>> [    0.043223] NIP:  c00000000201de3c LR: c00000000201de34 CTR: 
>> 0000000000000000
>> [    0.043226] REGS: c000000127cef8a0 TRAP: 0700   Tainted: G W       
>>     (6.17.0-auto-12607-g5472d60c129f)
>> [    0.043229] MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 
>> 84000440  XER: 20040010
>> [    0.043237] CFAR: c00000000017eed0 IRQMASK: 0
>> [    0.043237] GPR00: c00000000201de34 c000000127cefb40 
>> c0000000016a8100 0000000000000001
>> [    0.043237] GPR04: c00000012005a9c0 0000000020000000 
>> c000000002b705c8 0000000080000000
>> [    0.043237] GPR08: 000000257fffffff fffffffffffffff0 
>> c000000002db8100 000000011fffffff
>> [    0.043237] GPR12: c00000000201dd40 c000000002ff0000 
>> c0000000000112bc 0000000000000000
>> [    0.043237] GPR16: 0000000000000000 0000000000000000 
>> 0000000000000000 0000000000000000
>> [    0.043237] GPR20: 0000000000000000 0000000000000000 
>> 0000000000000000 c0000000015a3808
>> [    0.043237] GPR24: c00000000200468c c000000001699888 
>> 0000000000000106 c0000000020d1950
>> [    0.043237] GPR28: c0000000014683f8 0000000081000200 
>> c0000000015c1868 c000000002b9f710
>> [    0.043271] NIP [c00000000201de3c] 
>> add_system_ram_resources+0xfc/0x180
>> [    0.043276] LR [c00000000201de34] add_system_ram_resources+0xf4/0x180
>> [    0.043280] Call Trace:
>> [    0.043281] [c000000127cefb40] [c00000000201de34] 
>> add_system_ram_resources+0xf4/0x180 (unreliable)
>> [    0.043287] [c000000127cefba0] [c000000000010eb4] 
>> do_one_initcall+0x60/0x36c
>> [    0.043291] [c000000127cefc80] [c0000000020068cc] 
>> do_initcalls+0x120/0x220
>> [    0.043296] [c000000127cefd30] [c000000002006cbc] 
>> kernel_init_freeable+0x23c/0x390
>> [    0.043301] [c000000127cefde0] [c0000000000112e8] 
>> kernel_init+0x34/0x26c
>> [    0.043305] [c000000127cefe50] [c00000000000df7c] 
>> ret_from_kernel_user_thread+0x14/0x1c
>> [    0.043308] ---- interrupt: 0 at 0x0
>> [    0.043311] Code: 3d02010c e9210028 e9410020 fb840010 fba40018 
>> 38685b48 3929ffff f9440000 f9240008 4a161035 60000000 54630ffe 
>> <0b030000> 39210028 39400000 39010020
>> [    0.043322] ---[ end trace 0000000000000000 ]---
>> [    0.043520] kprobes: kprobe jump-optimization is enabled. Al
>

Please try the below fix:
https://lore.kernel.org/all/20251016142831.144515-1-sourabhjain@linux.ibm.com/

Thanks,
Sourabh Jain


