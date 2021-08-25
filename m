Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CEC3F753D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 14:43:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvlyT5PVNz2ynF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 22:43:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZMqZLDg7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZMqZLDg7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvkMV6bc6z2yJW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 21:31:34 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17PB4UsK001118; Wed, 25 Aug 2021 07:31:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=ahVKt4nOMVbs79kOxjxOUKFMeyX3UrfG9tFQwAXs+cU=;
 b=ZMqZLDg7pdCYBDqqufvtOgts5Cp5EPico3ILRCfAcEpEKeLFeR+AUGB6Y2J2Al+09BoH
 ZEbB9xwHbVFsd9VRx3FHXObvHRkIIOpvzGhskNPCtSWUh0tNlTUdAUoBKmIouNEp35B0
 oj6wIx7vsUsIwFK6+BwRxJBD+IeKPG7egshvgxpvCpb8ZpXFVmaNdX2IQX144DVgpSes
 7lH2m1amaXSbeV2INGDuKYmGuKg4tlyFHiPmwUmxYlsHYZY3Z6hE9B8ET1uAUlyiFULS
 kDNhGo/p8U/0ek/JQVGfIwR7RMENJCiOQ83BibQ3lE9nBK4umAQr2QhWUi2OBn/aJNlj Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3anm5t26uk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 07:31:27 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17PBMBSS083021;
 Wed, 25 Aug 2021 07:31:27 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3anm5t26tw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 07:31:27 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17PBJwJk029401;
 Wed, 25 Aug 2021 11:31:25 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 3ajs48dut0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 11:31:25 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17PBVLrK32244176
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Aug 2021 11:31:21 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 616D0AE099;
 Wed, 25 Aug 2021 11:31:21 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4DA6AE059;
 Wed, 25 Aug 2021 11:31:18 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com (unknown
 [9.43.52.60]) by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 Aug 2021 11:31:18 +0000 (GMT)
Subject: Re: [PATCH v2 2/3] selftests/powerpc: Add test for real address error
 handling
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20210805092025.272871-1-ganeshgr@linux.ibm.com>
 <20210805092025.272871-2-ganeshgr@linux.ibm.com>
 <87a6l7c8ku.fsf@mpe.ellerman.id.au>
From: Ganesh <ganeshgr@linux.ibm.com>
Message-ID: <8edb13f5-f036-2f9d-4c89-55c51c4cdbc0@linux.ibm.com>
Date: Wed, 25 Aug 2021 17:01:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87a6l7c8ku.fsf@mpe.ellerman.id.au>
Content-Type: multipart/alternative;
 boundary="------------362E7C179351F83DB5B7180C"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WoQ6nbR6ITYBc7gjKdkWhSG0DUlHA6im
X-Proofpoint-ORIG-GUID: PMlkeF9m9N6rKbGRO9r1fUs5RBtnIeOP
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-25_04:2021-08-25,
 2021-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 spamscore=0 phishscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108250066
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
Cc: mikey@neuling.org, mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------362E7C179351F83DB5B7180C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/24/21 6:18 PM, Michael Ellerman wrote:

> Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
>> Add test for real address or control memory address access
>> error handling, using NX-GZIP engine.
>>
>> The error is injected by accessing the control memory address
>> using illegal instruction, on successful handling the process
>> attempting to access control memory address using illegal
>> instruction receives SIGBUS.
> ...
>
>> diff --git a/tools/testing/selftests/powerpc/mce/inject-ra-err.sh b/tools/testing/selftests/powerpc/mce/inject-ra-err.sh
>> new file mode 100755
>> index 000000000000..3633cdc651a1
>> --- /dev/null
>> +++ b/tools/testing/selftests/powerpc/mce/inject-ra-err.sh
>> @@ -0,0 +1,18 @@
>> +#!/bin/bash
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +if [[ ! -w /dev/crypto/nx-gzip ]]; then
>> +	echo "WARN: Can't access /dev/crypto/nx-gzip, skipping"
>> +	exit 0
>> +fi
>> +
>> +timeout 5 ./inject-ra-err
>> +
>> +# 128 + 7 (SIGBUS) = 135, 128 is a exit code with special meaning.
>> +if [ $? -ne 135 ]; then
>> +	echo "FAILED: Real address or Control memory access error not handled"
>> +	exit $?
>> +fi
>> +
>> +echo "OK: Real address or Control memory access error is handled"
>> +exit 0
> I don't think we really need the shell script, we should be able to do
> all that in the C code.
>
> Can you try this?

it works!, We need to set timeout, with 120 sec timeout we may flood the dmesg.
Thanks.

>
> cheers
>
> diff --git a/tools/testing/selftests/powerpc/mce/Makefile b/tools/testing/selftests/powerpc/mce/Makefile
> new file mode 100644
> index 000000000000..2424513982d9
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/mce/Makefile
> @@ -0,0 +1,7 @@
> +#SPDX-License-Identifier: GPL-2.0-or-later
> +
> +TEST_GEN_PROGS := inject-ra-err
> +
> +include ../../lib.mk
> +
> +$(TEST_GEN_PROGS): ../harness.c
> diff --git a/tools/testing/selftests/powerpc/mce/inject-ra-err.c b/tools/testing/selftests/powerpc/mce/inject-ra-err.c
> new file mode 100644
> index 000000000000..ba0f9c28f786
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/mce/inject-ra-err.c
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <signal.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/ioctl.h>
> +#include <sys/mman.h>
> +#include <sys/stat.h>
> +#include <sys/types.h>
> +#include <unistd.h>
> +
> +#include "vas-api.h"
> +#include "utils.h"
> +
> +static bool faulted;
> +
> +static void sigbus_handler(int n, siginfo_t *info, void *ctxt_v)
> +{
> +	ucontext_t *ctxt = (ucontext_t *)ctxt_v;
> +	struct pt_regs *regs = ctxt->uc_mcontext.regs;
> +
> +	faulted = true;
> +	regs->nip += 4;
> +}
> +
> +static int test_ra_error(void)
> +{
> +	struct vas_tx_win_open_attr attr;
> +	int fd, *paste_addr;
> +	char *devname = "/dev/crypto/nx-gzip";
> +	struct sigaction act = {
> +		.sa_sigaction = sigbus_handler,
> +		.sa_flags = SA_SIGINFO,
> +	};
> +
> +	memset(&attr, 0, sizeof(attr));
> +	attr.version = 1;
> +	attr.vas_id = 0;
> +
> +	SKIP_IF(!access(devname, F_OK));
> +
> +	fd = open(devname, O_RDWR);
> +	FAIL_IF(fd < 0);
> +	FAIL_IF(ioctl(fd, VAS_TX_WIN_OPEN, &attr) < 0);
> +	FAIL_IF(sigaction(SIGBUS, &act, NULL) != 0);
> +
> +	paste_addr = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0ULL);
> +
> +	/* The following assignment triggers exception */
> +	mb();
> +	*paste_addr = 1;
> +	mb();
> +
> +	FAIL_IF(!faulted);
> +
> +	return 0;
> +}
> +
> +int main(void)
> +{
> +	return test_harness(test_ra_error, "inject-ra-err");
> +}

--------------362E7C179351F83DB5B7180C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>On 8/24/21 6:18 PM, Michael Ellerman wrote:</pre>
    <blockquote type="cite" cite="mid:87a6l7c8ku.fsf@mpe.ellerman.id.au">
      <pre class="moz-quote-pre" wrap="">Ganesh Goudar <a class="moz-txt-link-rfc2396E" href="mailto:ganeshgr@linux.ibm.com">&lt;ganeshgr@linux.ibm.com&gt;</a> writes:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Add test for real address or control memory address access
error handling, using NX-GZIP engine.

The error is injected by accessing the control memory address
using illegal instruction, on successful handling the process
attempting to access control memory address using illegal
instruction receives SIGBUS.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">...

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/tools/testing/selftests/powerpc/mce/inject-ra-err.sh b/tools/testing/selftests/powerpc/mce/inject-ra-err.sh
new file mode 100755
index 000000000000..3633cdc651a1
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mce/inject-ra-err.sh
@@ -0,0 +1,18 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+if [[ ! -w /dev/crypto/nx-gzip ]]; then
+	echo "WARN: Can't access /dev/crypto/nx-gzip, skipping"
+	exit 0
+fi
+
+timeout 5 ./inject-ra-err
+
+# 128 + 7 (SIGBUS) = 135, 128 is a exit code with special meaning.
+if [ $? -ne 135 ]; then
+	echo "FAILED: Real address or Control memory access error not handled"
+	exit $?
+fi
+
+echo "OK: Real address or Control memory access error is handled"
+exit 0
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I don't think we really need the shell script, we should be able to do
all that in the C code.

Can you try this?</pre>
    </blockquote>
    <pre>it works!, We need to set timeout, with 120 sec timeout we may flood the dmesg.
Thanks.
</pre>
    <blockquote type="cite" cite="mid:87a6l7c8ku.fsf@mpe.ellerman.id.au">
      <pre class="moz-quote-pre" wrap="">

cheers

diff --git a/tools/testing/selftests/powerpc/mce/Makefile b/tools/testing/selftests/powerpc/mce/Makefile
new file mode 100644
index 000000000000..2424513982d9
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mce/Makefile
@@ -0,0 +1,7 @@
+#SPDX-License-Identifier: GPL-2.0-or-later
+
+TEST_GEN_PROGS := inject-ra-err
+
+include ../../lib.mk
+
+$(TEST_GEN_PROGS): ../harness.c
diff --git a/tools/testing/selftests/powerpc/mce/inject-ra-err.c b/tools/testing/selftests/powerpc/mce/inject-ra-err.c
new file mode 100644
index 000000000000..ba0f9c28f786
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mce/inject-ra-err.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include &lt;errno.h&gt;
+#include &lt;fcntl.h&gt;
+#include &lt;signal.h&gt;
+#include &lt;stdio.h&gt;
+#include &lt;string.h&gt;
+#include &lt;sys/ioctl.h&gt;
+#include &lt;sys/mman.h&gt;
+#include &lt;sys/stat.h&gt;
+#include &lt;sys/types.h&gt;
+#include &lt;unistd.h&gt;
+
+#include "vas-api.h"
+#include "utils.h"
+
+static bool faulted;
+
+static void sigbus_handler(int n, siginfo_t *info, void *ctxt_v)
+{
+	ucontext_t *ctxt = (ucontext_t *)ctxt_v;
+	struct pt_regs *regs = ctxt-&gt;uc_mcontext.regs;
+
+	faulted = true;
+	regs-&gt;nip += 4;
+}
+
+static int test_ra_error(void)
+{
+	struct vas_tx_win_open_attr attr;
+	int fd, *paste_addr;
+	char *devname = "/dev/crypto/nx-gzip";
+	struct sigaction act = {
+		.sa_sigaction = sigbus_handler,
+		.sa_flags = SA_SIGINFO,
+	};
+
+	memset(&amp;attr, 0, sizeof(attr));
+	attr.version = 1;
+	attr.vas_id = 0;
+
+	SKIP_IF(!access(devname, F_OK));
+
+	fd = open(devname, O_RDWR);
+	FAIL_IF(fd &lt; 0);
+	FAIL_IF(ioctl(fd, VAS_TX_WIN_OPEN, &amp;attr) &lt; 0);
+	FAIL_IF(sigaction(SIGBUS, &amp;act, NULL) != 0);
+
+	paste_addr = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0ULL);
+
+	/* The following assignment triggers exception */
+	mb();
+	*paste_addr = 1;
+	mb();
+
+	FAIL_IF(!faulted);
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(test_ra_error, "inject-ra-err");
+}
</pre>
    </blockquote>
  </body>
</html>

--------------362E7C179351F83DB5B7180C--

