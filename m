Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DCA40F5CA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 12:21:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9qk06xYVz2ydk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 20:21:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GrIqIeH1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GrIqIeH1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9npC1XCTz2xtr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Sep 2021 18:54:58 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18H6jxOi026665; 
 Fri, 17 Sep 2021 04:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=cG7unUNY3wKQwREGlpqiOmVVTH4MvQEeMulcAhfMSug=;
 b=GrIqIeH1dE54bDrXMF6ERKZo4PkixxVKPSsts3+zFNTlU+NXfHIT9U9nzs1xTNL6Udin
 521RCH1ZEKBqoaFZy6JQX9AF+2JlgWsco8MlxHGjfhK50aNLqi/tJ3NtCKEsZSIOx1b4
 AHM7rBk9XL9XmNbKi26GHUycn6v7m2vfjBqov1ZNdojHajGJt0OYAhr4RnuJ7dVe05ME
 WGRpF4vE2vmBHAmqytkg/0pVDRpIM9AaGTcgQnffZl17MgmR7sq39AbDh0QrTr6a3nEw
 CsOR+xTe/Of1670JGJNkLcENPOGG4sezNF67J5lZ7lXKXg5yU4o+x4pOQZGwUnRIh20D fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b4g669xd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 04:54:52 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18H8dJRh017101;
 Fri, 17 Sep 2021 04:54:52 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b4g669xce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 04:54:52 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18H8r2qq003355;
 Fri, 17 Sep 2021 08:54:50 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 3b0m3aa2ct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 08:54:50 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 18H8oCc859965918
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Sep 2021 08:50:12 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FA62AE045;
 Fri, 17 Sep 2021 08:54:47 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15F5DAE055;
 Fri, 17 Sep 2021 08:54:46 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com (unknown
 [9.43.80.218]) by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 17 Sep 2021 08:54:45 +0000 (GMT)
Subject: Re: [PATCH] powerpc/mce: check if event info is valid
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20210806132307.367688-1-ganeshgr@linux.ibm.com>
From: Ganesh <ganeshgr@linux.ibm.com>
Message-ID: <4f9431fd-74b0-2ce4-807e-9796b326d729@linux.ibm.com>
Date: Fri, 17 Sep 2021 14:24:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210806132307.367688-1-ganeshgr@linux.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------D64035816105928A24A5C371"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jlssl0OJRuRSRZ7wNIR0QcTbWV6ndVNZ
X-Proofpoint-GUID: aElaNlbqPtx7GA_nV8Tq7oU_zZc51w-R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-17_04,2021-09-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=871
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109170054
X-Mailman-Approved-At: Fri, 17 Sep 2021 20:20:51 +1000
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
--------------D64035816105928A24A5C371
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/21 6:53 PM, Ganesh Goudar wrote:

> Check if the event info is valid before printing the
> event information. When a fwnmi enabled nested kvm guest
> hits a machine check exception L0 and L2 would generate
> machine check event info, But L1 would not generate any
> machine check event info as it won't go through 0x200
> vector and prints some unwanted message.
>
> To fix this, 'in_use' variable in machine check event info is
> no more in use, rename it to 'valid' and check if the event
> information is valid before logging the event information.
>
> without this patch L1 would print following message for
> exceptions encountered in L2, as event structure will be
> empty in L1.
>
> "Machine Check Exception, Unknown event version 0".
>
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---

Hi mpe, Any comments on this patch.


--------------D64035816105928A24A5C371
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">
      <pre>On 8/6/21 6:53 PM, Ganesh Goudar wrote:</pre>
    </div>
    <blockquote type="cite"
      cite="mid:20210806132307.367688-1-ganeshgr@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">Check if the event info is valid before printing the
event information. When a fwnmi enabled nested kvm guest
hits a machine check exception L0 and L2 would generate
machine check event info, But L1 would not generate any
machine check event info as it won't go through 0x200
vector and prints some unwanted message.

To fix this, 'in_use' variable in machine check event info is
no more in use, rename it to 'valid' and check if the event
information is valid before logging the event information.

without this patch L1 would print following message for
exceptions encountered in L2, as event structure will be
empty in L1.

"Machine Check Exception, Unknown event version 0".

Signed-off-by: Ganesh Goudar <a class="moz-txt-link-rfc2396E" href="mailto:ganeshgr@linux.ibm.com">&lt;ganeshgr@linux.ibm.com&gt;</a>
---
</pre>
    </blockquote>
    <pre>Hi mpe, Any comments on this patch.</pre>
  </body>
</html>

--------------D64035816105928A24A5C371--

