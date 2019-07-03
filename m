Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAC25EE45
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 23:24:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fDdn3rvTzDqNT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 07:24:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f7c83d2HzDqNQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 03:38:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45f7c71qthz8t0S
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 03:37:59 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45f7c71RKyz9sLt; Thu,  4 Jul 2019 03:37:59 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45f7c65KgRz9sBp
 for <linuxppc-dev@ozlabs.org>; Thu,  4 Jul 2019 03:37:58 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x63HbojE137584
 for <linuxppc-dev@ozlabs.org>; Wed, 3 Jul 2019 13:37:56 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2th0vt82jx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 03 Jul 2019 13:37:55 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 3 Jul 2019 18:37:06 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 3 Jul 2019 18:37:03 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x63HapWi30212376
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Jul 2019 17:36:51 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00C8F11C04A;
 Wed,  3 Jul 2019 17:37:02 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 116E711C050;
 Wed,  3 Jul 2019 17:37:00 +0000 (GMT)
Received: from [9.85.84.54] (unknown [9.85.84.54])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  3 Jul 2019 17:36:59 +0000 (GMT)
Subject: Re: [PATCH v3 01/16] powerpc/fadump: move internal fadump code to a
 new file
To: "Oliver O'Halloran" <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
References: <156149548694.9094.3211954809582123798.stgit@hbathini.in.ibm.com>
 <156149554689.9094.13274886908174068943.stgit@hbathini.in.ibm.com>
 <5f4b28e4df2049506a9fa03eead6cfbad9d7cdf3.camel@gmail.com>
From: Hari Bathini <hbathini@linux.ibm.com>
Date: Wed, 3 Jul 2019 23:06:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <5f4b28e4df2049506a9fa03eead6cfbad9d7cdf3.camel@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------6A163100F895494BA737EF9F"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19070317-0012-0000-0000-0000032EE58D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070317-0013-0000-0000-000021683985
Message-Id: <6c560e11-eb57-a6d5-b8e9-9a43053ca36f@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-03_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907030214
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:23:14 +1000
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Stewart Smith <stewart@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------6A163100F895494BA737EF9F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


On 03/07/19 9:00 AM, Oliver O'Halloran wrote:
> On Wed, 2019-06-26 at 02:15 +0530, Hari Bathini wrote:
>> Refactoring fadump code means internal fadump code is referenced from
>> different places. For ease, move internal code to a new file.
> Can you elaborate a bit? I don't really get what the difference between
> fadump and fadump-internal code is supposed to be. Why can't all this
> just live in fadump.c?

I am trying to keep the code referenced by both platforms (platform/pseries &
platform/powernv) in an internal file while using include/asm/fadump.h for
the interface with other kernel components..


--------------6A163100F895494BA737EF9F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 03/07/19 9:00 AM, Oliver O'Halloran
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5f4b28e4df2049506a9fa03eead6cfbad9d7cdf3.camel@gmail.com">
      <pre class="moz-quote-pre" wrap="">On Wed, 2019-06-26 at 02:15 +0530, Hari Bathini wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Refactoring fadump code means internal fadump code is referenced from
different places. For ease, move internal code to a new file.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Can you elaborate a bit? I don't really get what the difference between
fadump and fadump-internal code is supposed to be. Why can't all this
just live in fadump.c?
</pre>
    </blockquote>
    <pre>
I am trying to keep the code referenced by both platforms (platform/pseries &amp;
platform/powernv) in an internal file while using include/asm/fadump.h for
the interface with other kernel components..</pre>
  </body>
</html>

--------------6A163100F895494BA737EF9F--

