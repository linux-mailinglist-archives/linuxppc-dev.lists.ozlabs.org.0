Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6A42FCDDD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 11:43:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLMZ616K8zDr0Q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 21:43:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ananth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=S+Mh4fSj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLMW90r6kzDqjJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 21:40:52 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10KAY3SE048881; Wed, 20 Jan 2021 05:40:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=reply-to : subject : to
 : cc : references : from : message-id : date : mime-version : in-reply-to
 : content-type : content-transfer-encoding; s=pp1;
 bh=8++pGJf/Clt0cynxYOGvy1l4umy5Y9j+DcwBRJCA2HA=;
 b=S+Mh4fSj6I7B8MbZ20nMTwLESGZXfl/Hkd/87D0OW5c9B2inTmWT/FkgS37GT0dGkz4w
 tsgJb9z+V3J59ZOBebBlxBgt7fQ6QF1Y/aLakNDb88ZFgz7atm5uZsm2iyf6zC+c5EG1
 pc8S/2y88ZsDhMQ76bWZ8+QKvI5TiJItlLkIGI4qs+9QFUvOUJIZ51KCapdW6lCbo39C
 aDfHgSCYkL2kqDNPKZOiwhCsRBrIxrv7N7qdo/pd6uJeMACGY2MGjjWXo7pu2ztlI+Sc
 5z+PJJvt8pdUR1kVjuZrCzN8H4KobVCn8XvEcWwC4SkF9d5616hULicgodD3+E+pNoiY sQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 366j321kyb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 05:40:46 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10KAcQ0u023872;
 Wed, 20 Jan 2021 10:40:46 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 3668ps4ca7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 10:40:46 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10KAeiwr13370044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 10:40:44 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53A68C6059;
 Wed, 20 Jan 2021 10:40:44 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F308C6055;
 Wed, 20 Jan 2021 10:40:42 +0000 (GMT)
Received: from [9.102.3.213] (unknown [9.102.3.213])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 20 Jan 2021 10:40:42 +0000 (GMT)
Subject: Re: [PATCH] [PATCH] powerpc/sstep: Check ISA 3.0 instruction validity
 before emulation
To: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
References: <161113596420.206556.5023431229030762544.stgit@thinktux.local>
 <20210120101445.GA80@DESKTOP-TDPLP67.localdomain>
From: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
Organization: IBM
Message-ID: <d067aaa7-7d5b-55f4-18fa-bc992ed51383@linux.ibm.com>
Date: Wed, 20 Jan 2021 16:10:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120101445.GA80@DESKTOP-TDPLP67.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-20_02:2021-01-18,
 2021-01-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101200060
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
Reply-To: ananth@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, ravi.bangoria@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/20/21 3:44 PM, Naveen N. Rao wrote:
> On 2021/01/20 03:16PM, Ananth N Mavinakayanahalli wrote:
...

>> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
>> index bf7a7d62ae8b..ed119858e5e9 100644
>> --- a/arch/powerpc/lib/sstep.c
>> +++ b/arch/powerpc/lib/sstep.c
>> @@ -1528,6 +1528,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>>   		goto compute_done;
>>   
>>   	case 19:
>> +		if (!cpu_has_feature(CPU_FTR_ARCH_300))
>> +			return -1;
>>   		if (((word >> 1) & 0x1f) == 2) {
>>   			/* addpcis */
>>   			imm = (short) (word & 0xffc1);	/* d0 + d2 fields */
> 
> The cpu feature check should be within the if condition above since
> there are other instructions under opcode 19. This is not an issue right
> now as we don't emulate any of the others after this point, but it would
> be good to restrict the change to specific instructions.
> 
> Rest of the changes below look good to me. The only other v3.0
> instruction we need to gate is the 'scv' instruction. It would be good
> to handle that too.

I missed this in v2.. will send a v3. There is a bigger change needed to
accommodate scv since we currently don't check for it in analyze_insn().

-- 
Ananth
