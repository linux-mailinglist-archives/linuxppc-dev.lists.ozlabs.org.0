Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 410524905C1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 11:14:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jcnnr0jyTz3cB1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 21:14:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zs3MrwGc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Zs3MrwGc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jcl3S4kgZz2xCp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 19:11:16 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20H7QmgW023867; 
 Mon, 17 Jan 2022 08:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=b2sfjbrQ6zlHqFeECYbKAgxXP6DPtZTjZuB3iT8lPG0=;
 b=Zs3MrwGcwXd4nSgkEbzru6tiVmVx8VxCDv08DsKLIsHBaFh590vCd6TAh/OevMv/bVZQ
 zabMkmk+GbrOf9lloEg5GqqCjTK0J07ALJUYg181QtwNe/qJEASYZGVZTRQXZFDeOC6V
 aNCui+os7M8CuVnMdBOj2qw/J0g4vdhFBrVtkOQxd3pzP+x7pEvCfXNApFhPVwAWqBFZ
 X22jE1M+QBKCm2QSptSYba60iTE2zWqT8VaABlEx1abONpyIyAO6msEvi87Gjjomasjp
 BRlOL5ZJbwpEcuXmcGW67k9mcX52HX8agU1bUHUwEa/uYvGHDr1cTJkKdCN6rZkXlfiI pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn0jk4e04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 08:11:11 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20H83eN0028660;
 Mon, 17 Jan 2022 08:11:11 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn0jk4dyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 08:11:10 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20H87fDj024872;
 Mon, 17 Jan 2022 08:11:08 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3dknw99eaf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 08:11:08 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20H8B66b30343606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jan 2022 08:11:06 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D893A4054;
 Mon, 17 Jan 2022 08:11:06 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E1B0A405F;
 Mon, 17 Jan 2022 08:11:04 +0000 (GMT)
Received: from [9.43.43.186] (unknown [9.43.43.186])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Jan 2022 08:11:04 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------80wpF96HqMq7Xn1EIqHAS69X"
Message-ID: <78771d76-9ae2-9ab1-6b0e-7a93093056db@linux.ibm.com>
Date: Mon, 17 Jan 2022 13:41:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 2/2] pseries/mce: Refactor the pseries mce handling code
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20211124095500.98656-1-ganeshgr@linux.ibm.com>
 <20211124095500.98656-2-ganeshgr@linux.ibm.com>
 <1637759013.aa9l8cb1io.astroid@bobo.none>
From: Ganesh <ganeshgr@linux.ibm.com>
In-Reply-To: <1637759013.aa9l8cb1io.astroid@bobo.none>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GxqaIOzusiI4Sq0FTVOiN4qug_5772qV
X-Proofpoint-ORIG-GUID: vVhGKNN_bcFC5O1iIo0DAs7Hktjaqb1l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_02,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201170052
X-Mailman-Approved-At: Mon, 17 Jan 2022 21:13:18 +1100
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
Cc: mahesh@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------80wpF96HqMq7Xn1EIqHAS69X
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/21 18:40, Nicholas Piggin wrote:

> Excerpts from Ganesh Goudar's message of November 24, 2021 7:55 pm:
>> Now that we are no longer switching on the mmu in realmode
>> mce handler, Revert the commit 4ff753feab02("powerpc/pseries:
>> Avoid using addr_to_pfn in real mode") partially, which
>> introduced functions mce_handle_err_virtmode/realmode() to
>> separate mce handler code which needed translation to enabled.
>>
>> Signed-off-by: Ganesh Goudar<ganeshgr@linux.ibm.com>
>> ---
>>   arch/powerpc/platforms/pseries/ras.c | 122 +++++++++++----------------
>>   1 file changed, 49 insertions(+), 73 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
>> index 8613f9cc5798..62e1519b8355 100644
>> --- a/arch/powerpc/platforms/pseries/ras.c
>> +++ b/arch/powerpc/platforms/pseries/ras.c
>> @@ -511,58 +511,17 @@ int pSeries_system_reset_exception(struct pt_regs *regs)
>>   	return 0; /* need to perform reset */
>>   }
>>   
>> -static int mce_handle_err_realmode(int disposition, u8 error_type)
>> -{
>> -#ifdef CONFIG_PPC_BOOK3S_64
>> -	if (disposition == RTAS_DISP_NOT_RECOVERED) {
>> -		switch (error_type) {
>> -		case	MC_ERROR_TYPE_ERAT:
>> -			flush_erat();
>> -			disposition = RTAS_DISP_FULLY_RECOVERED;
>> -			break;
>> -		case	MC_ERROR_TYPE_SLB:
>> -			/*
>> -			 * Store the old slb content in paca before flushing.
>> -			 * Print this when we go to virtual mode.
>> -			 * There are chances that we may hit MCE again if there
>> -			 * is a parity error on the SLB entry we trying to read
>> -			 * for saving. Hence limit the slb saving to single
>> -			 * level of recursion.
>> -			 */
>> -			if (local_paca->in_mce == 1)
>> -				slb_save_contents(local_paca->mce_faulty_slbs);
>> -			flush_and_reload_slb();
>> -			disposition = RTAS_DISP_FULLY_RECOVERED;
>> -			break;
>> -		default:
>> -			break;
>> -		}
>> -	} else if (disposition == RTAS_DISP_LIMITED_RECOVERY) {
>> -		/* Platform corrected itself but could be degraded */
>> -		pr_err("MCE: limited recovery, system may be degraded\n");
>> -		disposition = RTAS_DISP_FULLY_RECOVERED;
>> -	}
>> -#endif
>> -	return disposition;
>> -}
>> -
>> -static int mce_handle_err_virtmode(struct pt_regs *regs,
>> -				   struct rtas_error_log *errp,
>> -				   struct pseries_mc_errorlog *mce_log,
>> -				   int disposition)
>> +static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
>>   {
>>   	struct mce_error_info mce_err = { 0 };
>> +	unsigned long eaddr = 0, paddr = 0;
>> +	struct pseries_errorlog *pseries_log;
>> +	struct pseries_mc_errorlog *mce_log;
>> +	int disposition = rtas_error_disposition(errp);
>>   	int initiator = rtas_error_initiator(errp);
>>   	int severity = rtas_error_severity(errp);
>> -	unsigned long eaddr = 0, paddr = 0;
>>   	u8 error_type, err_sub_type;
>>   
>> -	if (!mce_log)
>> -		goto out;
>> -
>> -	error_type = mce_log->error_type;
>> -	err_sub_type = rtas_mc_error_sub_type(mce_log);
>> -
>>   	if (initiator == RTAS_INITIATOR_UNKNOWN)
>>   		mce_err.initiator = MCE_INITIATOR_UNKNOWN;
>>   	else if (initiator == RTAS_INITIATOR_CPU)
>> @@ -588,6 +547,8 @@ static int mce_handle_err_virtmode(struct pt_regs *regs,
>>   		mce_err.severity = MCE_SEV_SEVERE;
>>   	else if (severity == RTAS_SEVERITY_ERROR)
>>   		mce_err.severity = MCE_SEV_SEVERE;
>> +	else if (severity == RTAS_SEVERITY_FATAL)
>> +		mce_err.severity = MCE_SEV_FATAL;
>>   	else
>>   		mce_err.severity = MCE_SEV_FATAL;
>>   
> What's this hunk for?
>
>> @@ -599,7 +560,18 @@ static int mce_handle_err_virtmode(struct pt_regs *regs,
>>   	mce_err.error_type = MCE_ERROR_TYPE_UNKNOWN;
>>   	mce_err.error_class = MCE_ECLASS_UNKNOWN;
>>   
>> -	switch (error_type) {
>> +	if (!rtas_error_extended(errp))
>> +		goto out;
>> +
>> +	pseries_log = get_pseries_errorlog(errp, PSERIES_ELOG_SECT_ID_MCE);
>> +	if (!pseries_log)
>> +		goto out;
>> +
>> +	mce_log = (struct pseries_mc_errorlog *)pseries_log->data;
>> +	error_type = mce_log->error_type;
>> +	err_sub_type = rtas_mc_error_sub_type(mce_log);
>> +
>> +	switch (mce_log->error_type) {
>>   	case MC_ERROR_TYPE_UE:
>>   		mce_err.error_type = MCE_ERROR_TYPE_UE;
>>   		mce_common_process_ue(regs, &mce_err);
>> @@ -692,41 +664,45 @@ static int mce_handle_err_virtmode(struct pt_regs *regs,
>>   		mce_err.error_type = MCE_ERROR_TYPE_DCACHE;
>>   		break;
>>   	case MC_ERROR_TYPE_I_CACHE:
>> -		mce_err.error_type = MCE_ERROR_TYPE_ICACHE;
>> +		mce_err.error_type = MCE_ERROR_TYPE_DCACHE;
>>   		break;
> And this one. Doesn't look right.
>
>>   	case MC_ERROR_TYPE_UNKNOWN:
>>   	default:
>>   		mce_err.error_type = MCE_ERROR_TYPE_UNKNOWN;
>>   		break;
>>   	}
>> +
>> +#ifdef CONFIG_PPC_BOOK3S_64
>> +	if (disposition == RTAS_DISP_NOT_RECOVERED) {
>> +		switch (error_type) {
>> +		case	MC_ERROR_TYPE_SLB:
>> +		case	MC_ERROR_TYPE_ERAT:
>> +			/*
>> +			 * Store the old slb content in paca before flushing.
>> +			 * Print this when we go to virtual mode.
>> +			 * There are chances that we may hit MCE again if there
>> +			 * is a parity error on the SLB entry we trying to read
>> +			 * for saving. Hence limit the slb saving to single
>> +			 * level of recursion.
>> +			 */
>> +			if (local_paca->in_mce == 1)
>> +				slb_save_contents(local_paca->mce_faulty_slbs);
>> +			flush_and_reload_slb();
>> +			disposition = RTAS_DISP_FULLY_RECOVERED;
>> +			break;
>> +		default:
>> +			break;
>> +		}
>> +	} else if (disposition == RTAS_DISP_LIMITED_RECOVERY) {
>> +		/* Platform corrected itself but could be degraded */
>> +		pr_err("MCE: limited recovery, system may be degraded\n");
>> +		disposition = RTAS_DISP_FULLY_RECOVERED;
>> +	}
> I would prefer if you just keep the mce_handle_err_realmode function
> (can rename it if you want). It's actually changed a bit since the
> patch being reverted so we don't want to undo that.

Ok, I will leave it as is for now, we can change it later.

>
> Thanks,
> Nick
--------------80wpF96HqMq7Xn1EIqHAS69X
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">
      <pre>On 11/24/21 18:40, Nicholas Piggin wrote:</pre>
    </div>
    <blockquote type="cite"
      cite="mid:1637759013.aa9l8cb1io.astroid@bobo.none">
      <pre class="moz-quote-pre" wrap="">Excerpts from Ganesh Goudar's message of November 24, 2021 7:55 pm:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Now that we are no longer switching on the mmu in realmode
mce handler, Revert the commit 4ff753feab02("powerpc/pseries:
Avoid using addr_to_pfn in real mode") partially, which
introduced functions mce_handle_err_virtmode/realmode() to
separate mce handler code which needed translation to enabled.

Signed-off-by: Ganesh Goudar <a class="moz-txt-link-rfc2396E" href="mailto:ganeshgr@linux.ibm.com">&lt;ganeshgr@linux.ibm.com&gt;</a>
---
 arch/powerpc/platforms/pseries/ras.c | 122 +++++++++++----------------
 1 file changed, 49 insertions(+), 73 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 8613f9cc5798..62e1519b8355 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -511,58 +511,17 @@ int pSeries_system_reset_exception(struct pt_regs *regs)
 	return 0; /* need to perform reset */
 }
 
-static int mce_handle_err_realmode(int disposition, u8 error_type)
-{
-#ifdef CONFIG_PPC_BOOK3S_64
-	if (disposition == RTAS_DISP_NOT_RECOVERED) {
-		switch (error_type) {
-		case	MC_ERROR_TYPE_ERAT:
-			flush_erat();
-			disposition = RTAS_DISP_FULLY_RECOVERED;
-			break;
-		case	MC_ERROR_TYPE_SLB:
-			/*
-			 * Store the old slb content in paca before flushing.
-			 * Print this when we go to virtual mode.
-			 * There are chances that we may hit MCE again if there
-			 * is a parity error on the SLB entry we trying to read
-			 * for saving. Hence limit the slb saving to single
-			 * level of recursion.
-			 */
-			if (local_paca-&gt;in_mce == 1)
-				slb_save_contents(local_paca-&gt;mce_faulty_slbs);
-			flush_and_reload_slb();
-			disposition = RTAS_DISP_FULLY_RECOVERED;
-			break;
-		default:
-			break;
-		}
-	} else if (disposition == RTAS_DISP_LIMITED_RECOVERY) {
-		/* Platform corrected itself but could be degraded */
-		pr_err("MCE: limited recovery, system may be degraded\n");
-		disposition = RTAS_DISP_FULLY_RECOVERED;
-	}
-#endif
-	return disposition;
-}
-
-static int mce_handle_err_virtmode(struct pt_regs *regs,
-				   struct rtas_error_log *errp,
-				   struct pseries_mc_errorlog *mce_log,
-				   int disposition)
+static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
 {
 	struct mce_error_info mce_err = { 0 };
+	unsigned long eaddr = 0, paddr = 0;
+	struct pseries_errorlog *pseries_log;
+	struct pseries_mc_errorlog *mce_log;
+	int disposition = rtas_error_disposition(errp);
 	int initiator = rtas_error_initiator(errp);
 	int severity = rtas_error_severity(errp);
-	unsigned long eaddr = 0, paddr = 0;
 	u8 error_type, err_sub_type;
 
-	if (!mce_log)
-		goto out;
-
-	error_type = mce_log-&gt;error_type;
-	err_sub_type = rtas_mc_error_sub_type(mce_log);
-
 	if (initiator == RTAS_INITIATOR_UNKNOWN)
 		mce_err.initiator = MCE_INITIATOR_UNKNOWN;
 	else if (initiator == RTAS_INITIATOR_CPU)
@@ -588,6 +547,8 @@ static int mce_handle_err_virtmode(struct pt_regs *regs,
 		mce_err.severity = MCE_SEV_SEVERE;
 	else if (severity == RTAS_SEVERITY_ERROR)
 		mce_err.severity = MCE_SEV_SEVERE;
+	else if (severity == RTAS_SEVERITY_FATAL)
+		mce_err.severity = MCE_SEV_FATAL;
 	else
 		mce_err.severity = MCE_SEV_FATAL;
 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What's this hunk for?

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">@@ -599,7 +560,18 @@ static int mce_handle_err_virtmode(struct pt_regs *regs,
 	mce_err.error_type = MCE_ERROR_TYPE_UNKNOWN;
 	mce_err.error_class = MCE_ECLASS_UNKNOWN;
 
-	switch (error_type) {
+	if (!rtas_error_extended(errp))
+		goto out;
+
+	pseries_log = get_pseries_errorlog(errp, PSERIES_ELOG_SECT_ID_MCE);
+	if (!pseries_log)
+		goto out;
+
+	mce_log = (struct pseries_mc_errorlog *)pseries_log-&gt;data;
+	error_type = mce_log-&gt;error_type;
+	err_sub_type = rtas_mc_error_sub_type(mce_log);
+
+	switch (mce_log-&gt;error_type) {
 	case MC_ERROR_TYPE_UE:
 		mce_err.error_type = MCE_ERROR_TYPE_UE;
 		mce_common_process_ue(regs, &amp;mce_err);
@@ -692,41 +664,45 @@ static int mce_handle_err_virtmode(struct pt_regs *regs,
 		mce_err.error_type = MCE_ERROR_TYPE_DCACHE;
 		break;
 	case MC_ERROR_TYPE_I_CACHE:
-		mce_err.error_type = MCE_ERROR_TYPE_ICACHE;
+		mce_err.error_type = MCE_ERROR_TYPE_DCACHE;
 		break;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
And this one. Doesn't look right.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 	case MC_ERROR_TYPE_UNKNOWN:
 	default:
 		mce_err.error_type = MCE_ERROR_TYPE_UNKNOWN;
 		break;
 	}
+
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (disposition == RTAS_DISP_NOT_RECOVERED) {
+		switch (error_type) {
+		case	MC_ERROR_TYPE_SLB:
+		case	MC_ERROR_TYPE_ERAT:
+			/*
+			 * Store the old slb content in paca before flushing.
+			 * Print this when we go to virtual mode.
+			 * There are chances that we may hit MCE again if there
+			 * is a parity error on the SLB entry we trying to read
+			 * for saving. Hence limit the slb saving to single
+			 * level of recursion.
+			 */
+			if (local_paca-&gt;in_mce == 1)
+				slb_save_contents(local_paca-&gt;mce_faulty_slbs);
+			flush_and_reload_slb();
+			disposition = RTAS_DISP_FULLY_RECOVERED;
+			break;
+		default:
+			break;
+		}
+	} else if (disposition == RTAS_DISP_LIMITED_RECOVERY) {
+		/* Platform corrected itself but could be degraded */
+		pr_err("MCE: limited recovery, system may be degraded\n");
+		disposition = RTAS_DISP_FULLY_RECOVERED;
+	}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I would prefer if you just keep the mce_handle_err_realmode function 
(can rename it if you want). It's actually changed a bit since the
patch being reverted so we don't want to undo that.</pre>
    </blockquote>
    <pre>Ok, I will leave it as is for now, we can change it later.</pre>
    <blockquote type="cite"
      cite="mid:1637759013.aa9l8cb1io.astroid@bobo.none">
      <pre class="moz-quote-pre" wrap="">

Thanks,
Nick
</pre>
    </blockquote>
  </body>
</html>
--------------80wpF96HqMq7Xn1EIqHAS69X--

