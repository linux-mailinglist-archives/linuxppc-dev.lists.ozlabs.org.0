Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5584F1EA647
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 16:49:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bJ3C3TqpzDqRW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 00:49:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bJ0g08JyzDqPn
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 00:46:58 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 051Ek2bB135572; Mon, 1 Jun 2020 10:46:20 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31bm15jwv7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jun 2020 10:46:20 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 051EkETP136822;
 Mon, 1 Jun 2020 10:46:19 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31bm15jwu1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jun 2020 10:46:19 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 051Edxwd013432;
 Mon, 1 Jun 2020 14:46:17 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 31bf47v92e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jun 2020 14:46:17 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 051EkEBu56819942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Jun 2020 14:46:15 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C58164C046;
 Mon,  1 Jun 2020 14:46:14 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52DFD4C04A;
 Mon,  1 Jun 2020 14:46:10 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.199.63.9])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  1 Jun 2020 14:46:10 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Mon, 01 Jun 2020 20:16:08 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v8 2/5] seq_buf: Export seq_buf_printf
In-Reply-To: <20200601094842.3cd0cab6@gandalf.local.home>
References: <20200527041244.37821-1-vaibhav@linux.ibm.com>
 <20200527041244.37821-3-vaibhav@linux.ibm.com> <87367f9eqs.fsf@linux.ibm.com>
 <20200601094842.3cd0cab6@gandalf.local.home>
Date: Mon, 01 Jun 2020 20:16:08 +0530
Message-ID: <87zh9m974f.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-01_10:2020-06-01,
 2020-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 suspectscore=0 cotscore=-2147483648 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006010103
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
Cc: Santosh Sivaraj <santosh@fossix.org>, Ira Weiny <ira.weiny@intel.com>,
 linux-nvdimm@lists.01.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Piotr Maziarz <piotrx.maziarz@linux.intel.com>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Oliver O'Halloran <oohall@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Steven Rostedt <rostedt@goodmis.org> writes:

> On Mon, 01 Jun 2020 17:31:31 +0530
> Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
>
>> Hi Christoph and Steven,
>> 
>> Have addressed your review comment to update the patch description and
>> title for this patch. Can you please provide your ack to this patch.
>> 
>> 
>
> I thought I already did, but it appears it was a reply to a private email
> you sent to me. I didn't realize it was off list.
>
> Anyway:
>
>  Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

Thanks Steven,

Had added your ack to Resend-v7 of this patch at [1] on which Christoph
Hellwig requested an update of patch title. Hence needed your re-ack for
this version of the patch

[1] : https://lore.kernel.org/linux-nvdimm/20200519190058.257981-3-vaibhav@linux.ibm.com/

>
> -- Steve

Cheers
~ Vaibhav
