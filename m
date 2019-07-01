Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 105E95BDED
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 16:17:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cqG31GcrzDqX6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 00:17:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cq8S0ndKzDqBd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 00:12:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45cq8K0Ywqz8tD1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 00:12:49 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45cq8J5Lm4z9sPQ; Tue,  2 Jul 2019 00:12:48 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cclaudio@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45cq8J0DLVz9sPF;
 Tue,  2 Jul 2019 00:12:47 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x61E8Ppi180503; Mon, 1 Jul 2019 10:12:46 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tfkmb8gs3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jul 2019 10:12:45 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x61E9lH8014210;
 Mon, 1 Jul 2019 14:12:45 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01dal.us.ibm.com with ESMTP id 2tdym6qcbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jul 2019 14:12:44 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x61ECgvJ49480050
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Jul 2019 14:12:43 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8150C6061;
 Mon,  1 Jul 2019 14:12:42 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E301BC605A;
 Mon,  1 Jul 2019 14:12:39 +0000 (GMT)
Received: from [9.80.232.19] (unknown [9.80.232.19])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  1 Jul 2019 14:12:39 +0000 (GMT)
Subject: Re: [PATCH v3 3/9] powerpc: Introduce FW_FEATURE_ULTRAVISOR
To: Paul Mackerras <paulus@ozlabs.org>
References: <20190606173614.32090-1-cclaudio@linux.ibm.com>
 <20190606173614.32090-4-cclaudio@linux.ibm.com>
 <20190615073600.GA24709@blackberry>
From: Claudio Carvalho <cclaudio@linux.ibm.com>
Message-ID: <990dd9d3-441a-229c-a007-817d1dd856be@linux.ibm.com>
Date: Mon, 1 Jul 2019 11:12:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190615073600.GA24709@blackberry>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-01_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907010175
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
 linuxppc-dev@ozlabs.org, Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 6/15/19 4:36 AM, Paul Mackerras wrote:
> On Thu, Jun 06, 2019 at 02:36:08PM -0300, Claudio Carvalho wrote:
>> This feature tells if the ultravisor firmware is available to handle
>> ucalls.
> Everything in this patch that depends on CONFIG_PPC_UV should just
> depend on CONFIG_PPC_POWERNV instead.  The reason is that every host
> kernel needs to be able to do the ultracall to set partition table
> entry 0, in case it ends up being run on a machine with an ultravisor.
> Otherwise we will have the situation where a host kernel may crash
> early in boot just because the machine it's booted on happens to have
> an ultravisor running.  The crash will be a particularly nasty one
> because it will happen before we have probed the machine type and
> initialized the console; therefore it will just look like the machine
> hangs for no discernable reason.

> We also need to think about how to provide a way for petitboot to know
> whether the kernel it is booting knows how to do a ucall to set its
> partition table entry.  One suggestion would be to modify
> vmlinux.lds.S to add a new PT_NOTE entry in the program header of the
> binary with (say) a 64-bit doubleword which is a bitmap indicating
> capabilities of the binary.  We would define the first bit as
> indicating that the kernel knows how to run under an ultravisor.
> When running under an ultravisor, petitboot could then look for the
> PT_NOTE and the ultravisor-capable bit in it, and if the PT_NOTE is
> not there or the bit is zero, put up a dialog warning the user that
> the kernel will probably crash early in boot, and asking for explicit
> confirmation that the user wants to proceed.


I just posted a separated RFC patch for the ELF note.

Thanks, Claudio.


>
> Paul.
>
