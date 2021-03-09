Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFD133240B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 12:29:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvtJn0Vq8z3cTf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 22:29:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nhH5iiMs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nhH5iiMs; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvtJK6tVqz30Kw
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 22:28:49 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129B3wcx043755; Tue, 9 Mar 2021 06:28:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NkdTnnfYghbRDUtA2oEECqWmnmnNMcZrmUuMlnmwJR0=;
 b=nhH5iiMs1o9Mf1a2JW9yHs3t4q7CBcpZ++nqct5+hK32fgod+Bnu2bapZR/8IFw9GR5G
 oeuC1bUMYjJZTf61ifKeO7qAO4TwDdmDUGVB8JwOFYWm//XdDh09uQ+w7+fk08+CAnDt
 pxri66J4aDWAuDbuItmqextyXSw6v6+b5fXJIW//706gsk7J6e2XvAzncNFUtFE3wKNP
 LOweRSx0cwV2YdNkI0KB4WSeBqYBjyBpL5MZn7G99CPJipaFh81/MweB3vKAjNKdLF5G
 BqhOZs3nZEug5d2fzGvK1bAMrSjVQuOHTa6PJdR+kP6yi1uKpxsDDQoIOm6v+2L/liWc KQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375wcm7r18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 06:28:44 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 129AwlKr026965;
 Tue, 9 Mar 2021 11:28:42 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 37636fg86y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 11:28:42 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 129BSeQM40305052
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Mar 2021 11:28:40 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88232AE045;
 Tue,  9 Mar 2021 11:28:40 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 477E8AE04D;
 Tue,  9 Mar 2021 11:28:39 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.80.199.175])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  9 Mar 2021 11:28:38 +0000 (GMT)
Subject: Re: [PATCH] powerpc/perf: Fix the threshold event selection for
 memory events in power10
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
References: <1614840015-1535-1-git-send-email-atrajeev@linux.vnet.ibm.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <e8b9af3b-71d2-d4b1-313c-3e108b5e3ab7@linux.ibm.com>
Date: Tue, 9 Mar 2021 16:58:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1614840015-1535-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_09:2021-03-08,
 2021-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103090053
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 3/4/21 12:10 PM, Athira Rajeev wrote:
> Memory events (mem-loads and mem-stores) currently use the threshold
> event selection as issue to finish. Power10 supports issue to complete
> as part of thresholding which is more appropriate for mem-loads and
> mem-stores. Hence fix the event code for memory events to use issue
> to complete.

Changes looks fine to me.

Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>

We should also CC stable to include this fix?


> Fixes: a64e697cef23 ("powerpc/perf: power10 Performance Monitoring support")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>   arch/powerpc/perf/power10-events-list.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/perf/power10-events-list.h b/arch/powerpc/perf/power10-events-list.h
> index e45dafe818ed..93be7197d250 100644
> --- a/arch/powerpc/perf/power10-events-list.h
> +++ b/arch/powerpc/perf/power10-events-list.h
> @@ -75,5 +75,5 @@
>    *     thresh end (TE)
>    */
>   
> -EVENT(MEM_LOADS,				0x34340401e0);
> -EVENT(MEM_STORES,				0x343c0401e0);
> +EVENT(MEM_LOADS,				0x35340401e0);
> +EVENT(MEM_STORES,				0x353c0401e0);
