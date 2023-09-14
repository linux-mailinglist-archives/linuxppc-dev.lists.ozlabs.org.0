Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3247A116A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 01:08:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m8iOcCrj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmtKB0qYJz3cGw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 09:08:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m8iOcCrj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=disgoel@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmbtX5trbz3bP9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 22:17:40 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38EC7VrT001823;
	Thu, 14 Sep 2023 12:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=/XLlfMvHOYmMhaeKJGvJDYVL5cFRWsXVT0rHCpYHFMk=;
 b=m8iOcCrjwl1M8eiKFqZoeItqBxwHRi4odZfAl1baFh6rzDxrShVUabKJlFnnU2L5Abq8
 TzJ4yU/UQ6V0LxKq13qNjEcDwIHwxdToI1CibtaE80pNuntMCsB84ju2TurXLBBusfbM
 qPZdzSi1c789pGMwtTFBnRP0HABreKCXbDUz+YZ/BEdoInW+RWurkZJD1GR3dJPa6OFi
 AvZ01DeWU0MVXDgHxacp7H2FNTGiaOTL9JiEa0c8xCgV6nV4Egqg9u7dFZFI/mRLYn/I
 WmDfCbvDf3+t4tGDAl0rIFyAOv4SZCO5O+9GXg9rlSRuPsZg1AcQGvAxh24plEK9Iqli rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t41hn8w9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 12:17:31 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38EC7tBr007165;
	Thu, 14 Sep 2023 12:17:30 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t41hn8w9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 12:17:30 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38ECEdXk024039;
	Thu, 14 Sep 2023 12:17:29 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t131tk5km-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 12:17:29 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38ECHQD920972154
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Sep 2023 12:17:26 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C56E92004B;
	Thu, 14 Sep 2023 12:17:26 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D141920043;
	Thu, 14 Sep 2023 12:17:24 +0000 (GMT)
Received: from [9.109.253.91] (unknown [9.109.253.91])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Sep 2023 12:17:24 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------4DM8dJXfPR0k8fSUmeizpbat"
Message-ID: <02324e34-5920-2238-0c00-f7018803939e@linux.ibm.com>
Date: Thu, 14 Sep 2023 17:47:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [V2 2/2] tools/perf/tests: Fix object code reading to skip
 address that falls out of text section
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
        jolsa@kernel.org, adrian.hunter@intel.com, irogers@google.com,
        namhyung@kernel.org
References: <20230907164529.36222-1-atrajeev@linux.vnet.ibm.com>
 <20230907164529.36222-2-atrajeev@linux.vnet.ibm.com>
From: Disha Goel <disgoel@linux.ibm.com>
In-Reply-To: <20230907164529.36222-2-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tDm0W1nCW2ew8r_tJ7aqUfg-LWWbeBKI
X-Proofpoint-GUID: kLT3_j6hkCdLFNlPjkYE65OKy0gktbHb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_09,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1011 spamscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 bulkscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309140103
X-Mailman-Approved-At: Fri, 15 Sep 2023 09:07:30 +1000
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
Cc: linux-perf-users@vger.kernel.org, kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------4DM8dJXfPR0k8fSUmeizpbat
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/09/23 10:15 pm, Athira Rajeev wrote:

> The testcase "Object code reading" fails in somecases
> for "fs_something" sub test as below:
>
>      Reading object code for memory address: 0xc008000007f0142c
>      File is: /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
>      On file address is: 0x1114cc
>      Objdump command is: objdump -z -d --start-address=0x11142c --stop-address=0x1114ac /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
>      objdump read too few bytes: 128
>      test child finished with -1
>
> This can alo be reproduced when running perf record with
> workload that exercises fs_something() code. In the test
> setup, this is exercising xfs code since root is xfs.
>
>      # perf record ./a.out
>      # perf report -v |grep "xfs.ko"
>        0.76% a.out /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko  0xc008000007de5efc B [k] xlog_cil_commit
>        0.74% a.out  /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko  0xc008000007d5ae18 B [k] xfs_btree_key_offset
>        0.74% a.out  /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko  0xc008000007e11fd4 B [k] 0x0000000000112074
>
> Here addr "0xc008000007e11fd4" is not resolved. since this is a
> kernel module, its offset is from the DSO. Xfs module is loaded
> at 0xc008000007d00000
>
>     # cat /proc/modules | grep xfs
>      xfs 2228224 3 - Live 0xc008000007d00000
>
> And size is 0x220000. So its loaded between  0xc008000007d00000
> and 0xc008000007f20000. From objdump, text section is:
>      text 0010f7bc  0000000000000000 0000000000000000 000000a0 2**4
>
> Hence perf captured ip maps to 0x112074 which is:
> ( ip - start of module ) + a0
>
> This offset 0x112074 falls out .text section which is up to 0x10f7bc
> In this case for module, the address 0xc008000007e11fd4 is pointing
> to stub instructions. This address range represents the module stubs
> which is allocated on module load and hence is not part of DSO offset.
>
> To address this issue in "object code reading", skip the sample if
> address falls out of text section and is within the module end.
> Use the "text_end" member of "struct dso" to do this check.
>
> To address this issue in "perf report", exploring an option of
> having stubs range as part of the /proc/kallsyms, so that perf
> report can resolve addresses in stubs range
>
> However this patch uses text_end to skip the stub range for
> Object code reading testcase.
>
> Reported-by: Disha Goel<disgoel@linux.ibm.com>
> Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>
> ---
> Changelog:
>   v1 -> v2:
>   Updated comment to add description on which arch has stub and
>   reason for skipping as suggested by Adrian

With this patch applied perf Object code reading test works correctly.

  26: Object code reading                                             : Ok

Tested-by: Disha Goel<disgoel@linux.ibm.com>

>   tools/perf/tests/code-reading.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/tools/perf/tests/code-reading.c b/tools/perf/tests/code-reading.c
> index ed3815163d1b..3cf6c2d42416 100644
> --- a/tools/perf/tests/code-reading.c
> +++ b/tools/perf/tests/code-reading.c
> @@ -269,6 +269,18 @@ static int read_object_code(u64 addr, size_t len, u8 cpumode,
>   	if (addr + len > map__end(al.map))
>   		len = map__end(al.map) - addr;
>   
> +	/*
> +	 * Some architectures (ex: powerpc) have stubs (trampolines) in kernel
> +	 * modules to manage long jumps. Check if the ip offset falls in stubs
> +	 * sections for kernel modules. And skip module address after text end
> +	 */
> +	if (strstr(dso->long_name, ".ko")) {
> +		if (al.addr > dso->text_end) {
> +			pr_debug("skipping the module address %#"PRIx64" after text end\n", al.addr);
> +			goto out;
> +		}
> +	}
> +
>   	/* Read the object code using perf */
>   	ret_len = dso__data_read_offset(dso, maps__machine(thread__maps(thread)),
>   					al.addr, buf1, len);
--------------4DM8dJXfPR0k8fSUmeizpbat
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>On 07/09/23 10:15 pm, Athira Rajeev wrote:</pre>
    <blockquote type="cite"
      cite="mid:20230907164529.36222-2-atrajeev@linux.vnet.ibm.com">
      <pre class="moz-quote-pre" wrap="">The testcase "Object code reading" fails in somecases
for "fs_something" sub test as below:

    Reading object code for memory address: 0xc008000007f0142c
    File is: /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
    On file address is: 0x1114cc
    Objdump command is: objdump -z -d --start-address=0x11142c --stop-address=0x1114ac /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
    objdump read too few bytes: 128
    test child finished with -1

This can alo be reproduced when running perf record with
workload that exercises fs_something() code. In the test
setup, this is exercising xfs code since root is xfs.

    # perf record ./a.out
    # perf report -v |grep "xfs.ko"
      0.76% a.out /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko  0xc008000007de5efc B [k] xlog_cil_commit
      0.74% a.out  /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko  0xc008000007d5ae18 B [k] xfs_btree_key_offset
      0.74% a.out  /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko  0xc008000007e11fd4 B [k] 0x0000000000112074

Here addr "0xc008000007e11fd4" is not resolved. since this is a
kernel module, its offset is from the DSO. Xfs module is loaded
at 0xc008000007d00000

   # cat /proc/modules | grep xfs
    xfs 2228224 3 - Live 0xc008000007d00000

And size is 0x220000. So its loaded between  0xc008000007d00000
and 0xc008000007f20000. From objdump, text section is:
    text 0010f7bc  0000000000000000 0000000000000000 000000a0 2**4

Hence perf captured ip maps to 0x112074 which is:
( ip - start of module ) + a0

This offset 0x112074 falls out .text section which is up to 0x10f7bc
In this case for module, the address 0xc008000007e11fd4 is pointing
to stub instructions. This address range represents the module stubs
which is allocated on module load and hence is not part of DSO offset.

To address this issue in "object code reading", skip the sample if
address falls out of text section and is within the module end.
Use the "text_end" member of "struct dso" to do this check.

To address this issue in "perf report", exploring an option of
having stubs range as part of the /proc/kallsyms, so that perf
report can resolve addresses in stubs range

However this patch uses text_end to skip the stub range for
Object code reading testcase.

Reported-by: Disha Goel <a class="moz-txt-link-rfc2396E" href="mailto:disgoel@linux.ibm.com">&lt;disgoel@linux.ibm.com&gt;</a>
Signed-off-by: Athira Rajeev <a class="moz-txt-link-rfc2396E" href="mailto:atrajeev@linux.vnet.ibm.com">&lt;atrajeev@linux.vnet.ibm.com&gt;</a>
---
Changelog:
 v1 -&gt; v2:
 Updated comment to add description on which arch has stub and
 reason for skipping as suggested by Adrian</pre>
    </blockquote>
    <pre>With this patch applied perf Object code reading test works correctly.

 26: Object code reading                                             : Ok

Tested-by: Disha Goel <a class="moz-txt-link-rfc2396E" href="mailto:disgoel@linux.ibm.com">&lt;disgoel@linux.ibm.com&gt;</a>
</pre>
    <blockquote type="cite"
      cite="mid:20230907164529.36222-2-atrajeev@linux.vnet.ibm.com">
      <pre class="moz-quote-pre" wrap=""> tools/perf/tests/code-reading.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/perf/tests/code-reading.c b/tools/perf/tests/code-reading.c
index ed3815163d1b..3cf6c2d42416 100644
--- a/tools/perf/tests/code-reading.c
+++ b/tools/perf/tests/code-reading.c
@@ -269,6 +269,18 @@ static int read_object_code(u64 addr, size_t len, u8 cpumode,
 	if (addr + len &gt; map__end(al.map))
 		len = map__end(al.map) - addr;
 
+	/*
+	 * Some architectures (ex: powerpc) have stubs (trampolines) in kernel
+	 * modules to manage long jumps. Check if the ip offset falls in stubs
+	 * sections for kernel modules. And skip module address after text end
+	 */
+	if (strstr(dso-&gt;long_name, ".ko")) {
+		if (al.addr &gt; dso-&gt;text_end) {
+			pr_debug("skipping the module address %#"PRIx64" after text end\n", al.addr);
+			goto out;
+		}
+	}
+
 	/* Read the object code using perf */
 	ret_len = dso__data_read_offset(dso, maps__machine(thread__maps(thread)),
 					al.addr, buf1, len);
</pre>
    </blockquote>
  </body>
</html>

--------------4DM8dJXfPR0k8fSUmeizpbat--

