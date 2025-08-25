Return-Path: <linuxppc-dev+bounces-11236-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 058EAB336D5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 08:54:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9M2z3d9xz3cYk;
	Mon, 25 Aug 2025 16:54:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756104843;
	cv=none; b=gkOTQwNKFkmmD+KcUaEWtpDSmI09M9gPRYWH/YgQIPXIxAkWjfmwuiVs+vf3lmFZ9k6A3pM6APHrmo73qoc8nXjuc/T2+gH3DAkWWNC6zOn/g+TPcbOiuDC29G4DZpTdSpdTKM+ujlOgIGzcY1zO0qqKA29C1hNSxssn95FaGhvQbTBpyIig9oKwpAtJ9UnJOmSYJNMkj0fU45ep+4cCcDMR18teCASPlTeNoshVYiYKB2TIxRWAsBb0q+RcOoQWtK4bGbCRYdx09aYhHNicBEweyjaJd8dUzcW4RhkkYpzUaEmuAUM7+65JsZMvCE9jYketa8u/VKEE9pWEAZwCJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756104843; c=relaxed/relaxed;
	bh=bh9mwpot3bhHtF+EF23O3i+sQr2bestJlevgplTWEdw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=Gec+tvW56TxsdbPGd4fJygFMUIKAT26U53a20+PINCls3uqEBMN4WHryorpG1c1UfkWG9V9YxiNaL0g/OKmNFvMReyHrc8M3XEumLfzoXkgbX6fWwK5qstKYpgLh+dOodBOkAqZFeuiypJ95uGqX/gN/dEL1imRfwOETcwAW2xA3Xw/WkWasO3t8wUKWaIkfwwbVNXnJc8C/ampUrkhSi2qhYrSW3547D0jnKPBnOLtSbXVV9saiSQmtNKc7xAxB08RB+WGYkrdxuXqEVRB9I+veRUNu1hdxqtWxO3F0Bl7qbNwPPA5bEf7mH4wr4oRJ7iLpj/iHbyOaYHxyx80C7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dhtQFER7; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dhtQFER7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9M2x2k8pz3cYb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 16:54:00 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OLKEsx020934;
	Mon, 25 Aug 2025 06:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=bh9mwp
	ot3bhHtF+EF23O3i+sQr2bestJlevgplTWEdw=; b=dhtQFER78x7LTmDa+9OW4g
	07yTXr4EeWy2DOmRphQ032DBOZh7I9KGXrvIykevCHFt+ycM7JNjFmkjMGHzbcPb
	NQg91wWgXT0zfbNnt25zYR5C68TFbr9rcwc1hnYJUFR2qPi95yITpTaDzFiFKfSo
	Zl+ieImJ8u3rIhaCFCbUKSkRrzDB3TXbDUj5qFqGjQKt1zuSGoYKmgOIMZ4KqmjH
	NcA88HtFs6cPISoVMLNW+YjwnaI6MMtdGTlTVdk1DymkUNZomkGC1qpNWG73e7iX
	jLU6eae1Z7lEhSpDqlHBM32UnpBQ0loLzKYG3lnLUh2hpsVSX8+Suq+0Yd8L5Cmg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5hpq98c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 06:53:51 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57P6qVuA004052;
	Mon, 25 Aug 2025 06:53:51 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5hpq989-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 06:53:51 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57P6oqLG002612;
	Mon, 25 Aug 2025 06:53:50 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qt6m4cat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 06:53:50 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57P6rkWU18612812
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Aug 2025 06:53:47 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A38C858062;
	Mon, 25 Aug 2025 06:53:46 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0F2C58058;
	Mon, 25 Aug 2025 06:53:45 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com (unknown [9.61.166.24])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Aug 2025 06:53:45 +0000 (GMT)
Message-ID: <da05efd90e7e44c761c09e6d8b0e52af4daa8f1a.camel@linux.ibm.com>
Subject: Re: [PATCH v2 4/9] powerpc/pseries: Send payload with
 ibm,send-hvpipe-msg RTAS
From: Haren Myneni <haren@linux.ibm.com>
To: mahesh@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        msuchanek@suse.de, tyreld@linux.ibm.com, npiggin@gmail.com,
        bjking1@linux.ibm.com, hbabu@us.ibm.com
Date: Sun, 24 Aug 2025 23:53:45 -0700
In-Reply-To: <bzukfcszv6bm6np3vars73x4kjl6zfh6okwmbetmranzaan34o@aufmggdubqz7>
References: <20250812225715.339225-1-haren@linux.ibm.com>
	 <20250812225715.339225-5-haren@linux.ibm.com>
	 <bzukfcszv6bm6np3vars73x4kjl6zfh6okwmbetmranzaan34o@aufmggdubqz7>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-27.el8_10) 
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
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfXwYsiLdEREpuO
 nrirpcQ2aeBAd9s9JJeniLkFsHfNXDNB6Vg6QXMk8OIehCO4YbkwJ9fzhFTigKC/2pMnhLyjN8C
 fPPN7H+lU5X25iRJfE+aUsBxq7DW+kDYPOzaicfNeEILp6RX9MkwxQXRr5/UqqpDrrjG8hCGE1Q
 S6usAPgRDbYh9Uaz6qjW9LbrFPNRpW8snyTupde6x9NML7ySKQdU/ShFR9LNvrCOjUA06EqTdMc
 56kb9CesXPXvMRG0RXZ7Q7SIBaBlRbGukyFmSCloH7iV+KjJEHfe8OMC+WQcgWiIdqazItj2Awt
 J0R3otbcBPNG4CgCHjn0zV6Ou7QMVibJAJ2d+d2furOce5QX20Sys8Vx7ZZJ9VWmQYAJDRpwXx0
 VETrXlJK
X-Proofpoint-ORIG-GUID: QH0tv3fer9-HIzfQni5lNxcejj8DowLb
X-Proofpoint-GUID: P28DrXNDIsfim6b1R-bdzMLEPbbtNRxz
X-Authority-Analysis: v=2.4 cv=Ndbm13D4 c=1 sm=1 tr=0 ts=68ac087f cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=J5CW7KK93opZg_CS6E0A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 2025-08-25 at 11:28 +0530, Mahesh J Salgaonkar wrote:
> On 2025-08-12 15:57:08 Tue, Haren Myneni wrote:
> > ibm,send-hvpipe-msg RTAS call is used to send data to the source
> > (Ex: Hardware Management Console) over the hypervisor pipe. The
> > maximum data length of 4048 bytes is supported with this RTAS call
> > right now. The user space uses write() to send this payload which
> > invokes this RTAS. Then the write returns the buffer length
> > (including papr_hvpipe_hdr length) to the user space for success
> > or RTAS failure error.
> > 
> > ibm,send-hvpipe-msg call takes source ID as target and the buffer
> > in the form of buffer list. The buffer list format consists of
> > work area of size 4K to hold buffer list and number of 4K work
> > areas depends on buffers is as follows:
> > 
> > Length of Buffer List in bytes
> > Address of 4K buffer 1
> > Length of 4K buffer 1 used
> > ...
> > Address of 4K buffer n
> > Length of 4K buffer n used
> > 
> > Only one buffer is used right now because of max payload size is
> > 4088 bytes. writev() can be used in future when supported more
> 
> Do you mean 4048 ?
Yes typo error. It should be 4048 bytes as mentioned in the code.

> 
> > than one buffer.
> > 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/platforms/pseries/papr-hvpipe.c | 120
> > ++++++++++++++++++-
> >  arch/powerpc/platforms/pseries/papr-hvpipe.h |   7 ++
> >  2 files changed, 126 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c
> > b/arch/powerpc/platforms/pseries/papr-hvpipe.c
> > index 5768d072859d..c30f4d75e645 100644
> > --- a/arch/powerpc/platforms/pseries/papr-hvpipe.c
> > +++ b/arch/powerpc/platforms/pseries/papr-hvpipe.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/of.h>
> >  #include <asm/machdep.h>
> >  #include <asm/rtas.h>
> > +#include <asm/rtas-work-area.h>
> >  #include <uapi/asm/papr-hvpipe.h>
> >  #include "pseries.h"
> >  #include "papr-hvpipe.h"
> > @@ -59,6 +60,51 @@ static LIST_HEAD(hvpipe_src_list);
> >   *   return code for failure.
> >   */
> >  
> > +/*
> > + * ibm,send-hvpipe-msg RTAS call
> > + * @area: Caller-provided work area buffer to send.
> > + * @srcID: Target source for the send pipe message.
> > + */
> > +static int rtas_ibm_send_hvpipe_msg(struct rtas_work_area *area,
> > u32 srcID)
> > +{
> > +	const s32 token =
> > rtas_function_token(RTAS_FN_IBM_SEND_HVPIPE_MSG);
> > +	s32 fwrc;
> > +	int ret;
> > +
> > +	if (token == RTAS_UNKNOWN_SERVICE)
> > +		return -ENOENT;
> > +
> > +	do {
> > +		fwrc = rtas_call(token, 2, 1, NULL, srcID,
> > +				rtas_work_area_phys(area));
> > +
> > +	} while (rtas_busy_delay(fwrc));
> > +
> > +	switch (fwrc) {
> > +	case RTAS_SUCCESS:
> > +		ret = 0;
> > +		break;
> > +	case RTAS_HARDWARE_ERROR:
> > +		ret = -EIO;
> > +		break;
> > +	case RTAS_INVALID_PARAMETER:
> > +		ret = -EINVAL;
> > +		break;
> > +	case RTAS_HVPIPE_CLOSED:
> > +		ret = -EACCES;
> 
> The status -4 is Pipe connection is closed/unavailabe. Instead of
> permission denied does it make sense to return -EPIPE (Broken pipe) ?

Agree, The user space should close all FDs when sees this error. Will
change it to -EPIPE.

Thanks for your suggestions.

> 
> > +		break;
> > +	case RTAS_FUNC_NOT_SUPPORTED:
> > +		ret = -EOPNOTSUPP;
> > +		break;
> > +	default:
> > +		ret = -EIO;
> > +		pr_err_ratelimited("unexpected ibm,receive-hvpipe-msg
> > status %d\n", fwrc);
> > +		break;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> [...]
> 
> Thanks,
> -Mahesh.


