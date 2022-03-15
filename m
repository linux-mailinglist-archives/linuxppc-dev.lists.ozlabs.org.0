Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BA34DA11A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 18:26:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJ0gz3tPVz30Dx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 04:26:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FgLVs4js;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FgLVs4js; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJ0gG1p33z2xXZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 04:26:01 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22FGflpB002387; 
 Tue, 15 Mar 2022 17:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=+m2zdRbNqsWkuVUHJWgaFa7AvKiQxrR+dHzT2AmUs8c=;
 b=FgLVs4jsakxDnWHrcaOP1dImS1/6Z2Ewv1RslCPRKf/07SH6vavvTJIMmq6+q4zIWbPB
 gC3ZURYKECyNRceFwPUl7Nrr16ETjAqZOBVJwRBVrKZeoWDVQuMicxzMPW4BbREkCqWb
 1EDgr1M+ywt043mZKEQQMg9JHjaRq2kJgWTMvsIK8/Izay+cPfjjB+mp4av0W/QnQ5hi
 AWOihZZCeuFuBi7jY8dVq4gXhoBh7ecsMrrdjKXSW2yNbxV8p7YF/37d2eJhNTL5pQV8
 iQjwENlMbzgHzTLH/EafygqoAU67OBi0l3UO3zmEi0t98zMDmhoHaTTxmh1ePHjrsDeX AA== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3etxhtgy6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 17:25:51 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22FHDKtp012855;
 Tue, 15 Mar 2022 17:25:49 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 3erk58p3n0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 17:25:49 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22FHPktZ52167006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Mar 2022 17:25:46 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 772D2AE04D;
 Tue, 15 Mar 2022 17:25:46 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89863AE045;
 Tue, 15 Mar 2022 17:25:41 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.211.32.147])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 15 Mar 2022 17:25:41 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Tue, 15 Mar 2022 22:55:39 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dan Williams
 <dan.j.williams@intel.com>, Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: manual merge of the nvdimm tree with the powerpc tree
In-Reply-To: <20220315191538.323eefbb@canb.auug.org.au>
References: <20220315191538.323eefbb@canb.auug.org.au>
Date: Tue, 15 Mar 2022 22:55:39 +0530
Message-ID: <87v8wfb018.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -3J5cxA1rd3sxn56In5FZvp1n-T54dZQ
X-Proofpoint-GUID: -3J5cxA1rd3sxn56In5FZvp1n-T54dZQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-15_03,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203150104
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
Cc: Kajol Jain <kjain@linux.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Shivaprasad G Bhat <sbhat@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Today's linux-next merge of the nvdimm tree got a conflict in:
>
>   arch/powerpc/platforms/pseries/papr_scm.c
>
> between commit:
>
>   bbbca72352bb ("powerpc/papr_scm: Implement initial support for injecting smart errors")
>
> from the powerpc tree and commit:
>
>   4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support")
>
> from the nvdimm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for this correction Stephen and the change looks ok to me. I
verified the functionality introduced by kernel commit bbbca72352bb
("powerpc/papr_scm: Implement initial support for injecting smart
errors") on the 'next-20220315' and found it to be working fine.

<snip>

-- 
Cheers
~ Vaibhav
