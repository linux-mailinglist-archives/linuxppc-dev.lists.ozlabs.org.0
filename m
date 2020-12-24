Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AD72E22E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Dec 2020 01:08:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D1Vm82kVkzDqMv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Dec 2020 11:08:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tXoI50Do; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D1VkV0YS4zDqLh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Dec 2020 11:07:13 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BO03XSp142005; Wed, 23 Dec 2020 19:07:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type; s=pp1; bh=rdvvPnui/9nvVF8DwdjL7SIwLMKq5UK4gaC9lsJBygw=;
 b=tXoI50Do2Aw5pYSU87Qto9e7+ixenaNdPx2rejU4S02rQFjE7D4RRHjktZXwY4G1wSAn
 Y8kJKc3ppTmYwhkqOCxwDqifWHRTXfab5TfcY6NQAJovU9NfTTv/JHxRBzjUb/mZEmy+
 16FJg/uz4DtwYkdVF1MrPuBPjnSShl1+NSy8BM/DXADfDNx6XZrni+H8fOZbF+HZIovv
 d02zFmFowTH3C47ExXVEa+6i8eqIGyFVsydeDl9J/Tqzsxy8BTQFfU2xgcNBXj/0lLwv
 ZQ/oJNTRBZzSp1q5Ya0L2zGd1R+q4BYLF+r8uXpfO3kPkfRBQ+PCQNDdxqC1QSNpHVqV 6Q== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35mf63128k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Dec 2020 19:07:06 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BO03DNl015282;
 Thu, 24 Dec 2020 00:07:05 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 35ma10jkx7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Dec 2020 00:07:05 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BO065Ii19398988
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Dec 2020 00:06:05 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10E0F112063;
 Thu, 24 Dec 2020 00:06:05 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B028112061;
 Thu, 24 Dec 2020 00:06:03 +0000 (GMT)
Received: from manicouagan.localdomain (unknown [9.80.205.254])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 24 Dec 2020 00:06:03 +0000 (GMT)
References: <20201218062103.76102-1-bauerman@linux.ibm.com>
 <20201223205838.GA4102@ram-ibm-com.ibm.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [PATCH] powerpc/mm: Limit allocation of SWIOTLB on server machines
In-reply-to: <20201223205838.GA4102@ram-ibm-com.ibm.com>
Date: Wed, 23 Dec 2020 21:06:01 -0300
Message-ID: <87o8ikukye.fsf@manicouagan.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-23_14:2020-12-23,
 2020-12-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 mlxscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012230164
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
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hi Ram,

Thanks for reviewing this patch.

Ram Pai <linuxram@us.ibm.com> writes:

> On Fri, Dec 18, 2020 at 03:21:03AM -0300, Thiago Jung Bauermann wrote:
>> On server-class POWER machines, we don't need the SWIOTLB unless we're a
>> secure VM. Nevertheless, if CONFIG_SWIOTLB is enabled we unconditionally
>> allocate it.
>> 
>> In most cases this is harmless, but on a few machine configurations (e.g.,
>> POWER9 powernv systems with 4 GB area reserved for crashdump kernel) it can
>> happen that memblock can't find a 64 MB chunk of memory for the SWIOTLB and
>> fails with a scary-looking WARN_ONCE:
>> 
>>  ------------[ cut here ]------------
>>  memblock: bottom-up allocation failed, memory hotremove may be affected
>>  WARNING: CPU: 0 PID: 0 at mm/memblock.c:332 memblock_find_in_range_node+0x328/0x340
>>  Modules linked in:
>>  CPU: 0 PID: 0 Comm: swapper Not tainted 5.10.0-rc2-orig+ #6
>>  NIP:  c000000000442f38 LR: c000000000442f34 CTR: c0000000001e0080
>>  REGS: c000000001def900 TRAP: 0700   Not tainted  (5.10.0-rc2-orig+)
>>  MSR:  9000000002021033 <SF,HV,VEC,ME,IR,DR,RI,LE>  CR: 28022222  XER: 20040000
>>  CFAR: c00000000014b7b4 IRQMASK: 1
>>  GPR00: c000000000442f34 c000000001defba0 c000000001deff00 0000000000000047
>>  GPR04: 00000000ffff7fff c000000001def828 c000000001def820 0000000000000000
>>  GPR08: 0000001ffc3e0000 c000000001b75478 c000000001b75478 0000000000000001
>>  GPR12: 0000000000002000 c000000002030000 0000000000000000 0000000000000000
>>  GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000002030000
>>  GPR20: 0000000000000000 0000000000010000 0000000000010000 c000000001defc10
>>  GPR24: c000000001defc08 c000000001c91868 c000000001defc18 c000000001c91890
>>  GPR28: 0000000000000000 ffffffffffffffff 0000000004000000 00000000ffffffff
>>  NIP [c000000000442f38] memblock_find_in_range_node+0x328/0x340
>>  LR [c000000000442f34] memblock_find_in_range_node+0x324/0x340
>>  Call Trace:
>>  [c000000001defba0] [c000000000442f34] memblock_find_in_range_node+0x324/0x340 (unreliable)
>>  [c000000001defc90] [c0000000015ac088] memblock_alloc_range_nid+0xec/0x1b0
>>  [c000000001defd40] [c0000000015ac1f8] memblock_alloc_internal+0xac/0x110
>>  [c000000001defda0] [c0000000015ac4d0] memblock_alloc_try_nid+0x94/0xcc
>>  [c000000001defe30] [c00000000159c3c8] swiotlb_init+0x78/0x104
>>  [c000000001defea0] [c00000000158378c] mem_init+0x4c/0x98
>>  [c000000001defec0] [c00000000157457c] start_kernel+0x714/0xac8
>>  [c000000001deff90] [c00000000000d244] start_here_common+0x1c/0x58
>>  Instruction dump:
>>  2c230000 4182ffd4 ea610088 ea810090 4bfffe84 39200001 3d42fff4 3c62ff60
>>  3863c560 992a8bfc 4bd0881d 60000000 <0fe00000> ea610088 4bfffd94 60000000
>>  random: get_random_bytes called from __warn+0x128/0x184 with crng_init=0
>>  ---[ end trace 0000000000000000 ]---
>>  software IO TLB: Cannot allocate buffer
>> 
>> Unless this is a secure VM the message can actually be ignored, because the
>> SWIOTLB isn't needed. Therefore, let's avoid the SWIOTLB in those cases.
>
> The above warn_on is conveying a genuine warning. Should it be silenced?

Not sure I understand your point. This patch doesn't silence the
warning, it avoids the problem it is warning about.

In any case, there's another patch being submitted upstream which
actually removes the warning by improving memblock's search for a free
memory region:

https://lore.kernel.org/lkml/20201217201214.3414100-2-guro@fb.com/

>> 
>> Fixes: eae9eec476d1 ("powerpc/pseries/svm: Allocate SWIOTLB buffer anywhere in memory")
>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>> ---
>>  arch/powerpc/mm/mem.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
>> index afab328d0887..3af991844145 100644
>> --- a/arch/powerpc/mm/mem.c
>> +++ b/arch/powerpc/mm/mem.c
>> @@ -300,7 +300,8 @@ void __init mem_init(void)
>>  	memblock_set_bottom_up(true);
>>  	if (is_secure_guest())
>>  		svm_swiotlb_init();
>> -	else
>> +	/* Server machines don't need SWIOTLB if they're not secure guests. */
>> +	else if (!machine_is(pseries) && !machine_is(powernv))
>
> I can see powernv never needing SWIOTLB. But, pseries guests, I am not
> so sure.

We've just very recently enabled CONFIG_SWIOTLB on production pseries
kernel configs. So far it hasn't been needed except for SVMs.

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
