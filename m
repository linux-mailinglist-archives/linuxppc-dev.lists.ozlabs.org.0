Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6296233726
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 18:51:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHbyz0Z36zDr74
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 02:51:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHbw9576CzDr9v
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 02:48:56 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06UGY6gv028196; Thu, 30 Jul 2020 12:48:51 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32krumt8gg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 12:48:51 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06UGjpvJ002120;
 Thu, 30 Jul 2020 16:48:49 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 32gcpx6cqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 16:48:48 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06UGmkAQ27918748
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jul 2020 16:48:46 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B307FA404D;
 Thu, 30 Jul 2020 16:48:46 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59677A4040;
 Thu, 30 Jul 2020 16:48:45 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.211.129.132])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 30 Jul 2020 16:48:45 +0000 (GMT)
Date: Thu, 30 Jul 2020 09:48:42 -0700
From: Ram Pai <linuxram@us.ibm.com>
To: Julia Lawall <julia.lawall@inria.fr>
Message-ID: <20200730164842.GA5882@oc0525413822.ibm.com>
References: <alpine.DEB.2.22.394.2007301231140.2548@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2007301231140.2548@hadrien>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
Subject: Re:  Documentation/powerpc: Ultravisor API
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-30_12:2020-07-30,
 2020-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=803 impostorscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007300113
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: sukadev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-doc@vger.kernel.org, corbet@lwn.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 30, 2020 at 12:35:38PM +0200, Julia Lawall wrote:
> The file Documentation/powerpc/ultravisor.rst contains:
> 
>     Only valid value(s) in ``flags`` are:
> 
>         * H_PAGE_IN_SHARED which indicates that the page is to be shared
> 	  with the Ultravisor.
> 
>         * H_PAGE_IN_NONSHARED indicates that the UV is not anymore
>           interested in the page. Applicable if the page is a shared page.
> 
> The flag H_PAGE_IN_SHARED exists in the Linux kernel
> (arch/powerpc/include/asm/hvcall.h), but the flag H_PAGE_IN_NONSHARED does
> not.  Should the documentation be changed in some way?

Currently the code assumes H_PAGE_IN_NONSHARED as !H_PAGE_IN_SHARED.

We need to patch the kernel to explicitly define the flag.
I will submit a patch towards this.

Thanks,
RP
