Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6247562141
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 17:13:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45j88W26cJzDqQy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 01:12:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=arbab@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45j86S035KzDq8v
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 01:11:11 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x68F04ue043244
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Jul 2019 11:11:08 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tm6r1cf4p-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jul 2019 11:11:08 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <arbab@linux.ibm.com>;
 Mon, 8 Jul 2019 16:11:07 +0100
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 8 Jul 2019 16:11:03 +0100
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x68FB27N12780480
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jul 2019 15:11:02 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36064124055;
 Mon,  8 Jul 2019 15:11:02 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2308E12405A;
 Mon,  8 Jul 2019 15:11:02 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.179.210])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  8 Jul 2019 15:11:02 +0000 (GMT)
Received: from arbab-laptop.localdomain (arbab-laptop.localdomain [IPv6:::1])
 by arbab-laptop.localdomain (Postfix) with ESMTP id 8C052460563;
 Mon,  8 Jul 2019 10:11:00 -0500 (CDT)
Date: Mon, 8 Jul 2019 10:11:00 -0500
From: Reza Arbab <arbab@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [v3 7/7] powerpc/64s: save r13 in MCE handler (simulator
 workaroud)
References: <20190705212647.21750-1-santosh@fossix.org>
 <20190705212647.21750-8-santosh@fossix.org>
 <1562406898.yw658lj3rp.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1562406898.yw658lj3rp.astroid@bobo.none>
Organization: IBM Linux Technology Center
User-Agent: NeoMutt/20180716
X-TM-AS-GCONF: 00
x-cbid: 19070815-0060-0000-0000-0000035A55AC
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011397; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01229253; UDB=6.00647378; IPR=6.01010512; 
 MB=3.00027634; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-08 15:11:05
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070815-0061-0000-0000-00004A0ED9D8
Message-Id: <20190708151100.6t7efnrrmtmn734h@arbab-laptop.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-08_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907080187
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
Cc: Santosh Sivaraj <santosh@fossix.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 06, 2019 at 07:56:39PM +1000, Nicholas Piggin wrote:
>Santosh Sivaraj's on July 6, 2019 7:26 am:
>> From: Reza Arbab <arbab@linux.ibm.com>
>>
>> Testing my memcpy_mcsafe() work in progress with an injected UE, I get
>> an error like this immediately after the function returns:
>>
>> BUG: Unable to handle kernel data access at 0x7fff84dec8f8
>> Faulting instruction address: 0xc0080000009c00b0
>> Oops: Kernel access of bad area, sig: 11 [#1]
>> LE PAGE_SIZE=64K MMU=Radix MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
>> Modules linked in: mce(O+) vmx_crypto crc32c_vpmsum
>> CPU: 0 PID: 1375 Comm: modprobe Tainted: G           O      5.1.0-rc6 #267
>> NIP:  c0080000009c00b0 LR: c0080000009c00a8 CTR: c000000000095f90
>> REGS: c0000000ee197790 TRAP: 0300   Tainted: G           O       (5.1.0-rc6)
>> MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 88002826  XER: 00040000
>> CFAR: c000000000095f8c DAR: 00007fff84dec8f8 DSISR: 40000000 IRQMASK: 0
>> GPR00: 000000006c6c6568 c0000000ee197a20 c0080000009c8400 fffffffffffffff2
>> GPR04: c0080000009c02e0 0000000000000006 0000000000000000 c000000003c834c8
>> GPR08: 0080000000000000 776a6681b7fb5100 0000000000000000 c0080000009c01c8
>> GPR12: c000000000095f90 00007fff84debc00 000000004d071440 0000000000000000
>> GPR16: 0000000100000601 c0080000009e0000 c000000000c98dd8 c000000000c98d98
>> GPR20: c000000003bba970 c0080000009c04d0 c0080000009c0618 c0000000001e5820
>> GPR24: 0000000000000000 0000000000000100 0000000000000001 c000000003bba958
>> GPR28: c0080000009c02e8 c0080000009c0318 c0080000009c02e0 0000000000000000
>> NIP [c0080000009c00b0] cause_ue+0xa8/0xe8 [mce]
>> LR [c0080000009c00a8] cause_ue+0xa0/0xe8 [mce]
>>
>> After debugging we see that the first instruction at vector 200 is skipped by
>> the simulator, due to which r13 is not saved. Adding a nop at 0x200 fixes the
>> issue.
>>
>> (This commit is needed for testing this series. This should not be taken
>> into the tree)
>
>Would be good if this was testable in simulator upstream, did you
>report it? What does cause_ue do? exc_mce in mambo seems to do the
>right thing AFAIKS.

I think I posted this earlier, but cause_ue() is just a test function 
telling me where to set up the error injection:

static noinline void cause_ue(void)
{
	static const char src[] = "hello";
	char dst[10];
	int rc;

	/* During the pause, break into mambo and run the following */
	pr_info("inject_mce_ue_on_addr 0x%px\n", src);
	pause(10);

	rc = memcpy_mcsafe(dst, src, sizeof(src));
	pr_info("memcpy_mcsafe() returns %d\n", rc);
	if (!rc)
		pr_info("dst=\"%s\"\n", dst);
}

Can't speak for the others, but I haven't chased this upstream. I didn't 
know it was a simulator issue.

-- 
Reza Arbab

