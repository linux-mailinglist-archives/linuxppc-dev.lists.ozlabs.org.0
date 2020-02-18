Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C021634D2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 22:25:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MYn003QTzDqgL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 08:25:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gromero@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MYkY5GdWzDqNn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 08:23:49 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01ILKSDH097838; Tue, 18 Feb 2020 16:23:45 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y6dnu41sv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2020 16:23:45 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01ILN8GD001767;
 Tue, 18 Feb 2020 21:23:44 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 2y6896mny0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2020 21:23:44 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01ILNiRk48234944
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Feb 2020 21:23:44 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B74D112062;
 Tue, 18 Feb 2020 21:23:44 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76F69112061;
 Tue, 18 Feb 2020 21:23:42 +0000 (GMT)
Received: from oc6336877782.ibm.com (unknown [9.85.161.208])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 18 Feb 2020 21:23:42 +0000 (GMT)
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Treat unrecognized TM instructions
 as illegal
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Michael Neuling <mikey@neuling.org>
References: <20200213151532.12559-1-gromero@linux.ibm.com>
 <29b136e15c2f04f783b54ec98552d1a6009234db.camel@neuling.org>
 <20200217055712.GS22482@gate.crashing.org>
 <1752a0c735a455c5d3ca09209f5a52748c8f7116.camel@neuling.org>
 <20200217073743.GT22482@gate.crashing.org>
From: Gustavo Romero <gromero@linux.vnet.ibm.com>
Message-ID: <30664862-ede5-16c3-6215-ade0b660bb58@linux.vnet.ibm.com>
Date: Tue, 18 Feb 2020 18:23:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200217073743.GT22482@gate.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-18_07:2020-02-18,
 2020-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=598 clxscore=1015
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002180139
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 Gustavo Romero <gromero@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 02/17/2020 04:37 AM, Segher Boessenkool wrote:
> On Mon, Feb 17, 2020 at 05:23:07PM +1100, Michael Neuling wrote:
>>>> Hence, we should NOP this, not generate an illegal.
>>>
>>> It is not a reserved bit.
>>>
>>> The IMC entry for it matches op1=011111 op2=1////01110 presumably, which
>>> catches all TM instructions and nothing else (bits 0..5 and bits 21..30).
>>> That does not look at bit 31, the softpatch handler has to deal with this.
>>>
>>> Some TM insns have bit 31 as 1 and some have it as /.  All instructions
>>> with a "." in the mnemonic have bit 31 is 1, all other have it reserved.
>>> The tables in appendices D, E, F show tend. and tsr. as having it
>>> reserved, which contradicts the individual instruction description (and
>>> does not make much sense).  (Only tcheck has /, everything else has 1;
>>> everything else has a mnemonic with a dot, and does write CR0 always).
>>
>> Wow, interesting.
>>
>> P8 seems to be treating 31 as a reserved bit (with the table definition rather
>> than the individual instruction description). I'm inclined to match P8 even
>> though it's inconsistent with the dot mnemonic as you say.
> 
> "The POWER8 core ignores the state of reserved bits in the instructions
> (denoted by “///” in the instruction definition) and executes the
> instruction normally. Software should set these bits to ‘0’ per the
> Power ISA." (p8 UM, 3.1.1.3; same in the p9 UM).

For the records, I've sent a v2 addressing Mikey's comments:

https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-February/204502.html

or

https://marc.info/?l=kvm-ppc&m=158206045520038&w=2

Thanks for the review.


Best regards,
Gustavo
