Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E79F3200C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2019 19:14:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45GSc02zkqzDqbX
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jun 2019 03:14:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45GSY74nVdzDqRf
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Jun 2019 03:12:10 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x51H7YFM117386
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 1 Jun 2019 13:12:07 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sunej3rsf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 01 Jun 2019 13:12:06 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Sat, 1 Jun 2019 18:12:05 +0100
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 1 Jun 2019 18:12:01 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x51HC0TI31130018
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 1 Jun 2019 17:12:00 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A936112062;
 Sat,  1 Jun 2019 17:12:00 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 713DD112061;
 Sat,  1 Jun 2019 17:11:57 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.80.209.235])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Sat,  1 Jun 2019 17:11:57 +0000 (GMT)
References: <20190521044912.1375-1-bauerman@linux.ibm.com>
User-agent: mu4e 1.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 00/12] Secure Virtual Machine Enablement
In-reply-to: <20190521044912.1375-1-bauerman@linux.ibm.com>
Date: Sat, 01 Jun 2019 14:11:53 -0300
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19060117-0052-0000-0000-000003CA0417
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011197; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01211780; UDB=6.00636760; IPR=6.00992823; 
 MB=3.00027145; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-01 17:12:04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060117-0053-0000-0000-0000612056EE
Message-Id: <87imtpgrhi.fsf@morokweng.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-01_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=958 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906010124
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
Cc: Anshuman Khandual <anshuman.linux@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Mike Anderson <andmike@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 Claudio Carvalho <cclaudio@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hello,

Thiago Jung Bauermann <bauerman@linux.ibm.com> writes:

> This series enables Secure Virtual Machines (SVMs) on powerpc. SVMs use the
> Protected Execution Facility (PEF) and request to be migrated to secure
> memory during prom_init() so by default all of their memory is inaccessible
> to the hypervisor. There is an Ultravisor call that the VM can use to
> request certain pages to be made accessible to (or shared with) the
> hypervisor.
>
> The objective of these patches is to have the guest perform this request
> for buffers that need to be accessed by the hypervisor such as the LPPACAs,
> the SWIOTLB memory and the Debug Trace Log.

Ping? Any more comments on these patches? Or even acks? :-)

-- 
Thiago Jung Bauermann
IBM Linux Technology Center

