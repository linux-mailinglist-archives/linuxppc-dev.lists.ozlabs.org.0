Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5D65BAD3B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 14:19:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTY5k4hhJz3c87
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 22:19:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WjJbAZAD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=disgoel@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WjJbAZAD;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTX0v216dz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 21:29:50 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28GBPQR1012509;
	Fri, 16 Sep 2022 11:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=dGownrXJMaBjYRzEh6MbykUdlQi9SIBWfxCI5lHrIOE=;
 b=WjJbAZADA77kj927lEq+8nKdHISfIHfrGC7jrM8RT9DAKPrvx7zlRj4nP0AvE84O160v
 zpM8SCBOwb6fZy2I+Gxel5jOl1A6bAxqE6YlPppyKW9liPicuUFLK1XbVT3i82/3rxyx
 CDIcSnnuVa6wqom6dEJmlrssYX639/e8v62YGOFx4EBy8Tu/aCAXjbYCjJ95HlT5PD3P
 MpGGInksWwPeVsco0pFHkOAQQ0kZsjjyxdMtfZ8UdcIQFNhbfmzYBLOT6SaRfp2nstBn
 VhDz1u5FdaBDiIxhznPQIF8HWyzkilLAnSJIlsuTV4w8rrkfxSntnYFnBvDE8FmNmeH1 pg== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmr8e82sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 11:29:40 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28GBLeYY002889;
	Fri, 16 Sep 2022 11:29:38 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma05fra.de.ibm.com with ESMTP id 3jm91crp2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 11:29:38 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28GBTY2x41222530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 11:29:34 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3D42A405B;
	Fri, 16 Sep 2022 11:29:34 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B901A4060;
	Fri, 16 Sep 2022 11:29:30 +0000 (GMT)
Received: from [9.43.57.26] (unknown [9.43.57.26])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 11:29:29 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------k0Zv4BFcTfFQnbSDvddDG7c9"
Message-ID: <b11ab2ef-0176-6622-7b59-47d42d90c5d7@linux.ibm.com>
Date: Fri, 16 Sep 2022 16:59:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH V2] tools/perf/tests: Fix perf probe error log check in
 skip_if_no_debuginfo
Content-Language: en-US
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
        jolsa@kernel.org, mpe@ellerman.id.au
References: <20220916104904.99798-1-atrajeev@linux.vnet.ibm.com>
From: Disha Goel <disgoel@linux.ibm.com>
In-Reply-To: <20220916104904.99798-1-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gFR1qAJ23P9ZH4kC4wBdi2QuQDR2ZaEG
X-Proofpoint-GUID: gFR1qAJ23P9ZH4kC4wBdi2QuQDR2ZaEG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_06,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 bulkscore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160082
X-Mailman-Approved-At: Fri, 16 Sep 2022 22:18:31 +1000
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------k0Zv4BFcTfFQnbSDvddDG7c9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/16/22 4:19 PM, Athira Rajeev wrote:
> The perf probe related tests like probe_vfs_getname.sh which
> is in "tools/perf/tests/shell" directory have dependency on
> debuginfo information in the kernel. Currently debuginfo
> check is handled by skip_if_no_debuginfo function in the
> file "lib/probe_vfs_getname.sh". skip_if_no_debuginfo function
> looks for this specific error log from perf probe to skip
> the testcase:
>
> <<>>
> Failed to find the path for the kernel|Debuginfo-analysis is
> not supported
> <>>
>
> But in some case, like this one in powerpc, while running this
> test, observed error logs is:
>
> <<>>
> The /lib/modules/<version>/build/vmlinux file has no debug information.
> Rebuild with CONFIG_DEBUG_INFO=y, or install an appropriate debuginfo
> package.
>    Error: Failed to add events.
> <<>>
>
> Update the skip_if_no_debuginfo function to include the above
> error, to skip the test in these scenarios too.
>
> Reported-by: Disha Goel<disgoel@linux.vnet.ibm.com>
> Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>

Tested-by: Disha Goel<disgoel@linux.vnet.ibm.com>

> ---
> changelog:
>   v1 -> v2:
>   Corrected formatting of spaces in error log.
>   With spaces in v1 of the patch, the egrep search was
>   considering spaces also.
>
>   tools/perf/tests/shell/lib/probe_vfs_getname.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/tests/shell/lib/probe_vfs_getname.sh b/tools/perf/tests/shell/lib/probe_vfs_getname.sh
> index 5b17d916c555..b616d42bd19d 100644
> --- a/tools/perf/tests/shell/lib/probe_vfs_getname.sh
> +++ b/tools/perf/tests/shell/lib/probe_vfs_getname.sh
> @@ -19,6 +19,6 @@ add_probe_vfs_getname() {
>   }
>
>   skip_if_no_debuginfo() {
> -	add_probe_vfs_getname -v 2>&1 | egrep -q "^(Failed to find the path for the kernel|Debuginfo-analysis is not supported)" && return 2
> +	add_probe_vfs_getname -v 2>&1 | egrep -q "^(Failed to find the path for the kernel|Debuginfo-analysis is not supported)|(file has no debug information)" && return 2
>   	return 1
>   }
--------------k0Zv4BFcTfFQnbSDvddDG7c9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/16/22 4:19 PM, Athira Rajeev
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20220916104904.99798-1-atrajeev@linux.vnet.ibm.com">
      <pre class="moz-quote-pre" wrap="">The perf probe related tests like probe_vfs_getname.sh which
is in "tools/perf/tests/shell" directory have dependency on
debuginfo information in the kernel. Currently debuginfo
check is handled by skip_if_no_debuginfo function in the
file "lib/probe_vfs_getname.sh". skip_if_no_debuginfo function
looks for this specific error log from perf probe to skip
the testcase:

&lt;&lt;&gt;&gt;
Failed to find the path for the kernel|Debuginfo-analysis is
not supported
&lt;&gt;&gt;

But in some case, like this one in powerpc, while running this
test, observed error logs is:

&lt;&lt;&gt;&gt;
The /lib/modules/&lt;version&gt;/build/vmlinux file has no debug information.
Rebuild with CONFIG_DEBUG_INFO=y, or install an appropriate debuginfo
package.
  Error: Failed to add events.
&lt;&lt;&gt;&gt;

Update the skip_if_no_debuginfo function to include the above
error, to skip the test in these scenarios too.

Reported-by: Disha Goel <a class="moz-txt-link-rfc2396E" href="mailto:disgoel@linux.vnet.ibm.com">&lt;disgoel@linux.vnet.ibm.com&gt;</a>
Signed-off-by: Athira Rajeev <a class="moz-txt-link-rfc2396E" href="mailto:atrajeev@linux.vnet.ibm.com">&lt;atrajeev@linux.vnet.ibm.com&gt;</a></pre>
    </blockquote>
    <pre>Tested-by: Disha Goel <a class="moz-txt-link-rfc2396E" href="mailto:disgoel@linux.vnet.ibm.com">&lt;disgoel@linux.vnet.ibm.com&gt;</a></pre>
    <blockquote type="cite"
      cite="mid:20220916104904.99798-1-atrajeev@linux.vnet.ibm.com">
      <pre class="moz-quote-pre" wrap="">
---
changelog:
 v1 -&gt; v2:
 Corrected formatting of spaces in error log.
 With spaces in v1 of the patch, the egrep search was
 considering spaces also.

 tools/perf/tests/shell/lib/probe_vfs_getname.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/lib/probe_vfs_getname.sh b/tools/perf/tests/shell/lib/probe_vfs_getname.sh
index 5b17d916c555..b616d42bd19d 100644
--- a/tools/perf/tests/shell/lib/probe_vfs_getname.sh
+++ b/tools/perf/tests/shell/lib/probe_vfs_getname.sh
@@ -19,6 +19,6 @@ add_probe_vfs_getname() {
 }

 skip_if_no_debuginfo() {
-	add_probe_vfs_getname -v 2&gt;&amp;1 | egrep -q "^(Failed to find the path for the kernel|Debuginfo-analysis is not supported)" &amp;&amp; return 2
+	add_probe_vfs_getname -v 2&gt;&amp;1 | egrep -q "^(Failed to find the path for the kernel|Debuginfo-analysis is not supported)|(file has no debug information)" &amp;&amp; return 2
 	return 1
 }
</pre>
    </blockquote>
  </body>
</html>

--------------k0Zv4BFcTfFQnbSDvddDG7c9--

