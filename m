Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4E055BCB8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 02:31:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LX5BH5lKCz3dwG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 10:31:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gA7/ftYY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sv@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gA7/ftYY;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWrzl6cJ6z3bqK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 01:21:39 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RFDsM0014209;
	Mon, 27 Jun 2022 15:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=kxMhDRM6nTAU/Ag3SBn+tnze8UKdeSZaBcZ/TLdATDk=;
 b=gA7/ftYYlj/UCoN1s+3MOggJLQOfVZBJRAjH3qHjc06iRKJGCKuoaQIitO9WIy+wXwhn
 f18240lHb48GUFD8KpNz1YeWBua1TSMVMbUyErnf8qxB+tuea8sLxA/rwneecIrDOklI
 cxeihiH4dXfbL9x00L+e3SM7W5C+7DaGp2vry3BRzZc5i7lQQ3ByxgAp7fMmNNex02St
 gi4d5z7lK+ixmFGqA45u3IXl6/Jnu2uEOSsdXc7Rr2rAQ7VV0kP49ZHgDIZxJr73TLyd
 FhhE9J3N2Hot1fvaCZiSD/Vzd6cREY0hx09TJDSfPjWhfO6dshSGqd7Ud6TFootdmWDs mg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gyf0k07ua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jun 2022 15:21:18 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25RFE6em015410;
	Mon, 27 Jun 2022 15:21:18 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gyf0k07t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jun 2022 15:21:17 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25RF6eAf020377;
	Mon, 27 Jun 2022 15:21:15 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04ams.nl.ibm.com with ESMTP id 3gwt08u4s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jun 2022 15:21:15 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25RFLDj818481508
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jun 2022 15:21:13 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4EAC6A405B;
	Mon, 27 Jun 2022 15:21:13 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C4343A4054;
	Mon, 27 Jun 2022 15:21:08 +0000 (GMT)
Received: from [9.43.63.124] (unknown [9.43.63.124])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 27 Jun 2022 15:21:08 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------d9XJW9h4ePxCRrHZwBFaD0Ci"
Message-ID: <03154518-216a-e050-033b-314eb9240c56@linux.vnet.ibm.com>
Date: Mon, 27 Jun 2022 20:51:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH v3 11/12] powerpc: Remove unreachable() from WARN_ON()
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20220624183238.388144-1-sv@linux.ibm.com>
 <20220624183238.388144-12-sv@linux.ibm.com>
 <70b6d08d-aced-7f4e-b958-a3c7ae1a9319@csgroup.eu>
From: Sathvika Vasireddy <sv@linux.vnet.ibm.com>
In-Reply-To: <70b6d08d-aced-7f4e-b958-a3c7ae1a9319@csgroup.eu>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kHMrqOGz3AHoJ-wISinUL9IwxcEHPDPZ
X-Proofpoint-ORIG-GUID: gWvqWB4k_fLC3V6NjsIIkwkvqBXC20sp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=983 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206270065
X-Mailman-Approved-At: Tue, 28 Jun 2022 10:29:05 +1000
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "paulus@samba.org" <paulus@samba.org>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, Sathvika Vasireddy <sv@linux.ibm.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------d9XJW9h4ePxCRrHZwBFaD0Ci
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 25/06/22 12:16, Christophe Leroy wrote:
>
> Le 24/06/2022 à 20:32, Sathvika Vasireddy a écrit :
>> objtool is throwing *unannotated intra-function call*
>> warnings with a few instructions that are marked
>> unreachable. Remove unreachable() from WARN_ON()
>> to fix these warnings, as the codegen remains same
>> with and without unreachable() in WARN_ON().
> Did you try the two exemples described in commit 1e688dd2a3d6
> ("powerpc/bug: Provide better flexibility to WARN_ON/__WARN_FLAGS() with
> asm goto") ?
>
> Without your patch:
>
> 00000640 <test>:
>    640:	81 23 00 84 	lwz     r9,132(r3)
>    644:	71 29 40 00 	andi.   r9,r9,16384
>    648:	40 82 00 0c 	bne     654 <test+0x14>
>    64c:	80 63 00 0c 	lwz     r3,12(r3)
>    650:	4e 80 00 20 	blr
>    654:	0f e0 00 00 	twui    r0,0
>
> 00000658 <test9w>:
>    658:	2c 04 00 00 	cmpwi   r4,0
>    65c:	41 82 00 0c 	beq     668 <test9w+0x10>
>    660:	7c 63 23 96 	divwu   r3,r3,r4
>    664:	4e 80 00 20 	blr
>    668:	0f e0 00 00 	twui    r0,0
>    66c:	38 60 00 00 	li      r3,0
>    670:	4e 80 00 20 	blr
>
>
> With your patch:
>
> 00000640 <test>:
>    640:	81 23 00 84 	lwz     r9,132(r3)
>    644:	71 29 40 00 	andi.   r9,r9,16384
>    648:	40 82 00 0c 	bne     654 <test+0x14>
>    64c:	80 63 00 0c 	lwz     r3,12(r3)
>    650:	4e 80 00 20 	blr
>    654:	0f e0 00 00 	twui    r0,0
>    658:	4b ff ff f4 	b       64c <test+0xc>		<==
>
> 0000065c <test9w>:
>    65c:	2c 04 00 00 	cmpwi   r4,0
>    660:	41 82 00 0c 	beq     66c <test9w+0x10>
>    664:	7c 63 23 96 	divwu   r3,r3,r4
>    668:	4e 80 00 20 	blr
>    66c:	0f e0 00 00 	twui    r0,0
>    670:	38 60 00 00 	li      r3,0			<==
>    674:	4e 80 00 20 	blr				<==
>    678:	38 60 00 00 	li      r3,0
>    67c:	4e 80 00 20 	blr
>
The builtin variant of unreachable (__builtin_unreachable()) works,
and the codegen remains the same.

How about using that instead of unreachable() ?


- Sathvika

--------------d9XJW9h4ePxCRrHZwBFaD0Ci
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix"><font face="monospace">On 25/06/22
        12:16, Christophe Leroy wrote:</font><br>
    </div>
    <blockquote type="cite"
      cite="mid:70b6d08d-aced-7f4e-b958-a3c7ae1a9319@csgroup.eu">
      <pre class="moz-quote-pre" wrap="">

Le 24/06/2022 à 20:32, Sathvika Vasireddy a écrit :
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">objtool is throwing *unannotated intra-function call*
warnings with a few instructions that are marked
unreachable. Remove unreachable() from WARN_ON()
to fix these warnings, as the codegen remains same
with and without unreachable() in WARN_ON().
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Did you try the two exemples described in commit 1e688dd2a3d6 
("powerpc/bug: Provide better flexibility to WARN_ON/__WARN_FLAGS() with 
asm goto") ?

Without your patch:

00000640 &lt;test&gt;:
  640:	81 23 00 84 	lwz     r9,132(r3)
  644:	71 29 40 00 	andi.   r9,r9,16384
  648:	40 82 00 0c 	bne     654 &lt;test+0x14&gt;
  64c:	80 63 00 0c 	lwz     r3,12(r3)
  650:	4e 80 00 20 	blr
  654:	0f e0 00 00 	twui    r0,0

00000658 &lt;test9w&gt;:
  658:	2c 04 00 00 	cmpwi   r4,0
  65c:	41 82 00 0c 	beq     668 &lt;test9w+0x10&gt;
  660:	7c 63 23 96 	divwu   r3,r3,r4
  664:	4e 80 00 20 	blr
  668:	0f e0 00 00 	twui    r0,0
  66c:	38 60 00 00 	li      r3,0
  670:	4e 80 00 20 	blr


With your patch:

00000640 &lt;test&gt;:
  640:	81 23 00 84 	lwz     r9,132(r3)
  644:	71 29 40 00 	andi.   r9,r9,16384
  648:	40 82 00 0c 	bne     654 &lt;test+0x14&gt;
  64c:	80 63 00 0c 	lwz     r3,12(r3)
  650:	4e 80 00 20 	blr
  654:	0f e0 00 00 	twui    r0,0
  658:	4b ff ff f4 	b       64c &lt;test+0xc&gt;		&lt;==

0000065c &lt;test9w&gt;:
  65c:	2c 04 00 00 	cmpwi   r4,0
  660:	41 82 00 0c 	beq     66c &lt;test9w+0x10&gt;
  664:	7c 63 23 96 	divwu   r3,r3,r4
  668:	4e 80 00 20 	blr
  66c:	0f e0 00 00 	twui    r0,0
  670:	38 60 00 00 	li      r3,0			&lt;==
  674:	4e 80 00 20 	blr				&lt;==
  678:	38 60 00 00 	li      r3,0
  67c:	4e 80 00 20 	blr

</pre>
    </blockquote>
    <font face="monospace">The builtin variant of unreachable (<font
        color="#151415"><span style="font-size: 12px; font-style: normal; font-variant-ligatures: none; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: pre-wrap; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(29, 28, 29, 0.04); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">__builtin_unreachable()</span></font>)
      works,</font><br>
    <font face="monospace">and the codegen remains the same. <br>
    </font>
    <p><font face="monospace">How about using that instead of
        unreachable() ?</font></p>
    <p><font face="monospace"><br>
      </font></p>
    <p><font face="monospace">- Sathvika<br>
      </font></p>
  </body>
</html>

--------------d9XJW9h4ePxCRrHZwBFaD0Ci--

