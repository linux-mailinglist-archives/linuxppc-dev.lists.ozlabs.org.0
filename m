Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 766FA70C83C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 May 2023 21:36:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQ74B2KjBz3f4c
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 05:36:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T0wLBkpL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T0wLBkpL;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQ39x4z8Xz3bqv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 02:41:25 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34MFdb05027184;
	Mon, 22 May 2023 16:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=E2WedIIVgLuVIx+VuMtJwg9+LFmqdy3h7MDUH6OfON4=;
 b=T0wLBkpL7Is/WJXLltMeslJoX0HUvpIjcA9JOLMLasWhSqGs9erV3rUuDx46C34ZrmAa
 6xOup9J84mwco9Vc5bkKrdlNrAzGCjV+2/hxpD2rADzS7idahjnXIiHmhWQ4m7MO9bMV
 ClZUeuNNbJzvKKpWJh3XCgrJquLQtH+Lp20xwfl2yM7hhmPp8Cy+w65Dgo2UN0zFjem8
 bd4Ig8lZ5UB2w1EsSWNYsVAm6wAC2OutkdesJELARzlCmy9YBXwwpSxdDtLeMNJeKwRs
 51GZ5ajnG5WhYQ5GLnp+tswMQm6eGyvBpOJ/Aq/KpjSMq9K09BBqmce/LSLoCRUW+oSM ow== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qrak1jtgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 May 2023 16:41:17 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34MDtBlx009109;
	Mon, 22 May 2023 16:41:16 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
	by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3qppc5b5ty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 May 2023 16:41:16 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34MGfFpE24379910
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 May 2023 16:41:15 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B70658067;
	Mon, 22 May 2023 16:41:15 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C618B58065;
	Mon, 22 May 2023 16:41:14 +0000 (GMT)
Received: from [9.67.88.183] (unknown [9.67.88.183])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 22 May 2023 16:41:14 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------OVdZP7zTK11QF3FGRVEWjgMM"
Message-ID: <b1260c4d-78ac-9c61-02e3-538846796982@linux.vnet.ibm.com>
Date: Mon, 22 May 2023 11:41:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH] powerpc/iommu: limit number of TCEs to 512 for
 H_STUFF_TCE hcall
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20230509220549.23946-1-gbatra@linux.vnet.ibm.com>
 <875y8yl1k5.fsf@mail.lhotse>
 <ad7517b3-02f2-436a-4c31-878031630c25@linux.vnet.ibm.com>
 <87r0rfywtf.fsf@mail.lhotse>
From: Gaurav Batra <gbatra@linux.vnet.ibm.com>
In-Reply-To: <87r0rfywtf.fsf@mail.lhotse>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eSB8_aCuCMnRQEhu0ttsRH7WSqd1wL8K
X-Proofpoint-GUID: eSB8_aCuCMnRQEhu0ttsRH7WSqd1wL8K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_11,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305220134
X-Mailman-Approved-At: Tue, 23 May 2023 05:36:00 +1000
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
Cc: brking@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, gjoyce@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------OVdZP7zTK11QF3FGRVEWjgMM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/17/23 7:19 AM, Michael Ellerman wrote:
> Gaurav Batra<gbatra@linux.vnet.ibm.com>  writes:
>> Hello Michael,
>>
>> System test hit the crash. I believe, it was PHYP that resulted in it
>> due to number of TCEs passed in to be >512.
> OK. It's always good to spell out in the change log whether it's a
> theoretical/unlikely bug, or one that's actually been hit in testing or
> the field.
I will submit another version of the patch with some changes in the log 
once I figure out how to Tag it for stable (as mentioned below).
>> I was wondering about the Fixes tag as well. But, this interface, in
>> it's current form, is there from the day the file was created. So, in
>> this case, should I mention the first commit which created this source file?
> If it really goes back to the origin commit, then it's probably better
> to just say so and tag it for stable, rather than pointing to 1da177e4.
How to do I tag it for stable? Will it be part of the "Fixes:" tag or 
some other tag?
>
> I wonder though is there something else that changed that means this bug
> is now being hit but wasn't before? Or maybe it's just that we are
> testing on systems with large enough amounts of memory to hit this but
> which aren't using a direct mapping?

 From the details in Bugzilla, it does seems like the HCALL was 
previously taking long as well but PHYP was more relaxed about it. Now, 
PHYP is limiting on how long can an HCALL take.

Below are some excerpts from the Bug: 202349

Linux is passing too many counts in H_STUFF_TCE. The higher the counts, 
the longer the HCALL takes. From a Hypervisor perspective, we cannot 
stop Linux from doing this or it will violate the rules in the PAPR 
(which then would cause Linux to crash). The dispatcher team has 
"tightened the screws" on long running HCALLs by causing this trap to 
fire. From our discussions, they will not put the limits back where they 
were before.


Thanks

Gaurav

>
> cheers
--------------OVdZP7zTK11QF3FGRVEWjgMM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/17/23 7:19 AM, Michael Ellerman
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87r0rfywtf.fsf@mail.lhotse">
      <pre class="moz-quote-pre" wrap="">Gaurav Batra <a class="moz-txt-link-rfc2396E" href="mailto:gbatra@linux.vnet.ibm.com">&lt;gbatra@linux.vnet.ibm.com&gt;</a> writes:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hello Michael,

System test hit the crash. I believe, it was PHYP that resulted in it 
due to number of TCEs passed in to be &gt;512.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
OK. It's always good to spell out in the change log whether it's a
theoretical/unlikely bug, or one that's actually been hit in testing or
the field.
</pre>
    </blockquote>
    <font color="#0432ff">I will submit another version of the patch
      with some changes in the log once I figure out how to Tag it for
      stable (as mentioned below).</font><br>
    <blockquote type="cite" cite="mid:87r0rfywtf.fsf@mail.lhotse">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I was wondering about the Fixes tag as well. But, this interface, in 
it's current form, is there from the day the file was created. So, in 
this case, should I mention the first commit which created this source file?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If it really goes back to the origin commit, then it's probably better
to just say so and tag it for stable, rather than pointing to 1da177e4.</pre>
    </blockquote>
    <font color="#0432ff">How to do I tag it for stable? Will it be part
      of the "Fixes:" tag or some other tag?</font><br>
    <blockquote type="cite" cite="mid:87r0rfywtf.fsf@mail.lhotse">
      <pre class="moz-quote-pre" wrap="">

I wonder though is there something else that changed that means this bug
is now being hit but wasn't before? Or maybe it's just that we are
testing on systems with large enough amounts of memory to hit this but
which aren't using a direct mapping?</pre>
    </blockquote>
    <p><font color="#0432ff">From the details in Bugzilla, it does seems
        like the HCALL was previously taking long as well but PHYP was
        more relaxed about it. Now, PHYP is limiting on how long can an
        HCALL take. <br>
      </font></p>
    <p><font color="#0432ff">Below are some excerpts from the Bug:
        202349</font></p>
    <pre class="bz_comment_text" style="font-size: small; margin: 0px; font-family: courier; white-space: pre-wrap; width: auto; word-break: break-word; padding: 2px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><font color="#0432ff">Linux is passing too many counts in H_STUFF_TCE.  The higher the counts,
the longer the HCALL takes.  From a Hypervisor perspective, we cannot stop
Linux from doing this or it will violate the rules in the PAPR (which then
would cause Linux to crash).

The dispatcher team has "tightened the screws" on long running HCALLs by
causing this trap to fire.  From our discussions, they will not put the limits
back where they were before.
</font></pre>
    <br class="Apple-interchange-newline">
    <p>Thanks</p>
    <p>Gaurav<br>
    </p>
    <p><font color="#0432ff"></font></p>
    <blockquote type="cite" cite="mid:87r0rfywtf.fsf@mail.lhotse">
      <pre class="moz-quote-pre" wrap="">

cheers
</pre>
    </blockquote>
  </body>
</html>

--------------OVdZP7zTK11QF3FGRVEWjgMM--

