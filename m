Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D3767960
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 10:51:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45m3SP5kBbzDqvp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 18:51:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lgjx3Qg8zDr0L
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 04:02:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45lgjw3cV2z8vhn
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 04:02:12 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45lgjw2PY9z9sDQ; Sat, 13 Jul 2019 04:02:12 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cclaudio@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45lgjt6TFjz9sBt
 for <linuxppc-dev@ozlabs.org>; Sat, 13 Jul 2019 04:02:10 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CI27Gi083686
 for <linuxppc-dev@ozlabs.org>; Fri, 12 Jul 2019 14:02:09 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tpw8y4ebs-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Fri, 12 Jul 2019 14:02:07 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <cclaudio@linux.ibm.com>;
 Fri, 12 Jul 2019 19:02:02 +0100
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 12 Jul 2019 19:02:00 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6CI1xEo43975034
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 18:01:59 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F13E112064;
 Fri, 12 Jul 2019 18:01:59 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD2A0112061;
 Fri, 12 Jul 2019 18:01:57 +0000 (GMT)
Received: from [9.18.235.77] (unknown [9.18.235.77])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 12 Jul 2019 18:01:57 +0000 (GMT)
Subject: Re: [PATCH v4 2/8] powerpc: Introduce FW_FEATURE_ULTRAVISOR
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20190628200825.31049-1-cclaudio@linux.ibm.com>
 <20190628200825.31049-3-cclaudio@linux.ibm.com>
 <87k1cog250.fsf@concordia.ellerman.id.au>
From: Claudio Carvalho <cclaudio@linux.ibm.com>
Date: Fri, 12 Jul 2019 15:01:56 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <87k1cog250.fsf@concordia.ellerman.id.au>
Content-Type: multipart/alternative;
 boundary="------------553B7B98B64F8622D881B133"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19071218-0060-0000-0000-0000035DD20F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011416; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01231202; UDB=6.00648563; IPR=6.01012486; 
 MB=3.00027694; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-12 18:02:01
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071218-0061-0000-0000-00004A1D7136
Message-Id: <4da093e5-14ea-963b-9e8d-a6ba2aa4678f@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-12_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907120183
X-Mailman-Approved-At: Sat, 13 Jul 2019 18:44:20 +1000
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 Ryan Grimm <grimm@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauerman@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------553B7B98B64F8622D881B133
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


On 7/11/19 9:57 AM, Michael Ellerman wrote:
> Claudio Carvalho <cclaudio@linux.ibm.com> writes:
>> diff --git a/arch/powerpc/include/asm/ultravisor.h b/arch/powerpc/include/asm/ultravisor.h
>> new file mode 100644
>> index 000000000000..e5009b0d84ea
>> --- /dev/null
>> +++ b/arch/powerpc/include/asm/ultravisor.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Ultravisor definitions
>> + *
>> + * Copyright 2019, IBM Corporation.
>> + *
>> + */
>> +#ifndef _ASM_POWERPC_ULTRAVISOR_H
>> +#define _ASM_POWERPC_ULTRAVISOR_H
>> +
>> +/* Internal functions */
>> +extern int early_init_dt_scan_ultravisor(unsigned long node, const char *uname,
>> +					 int depth, void *data);
> Please don't use extern in new headers.
>
>> diff --git a/arch/powerpc/kernel/ultravisor.c b/arch/powerpc/kernel/ultravisor.c
>> new file mode 100644
>> index 000000000000..dc6021f63c97
>> --- /dev/null
>> +++ b/arch/powerpc/kernel/ultravisor.c
> Is there a reason this (and other later files) aren't in platforms/powernv ?

Yes, there is.
https://www.spinics.net/lists/kvm-ppc/msg14998.html

We also need to do ucalls from a secure guest and its kernel may not have CONFIG_PPC_POWERNV=y. I can make it clear in the commit message.


>
>> @@ -0,0 +1,24 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Ultravisor high level interfaces
>> + *
>> + * Copyright 2019, IBM Corporation.
>> + *
>> + */
>> +#include <linux/init.h>
>> +#include <linux/printk.h>
>> +#include <linux/string.h>
>> +
>> +#include <asm/ultravisor.h>
>> +#include <asm/firmware.h>
>> +
>> +int __init early_init_dt_scan_ultravisor(unsigned long node, const char *uname,
>> +					 int depth, void *data)
>> +{
>> +	if (depth != 1 || strcmp(uname, "ibm,ultravisor") != 0)
>> +		return 0;
> I know you're following the example of OPAL, but this is not the best
> way to search for the ultravisor node.
>
> It makes the location and name of the node part of the ABI, when there's
> no need for it to be.
>
> If instead you just scan the tree for a node that is *compatible* with
> "ibm,ultravisor" (or whatever compatible string) then the node can be
> placed any where in the tree and have any name, which gives us the most
> flexibility in future to change the location of the device tree node.

I will do that in the next version.

Thanks,
Claudio


>
> cheers
>

--------------553B7B98B64F8622D881B133
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/11/19 9:57 AM, Michael Ellerman
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:87k1cog250.fsf@concordia.ellerman.id.au">
      <pre class="moz-quote-pre" wrap="">Claudio Carvalho <a class="moz-txt-link-rfc2396E" href="mailto:cclaudio@linux.ibm.com">&lt;cclaudio@linux.ibm.com&gt;</a> writes:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/arch/powerpc/include/asm/ultravisor.h b/arch/powerpc/include/asm/ultravisor.h
new file mode 100644
index 000000000000..e5009b0d84ea
--- /dev/null
+++ b/arch/powerpc/include/asm/ultravisor.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Ultravisor definitions
+ *
+ * Copyright 2019, IBM Corporation.
+ *
+ */
+#ifndef _ASM_POWERPC_ULTRAVISOR_H
+#define _ASM_POWERPC_ULTRAVISOR_H
+
+/* Internal functions */
+extern int early_init_dt_scan_ultravisor(unsigned long node, const char *uname,
+					 int depth, void *data);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Please don't use extern in new headers.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/arch/powerpc/kernel/ultravisor.c b/arch/powerpc/kernel/ultravisor.c
new file mode 100644
index 000000000000..dc6021f63c97
--- /dev/null
+++ b/arch/powerpc/kernel/ultravisor.c
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Is there a reason this (and other later files) aren't in platforms/powernv ?</pre>
    </blockquote>
    <pre style="white-space: pre-wrap; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">Yes, there is.
<a href="https://www.spinics.net/lists/kvm-ppc/msg14998.html">https://www.spinics.net/lists/kvm-ppc/msg14998.html</a>

We also need to do ucalls from a secure guest and its kernel may not have CONFIG_PPC_POWERNV=y. I can make it clear in the commit message.


</pre>
    <blockquote type="cite"
      cite="mid:87k1cog250.fsf@concordia.ellerman.id.au">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Ultravisor high level interfaces
+ *
+ * Copyright 2019, IBM Corporation.
+ *
+ */
+#include &lt;linux/init.h&gt;
+#include &lt;linux/printk.h&gt;
+#include &lt;linux/string.h&gt;
+
+#include &lt;asm/ultravisor.h&gt;
+#include &lt;asm/firmware.h&gt;
+
+int __init early_init_dt_scan_ultravisor(unsigned long node, const char *uname,
+					 int depth, void *data)
+{
+	if (depth != 1 || strcmp(uname, "ibm,ultravisor") != 0)
+		return 0;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I know you're following the example of OPAL, but this is not the best
way to search for the ultravisor node.

It makes the location and name of the node part of the ABI, when there's
no need for it to be.

If instead you just scan the tree for a node that is *compatible* with
"ibm,ultravisor" (or whatever compatible string) then the node can be
placed any where in the tree and have any name, which gives us the most
flexibility in future to change the location of the device tree node.</pre>
    </blockquote>
    <p>I will do that in the next version.</p>
    <p>Thanks,<br>
      Claudio<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:87k1cog250.fsf@concordia.ellerman.id.au">
      <pre class="moz-quote-pre" wrap="">

cheers

</pre>
    </blockquote>
  </body>
</html>

--------------553B7B98B64F8622D881B133--

