Return-Path: <linuxppc-dev+bounces-14377-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A21C73D61
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Nov 2025 12:55:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBxcF3KHTz2yv0;
	Thu, 20 Nov 2025 22:55:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763639487;
	cv=none; b=Kqz55TDtDYoadOUmhl7V8j85ZWoq6DmnCofKLI9XRGz7AOeoo1kFb7V2jMNQ1l7G8iYvTi2pXqYahYWjCTwRcKqMudUtuNAxdakNd+dKUm93gF2hAxELbu9Hg/W4vp295hzLkdFEaRlrfgaLmmubJqkLefBLMhpEl1HaI6KL8c5ukzFBzQqsevTCq9MYZmejtz4MRcpP7cWFqzVTZYj22NT7YNTEfxD8rsmT/ssIUUNxwpArO61gxBkmVebiv/+LLT3gDClKqHK0vlGV90S3V41vc0rK9H/XhGHigMUPU48vi2hwtAq6wi45ZsULwlrxIzze1NlKYUreBWjAhZDw0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763639487; c=relaxed/relaxed;
	bh=diZfiQKe6gjM4y97kHUo0YqFX3b6KrQkXx0tWBZdTGs=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To; b=YzgpGRbfftPS0CWGGxystyk5ybUrL2IeWR2iad5WGwv2bVp4kT2Q/gM1BnnmNTrrnjcQsRIxsew3tLlTX56CS05DSz8pd+VmfhErrPAOGx4EysdRabt5zgKWBbCPRZAjJ98irmvKUtnrgcKfU7SHjPf0k5o5AlxIHWKmlolwx7N1WFwxU2MnL//AGSltVGhiTx68kargNcjoVPH/00KzCB8OoqOAf93uP4qj29i5OOeym3diTbBbCfQkF0pJ7SPZwCBefDDCGwokrPiLtTGqvfc4iaaCD2dOAnBWz+f5frTOPjW5sldOXRyfHn7a1msVBR8R4Q2RjkhQBaLYRKaklA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VxJZhzO7; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VxJZhzO7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBxWy50Mkz2yr2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Nov 2025 22:51:25 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJLl0E4028030;
	Thu, 20 Nov 2025 11:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=diZfiQKe6gjM4y97kHUo0YqFX3b6Kr
	QkXx0tWBZdTGs=; b=VxJZhzO7L0n00lDf4wVuhRxh10FkyQh5CW3qHtNQJxFM+k
	HI2oo+m9+KKfrXIxXf0wsLRMRSfZ7rcJmH9xhgHrCbErHU4OSFdOfDeHFEjZS9YH
	YDu6fCH3CMR21RVmnQ/GnOSRbFKcJuj8xxmMqmASI6xqTM4CLgReZHuC+1AdfUqw
	hIp6Kl68VWrnan0EIotXrKfFj7jwnEUZcVGzEV34H1UPxjmihtvlRHbct2lBs6uB
	DxFjNtViQqNFgpUEGFVvx1/o3GkdaFpn/Wt1fqpeYSzHYqMadSZQE4l3m9TqULtj
	BZZ0ZooIdELFa3udwpoqZjCIz/qvHhIFkSPyBh3w==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejka62dj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 11:51:20 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AK8QiXR010419;
	Thu, 20 Nov 2025 11:51:19 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af3useaw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 11:51:19 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AKBpG7529164198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Nov 2025 11:51:16 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 04D9320040;
	Thu, 20 Nov 2025 11:51:16 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B3B9220043;
	Thu, 20 Nov 2025 11:51:15 +0000 (GMT)
Received: from [9.83.151.220] (unknown [9.83.151.220])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 20 Nov 2025 11:51:15 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------Fwe3idnMn0kjvx0jbVbtw7nv"
Message-ID: <c9507e7b-8802-4630-833d-e22369993b89@linux.ibm.com>
Date: Thu, 20 Nov 2025 12:51:15 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Downgrade ocxl to Odd Fixes
To: Andrew Donnellan <ajd@linux.ibm.com>,
        Christophe Lombard <clombard@linux.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20251120-ocxl-odd-fixes-v1-1-8b766f114621@linux.ibm.com>
Content-Language: en-US
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20251120-ocxl-odd-fixes-v1-1-8b766f114621@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: akZN5vQQSSbqPh-5ixmj6ozq7miakKRn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXzzd4gSoAjkr7
 rXd6VF5jZV8a7oZEptUQUkp1Lh2X/JX74MQPpbtkJAi3WqC6VmZoGBMKWq73drE0aFQrelYO1pW
 6VwAQwYHuNBO3pjuTD+Ktpi7Z51yjZdTMRcstFk8OUvmhv+IRmPPbdM36buZKu6KrupG338QJnf
 SYjgk2PhCAyfc9jYE/FG5Ltk6xgEFfQ8QEuUaX7QH8MFa3xsRQQIGKK7HOI5ytCPl5iTZygff0z
 E0QGhwl/6cKEgnY3YMSjfBdHAy1O9OEbhd2MHsoVfwoJXf696fasKJ4odFNIXxAzxqZzfiukwIX
 i7y7bbcVSahO4aA/eRU3RvI6YEpvQoyYn17xGgzRj87bpF0I4t/RKS8RzipIz9e8QMCsoU+SC7X
 7NpDxkBAForf8QYR/8v9kx9WBaiVFA==
X-Proofpoint-ORIG-GUID: akZN5vQQSSbqPh-5ixmj6ozq7miakKRn
X-Authority-Analysis: v=2.4 cv=XtL3+FF9 c=1 sm=1 tr=0 ts=691f00b8 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=r77TgQKjGQsHNAKrUKIA:9
 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=j4y0IyxOXT8mC1ccFwUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=7ZpWsS54KESwXlVTA3QA:9 a=E-LgZup7uRcSTmr8:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_04,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is a multi-part message in MIME format.
--------------Fwe3idnMn0kjvx0jbVbtw7nv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 20/11/2025 à 04:16, Andrew Donnellan a écrit :
> There hasn't been any substantive work on the ocxl driver since 2020, and
> all patches since then have been minor fixes or part of treewide or
> arch-wide changes. Frederic and I are no longer spending much time on this
> driver.
>
> Downgrade the status of the ocxl driver to Odd Fixes, to reflect the
> current reality.
>
> Signed-off-by: Andrew Donnellan<ajd@linux.ibm.com>


Acked-by: Frederic Barrat<fbarrat@linux.ibm.com>

   Fred


> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea8194ac8970d0e34421670b663347b4678a34de..3d558554f074916364b013855dc0a82cfb6e73f2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18755,7 +18755,7 @@ OCXL (Open Coherent Accelerator Processor Interface OpenCAPI) DRIVER
>   M:	Frederic Barrat<fbarrat@linux.ibm.com>
>   M:	Andrew Donnellan<ajd@linux.ibm.com>
>   L:	linuxppc-dev@lists.ozlabs.org
> -S:	Supported
> +S:	Odd Fixes
>   F:	Documentation/userspace-api/accelerators/ocxl.rst
>   F:	arch/powerpc/include/asm/pnv-ocxl.h
>   F:	arch/powerpc/platforms/powernv/ocxl.c
>
> ---
> base-commit: 23cb64fb76257309e396ea4cec8396d4a1dbae68
> change-id: 20251120-ocxl-odd-fixes-6a87a68dd270
>
>
> --
> Andrew Donnellan    OzLabs, ADL Canberra
> ajd@linux.ibm.com   IBM Australia Limited
>
--------------Fwe3idnMn0kjvx0jbVbtw7nv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">Le 20/11/2025 à 04:16, Andrew Donnellan
      a écrit :<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251120-ocxl-odd-fixes-v1-1-8b766f114621@linux.ibm.com">
      <pre wrap="" class="moz-quote-pre">There hasn't been any substantive work on the ocxl driver since 2020, and
all patches since then have been minor fixes or part of treewide or
arch-wide changes. Frederic and I are no longer spending much time on this
driver.

Downgrade the status of the ocxl driver to Odd Fixes, to reflect the
current reality.

Signed-off-by: Andrew Donnellan <a class="moz-txt-link-rfc2396E" href="mailto:ajd@linux.ibm.com">&lt;ajd@linux.ibm.com&gt;</a></pre>
    </blockquote>
    <p><span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;"><br>
        </span></span></p>
    <p><span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;">Acked-by:
          Frederic </span><span
style="font-weight:bold;color:#ff5454;background-color:#ffffff;">Barrat</span><span
          style="color:#000000;background-color:#ffffff;">
          <a class="moz-txt-link-rfc2396E" href="mailto:fbarrat@linux.ibm.com">&lt;fbarrat@linux.ibm.com&gt;</a></span><br>
      </span></p>
    <p>  Fred</p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20251120-ocxl-odd-fixes-v1-1-8b766f114621@linux.ibm.com">
      <pre wrap="" class="moz-quote-pre">
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea8194ac8970d0e34421670b663347b4678a34de..3d558554f074916364b013855dc0a82cfb6e73f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18755,7 +18755,7 @@ OCXL (Open Coherent Accelerator Processor Interface OpenCAPI) DRIVER
 M:	Frederic Barrat <a class="moz-txt-link-rfc2396E" href="mailto:fbarrat@linux.ibm.com">&lt;fbarrat@linux.ibm.com&gt;</a>
 M:	Andrew Donnellan <a class="moz-txt-link-rfc2396E" href="mailto:ajd@linux.ibm.com">&lt;ajd@linux.ibm.com&gt;</a>
 L:	<a class="moz-txt-link-abbreviated" href="mailto:linuxppc-dev@lists.ozlabs.org">linuxppc-dev@lists.ozlabs.org</a>
-S:	Supported
+S:	Odd Fixes
 F:	Documentation/userspace-api/accelerators/ocxl.rst
 F:	arch/powerpc/include/asm/pnv-ocxl.h
 F:	arch/powerpc/platforms/powernv/ocxl.c

---
base-commit: 23cb64fb76257309e396ea4cec8396d4a1dbae68
change-id: 20251120-ocxl-odd-fixes-6a87a68dd270


--
Andrew Donnellan    OzLabs, ADL Canberra
<a class="moz-txt-link-abbreviated" href="mailto:ajd@linux.ibm.com">ajd@linux.ibm.com</a>   IBM Australia Limited

</pre>
    </blockquote>
  </body>
</html>

--------------Fwe3idnMn0kjvx0jbVbtw7nv--


