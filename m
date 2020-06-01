Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 789231EA372
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 14:06:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bDR62j3kzDqHm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 22:06:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bDMT3pTHzDqLR
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jun 2020 22:03:00 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 051C21KT085887; Mon, 1 Jun 2020 08:02:08 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31d0ns97xd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jun 2020 08:02:07 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 051C22SM085957;
 Mon, 1 Jun 2020 08:02:02 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31d0ns97q6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jun 2020 08:02:02 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 051C0aQe025954;
 Mon, 1 Jun 2020 12:01:41 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 31bf481m2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jun 2020 12:01:40 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 051C0OoI54853974
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Jun 2020 12:00:24 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BFE7A406D;
 Mon,  1 Jun 2020 12:01:38 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB21FA4057;
 Mon,  1 Jun 2020 12:01:32 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.85.104.164])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  1 Jun 2020 12:01:32 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Mon, 01 Jun 2020 17:31:31 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Christoph Hellwig <hch@infradead.org>, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v8 2/5] seq_buf: Export seq_buf_printf
In-Reply-To: <20200527041244.37821-3-vaibhav@linux.ibm.com>
References: <20200527041244.37821-1-vaibhav@linux.ibm.com>
 <20200527041244.37821-3-vaibhav@linux.ibm.com>
Date: Mon, 01 Jun 2020 17:31:31 +0530
Message-ID: <87367f9eqs.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-01_07:2020-06-01,
 2020-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 adultscore=0 clxscore=1015 cotscore=-2147483648 malwarescore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=1 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006010087
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
Cc: Santosh Sivaraj <santosh@fossix.org>, linux-nvdimm@lists.01.org,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Piotr Maziarz <piotrx.maziarz@linux.intel.com>,
 Christoph Hellwig <hch@infradead.org>, Oliver O'Halloran <oohall@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hi Christoph and Steven,

Have addressed your review comment to update the patch description and
title for this patch. Can you please provide your ack to this patch.

Thanks,
~ Vaibhav

Vaibhav Jain <vaibhav@linux.ibm.com> writes:

> 'seq_buf' provides a very useful abstraction for writing to a string
> buffer without needing to worry about it over-flowing. However even
> though the API has been stable for couple of years now its still not
> exported to kernel loadable modules limiting its usage.
>
> Hence this patch proposes update to 'seq_buf.c' to mark
> seq_buf_printf() which is part of the seq_buf API to be exported to
> kernel loadable GPL modules. This symbol will be used in later parts
> of this patch-set to simplify content creation for a sysfs attribute.
>
> Cc: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
> Cc: Cezary Rojewski <cezary.rojewski@intel.com>
> Cc: Christoph Hellwig <hch@infradead.org>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Changelog:
>
> v7..v8:
> * Updated the patch title [ Christoph Hellwig ]
> * Updated patch description to replace confusing term 'external kernel
>   modules' to 'kernel lodable modules'.
>
> Resend:
> * Added ack from Steven Rostedt
>
> v6..v7:
> * New patch in the series
> ---
>  lib/seq_buf.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/lib/seq_buf.c b/lib/seq_buf.c
> index 4e865d42ab03..707453f5d58e 100644
> --- a/lib/seq_buf.c
> +++ b/lib/seq_buf.c
> @@ -91,6 +91,7 @@ int seq_buf_printf(struct seq_buf *s, const char *fmt, ...)
>  
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(seq_buf_printf);
>  
>  #ifdef CONFIG_BINARY_PRINTF
>  /**
> -- 
> 2.26.2
>
-- 
