Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D38C53F753F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 14:44:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvlzJ5LSyz3cH5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 22:44:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QegzOFN7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QegzOFN7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvkTW08h4z2yJS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 21:36:46 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17PBYgwA134112; Wed, 25 Aug 2021 07:36:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=62lkoYQmLmGF0N4Iuiouh6JMk8Ku+TPsGB4x8irlGEA=;
 b=QegzOFN7li28FIyQeML6zEUHkPdjeZITk8N5y0ipYt3oK5DO6GrNuLQIGYoUcR1Lm85D
 2hovh5+aXJfKZ6jNikit/ql8rGoJayjYSYNLgQvPrBaZJNZFZ61+p4hVhrpu6JSXp2x4
 C9+Ozaxht+HYd2BoWuCG+clAuPSjonM7rppD/7F5jcGc9xR/WWnw+KxxxR3SeIW8xXiC
 EHxT1X8TeJdJUa58TjCrTCBIh6lc+R2saxJuBwPl8uqB/rFB/wuMexBzeohw0yzc76mx
 6NvmjLI/vujltZPGzjMm4oRjPtTqmMr5gcwkT7q/3NCGK010bfu+zPt/fIohw/rR1f+8 fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3anm5t2c6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 07:36:38 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17PBYnHn134596;
 Wed, 25 Aug 2021 07:36:37 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3anm5t2c5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 07:36:37 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17PBJW8D019562;
 Wed, 25 Aug 2021 11:36:35 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 3ajs48dujd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 11:36:35 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17PBaW1x37159174
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Aug 2021 11:36:32 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0A72AE061;
 Wed, 25 Aug 2021 11:36:32 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C63F6AE051;
 Wed, 25 Aug 2021 11:36:30 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com (unknown
 [9.43.52.60]) by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 Aug 2021 11:36:30 +0000 (GMT)
Subject: Re: [PATCH v2 1/3] powerpc/pseries: Parse control memory access error
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20210805092025.272871-1-ganeshgr@linux.ibm.com>
 <87eeajcpmq.fsf@mpe.ellerman.id.au> <20210824212420.GL1583@gate.crashing.org>
From: Ganesh <ganeshgr@linux.ibm.com>
Message-ID: <92790955-ce8d-1826-2317-c889038545fc@linux.ibm.com>
Date: Wed, 25 Aug 2021 17:06:29 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210824212420.GL1583@gate.crashing.org>
Content-Type: multipart/alternative;
 boundary="------------49958F2D7870C013C4983E08"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DAIvs7mZn8qoEGL3V6PyVpTZaAGW7CPs
X-Proofpoint-ORIG-GUID: 7EvZvDwtRtWSSAQ7KUoEdZ14J8KBTLyt
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-25_05:2021-08-25,
 2021-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 clxscore=1011 mlxlogscore=999 lowpriorityscore=0 spamscore=0 phishscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108250068
X-Mailman-Approved-At: Wed, 25 Aug 2021 22:42:10 +1000
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
Cc: mikey@neuling.org, linuxppc-dev@lists.ozlabs.org, mahesh@linux.ibm.com,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------49958F2D7870C013C4983E08
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/25/21 2:54 AM, Segher Boessenkool wrote:
> On Tue, Aug 24, 2021 at 04:39:57PM +1000, Michael Ellerman wrote:
>>> +		case MC_ERROR_CTRL_MEM_ACCESS_PTABLE_WALK:
>>> +			mce_err.u.ra_error_type =
>>> +				MCE_RA_ERROR_PAGE_TABLE_WALK_LOAD_STORE_FOREIGN;
>> That name is ridiculously long, but I guess that's not your fault :)
>> We can fix it up in a later patch.
> It also has surprisingly little information content for the 47 chars
> length it has :-)  What does this even mean?!

It means control memory access error/real address error is detected during page
table walk.

>
> Segher

--------------49958F2D7870C013C4983E08
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/25/21 2:54 AM, Segher Boessenkool
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210824212420.GL1583@gate.crashing.org">
      <pre class="moz-quote-pre" wrap="">On Tue, Aug 24, 2021 at 04:39:57PM +1000, Michael Ellerman wrote:
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+		case MC_ERROR_CTRL_MEM_ACCESS_PTABLE_WALK:
+			mce_err.u.ra_error_type =
+				MCE_RA_ERROR_PAGE_TABLE_WALK_LOAD_STORE_FOREIGN;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
That name is ridiculously long, but I guess that's not your fault :)
We can fix it up in a later patch.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It also has surprisingly little information content for the 47 chars
length it has :-)  What does this even mean?!</pre>
    </blockquote>
    <pre>It means control memory access error/real address error is detected during page
table walk. 
</pre>
    <blockquote type="cite"
      cite="mid:20210824212420.GL1583@gate.crashing.org">
      <pre class="moz-quote-pre" wrap="">

Segher
</pre>
    </blockquote>
  </body>
</html>

--------------49958F2D7870C013C4983E08--

