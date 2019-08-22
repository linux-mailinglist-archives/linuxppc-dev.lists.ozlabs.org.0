Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFADE988F7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 03:28:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DRkn27H7zDr6v
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 11:28:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DRhV4Xv3zDr5g
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 11:26:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46DRhV3fN3z8t5T
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 11:26:50 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46DRhV2rH3z9s7T; Thu, 22 Aug 2019 11:26:50 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cclaudio@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46DRhT6rr0z9s4Y
 for <linuxppc-dev@ozlabs.org>; Thu, 22 Aug 2019 11:26:49 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7M16xDT145290; Wed, 21 Aug 2019 21:26:45 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uhfx5tgab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Aug 2019 21:26:45 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7M1CjTG007128;
 Thu, 22 Aug 2019 01:26:44 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 2ue976jumj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Aug 2019 01:26:44 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7M1QhcV48562526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Aug 2019 01:26:43 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B53ABAE066;
 Thu, 22 Aug 2019 01:26:43 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A92CAE05F;
 Thu, 22 Aug 2019 01:26:40 +0000 (GMT)
Received: from [9.80.203.17] (unknown [9.80.203.17])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 22 Aug 2019 01:26:40 +0000 (GMT)
Subject: Re: [PATCH v5 2/7] powerpc/kernel: Add ucall_norets() ultravisor call
 handler
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20190808040555.2371-1-cclaudio@linux.ibm.com>
 <20190808040555.2371-3-cclaudio@linux.ibm.com>
 <87wofgqb2g.fsf@concordia.ellerman.id.au>
 <20190814183432.GG31406@gate.crashing.org>
From: Claudio Carvalho <cclaudio@linux.ibm.com>
Message-ID: <dbfbea49-c6b4-6bac-955d-8da03642db47@linux.ibm.com>
Date: Wed, 21 Aug 2019 22:26:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190814183432.GG31406@gate.crashing.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220011
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 linuxppc-dev@ozlabs.org, Ryan Grimm <grimm@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Guerney Hunt <gdhh@linux.ibm.com>, Thiago Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 8/14/19 3:34 PM, Segher Boessenkool wrote:
> On Wed, Aug 14, 2019 at 08:46:15PM +1000, Michael Ellerman wrote:
>> Claudio Carvalho <cclaudio@linux.ibm.com> writes:
>>> +_GLOBAL(ucall_norets)
>>> +EXPORT_SYMBOL_GPL(ucall_norets)
>>> +	mfcr	r0
>>> +	stw	r0,8(r1)
>>> +
>>> +	sc	2		/* Invoke the ultravisor */
>>> +
>>> +	lwz	r0,8(r1)
>>> +	mtcrf	0xff,r0
>>> +	blr			/* Return r3 = status */
>> Paulus points that we shouldn't need to save CR here. Our caller will
>> have already saved it if it needed to, and we don't use CR in this
>> function so we don't need to save it.
>>
>> That's assuming the Ultravisor follows the hcall ABI in which CR2-4 are
>> non-volatile (PAPR § 14.5.3).
> And assuming the ultravisor already clears (or sets, or whatever) all CR
> fields it does not want to leak the contents of (which it also should,
> of course).

Thanks Segher. We are working on that in the ultravisor source code.

Claudio.


>
>> I know plpar_hcall_norets() does save CR, but it shouldn't need to, that
>> seems to be historical. aka. no one knows why it does it but it always
>> has.
>
> Segher
>
