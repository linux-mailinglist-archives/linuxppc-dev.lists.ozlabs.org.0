Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A034F988
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 04:34:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Wc2S62flzDqmY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 12:34:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=arbab@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Wc0s1qSdzDqTF
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2019 12:33:16 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5N2VeAh122584; Sat, 22 Jun 2019 22:33:09 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ta023gtck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 22 Jun 2019 22:33:09 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5N2X9DT124499;
 Sat, 22 Jun 2019 22:33:09 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ta023gtc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 22 Jun 2019 22:33:09 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5N2U6Nt027651;
 Sun, 23 Jun 2019 02:33:08 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 2t9by65cve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 23 Jun 2019 02:33:08 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5N2X7uR16122182
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 23 Jun 2019 02:33:07 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18DFD6A04F;
 Sun, 23 Jun 2019 02:33:07 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1B936A047;
 Sun, 23 Jun 2019 02:33:06 +0000 (GMT)
Received: from arbab-vm.localdomain (unknown [9.85.182.131])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun, 23 Jun 2019 02:33:06 +0000 (GMT)
Received: from arbab-vm (localhost [IPv6:::1])
 by arbab-vm.localdomain (Postfix) with ESMTP id 733CE1001AC;
 Sat, 22 Jun 2019 21:33:04 -0500 (CDT)
Date: Sat, 22 Jun 2019 21:33:04 -0500
From: Reza Arbab <arbab@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 11/13] powerpc/64s: Save r13 in machine_check_common_early
Message-ID: <20190623023303.tdtev4giyfv2yfwg@arbab-vm>
References: <cover.1561020760.git.santosh@fossix.org>
 <d6ae7dd59966ee1c7593b8fd936774c0b13e6dd4.1561020760.git.santosh@fossix.org>
 <20190621114725.xg6cogv4ecejz6pj@in.ibm.com>
 <1561158983.qtodmczmox.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1561158983.qtodmczmox.astroid@bobo.none>
Organization: IBM Linux Technology Center
User-Agent: NeoMutt/20180716
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-23_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906230020
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
Cc: Santosh Sivaraj <santosh@fossix.org>, mahesh@linux.vnet.ibm.com,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 22, 2019 at 09:21:55AM +1000, Nicholas Piggin wrote:
>Yep, from the stack trace, r13 is corrupted. So r13 must have got
>corrupted before the machine check and this just happens to have
>corrected it.
>
>How does cause_ue work? It or memcpy_mcsafe must be corrupting
>r13.

Well, cause_ue() is just my little testcase using inject_mce_ue_on_addr 
from skiboot/external/mambo/mambo_utils.tcl:

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

I can't see how memcpy_mcsafe() would be causing it. I tried changing it 
to save/restore r13 where it already does r14-r22, but that didn't make 
a difference. Any ideas?

-- 
Reza Arbab
