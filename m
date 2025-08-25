Return-Path: <linuxppc-dev+bounces-11239-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB202B339A7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 10:42:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9PSQ4bzRz3cb1;
	Mon, 25 Aug 2025 18:42:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756111366;
	cv=none; b=dvs4zhpjK5QaLIYfDXKIhLrtYH1cPb7DElDaWhoKYK51Y3ez50sq388qUseT1L+v1roOd2ZqthmtU+y1LRFT956wU6ZZdIUJg6zlekInAhN7KNIaxc+qObxhdbPDpPgY7r25+tw0K3ksSCe66eCmAub30KZkr34NGbYbDy26Jo03vRTb0z7n7j1VVuiL1mOrhWm74PY5N4sz0/p3tpuxcLeeeLCvWAXvnnEoP4LnvVH+3cq8323GwiTQXdqm/arjVrrXdH2LOXiuZZeNr6MA33Hp0uS7v3bHTHWBlZ/9DgH58KaY4jiGIDn8WCACPG9vGMo3kM2DDMyQz9aEnzP7FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756111366; c=relaxed/relaxed;
	bh=3XzTNM8ekqV1m3iSy8/oQuxwBAzOj3XXpL8+WGpB5mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l8JzVYoqM9NUtU+1ntNHFlkl2xOtevhA6kcGu4ZajZMhGDZQCHQOiNmVGiF298GQkIzWrU0kzxtdISz8NdHWxc2nnuDNgHtP9EydT00OH2SkA/hchftpzzB8XAd+yh0CAH9TpNEaub8ErFV12xF8EhaZMQWN1WVI6cy//wrIj6075FmSfIrZoVs1wLzSa5guS7J2k6SiGcR1dDGs3qgmOS89x5cuyXM+HZplJ0ef6vcGb2g5RaFYAMyusCrRWJmbL2IALWS/3KtZ2VoC4y+QVZB0kCkoAekwfZqH7FZzTXK4yqb900Bb0+x5yQCdXWCiJbXPPOuuNs3epNWW7vKjzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M942aTBI; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M942aTBI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9PSP5rgWz3cZr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 18:42:45 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ONIs1Q004346;
	Mon, 25 Aug 2025 08:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=3XzTNM8ekqV1m3iSy8/oQ
	uxwBAzOj3XXpL8+WGpB5mc=; b=M942aTBIUrZlqjbxnvqb2MEovhZ1dcbkEx1m2
	LIzUSlxX6/DvuQUmjZrs+BoThtgy+JvScOXieCuaNYBYB+QN2u4m7HihPP1gPTGd
	wtxW8DYZiuA39RASjePF0IPa2ZyJCmk395Ot/jEE8+TSSPtEwdpUIrEQAUK2XYT+
	GZ4E513QYY3feWXD45NVNAEaZ9EgUsk/mW4QDA+RFSnYmH8/yi/6iEUYk+Eac7o/
	YpWI5AsX3CawULvYDy2Qp4nZ0JpCulI+NbyRv/AJDyybLYileUK5CdKCuEbxbfOo
	rOJ2gwp19xtNFQIhSNGp/6tG/MP3DGjE/Niikc+PD/9T+BBtQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q42hqxnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 08:42:36 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57P8In2m025356;
	Mon, 25 Aug 2025 08:42:36 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q42hqxn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 08:42:36 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57P4qhY6007443;
	Mon, 25 Aug 2025 08:42:35 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qqyu55u5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 08:42:35 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57P8gVvZ18874718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Aug 2025 08:42:32 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D70B420040;
	Mon, 25 Aug 2025 08:42:31 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC06220043;
	Mon, 25 Aug 2025 08:42:29 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.124.213.91])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 25 Aug 2025 08:42:29 +0000 (GMT)
Date: Mon, 25 Aug 2025 14:12:27 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Haren Myneni <haren@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        msuchanek@suse.de, tyreld@linux.ibm.com, npiggin@gmail.com,
        bjking1@linux.ibm.com, hbabu@us.ibm.com
Subject: Re: [PATCH v2 4/9] powerpc/pseries: Send payload with
 ibm,send-hvpipe-msg RTAS
Message-ID: <aat5dcwwqm47wmwi4emmxa5d266ldvr7olg2d2f5klvnuxjr4i@gjx5putjxzfp>
Reply-To: mahesh@linux.ibm.com
References: <20250812225715.339225-1-haren@linux.ibm.com>
 <20250812225715.339225-5-haren@linux.ibm.com>
 <bzukfcszv6bm6np3vars73x4kjl6zfh6okwmbetmranzaan34o@aufmggdubqz7>
 <da05efd90e7e44c761c09e6d8b0e52af4daa8f1a.camel@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da05efd90e7e44c761c09e6d8b0e52af4daa8f1a.camel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAxMCBTYWx0ZWRfX4/xnm6RuSrFm
 80zc3X6IbT6o1n3GtEKrQ73e1ou5KcGjHawl8l+xmPk9mbGjJmSjBKnufqxWUwsFmmU37xSEX7m
 4Deohk+WKYR/JuA7OsoTIcytOCzbb3q27vi1LMFDF/1zpTTv8mpSH6e2z+iUc+aSZ378xIjkTMe
 fISjwR97N96EWdL6PuF6CQloaFOfqC6gZ8twky8GihkPxiKeFoP6qV3hXq/OaZRUWDFRRnu0ym2
 RL5lLWYQV0XqfIVI0L5v1X89rtlkSlBrg+RKyxycxQmgDklVwjvUH2QXG0qWgVYN1O9frWlDSqb
 nPoqfMWkSBDmfN3L8L0+O9U/+exVrzo+ZuRNOHJYYiEB/uuUjt7rK1twLxGKH6gSaSRQ0mWdL/C
 +uUFr0/C
X-Proofpoint-ORIG-GUID: yBFBSfaA-3KHbduQEQLTGr4OkPruzozZ
X-Proofpoint-GUID: fbQJsYvB2JjQ_-wZu8TbNyCv9Aoeb1wR
X-Authority-Analysis: v=2.4 cv=evffzppX c=1 sm=1 tr=0 ts=68ac21fd cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=Oedjz1oTgQnyhZ1NhsoA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230010
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-08-24 23:53:45 Sun, Haren Myneni wrote:
> On Mon, 2025-08-25 at 11:28 +0530, Mahesh J Salgaonkar wrote:
> > On 2025-08-12 15:57:08 Tue, Haren Myneni wrote:
> > > ibm,send-hvpipe-msg RTAS call is used to send data to the source
> > > (Ex: Hardware Management Console) over the hypervisor pipe. The
> > > maximum data length of 4048 bytes is supported with this RTAS call
> > > right now. The user space uses write() to send this payload which
> > > invokes this RTAS. Then the write returns the buffer length
> > > (including papr_hvpipe_hdr length) to the user space for success
> > > or RTAS failure error.
> > > 
> > > ibm,send-hvpipe-msg call takes source ID as target and the buffer
> > > in the form of buffer list. The buffer list format consists of
> > > work area of size 4K to hold buffer list and number of 4K work
> > > areas depends on buffers is as follows:
> > > 
> > > Length of Buffer List in bytes
> > > Address of 4K buffer 1
> > > Length of 4K buffer 1 used
> > > ...
> > > Address of 4K buffer n
> > > Length of 4K buffer n used
> > > 
> > > Only one buffer is used right now because of max payload size is
> > > 4088 bytes. writev() can be used in future when supported more
> > 
> > Do you mean 4048 ?
> Yes typo error. It should be 4048 bytes as mentioned in the code.
> 
> > 
> > > than one buffer.
> > > 
> > > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > > ---
> > >  arch/powerpc/platforms/pseries/papr-hvpipe.c | 120
> > > ++++++++++++++++++-
> > >  arch/powerpc/platforms/pseries/papr-hvpipe.h |   7 ++
> > >  2 files changed, 126 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c
> > > b/arch/powerpc/platforms/pseries/papr-hvpipe.c
> > > index 5768d072859d..c30f4d75e645 100644
> > > --- a/arch/powerpc/platforms/pseries/papr-hvpipe.c
> > > +++ b/arch/powerpc/platforms/pseries/papr-hvpipe.c
> > > @@ -14,6 +14,7 @@
> > >  #include <linux/of.h>
> > >  #include <asm/machdep.h>
> > >  #include <asm/rtas.h>
> > > +#include <asm/rtas-work-area.h>
> > >  #include <uapi/asm/papr-hvpipe.h>
> > >  #include "pseries.h"
> > >  #include "papr-hvpipe.h"
> > > @@ -59,6 +60,51 @@ static LIST_HEAD(hvpipe_src_list);
> > >   *   return code for failure.
> > >   */
> > >  
> > > +/*
> > > + * ibm,send-hvpipe-msg RTAS call
> > > + * @area: Caller-provided work area buffer to send.
> > > + * @srcID: Target source for the send pipe message.
> > > + */
> > > +static int rtas_ibm_send_hvpipe_msg(struct rtas_work_area *area,
> > > u32 srcID)
> > > +{
> > > +	const s32 token =
> > > rtas_function_token(RTAS_FN_IBM_SEND_HVPIPE_MSG);
> > > +	s32 fwrc;
> > > +	int ret;
> > > +
> > > +	if (token == RTAS_UNKNOWN_SERVICE)
> > > +		return -ENOENT;
> > > +
> > > +	do {
> > > +		fwrc = rtas_call(token, 2, 1, NULL, srcID,
> > > +				rtas_work_area_phys(area));
> > > +
> > > +	} while (rtas_busy_delay(fwrc));
> > > +
> > > +	switch (fwrc) {
> > > +	case RTAS_SUCCESS:
> > > +		ret = 0;
> > > +		break;
> > > +	case RTAS_HARDWARE_ERROR:
> > > +		ret = -EIO;
> > > +		break;
> > > +	case RTAS_INVALID_PARAMETER:
> > > +		ret = -EINVAL;
> > > +		break;
> > > +	case RTAS_HVPIPE_CLOSED:
> > > +		ret = -EACCES;
> > 
> > The status -4 is Pipe connection is closed/unavailabe. Instead of
> > permission denied does it make sense to return -EPIPE (Broken pipe) ?
> 
> Agree, The user space should close all FDs when sees this error. Will
> change it to -EPIPE.
> 
> Thanks for your suggestions.

Feel free to add my Reviewed-by:

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks,
-Mahesh.

