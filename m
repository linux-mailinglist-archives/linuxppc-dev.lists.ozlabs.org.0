Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EDE447CAC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 10:20:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hnlvq1Lfrz308G
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 20:20:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E7JMrfiU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=E7JMrfiU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hnl3Q12x7z2xBb
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Nov 2021 19:42:09 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A88THxL008153; 
 Mon, 8 Nov 2021 08:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=SebJPIT6q+gbpTsHW6yfpFLyEAQDdsEAyWZ8dsCTksw=;
 b=E7JMrfiUmQiyqsSzqjotgzujIQeb3e6vr807kWLPvk2rlq7DWiVm9+YgWSyp/BsXAQ67
 Y7sZ5xfN6eH5P1cPJPLHei+LA08NlIEgAQOrG8P/fL1DErPBABK+qIJgSR4kG9eiOwGY
 8FFNPdSYXhYcmN77JHl4bha/IymgaxkG58E9cpxsBbyJdA5Ygg0ew6iT0BR+hw1Q0cnT
 CSEYH+0tJ4VqhDmpqFfRpSbPSI79lcZdQhZOEAjgB1dh26oU3Y9FL+AW/CcbHpNZq53q
 ucSD+A6RuBFyG9JChAuvE/mqYkOTMw1wYB/J6G4VAYjNSKesNUNYoLWmbsu45rIpGRT/ Ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c66u1100w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 08:42:03 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A86jYso017586;
 Mon, 8 Nov 2021 08:42:03 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c66u11003-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 08:42:03 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A88XPND030104;
 Mon, 8 Nov 2021 08:42:01 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 3c5hb92hjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 08:42:01 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A88fxOA3539708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Nov 2021 08:41:59 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00A8AA405B;
 Mon,  8 Nov 2021 08:41:59 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4925BA404D;
 Mon,  8 Nov 2021 08:41:57 +0000 (GMT)
Received: from [9.43.55.9] (unknown [9.43.55.9])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  8 Nov 2021 08:41:57 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------j5uZZdwii1gLzEKCxsHNFNyE"
Message-ID: <a6ffe492-34a7-7e5e-f652-3fc302bfad20@linux.ibm.com>
Date: Mon, 8 Nov 2021 14:11:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 1/3] powerpc/pseries: Parse control memory access error
Content-Language: en-US
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20210906084303.183921-1-ganeshgr@linux.ibm.com>
From: Ganesh <ganeshgr@linux.ibm.com>
In-Reply-To: <20210906084303.183921-1-ganeshgr@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KvVR-39s_3PydA_s71CaJXaolJOeLype
X-Proofpoint-ORIG-GUID: e-pjpUsvBVu-pOXxC-le2okuienEfQzj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_03,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111080053
X-Mailman-Approved-At: Mon, 08 Nov 2021 20:20:02 +1100
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
Cc: mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------j5uZZdwii1gLzEKCxsHNFNyE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/6/21 14:13, Ganesh Goudar wrote:

> Add support to parse and log control memory access
> error for pseries. These changes are made according to
> PAPR v2.11 10.3.2.2.12.
>
> Signed-off-by: Ganesh Goudar<ganeshgr@linux.ibm.com>
> ---
> v3: Modify the commit log to mention the document according
>      to which changes are made.
>      Define and use a macro to check if the effective address
>      is provided.
>
> v2: No changes.
> ---
>   arch/powerpc/platforms/pseries/ras.c | 36 ++++++++++++++++++++++++----
>   1 file changed, 32 insertions(+), 4 deletions(-)
>
Hi mpe, Any comments on this patch series?

--------------j5uZZdwii1gLzEKCxsHNFNyE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">
      <pre>On 9/6/21 14:13, Ganesh Goudar wrote:</pre>
    </div>
    <blockquote type="cite"
      cite="mid:20210906084303.183921-1-ganeshgr@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">Add support to parse and log control memory access
error for pseries. These changes are made according to
PAPR v2.11 10.3.2.2.12.

Signed-off-by: Ganesh Goudar <a class="moz-txt-link-rfc2396E" href="mailto:ganeshgr@linux.ibm.com">&lt;ganeshgr@linux.ibm.com&gt;</a>
---
v3: Modify the commit log to mention the document according
    to which changes are made.
    Define and use a macro to check if the effective address
    is provided.

v2: No changes.
---
 arch/powerpc/platforms/pseries/ras.c | 36 ++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

</pre>
    </blockquote>
    <pre>Hi mpe, Any comments on this patch series?</pre>
  </body>
</html>
--------------j5uZZdwii1gLzEKCxsHNFNyE--

