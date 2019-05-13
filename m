Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D711BB02
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 18:30:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452mXF3sjrzDqGn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 02:30:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452mVx4w6FzDqDy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 02:29:45 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4DGNT85060310
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 12:29:42 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sfb42jpx7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 12:29:42 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <nathanl@linux.ibm.com>;
 Mon, 13 May 2019 17:29:41 +0100
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 13 May 2019 17:29:40 +0100
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4DGTc3a328114
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 May 2019 16:29:38 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4EE1B136055;
 Mon, 13 May 2019 16:29:38 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3264F136053;
 Mon, 13 May 2019 16:29:38 +0000 (GMT)
Received: from localhost (unknown [9.41.179.184])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 13 May 2019 16:29:38 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 2/8] powerpc/pseries: Do not save the previous DTL mask
 value
In-Reply-To: <ebdb100c89ef17605a300371b9f4d414502601d7.1557502887.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1557502887.git.naveen.n.rao@linux.vnet.ibm.com>
 <ebdb100c89ef17605a300371b9f4d414502601d7.1557502887.git.naveen.n.rao@linux.vnet.ibm.com>
Date: Mon, 13 May 2019 11:29:37 -0500
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19051316-0036-0000-0000-00000AB8D691
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011093; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01202790; UDB=6.00631292; IPR=6.00983707; 
 MB=3.00026868; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-13 16:29:41
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051316-0037-0000-0000-00004BC5CEB1
Message-Id: <877eaul3m6.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-13_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=509 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905130112
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mingming Cao <mingming.cao@ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:

> When CONFIG_VIRT_CPU_ACCOUNTING_NATIVE is enabled, we always initialize
> DTL enable mask to DTL_LOG_PREEMPT (0x2). There are no other places
> where the mask is changed. As such, when reading the DTL log buffer
> through debugfs, there is no need to save and restore the previous mask
> value.
>
> We don't need to save and restore the earlier mask value if
> CONFIG_VIRT_CPU_ACCOUNTING_NATIVE is not enabled. So, remove the field
> from the structure as well.

Makes sense.

Acked-by: Nathan Lynch <nathanl@linux.ibm.com>

