Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B91C5A24C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 19:29:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45b3fD2gQZzDqxl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 03:29:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45b3cQ26ZczDqwb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 03:27:33 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5SHQiAc092661
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 13:27:26 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tdng9c49v-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 13:27:26 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <nathanl@linux.ibm.com>;
 Fri, 28 Jun 2019 18:27:24 +0100
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 28 Jun 2019 18:27:22 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5SHRLG537159346
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jun 2019 17:27:21 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12038AC05E;
 Fri, 28 Jun 2019 17:27:21 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EABBAAC05B;
 Fri, 28 Jun 2019 17:27:20 +0000 (GMT)
Received: from localhost (unknown [9.41.179.236])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 28 Jun 2019 17:27:20 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] powerpc/pseries: Fix maximum memory value
In-Reply-To: <156170480663.26214.11212383510892156924.stgit@aravinda>
References: <156170480663.26214.11212383510892156924.stgit@aravinda>
Date: Fri, 28 Jun 2019 12:27:20 -0500
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19062817-0060-0000-0000-00000356C317
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011347; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01224569; UDB=6.00644529; IPR=6.01005762; 
 MB=3.00027510; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-28 17:27:22
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062817-0061-0000-0000-000049F1077F
Message-Id: <87tvc9sjrb.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-28_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=818 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906280200
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
Cc: naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aravinda Prasad <aravinda@linux.vnet.ibm.com> writes:
> Calculating the maximum memory based on the number of lmbs
> and lmb size does not account for the RMA region. Hence
> use memory_hotplug_max(), which already accounts for the
> RMA region, to fetch the maximum memory value. Thanks to
> Nathan Lynch for suggesting the memory_hotplug_max()
> function.

Well, I hope I haven't led you astray... will it give you the desired
result on a kernel configured without memory hotplug support, booted in
an LPAR with some huge pages configured?

If so, then
Acked-by: Nathan Lynch <nathanl@linux.ibm.com>

It would likely help with review and future maintenance if the semantics
and intended use of the MaxMem field are made a little more
explicit. For example, is it supposed to include persistent memory?
Perhaps a follow-up patch could address this. Or maybe I'm overthinking
it.

