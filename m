Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 483AD7887C3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 14:49:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=feKBvwST;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXKXJ61ypz30fF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 22:49:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=feKBvwST;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=disgoel@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXHvm6QJrz3bwX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 21:36:04 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37PBWDIc023885;
	Fri, 25 Aug 2023 11:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=YusWZWXF1gn8oDPaa5B8VcVUwd4fXCj8GFQ29eKXiGU=;
 b=feKBvwSTcj4PjEiyvYt7/2k5Ki5hO0rfH2taTxzALDz4zZuMzDL87dxaf6NuKc8NXZqL
 5W9jpu7Vj4DM7mo8rd8Df3lT4bhNAqDUV4tVkawjgSsgRcRD/DimF+tFQ2vP8xQ+G52/
 nbl+hiQTGWKXh5BkkHaJghXS7doKuNQGmvLD7XHditscv+rwD9EQt6pDi7UX/IYnvZPv
 q1gkpcv4N4HTTI3j/DFhMch54TFaTnawyuTTt6cnD5FESUUkCLfpt7QnSN5LZ7zokdHg
 KuL5LVndQUhQSmy2SC5sdnhwq3rtlHbrzYsSgDD18aqrgS9pAQM2zmPllpSGZpdkKi2Q UA== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3spugxr2k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 11:35:57 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37PASx4C027333;
	Fri, 25 Aug 2023 11:35:56 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sn20sy7fj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 11:35:56 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37PBZrOv53412112
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Aug 2023 11:35:53 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A63320049;
	Fri, 25 Aug 2023 11:35:53 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 117FA20040;
	Fri, 25 Aug 2023 11:35:51 +0000 (GMT)
Received: from [9.43.29.72] (unknown [9.43.29.72])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Aug 2023 11:35:50 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------q0866BmGonmaPIAY76fPjSJy"
Message-ID: <f1e676a4-4222-725c-dbe9-7efbe160fc9e@linux.ibm.com>
Date: Fri, 25 Aug 2023 17:05:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH] powerpc/perf/hv-24x7: Update domain value check
To: Kajol Jain <kjain@linux.ibm.com>, mpe@ellerman.id.au
References: <20230825055601.360083-1-kjain@linux.ibm.com>
From: Disha Goel <disgoel@linux.ibm.com>
In-Reply-To: <20230825055601.360083-1-kjain@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1tPNAhu7w88AA0WnRpr7LhFe4538LhTe
X-Proofpoint-ORIG-GUID: 1tPNAhu7w88AA0WnRpr7LhFe4538LhTe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_10,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308250101
X-Mailman-Approved-At: Fri, 25 Aug 2023 22:48:36 +1000
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
Cc: atrajeev@linux.vnet.ibm.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, Krishan Gopal Sarawast <krishang@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------q0866BmGonmaPIAY76fPjSJy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/08/23 11:26 am, Kajol Jain wrote:

> Valid domain value is in range 1 to HV_PERF_DOMAIN_MAX.
> Current code has check for domain value greater than or
> equal to HV_PERF_DOMAIN_MAX. But the check for domain value 0
> is missing.
> Fix this issue by adding check for domain value 0.
>
> Fixes: ebd4a5a3ebd9 ("powerpc/perf/hv-24x7: Minor improvements")
> Reported-by: Krishan Gopal Sarawast<krishang@linux.vnet.ibm.com>  
> Signed-off-by: Kajol Jain<kjain@linux.ibm.com>

Tested the patch on power, with domain=0 not getting hcall failure after patch changes.

Before patch changes:
# ./perf stat -v -e hv_24x7/CPM_ADJUNCT_INST,domain=0,core=1/ sleep 1
Using CPUID 00800200
Control descriptor is not initialized
Error:
The sys_perf_event_open() syscall returned with 5 (Input/output error) for
event (hv_24x7/CPM_ADJUNCT_INST,domain=0,core=1/).
/bin/dmesg | grep -i perf may provide additional information.

Result from dmesg:
[   37.819387] hv-24x7: hcall failed: [0 0x60040000 0x100 0] => ret
0xfffffffffffffffc (-4) detail=0x2000000 failing ix=0

After patch changes:
# ./perf stat -v -e hv_24x7/CPM_ADJUNCT_INST,domain=0,core=1/ sleep 1
Using CPUID 00800200
Control descriptor is not initialized
Warning:
hv_24x7/CPM_ADJUNCT_INST,domain=0,core=1/ event is not supported by the kernel.
failed to read counter hv_24x7/CPM_ADJUNCT_INST,domain=0,core=1/

  Performance counter stats for 'system wide':

    <not supported>      hv_24x7/CPM_ADJUNCT_INST,domain=0,core=1/

        1.001352771 seconds time elapsed

Tested-by: Disha Goel<disgoel@linux.ibm.com>

> ---
>   arch/powerpc/perf/hv-24x7.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
> index 317175791d23..644881cc1c00 100644
> --- a/arch/powerpc/perf/hv-24x7.c
> +++ b/arch/powerpc/perf/hv-24x7.c
> @@ -1418,7 +1418,7 @@ static int h_24x7_event_init(struct perf_event *event)
>   	}
>   
>   	domain = event_get_domain(event);
> -	if (domain >= HV_PERF_DOMAIN_MAX) {
> +	if (domain  == 0 || domain >= HV_PERF_DOMAIN_MAX) {
>   		pr_devel("invalid domain %d\n", domain);
>   		return -EINVAL;
>   	}
--------------q0866BmGonmaPIAY76fPjSJy
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>On 25/08/23 11:26 am, Kajol Jain wrote:</pre>
    <blockquote type="cite"
      cite="mid:20230825055601.360083-1-kjain@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">Valid domain value is in range 1 to HV_PERF_DOMAIN_MAX.
Current code has check for domain value greater than or
equal to HV_PERF_DOMAIN_MAX. But the check for domain value 0
is missing.
Fix this issue by adding check for domain value 0.

Fixes: ebd4a5a3ebd9 ("powerpc/perf/hv-24x7: Minor improvements")
Reported-by: Krishan Gopal Sarawast <a class="moz-txt-link-rfc2396E" href="mailto:krishang@linux.vnet.ibm.com">&lt;krishang@linux.vnet.ibm.com&gt;</a> 
Signed-off-by: Kajol Jain <a class="moz-txt-link-rfc2396E" href="mailto:kjain@linux.ibm.com">&lt;kjain@linux.ibm.com&gt;</a></pre>
    </blockquote>
    <pre>Tested the patch on power, with domain=0 not getting hcall failure after patch changes.

Before patch changes:
# ./perf stat -v -e hv_24x7/CPM_ADJUNCT_INST,domain=0,core=1/ sleep 1
Using CPUID 00800200
Control descriptor is not initialized
Error:
The sys_perf_event_open() syscall returned with 5 (Input/output error) for
event (hv_24x7/CPM_ADJUNCT_INST,domain=0,core=1/).
/bin/dmesg | grep -i perf may provide additional information.

Result from dmesg:
[   37.819387] hv-24x7: hcall failed: [0 0x60040000 0x100 0] =&gt; ret
0xfffffffffffffffc (-4) detail=0x2000000 failing ix=0

After patch changes:
# ./perf stat -v -e hv_24x7/CPM_ADJUNCT_INST,domain=0,core=1/ sleep 1
Using CPUID 00800200
Control descriptor is not initialized
Warning:
hv_24x7/CPM_ADJUNCT_INST,domain=0,core=1/ event is not supported by the kernel.
failed to read counter hv_24x7/CPM_ADJUNCT_INST,domain=0,core=1/

 Performance counter stats for 'system wide':

   &lt;not supported&gt;      hv_24x7/CPM_ADJUNCT_INST,domain=0,core=1/

       1.001352771 seconds time elapsed

Tested-by: Disha Goel <a class="moz-txt-link-rfc2396E" href="mailto:disgoel@linux.ibm.com">&lt;disgoel@linux.ibm.com&gt;</a>
</pre>
    <blockquote type="cite"
      cite="mid:20230825055601.360083-1-kjain@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">
---
 arch/powerpc/perf/hv-24x7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index 317175791d23..644881cc1c00 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -1418,7 +1418,7 @@ static int h_24x7_event_init(struct perf_event *event)
 	}
 
 	domain = event_get_domain(event);
-	if (domain &gt;= HV_PERF_DOMAIN_MAX) {
+	if (domain  == 0 || domain &gt;= HV_PERF_DOMAIN_MAX) {
 		pr_devel("invalid domain %d\n", domain);
 		return -EINVAL;
 	}
</pre>
    </blockquote>
  </body>
</html>

--------------q0866BmGonmaPIAY76fPjSJy--

