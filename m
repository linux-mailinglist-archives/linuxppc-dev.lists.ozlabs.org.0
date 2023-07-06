Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AAA749EF6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 16:27:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K2Z6ZSDu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qxf5371vKz3c1C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 00:27:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K2Z6ZSDu;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qxf474W97z3bpK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 00:27:03 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Qxf466pnCz4wZv
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 00:27:02 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Qxf466lLbz4wZw; Fri,  7 Jul 2023 00:27:02 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K2Z6ZSDu;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Qxf461Ftbz4wZv
	for <linuxppc-dev@ozlabs.org>; Fri,  7 Jul 2023 00:27:01 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 366EEFKp020237
	for <linuxppc-dev@ozlabs.org>; Thu, 6 Jul 2023 14:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=uxmd5CuiEkvEzVSoYQqWM8h/Gqe3P9oGT7QRXPMQkys=;
 b=K2Z6ZSDuTVeCEtKmJAKqoyt/Wej58LijrOqAC9M8E8wSmGiCfRkIc7/u+PnaaxtODlIz
 JCtqBbiqb1J+V5T33VEyLbVI1pbYJ0gQYICcJ5JR/gFyL89YzwNm98aFqrDSnQXK9Rtz
 6FuJtP1QylvgvgGbz1caWqf5lcgofcIoIJLAjwIGtY8hkyZJXl6rBe/4zmB481lNwdOu
 k6SIzLzfNs8B1df8srvTjX8dpSA/dou1lw30vdT2NN/t5BSzAQ4ibuwNGJZE1/+EtBh7
 VPqiNDebAr1jLVyKLE6omYxugCyNUGEGx06+1Fy2QAwMJZrY3Ly7VcQRVI/To6HO2yVA 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rny6q8njn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@ozlabs.org>; Thu, 06 Jul 2023 14:26:58 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 366EEHLi020474
	for <linuxppc-dev@ozlabs.org>; Thu, 6 Jul 2023 14:26:58 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rny6q8nhr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 14:26:58 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3666xYa7021121;
	Thu, 6 Jul 2023 14:26:55 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3rjbs4uckw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 14:26:55 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 366EQqFl15008324
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Jul 2023 14:26:52 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 488FE2004B;
	Thu,  6 Jul 2023 14:26:52 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CE9A20043;
	Thu,  6 Jul 2023 14:26:51 +0000 (GMT)
Received: from in.ibm.com (unknown [9.171.33.58])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  6 Jul 2023 14:26:51 +0000 (GMT)
Date: Thu, 6 Jul 2023 19:56:48 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH] powernv/opal-prd: Silence memcpy() run-time false
 positive warnings
Message-ID: <2sk4oxw6xpxblqi64kp5n4i7llfmf2vun4waqh7mwsqy3n3ubg@bfc6xzjsdskh>
References: <168776304370.89193.185568680784294524.stgit@jupiter>
 <72357055-fc0a-38ba-8c45-cdb07b284fbf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72357055-fc0a-38ba-8c45-cdb07b284fbf@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: u23as8Ie7zoYpNrb2I7BxjHwQ5OosFev
X-Proofpoint-ORIG-GUID: XzB-P-glrPQgb3l2lvrHz8KddrNJhosp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_10,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 mlxlogscore=814 mlxscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060126
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
Reply-To: mahesh@linux.ibm.com
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-07-05 11:06:46 Wed, Jordan Niethe wrote:
> 
> 
> On 26/6/23 5:04 pm, Mahesh Salgaonkar wrote:
> > opal_prd_msg_notifier extracts the opal prd message size from the message
> > header and uses it for allocating opal_prd_msg_queue_item that includes
> > the correct message size to be copied. However, while running under
> > CONFIG_FORTIFY_SOURCE=y, it triggers following run-time warning:
> > 
> > [ 6458.234352] memcpy: detected field-spanning write (size 32) of single field "&item->msg" at arch/powerpc/platforms/powernv/opal-prd.c:355 (size 4)
> > [ 6458.234390] WARNING: CPU: 9 PID: 660 at arch/powerpc/platforms/powernv/opal-prd.c:355 opal_prd_msg_notifier+0x174/0x188 [opal_prd]
> > [...]
> > [ 6458.234709] NIP [c00800000e0c0e6c] opal_prd_msg_notifier+0x174/0x188 [opal_prd]
> > [ 6458.234723] LR [c00800000e0c0e68] opal_prd_msg_notifier+0x170/0x188 [opal_prd]
> > [ 6458.234736] Call Trace:
> > [ 6458.234742] [c0000002acb23c10] [c00800000e0c0e68] opal_prd_msg_notifier+0x170/0x188 [opal_prd] (unreliable)
> > [ 6458.234759] [c0000002acb23ca0] [c00000000019ccc0] notifier_call_chain+0xc0/0x1b0
> > [ 6458.234774] [c0000002acb23d00] [c00000000019ceac] atomic_notifier_call_chain+0x2c/0x40
> > [ 6458.234788] [c0000002acb23d20] [c0000000000d69b4] opal_message_notify+0xf4/0x2c0
> > [...]
> > 
> > Add a flexible array member to avoid false positive run-time warning.
> > 
> > Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> > Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> > ---
> >   arch/powerpc/platforms/powernv/opal-prd.c |    7 +++++--
> >   1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/powernv/opal-prd.c b/arch/powerpc/platforms/powernv/opal-prd.c
> > index 113bdb151f687..9e2c4775f75f5 100644
> > --- a/arch/powerpc/platforms/powernv/opal-prd.c
> > +++ b/arch/powerpc/platforms/powernv/opal-prd.c
> > @@ -30,7 +30,10 @@
> >    */
> >   struct opal_prd_msg_queue_item {
> >   	struct list_head		list;
> > -	struct opal_prd_msg_header	msg;
> > +	union {
> > +		struct opal_prd_msg_header	msg;
> > +		DECLARE_FLEX_ARRAY(__u8, msg_flex);
> > +	};
> >   };
> >   static struct device_node *prd_node;
> > @@ -352,7 +355,7 @@ static int opal_prd_msg_notifier(struct notifier_block *nb,
> >   	if (!item)
> >   		return -ENOMEM;
> > -	memcpy(&item->msg, msg->params, msg_size);
> > +	memcpy(&item->msg_flex, msg->params, msg_size);
> 
> This does silence the warning but it seems like we might be able to go a
> little further.
> 
> What about not adding that flex array to struct opal_prd_msg_queue_item, but
> adding one to struct opal_prd_msg. That is what the data format actually is.
> 
> So we'd have something like:
> 
> 
>     struct opal_prd_msg  {
> 
>         struct opal_prd_msg_header hdr;
> 
>         char msg[];
> 
>     }
> 
> 
> and change things to use that instead?
> 
> But that might be more trouble than it is worth,

Yup, it would cause more changes to the code elsewhere as well.

> alternatively we can just
> do:
> 
> 	item->msg = *hdr;
> 	memcpy((char *)item->msg + sizeof(*hdr), (char *)hdr + sizeof(*hdr),
> msg_size - sizeof(*hdr));

Agree, this helps, I tried with small change to above code which
also works fine.

	item->msg = *hdr;
	hdr++;
	memcpy((char *)&item->msg + sizeof(*hdr), hdr, msg_size - sizeof(*hdr));

Will send out v2.

Thanks,
-Mahesh.
