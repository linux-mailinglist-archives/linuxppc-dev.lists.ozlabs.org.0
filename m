Return-Path: <linuxppc-dev+bounces-13776-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 911BCC33D79
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 04:34:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1WCT33fBz30Qk;
	Wed,  5 Nov 2025 14:34:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762313669;
	cv=none; b=WbrRTzVVfOjBTpUqsdq0BuYjXCfDPms3F7dCiw4qbjKZE37czt5L/GyyPrIduQ5taEHX+iLHP/90tGuo+414YJpXWTqf0SMb5+slOi9IZ/aN7F8LRGifNVflC7zckXd1hed46vPsMphRwTnH/FxyQcHUhLXBoCoOMTN3vs1OpIRBGKn0RNO4F158pASawS0GtwYFzbmDqpCNzTbUz4LEZfJeymNdzQ3PbpCa7QWvnD51le7cNWIq50pu0R/Amjw/0+dVexzdJGBA39CJN5ZrSd2vbHeG8aBPlDeInfsDPyt+2l5x/INdyRFGrh3pdIGRgujFeFU6RE3I/vvsp4L2zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762313669; c=relaxed/relaxed;
	bh=mqwLGxE4Y564ZewohM8e+2lOgfE4v+q7gK0OGvckDt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i8MDYvOF59WmYUWoQumznyBQXGEp2m4FOzCqsffQrJfqSbgr5aSr1kPh1/XwtlvnOVv6To/znn41ZAiODDWzDuGm8zyW6R1io6UPyNjPE+528GIh7emDHrxsWeDIs2vuPc0/uBNB0oHd2UbrqJ5OfcA/18yNfN0sBoCAG5/74s+SXfB+OX/OQxGsmgFJF1X4YSoSDwExbqAkhoer3Cc1/XhPl4wfTmP2DuEnAJ0dh+btvxz4XYJKtz2z/Aeml8sgTIJO0PxZT+kXUo2l/TPzjAw00CAVyZ80a7l79xu1LgnTE0VQ+9QvKNoEfIadL8d5pV0/+7bA+yqjjnPpMgJFYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fsh1zd9X; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fsh1zd9X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1WCR6Tlwz306d
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 14:34:27 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A4EgECR024476;
	Wed, 5 Nov 2025 03:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=mqwLGx
	E4Y564ZewohM8e+2lOgfE4v+q7gK0OGvckDt4=; b=Fsh1zd9XmM+0Qw5AshzRsz
	Gm3WrqmmPdjasc5DhPIlxPkc0zyRd28dbqtSNgmszN6AG18OZx++I7ERTsxWUD9G
	pnxa0RnFKqJMCieG5Iet3ObncZlkpfZSrICpywsY49OOBHlh/oz2lJM0AoWJv5wa
	ObDVX+z398WMx4K0rY4HatkaGdj5t097nbzN9xQeIShY0KjDIf416745mmG2vUk2
	F2ukfci6aU5Ym3gvAtsj3dOM8UZDv2o2IoejlXCj3HjhfIg5SvAP2bHnNffIgCeZ
	x1rTNVQYTHIfXxKLqdXZEWg4ATd0LlcTzA/CznUXsOXeE4JbeXswRAQfTxDv8KyQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59vuf6qe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 03:34:20 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A530ZDI009855;
	Wed, 5 Nov 2025 03:34:19 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a5x1ke6ew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 03:34:19 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A53YH7B59769142
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Nov 2025 03:34:17 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57CD420043;
	Wed,  5 Nov 2025 03:34:17 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C732F20040;
	Wed,  5 Nov 2025 03:34:15 +0000 (GMT)
Received: from [9.109.204.116] (unknown [9.109.204.116])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Nov 2025 03:34:15 +0000 (GMT)
Message-ID: <a81bf9c0-f8c8-49f9-965d-26f704a73517@linux.ibm.com>
Date: Wed, 5 Nov 2025 09:03:43 +0530
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
Subject: Re: [PATCH 0/2] Export kdump crashkernel CMA ranges
To: Baoquan he <bhe@redhat.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
        Jiri Bohac <jbohac@suse.cz>, Shivang Upadhyay <shivangu@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org
References: <20251103035859.1267318-1-sourabhjain@linux.ibm.com>
 <aQrBbYVEQleExjpk@MiWiFi-R3L-srv>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <aQrBbYVEQleExjpk@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HXZlabnTa8h_DEIcxvl6Sm-kK7acfCMs
X-Proofpoint-GUID: HXZlabnTa8h_DEIcxvl6Sm-kK7acfCMs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyMSBTYWx0ZWRfX/2AOhhSIVWQ3
 CEMlQwF3PoJSFF8N6w/iSrlQZ7dH9aqMHwpp6EAayXxRCihpo2E+PpouVBw/L4wmuBokZSRU3Y9
 VWx6Z5TFWqNJwggDUgDUMkW2t9bloYQpA5VoIshtPdqjOWfxlQJHXzsZVYX0ofHtT9d/qNA9G4g
 bN4sjRu2oChRnZmA+3iW5eDQNoF9gazfJY2UlR7dtYKL5YZQcCTk85zg7AJ/dSkdCEutsyTHJnM
 LsFv+idoiWRcjDSW9wRj3802H6uRnqKxa7YO2cnyi5cNbLOKGXLiB1te07/cptx25ISLlO/dCiF
 ykzxtk4L24YlaTHi3y73Vwx9EMsHqHCvaZ2xaf/2Bq8phBDw9+RddWG1PN321EhNFpPDCcYnAHp
 8GvFpss+rLobSzBRzYDKw+EwC6OnVA==
X-Authority-Analysis: v=2.4 cv=U6qfzOru c=1 sm=1 tr=0 ts=690ac5bc cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=XWi_oYZyp0CedhVi0gkA:9 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_02,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511010021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 05/11/25 08:45, Baoquan he wrote:
> On 11/03/25 at 09:28am, Sourabh Jain wrote:
>> /sys/kernel/kexec_crash_cma_ranges to export all CMA regions reserved
>> for the crashkernel to user-space. This enables user-space tools
>> configuring kdump to determine the amount of memory reserved for the
>> crashkernel. When CMA is used for crashkernel allocation, tools can use
>> this information to warn users that attempting to capture user pages
>> while CMA reservation is active may lead to unreliable or incomplete
>> dump capture.
>>
>> While adding documentation for the new sysfs interface, I realized that
>> there was no ABI document for the existing kexec and kdump sysfs
>> interfaces, so I added one.
>>
>> The first patch adds the ABI documentation for the existing kexec and
>> kdump sysfs interfaces, and the second patch adds the
>> /sys/kernel/kexec_crash_cma_ranges sysfs interface along with its
>> corresponding ABI documentation.
>>
>> *Seeking opinions*
>> There are already four kexec/kdump sysfs entries under /sys/kernel/,
>> and this patch series adds one more. Should we consider moving them to
>> a separate directory, such as /sys/kernel/kexec, to avoid polluting
>> /sys/kernel/? For backward compatibility, we can create symlinks at
>> the old locations for sometime and remove them in the future.
> That sounds a good idea, will you do it in v2? Because otherwise the
> kexec_crash_cma_ranges need be moved too.

Yes I will include it in v2.

Thanks,
Sourabh Jain


