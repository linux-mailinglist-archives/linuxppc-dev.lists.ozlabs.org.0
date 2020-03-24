Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99074191BFB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 22:33:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48n4HJ4B0vzDqrs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 08:33:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mpx36G24zDq5k
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 22:31:35 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02OB4x1i067245
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 07:31:31 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ywf2gv9gx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 07:31:31 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ganeshgr@linux.ibm.com>;
 Tue, 24 Mar 2020 11:31:28 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 24 Mar 2020 11:31:26 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02OBVQrP43450584
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Mar 2020 11:31:26 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95ACB5204E;
 Tue, 24 Mar 2020 11:31:26 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.58.37])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 670C652050;
 Tue, 24 Mar 2020 11:31:25 +0000 (GMT)
Subject: Re: [PATCH v3] powerpc/pseries: Handle UE event for memcpy_mcsafe
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20200322160525.7624-1-ganeshgr@linux.ibm.com>
 <87pnd2xqyr.fsf@mpe.ellerman.id.au>
From: Ganesh <ganeshgr@linux.ibm.com>
Date: Tue, 24 Mar 2020 17:01:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <87pnd2xqyr.fsf@mpe.ellerman.id.au>
Content-Type: multipart/alternative;
 boundary="------------B9C2158D127CBCD3207F8E58"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20032411-0012-0000-0000-00000396CC44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032411-0013-0000-0000-000021D3C017
Message-Id: <30a0cc27-36fb-d8b4-9266-84195d32211a@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_03:2020-03-23,
 2020-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003240056
X-Mailman-Approved-At: Wed, 25 Mar 2020 08:31:43 +1100
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
Cc: mahesh@linux.vnet.ibm.com, santosh@fossix.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------B9C2158D127CBCD3207F8E58
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/24/20 10:57 AM, Michael Ellerman wrote:
> Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
>> If we hit UE at an instruction with a fixup entry, flag to
>> ignore the event and set nip to continue execution at the
>> fixup entry.
> You don't explain why we would want to do that. Or what the consequences
> are if we *don't* do it.
>
> As such it's unclear if this is an important fix or just a nice-to-have.

We want avoid panic if we hit MCE during memcpy from pmem devices because
the system is still recoverable and should just result -EIO, So we flag it here
to ignore the UE event. I will respin with better commit message.

>> For powernv these changes are already made by
>> commit 895e3dceeb97 ("powerpc/mce: Handle UE event for memcpy_mcsafe")
> We have masses of code that supposedly abstracts the MCE logic. How did
> we end up in the situation where we're having to write the same fix
> twice for different platforms?

What is common between pseries and powernv now is saving the MCE event for deferred
handling and deferred handling. According to me it becomes bit messy to return
disposition(UE RECOVERED) from common code. So what we can have is a common function
which searches the exception table entry and updates nip with fixup address, And call
it from different places for pseries and powernv. If you are ok ill spin next version.

> next
>
> cheers
>
>> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
>> Reviewed-by: Santosh S <santosh@fossix.org>
>> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
>> ---
>> V2: Fixes a trivial checkpatch error in commit msg.
>> V3: Use proper subject prefix.
>> ---
>>   arch/powerpc/platforms/pseries/ras.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
>> index 43710b69e09e..58e2483fbb1a 100644
>> --- a/arch/powerpc/platforms/pseries/ras.c
>> +++ b/arch/powerpc/platforms/pseries/ras.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/fs.h>
>>   #include <linux/reboot.h>
>>   #include <linux/irq_work.h>
>> +#include <linux/extable.h>
>>   
>>   #include <asm/machdep.h>
>>   #include <asm/rtas.h>
>> @@ -505,6 +506,7 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
>>   	int initiator = rtas_error_initiator(errp);
>>   	int severity = rtas_error_severity(errp);
>>   	u8 error_type, err_sub_type;
>> +	const struct exception_table_entry *entry;
>>   
>>   	if (initiator == RTAS_INITIATOR_UNKNOWN)
>>   		mce_err.initiator = MCE_INITIATOR_UNKNOWN;
>> @@ -558,6 +560,12 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
>>   	switch (mce_log->error_type) {
>>   	case MC_ERROR_TYPE_UE:
>>   		mce_err.error_type = MCE_ERROR_TYPE_UE;
>> +		entry = search_kernel_exception_table(regs->nip);
>> +		if (entry) {
>> +			mce_err.ignore_event = true;
>> +			regs->nip = extable_fixup(entry);
>> +			disposition = RTAS_DISP_FULLY_RECOVERED;
>> +		}
>>   		switch (err_sub_type) {
>>   		case MC_ERROR_UE_IFETCH:
>>   			mce_err.u.ue_error_type = MCE_UE_ERROR_IFETCH;
>> -- 
>> 2.17.2


--------------B9C2158D127CBCD3207F8E58
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <pre>
</pre>
    <br>
    <div class="moz-cite-prefix">On 3/24/20 10:57 AM, Michael Ellerman
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87pnd2xqyr.fsf@mpe.ellerman.id.au">
      <pre class="moz-quote-pre" wrap="">Ganesh Goudar <a class="moz-txt-link-rfc2396E" href="mailto:ganeshgr@linux.ibm.com">&lt;ganeshgr@linux.ibm.com&gt;</a> writes:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">If we hit UE at an instruction with a fixup entry, flag to
ignore the event and set nip to continue execution at the
fixup entry.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You don't explain why we would want to do that. Or what the consequences
are if we *don't* do it.

As such it's unclear if this is an important fix or just a nice-to-have.</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">We want avoid panic if we hit MCE during memcpy from pmem devices because
the system is still recoverable and should just result -EIO, So we flag it here
to ignore the UE event. I will respin with better commit message.
</pre>
    <blockquote type="cite" cite="mid:87pnd2xqyr.fsf@mpe.ellerman.id.au">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">For powernv these changes are already made by
commit 895e3dceeb97 ("powerpc/mce: Handle UE event for memcpy_mcsafe")
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
We have masses of code that supposedly abstracts the MCE logic. How did
we end up in the situation where we're having to write the same fix
twice for different platforms?</pre>
    </blockquote>
    <pre>What is common between pseries and powernv now is saving the MCE event for deferred
handling and deferred handling. According to me it becomes bit messy to return
disposition(UE RECOVERED) from common code. So what we can have is a common function
which searches the exception table entry and updates nip with fixup address, And call
it from different places for pseries and powernv. If you are ok ill spin next version.
</pre>
    <blockquote type="cite" cite="mid:87pnd2xqyr.fsf@mpe.ellerman.id.au">
      <pre class="moz-quote-pre" wrap="">next 

cheers

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Reviewed-by: Mahesh Salgaonkar <a class="moz-txt-link-rfc2396E" href="mailto:mahesh@linux.vnet.ibm.com">&lt;mahesh@linux.vnet.ibm.com&gt;</a>
Reviewed-by: Santosh S <a class="moz-txt-link-rfc2396E" href="mailto:santosh@fossix.org">&lt;santosh@fossix.org&gt;</a>
Signed-off-by: Ganesh Goudar <a class="moz-txt-link-rfc2396E" href="mailto:ganeshgr@linux.ibm.com">&lt;ganeshgr@linux.ibm.com&gt;</a>
---
V2: Fixes a trivial checkpatch error in commit msg.
V3: Use proper subject prefix.
---
 arch/powerpc/platforms/pseries/ras.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 43710b69e09e..58e2483fbb1a 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -10,6 +10,7 @@
 #include &lt;linux/fs.h&gt;
 #include &lt;linux/reboot.h&gt;
 #include &lt;linux/irq_work.h&gt;
+#include &lt;linux/extable.h&gt;
 
 #include &lt;asm/machdep.h&gt;
 #include &lt;asm/rtas.h&gt;
@@ -505,6 +506,7 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
 	int initiator = rtas_error_initiator(errp);
 	int severity = rtas_error_severity(errp);
 	u8 error_type, err_sub_type;
+	const struct exception_table_entry *entry;
 
 	if (initiator == RTAS_INITIATOR_UNKNOWN)
 		mce_err.initiator = MCE_INITIATOR_UNKNOWN;
@@ -558,6 +560,12 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
 	switch (mce_log-&gt;error_type) {
 	case MC_ERROR_TYPE_UE:
 		mce_err.error_type = MCE_ERROR_TYPE_UE;
+		entry = search_kernel_exception_table(regs-&gt;nip);
+		if (entry) {
+			mce_err.ignore_event = true;
+			regs-&gt;nip = extable_fixup(entry);
+			disposition = RTAS_DISP_FULLY_RECOVERED;
+		}
 		switch (err_sub_type) {
 		case MC_ERROR_UE_IFETCH:
 			mce_err.u.ue_error_type = MCE_UE_ERROR_IFETCH;
-- 
2.17.2
</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------B9C2158D127CBCD3207F8E58--

