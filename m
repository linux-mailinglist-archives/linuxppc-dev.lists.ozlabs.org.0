Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5FC3F538C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 01:12:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gtp1T3cCsz2yPK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 09:12:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GhoJXtV1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GhoJXtV1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GthGr5lZZz2xYP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 04:53:56 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17NIYPpM055175; Mon, 23 Aug 2021 14:53:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=x+sM6L9lKi1NwenP9acWV1EaMmm4HAfMaJ/dx1sufko=;
 b=GhoJXtV1P+nObHWKLhRb1T0r7u3sqcPRFmIYiReiGLdono3Lq+rb/BHX4kFHRYXqGut3
 HTOv22UX+E3k2noBvupD2eSXxTmnsupYW8n/tq1om8TQG3cRsGXmjAFoPSfMkzlg5UH4
 wRxqquXR/zICSlTX3AYMU/lNPudLX/AjgVO292jewYIHznOpKRmN7qTJkAy/L96TDYBW
 xPiGpbeYEz5pTfT7Oxoqkgb8uCB0aGvYmITJU82k6yOr3/06LhjoUaZmZ1co7kaU76Ci
 jvrtpWKHLy25c7NnPUkMFwrXrNYl1WABdeX9oSi4kZFbUU5fXc0WWq/gQ7p4sNp0NzQn Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3amcjjhn50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 14:53:47 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17NIYura056185;
 Mon, 23 Aug 2021 14:53:47 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3amcjjhn4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 14:53:47 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17NIrYRb018279;
 Mon, 23 Aug 2021 18:53:45 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 3ajrrhu8ap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 18:53:45 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17NIrhPu28574056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Aug 2021 18:53:43 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A7AD42041;
 Mon, 23 Aug 2021 18:53:43 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F0364204C;
 Mon, 23 Aug 2021 18:53:41 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com (unknown
 [9.199.46.131])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 23 Aug 2021 18:53:40 +0000 (GMT)
Subject: Re: [PATCH v2 1/3] powerpc/pseries: Parse control memory access error
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20210805092025.272871-1-ganeshgr@linux.ibm.com>
From: Ganesh <ganeshgr@linux.ibm.com>
Message-ID: <1e5a7f4b-ddf7-69f2-bbaf-913644175c3e@linux.ibm.com>
Date: Tue, 24 Aug 2021 00:23:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210805092025.272871-1-ganeshgr@linux.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------462BBB08512A27BD48916A3D"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EzFFMjuATQZrJbZpIQO-mcD84XN8zhMc
X-Proofpoint-ORIG-GUID: RY_qO7iSqFUOojLRZlFJWHUMn2DCYnsV
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-23_04:2021-08-23,
 2021-08-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108230126
X-Mailman-Approved-At: Tue, 24 Aug 2021 09:12:09 +1000
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
--------------462BBB08512A27BD48916A3D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi mpe, Any comments on this patchset?

On 8/5/21 2:50 PM, Ganesh Goudar wrote:

> Add support to parse and log control memory access
> error for pseries.
>
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---
> v2: No changes in this patch.
> ---
>   arch/powerpc/platforms/pseries/ras.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
> index 167f2e1b8d39..608c35cad0c3 100644
> --- a/arch/powerpc/platforms/pseries/ras.c
> +++ b/arch/powerpc/platforms/pseries/ras.c
> @@ -80,6 +80,7 @@ struct pseries_mc_errorlog {
>   #define MC_ERROR_TYPE_TLB		0x04
>   #define MC_ERROR_TYPE_D_CACHE		0x05
>   #define MC_ERROR_TYPE_I_CACHE		0x07
> +#define MC_ERROR_TYPE_CTRL_MEM_ACCESS	0x08
>   
>   /* RTAS pseries MCE error sub types */
>   #define MC_ERROR_UE_INDETERMINATE		0
> @@ -103,6 +104,9 @@ struct pseries_mc_errorlog {
>   #define MC_ERROR_TLB_MULTIHIT		2
>   #define MC_ERROR_TLB_INDETERMINATE	3
>   
> +#define MC_ERROR_CTRL_MEM_ACCESS_PTABLE_WALK	0
> +#define MC_ERROR_CTRL_MEM_ACCESS_OP_ACCESS	1
> +
>   static inline u8 rtas_mc_error_sub_type(const struct pseries_mc_errorlog *mlog)
>   {
>   	switch (mlog->error_type) {
> @@ -112,6 +116,8 @@ static inline u8 rtas_mc_error_sub_type(const struct pseries_mc_errorlog *mlog)
>   	case	MC_ERROR_TYPE_ERAT:
>   	case	MC_ERROR_TYPE_TLB:
>   		return (mlog->sub_err_type & 0x03);
> +	case	MC_ERROR_TYPE_CTRL_MEM_ACCESS:
> +		return (mlog->sub_err_type & 0x70) >> 4;
>   	default:
>   		return 0;
>   	}
> @@ -699,6 +705,21 @@ static int mce_handle_err_virtmode(struct pt_regs *regs,
>   	case MC_ERROR_TYPE_I_CACHE:
>   		mce_err.error_type = MCE_ERROR_TYPE_ICACHE;
>   		break;
> +	case MC_ERROR_TYPE_CTRL_MEM_ACCESS:
> +		mce_err.error_type = MCE_ERROR_TYPE_RA;
> +		if (mce_log->sub_err_type & 0x80)
> +			eaddr = be64_to_cpu(mce_log->effective_address);
> +		switch (err_sub_type) {
> +		case MC_ERROR_CTRL_MEM_ACCESS_PTABLE_WALK:
> +			mce_err.u.ra_error_type =
> +				MCE_RA_ERROR_PAGE_TABLE_WALK_LOAD_STORE_FOREIGN;
> +			break;
> +		case MC_ERROR_CTRL_MEM_ACCESS_OP_ACCESS:
> +			mce_err.u.ra_error_type =
> +				MCE_RA_ERROR_LOAD_STORE_FOREIGN;
> +			break;
> +		}
> +		break;
>   	case MC_ERROR_TYPE_UNKNOWN:
>   	default:
>   		mce_err.error_type = MCE_ERROR_TYPE_UNKNOWN;

--------------462BBB08512A27BD48916A3D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi mpe, Any comments on this patchset?
</pre>
    <div class="moz-cite-prefix">
      <pre>On 8/5/21 2:50 PM, Ganesh Goudar wrote:</pre>
    </div>
    <blockquote type="cite"
      cite="mid:20210805092025.272871-1-ganeshgr@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">Add support to parse and log control memory access
error for pseries.

Signed-off-by: Ganesh Goudar <a class="moz-txt-link-rfc2396E" href="mailto:ganeshgr@linux.ibm.com">&lt;ganeshgr@linux.ibm.com&gt;</a>
---
v2: No changes in this patch.
---
 arch/powerpc/platforms/pseries/ras.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 167f2e1b8d39..608c35cad0c3 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -80,6 +80,7 @@ struct pseries_mc_errorlog {
 #define MC_ERROR_TYPE_TLB		0x04
 #define MC_ERROR_TYPE_D_CACHE		0x05
 #define MC_ERROR_TYPE_I_CACHE		0x07
+#define MC_ERROR_TYPE_CTRL_MEM_ACCESS	0x08
 
 /* RTAS pseries MCE error sub types */
 #define MC_ERROR_UE_INDETERMINATE		0
@@ -103,6 +104,9 @@ struct pseries_mc_errorlog {
 #define MC_ERROR_TLB_MULTIHIT		2
 #define MC_ERROR_TLB_INDETERMINATE	3
 
+#define MC_ERROR_CTRL_MEM_ACCESS_PTABLE_WALK	0
+#define MC_ERROR_CTRL_MEM_ACCESS_OP_ACCESS	1
+
 static inline u8 rtas_mc_error_sub_type(const struct pseries_mc_errorlog *mlog)
 {
 	switch (mlog-&gt;error_type) {
@@ -112,6 +116,8 @@ static inline u8 rtas_mc_error_sub_type(const struct pseries_mc_errorlog *mlog)
 	case	MC_ERROR_TYPE_ERAT:
 	case	MC_ERROR_TYPE_TLB:
 		return (mlog-&gt;sub_err_type &amp; 0x03);
+	case	MC_ERROR_TYPE_CTRL_MEM_ACCESS:
+		return (mlog-&gt;sub_err_type &amp; 0x70) &gt;&gt; 4;
 	default:
 		return 0;
 	}
@@ -699,6 +705,21 @@ static int mce_handle_err_virtmode(struct pt_regs *regs,
 	case MC_ERROR_TYPE_I_CACHE:
 		mce_err.error_type = MCE_ERROR_TYPE_ICACHE;
 		break;
+	case MC_ERROR_TYPE_CTRL_MEM_ACCESS:
+		mce_err.error_type = MCE_ERROR_TYPE_RA;
+		if (mce_log-&gt;sub_err_type &amp; 0x80)
+			eaddr = be64_to_cpu(mce_log-&gt;effective_address);
+		switch (err_sub_type) {
+		case MC_ERROR_CTRL_MEM_ACCESS_PTABLE_WALK:
+			mce_err.u.ra_error_type =
+				MCE_RA_ERROR_PAGE_TABLE_WALK_LOAD_STORE_FOREIGN;
+			break;
+		case MC_ERROR_CTRL_MEM_ACCESS_OP_ACCESS:
+			mce_err.u.ra_error_type =
+				MCE_RA_ERROR_LOAD_STORE_FOREIGN;
+			break;
+		}
+		break;
 	case MC_ERROR_TYPE_UNKNOWN:
 	default:
 		mce_err.error_type = MCE_ERROR_TYPE_UNKNOWN;
</pre>
    </blockquote>
  </body>
</html>

--------------462BBB08512A27BD48916A3D--

