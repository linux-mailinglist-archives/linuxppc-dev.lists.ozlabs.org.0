Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 094CA3F5791
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 07:19:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gty935JSMz2yPJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 15:19:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PG2mi5lH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PG2mi5lH; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gty8F10NXz2xrm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 15:19:08 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17O5CeBk174333; Tue, 24 Aug 2021 01:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=PE/TzKz3X9Hz3XOzUeUYInAIDGmI+H9B+ly6TDLjfD4=;
 b=PG2mi5lHmfKSLIPp7PBzEVPvOP4i8j/BTkMpO+bMNNNnnnT07VagYxtZCs7gFM/7M2hQ
 wbpV1r+aZU6J79W/TeQM/tvYVsz0L+g36VM4IJXL//desOFLH7EhKWS5b0Y4OrGhNCLa
 L8m7a3yyUYih3jJdicUERAUDXUJKWsNSj6EL69srjFn00+7R6c3eqRNqdx+6NF5iQzGx
 5XpXK4BnFVjbXkOhUtFT+0wffJOopsKvfDI0B7XUF0cTl6Gb9G20KgjF2fQx2TI4EsUk
 XKtRO9kDMLQOsVJ2pgk3CEzXcb2KJjQqYXZkHFqyCVf9OMM37NYSxqeQQQzVeBhzueF5 Ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3amrx0t0qp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Aug 2021 01:18:55 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17O54Gd1146266;
 Tue, 24 Aug 2021 01:18:55 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3amrx0t0qg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Aug 2021 01:18:55 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17O5HJLE030281;
 Tue, 24 Aug 2021 05:18:54 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 3ajs4ch0sm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Aug 2021 05:18:54 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17O5Iroa41877868
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Aug 2021 05:18:53 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDADEB206A;
 Tue, 24 Aug 2021 05:18:53 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29977B2068;
 Tue, 24 Aug 2021 05:18:51 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.125.5])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 24 Aug 2021 05:18:50 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build warning after merge of the powerpc tree
In-Reply-To: <20210823204803.7cb76778@canb.auug.org.au>
References: <20210823195540.4d7363ed@canb.auug.org.au>
 <20210823204803.7cb76778@canb.auug.org.au>
Date: Tue, 24 Aug 2021 10:48:47 +0530
Message-ID: <87v93ve7yg.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hZjYXa38_KuuHplE-WO4QycR3zD1t4JA
X-Proofpoint-ORIG-GUID: sH7ZjWYYbu6t_LnU8jBcOlx4rrpIfd-f
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-24_01:2021-08-23,
 2021-08-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1011 impostorscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108240031
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> [cc'ing Jon in case he can fix the sphix hang - or knows anything about it]
>
> On Mon, 23 Aug 2021 19:55:40 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the powerpc tree, today's linux-next build (htmldocs)
>> produced this warning:
>> 
>
> I missed a line:
>
> Sphinx parallel build error:
>
>> docutils.utils.SystemMessage: Documentation/powerpc/associativity.rst:1: (SEVERE/4) Title overline & underline mismatch.
>> 
>> ============================
>> NUMA resource associativity
>> =============================
>> 
>> Introduced by commit
>> 
>>   1c6b5a7e7405 ("powerpc/pseries: Add support for FORM2 associativity")
>> 
>> There are other obvious problems with this document (but sphinx seems
>> to have hung before it reported them).
>> 
>> Like
>> 
>> Form 0
>> -----
>> 
>> and
>> 
>> Form 1
>> -----
>> 
>> and
>> 
>> Form 2
>> -------
>
> I also get the following warning:
>
> Documentation/powerpc/associativity.rst: WARNING: document isn't included in any toctree
>
> And applying the following patch is enough to allow sphinx to finish
> (rather than livelocking):
>
> diff --git a/Documentation/powerpc/associativity.rst b/Documentation/powerpc/associativity.rst
> index 07e7dd3d6c87..b77c6ccbd6cb 100644
> --- a/Documentation/powerpc/associativity.rst
> +++ b/Documentation/powerpc/associativity.rst
> @@ -1,6 +1,6 @@
> -============================
> +===========================
>  NUMA resource associativity
> -=============================
> +===========================
>  
>  Associativity represents the groupings of the various platform resources into
>  domains of substantially similar mean performance relative to resources outside
> @@ -20,11 +20,11 @@ A value of 1 indicates the usage of Form 1 associativity. For Form 2 associativi
>  bit 2 of byte 5 in the "ibm,architecture-vec-5" property is used.
>  
>  Form 0
> ------
> +------
>  Form 0 associativity supports only two NUMA distances (LOCAL and REMOTE).
>  
>  Form 1
> ------
> +------
>  With Form 1 a combination of ibm,associativity-reference-points, and ibm,associativity
>  device tree properties are used to determine the NUMA distance between resource groups/domains.
>  
> @@ -45,7 +45,7 @@ level of the resource group, the kernel doubles the NUMA distance between the
>  comparing domains.
>  
>  Form 2
> --------
> +------
>  Form 2 associativity format adds separate device tree properties representing NUMA node distance
>  thereby making the node distance computation flexible. Form 2 also allows flexible primary
>  domain numbering. With numa distance computation now detached from the index value in

Thanks for looking into this. I guess we also need to format the below table?

  | 0    8   40
--|------------
  |
0 | 10   20  80
  |
8 | 20   10  160
  |
40| 80   160  10


I don't know how to represent that in the documentation file. A table is
probably not the right one?

-aneesh
