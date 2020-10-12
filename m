Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0718228B370
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 13:10:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C8wv55Mj5zDqf9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 22:10:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IGC2twWW; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C8wrs0nM9zDqLh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Oct 2020 22:08:12 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09CB2oFC025334; Mon, 12 Oct 2020 07:08:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=b6Bcgl76TV5SJpvDJMe4I0lHXQjYhSuuwo7LIMRpl/w=;
 b=IGC2twWWpMrGUzOBb7OJQeSZXs3qojAeZ10heTbjJiqmmJ6b0+NpNR3mAPO39v+FL7qY
 x6ESjS3efaP/22FKGzE8ZU93KplXy+HhkN2WP8CYajRJj+AIJL9aDXMF0RJsIFtqJ1JD
 BpkwvgTZKdg/LhCulLbPYYhn4HkprGQt7EXXdpidjm9QnG58XBLK8tzvskgo79kt6F7S
 fj72o6Lsu7WGxsxHVKz+SU077t9ZVIyR7l4Th1ZSDY7bBJYHIrEhwpCLV+WgEdpHVelU
 38hVeBWTjpmbJoeEyNlQOpx5zxuMF/6rBTJedrOHjRKrkcZL/68JpAI4uVi0dcv4u6HV nQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 344nw70754-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 07:08:06 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09CB2qxP025687;
 Mon, 12 Oct 2020 07:08:06 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 344nw70745-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 07:08:06 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09CB2g2c014765;
 Mon, 12 Oct 2020 11:08:04 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3434k7s0aa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 11:08:04 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09CB813d23527866
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Oct 2020 11:08:01 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BC39A4051;
 Mon, 12 Oct 2020 11:08:01 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 818C8A4040;
 Mon, 12 Oct 2020 11:07:58 +0000 (GMT)
Received: from [9.199.40.187] (unknown [9.199.40.187])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 12 Oct 2020 11:07:58 +0000 (GMT)
Subject: Re: [PATCH v5 1/5] powerpc/sstep: Emulate prefixed instructions only
 when CPU_FTR_ARCH_31 is set
To: Daniel Axtens <dja@axtens.net>
References: <20201011050908.72173-1-ravi.bangoria@linux.ibm.com>
 <20201011050908.72173-2-ravi.bangoria@linux.ibm.com>
 <87h7r0w6s0.fsf@dja-thinkpad.axtens.net>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Message-ID: <41dda593-0fc6-569e-2243-189d84653b4a@linux.ibm.com>
Date: Mon, 12 Oct 2020 16:37:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87h7r0w6s0.fsf@dja-thinkpad.axtens.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-12_08:2020-10-12,
 2020-10-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010120088
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, bala24@linux.ibm.com,
 paulus@samba.org, sandipan@linux.ibm.com, jniethe5@gmail.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Daniel,

On 10/12/20 7:21 AM, Daniel Axtens wrote:
> Hi,
> 
> Apologies if this has come up in a previous revision.
> 
> 
>>   	case 1:
>> +		if (!cpu_has_feature(CPU_FTR_ARCH_31))
>> +			return -1;
>> +
>>   		prefix_r = GET_PREFIX_R(word);
>>   		ra = GET_PREFIX_RA(suffix);
> 
> The comment above analyse_instr reads in part:
> 
>   * Return value is 1 if the instruction can be emulated just by
>   * updating *regs with the information in *op, -1 if we need the
>   * GPRs but *regs doesn't contain the full register set, or 0
>   * otherwise.
> 
> I was wondering why returning -1 if the instruction isn't supported the
> right thing to do - it seemed to me that it should return 0?
> 
> I did look and see that there are other cases where the code returns -1
> for an unsupported operation, e.g.:
> 
> #ifdef __powerpc64__
> 	case 4:
> 		if (!cpu_has_feature(CPU_FTR_ARCH_300))
> 			return -1;
> 
> 		switch (word & 0x3f) {
> 		case 48:	/* maddhd */
> 
> That's from commit 930d6288a267 ("powerpc: sstep: Add support for
> maddhd, maddhdu, maddld instructions"), but it's not explained there either
> 
> I see the same pattern in a number of commits: commit 6324320de609
> ("powerpc sstep: Add support for modsd, modud instructions"), commit
> 6c180071509a ("powerpc sstep: Add support for modsw, moduw
> instructions"), commit a23987ef267a ("powerpc: sstep: Add support for
> darn instruction") and a few others, all of which seem to have come
> through Sandipan in February 2019. I haven't spotted any explanation for
> why -1 was chosen, but I haven't checked the mailing list archives.
> 
> If -1 is OK, would it be possible to update the comment to explain why?

Agreed. As you rightly pointed out, there are many more such cases and, yes,
we are aware of this issue and it's being worked upon as a separate patch.
(Sandipan did send a fix patch internally some time back).

Thanks for pointing it out!
Ravi
