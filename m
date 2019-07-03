Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 893525EE7B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 23:27:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fDjK4ycrzDqLR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 07:27:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f7rw3K8fzDqP8
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 03:49:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45f7rv5dp3z8tQv
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 03:49:03 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45f7rv4g3Jz9sLt; Thu,  4 Jul 2019 03:49:03 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45f7rv0TW6z9sBp
 for <linuxppc-dev@ozlabs.org>; Thu,  4 Jul 2019 03:49:02 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x63Hl1N4065031
 for <linuxppc-dev@ozlabs.org>; Wed, 3 Jul 2019 13:49:00 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2th072a2uu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 03 Jul 2019 13:49:00 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 3 Jul 2019 18:48:58 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 3 Jul 2019 18:48:56 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x63Hmtlg34669012
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Jul 2019 17:48:55 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D96111C050;
 Wed,  3 Jul 2019 17:48:55 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 512D211C04A;
 Wed,  3 Jul 2019 17:48:53 +0000 (GMT)
Received: from [9.85.84.54] (unknown [9.85.84.54])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  3 Jul 2019 17:48:53 +0000 (GMT)
Subject: Re: [PATCH v3 03/16] pseries/fadump: move out platform specific
 support from generic code
To: "Oliver O'Halloran" <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
References: <156149548694.9094.3211954809582123798.stgit@hbathini.in.ibm.com>
 <156149556436.9094.15834897273683011518.stgit@hbathini.in.ibm.com>
 <8a779e216bb088b33b022cd026bdb647e05aa338.camel@gmail.com>
From: Hari Bathini <hbathini@linux.ibm.com>
Date: Wed, 3 Jul 2019 23:18:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <8a779e216bb088b33b022cd026bdb647e05aa338.camel@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------CAF89D5A5255138FE96E15A5"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19070317-0016-0000-0000-0000028EDC45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070317-0017-0000-0000-000032EC77AF
Message-Id: <72e2c26a-3944-bfdb-6bb1-b4f2318e2951@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-03_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907030216
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
--------------CAF89D5A5255138FE96E15A5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


On 03/07/19 9:34 AM, Oliver O'Halloran wrote:
> On Wed, 2019-06-26 at 02:16 +0530, Hari Bathini wrote:
>> Introduce callbacks for platform specific operations like register,
>> unregister, invalidate & such, and move pseries specific code into
>> platform code.
> Please don't move around large blocks of code *and* change the code in
> a single patch. It makes reviewing the changes extremely tedious since
> the changes are mixed in with hundreds of lines of nothing.

Right, Oliver.
I am already working on splitting up few other patches for ease of reviewing.
Thought of keeping this patch this way though as it doesn't add any new logic
but moves the code around. Will ensure I split this one up too for the sake
of sanity.

>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>  arch/powerpc/include/asm/fadump.h            |   75 ----
>>  arch/powerpc/kernel/fadump-common.h          |   38 ++
>>  arch/powerpc/kernel/fadump.c                 |  500 ++-----------------------
>>  arch/powerpc/platforms/pseries/Makefile      |    1 
>>  arch/powerpc/platforms/pseries/rtas-fadump.c |  529 ++++++++++++++++++++++++++
>>  arch/powerpc/platforms/pseries/rtas-fadump.h |   96 +++++
>>  6 files changed, 700 insertions(+), 539 deletions(-)
>>  create mode 100644 arch/powerpc/platforms/pseries/rtas-fadump.c
>>  create mode 100644 arch/powerpc/platforms/pseries/rtas-fadump.h
>>
>> +static struct fadump_ops pseries_fadump_ops = {
>> +	.init_fadump_mem_struct	= pseries_init_fadump_mem_struct,
>> +	.register_fadump	= pseries_register_fadump,
> I realise you are just translating the existing interface, but why is
> init_fadump_mem_struct() done as a seperate step and not as a part of
> the registration function? The struct doesn't seem to be necessary
> until the actual registration happens.

Yeah. But registration is a user choice and can happen multiple times within
a single boot (for example, due to hotplug operations) but the structure
contents remain the same. So, it is initialized once early on...

>
>> +	.unregister_fadump	= pseries_unregister_fadump,
>> +	.invalidate_fadump	= pseries_invalidate_fadump,
>> +	.process_fadump		= pseries_process_fadump,
>> +	.fadump_region_show	= pseries_fadump_region_show,
>> +	.crash_fadump		= pseries_crash_fadump,
> Rename this to fadump_trigger or something, it's not clear what it
> does.

Sure.
Thanks for the review!

- Hari


--------------CAF89D5A5255138FE96E15A5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 03/07/19 9:34 AM, Oliver O'Halloran
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:8a779e216bb088b33b022cd026bdb647e05aa338.camel@gmail.com">
      <pre class="moz-quote-pre" wrap="">On Wed, 2019-06-26 at 02:16 +0530, Hari Bathini wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Introduce callbacks for platform specific operations like register,
unregister, invalidate &amp; such, and move pseries specific code into
platform code.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Please don't move around large blocks of code *and* change the code in
a single patch. It makes reviewing the changes extremely tedious since
the changes are mixed in with hundreds of lines of nothing.
</pre>
    </blockquote>
    <pre>
Right, Oliver.
I am already working on splitting up few other patches for ease of reviewing.
Thought of keeping this patch this way though as it doesn't add any new logic
but moves the code around. Will ensure I split this one up too for the sake
of sanity.

</pre>
    <blockquote type="cite"
      cite="mid:8a779e216bb088b33b022cd026bdb647e05aa338.camel@gmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Hari Bathini <a class="moz-txt-link-rfc2396E" href="mailto:hbathini@linux.ibm.com">&lt;hbathini@linux.ibm.com&gt;</a>
---
 arch/powerpc/include/asm/fadump.h            |   75 ----
 arch/powerpc/kernel/fadump-common.h          |   38 ++
 arch/powerpc/kernel/fadump.c                 |  500 ++-----------------------
 arch/powerpc/platforms/pseries/Makefile      |    1 
 arch/powerpc/platforms/pseries/rtas-fadump.c |  529 ++++++++++++++++++++++++++
 arch/powerpc/platforms/pseries/rtas-fadump.h |   96 +++++
 6 files changed, 700 insertions(+), 539 deletions(-)
 create mode 100644 arch/powerpc/platforms/pseries/rtas-fadump.c
 create mode 100644 arch/powerpc/platforms/pseries/rtas-fadump.h

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+static struct fadump_ops pseries_fadump_ops = {
+	.init_fadump_mem_struct	= pseries_init_fadump_mem_struct,
+	.register_fadump	= pseries_register_fadump,
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I realise you are just translating the existing interface, but why is
init_fadump_mem_struct() done as a seperate step and not as a part of
the registration function? The struct doesn't seem to be necessary
until the actual registration happens.</pre>
    </blockquote>
    <pre>
Yeah. But registration is a user choice and can happen multiple times within
a single boot (for example, due to hotplug operations) but the structure
contents remain the same. So, it is initialized once early on...

</pre>
    <blockquote type="cite"
      cite="mid:8a779e216bb088b33b022cd026bdb647e05aa338.camel@gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+	.unregister_fadump	= pseries_unregister_fadump,
+	.invalidate_fadump	= pseries_invalidate_fadump,
+	.process_fadump		= pseries_process_fadump,
+	.fadump_region_show	= pseries_fadump_region_show,
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+	.crash_fadump		= pseries_crash_fadump,
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Rename this to fadump_trigger or something, it's not clear what it
does.
</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">
Sure.
Thanks for the review!

- Hari
</pre>
  </body>
</html>

--------------CAF89D5A5255138FE96E15A5--

