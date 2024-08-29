Return-Path: <linuxppc-dev+bounces-713-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D5A96382C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 04:26:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvQBh3GQCz2yn2;
	Thu, 29 Aug 2024 12:26:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724898380;
	cv=none; b=VRSlu8ZnE7S0fiE8yExgMj0+Uo7vgZ8jMLS0xh9VZZDVEd/tb+VxG0ie3csLyWRQifSnlMXMy0HZCSdo9LsPK1VVSs6Cj2rVsRrWnQPCVfYNAHyzk4nw8x2uaJ7zOJNH6L6o8JPyrTW0jcXuvvJpIeb+OqmV5ZSs8unjWzggPDzA8kiz1b/VlyWsOloKTraxtLexNTzLCfxZEMOqFdz8ykhYJY34GP8vBE1/t7TecVFfRNUS8RGrZoE6bLHO99mxQGRJkCAxM5HJDjYfcQntmUJSUXhOVcVQTb7BwFhlpDRLrFTbFyeWzffCaMqtXcl3sUl40Xq/rlngzcDWeOcvVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724898380; c=relaxed/relaxed;
	bh=gbxzZ3hYPM6MPQ3vGsdG2IxA6riTloMwPP58d6bMTjg=;
	h=Received:DKIM-Signature:Received:Received:Received:Received:
	 Received:Received:Received:Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:X-Mailer:
	 Mime-Version:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details; b=fiSBEW4V2UiM8GX72hEeTQIgSwWca9v3CFJaimbUxM/JYI54RzMJWzthXCzG7lHfa1wEHxHJfaJ408m8KCIlviDSmG6IcqZiO5+HQRs271y4HQGKwcrJPVrbW/JZCDrF19FyH5qfBoCAUVhK/hsGongMJjpmyjY5oXFuKDV00UvRKwU6F/21eyxj7I5jD4TnIAkE/AN+QLZe/cB4a6vbSl4FP7OCsq1qMuW12Dpjz7Qv4sXh8drJNcN5tTTJyuYDm7LZ0z6yI9RZIUIsUzEWtDm5op78uPolLaotf1esrodwHpi86rA9M7HpDgKLlDEPGQQBmJ/Xuql7kOaNOCXUtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EWS3Tcbm; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EWS3Tcbm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvQBg6vyjz2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 12:26:19 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SLJN7F003863;
	Thu, 29 Aug 2024 02:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:mime-version:content-transfer-encoding; s=pp1; bh=
	gbxzZ3hYPM6MPQ3vGsdG2IxA6riTloMwPP58d6bMTjg=; b=EWS3TcbmJ05W1zNf
	iWdDQUzYEQeeMcoqOOlIir3Khij4eq43T5dVnq2V4S76S832TI/KuOIH00NIorFK
	HL/xS3fKw+gC645/tNkCBlE1IVkpfTjV26A3FdW2uzvQyGYk6d7Kd1Q+NQ53KEsr
	Mc3a0kK4xvgCt4SLKunm/YtJjBXdEEz8fOYflOEOreK6CsB1B4cMkw0/nNYn9VW0
	UGR3SSpIwXaUw0NTSZ4h7WUb5Qvkxfman39p7+Y14Sh5q6MquIIXqH8enYT3P0fI
	xp/Uziecg55zgPFJP0q1I10nlR9a8hv07xzlF9TknpRvw2vc3nH8UqAjnh+MAvbD
	IakKWA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 419q8p5xrf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 02:26:13 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47T2PECs016620;
	Thu, 29 Aug 2024 02:26:12 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 419q8p5xrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 02:26:12 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47SMaU1h008228;
	Thu, 29 Aug 2024 02:26:11 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 417v2mtcav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 02:26:11 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47T2Q8iO53739868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Aug 2024 02:26:08 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C1BD58064;
	Thu, 29 Aug 2024 02:26:08 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9CC8F5805A;
	Thu, 29 Aug 2024 02:26:07 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com (unknown [9.61.80.235])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 Aug 2024 02:26:07 +0000 (GMT)
Message-ID: <706b666aaf1e515506bb6a4bc1146ee00571a137.camel@linux.ibm.com>
Subject: Re: [PATCH v3 3/3] powerpc/pseries/dlpar: Add device tree nodes for
 DLPAR IO add
From: Haren Myneni <haren@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, tyreld@linux.ibm.com, brking@linux.ibm.com,
        hbabu@us.ibm.com
Date: Wed, 28 Aug 2024 19:26:07 -0700
In-Reply-To: <87y14hdq0r.fsf@mail.lhotse>
References: <20240822025028.938332-1-haren@linux.ibm.com>
	 <20240822025028.938332-3-haren@linux.ibm.com> <87y14hdq0r.fsf@mail.lhotse>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-26.el8_10) 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: W_5kTMQCg56kGDz0LMJzR3u8WvCRf45u
X-Proofpoint-ORIG-GUID: kSFipkjdxAww1bVGQrxGu4ItI3eZEkaN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_01,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408290014

On Wed, 2024-08-28 at 18:12 +1000, Michael Ellerman wrote:
> Hi Haren,
> 
> One query below about the of_node refcounting.
> 
> Haren Myneni <haren@linux.ibm.com> writes:
> > In the powerpc-pseries specific implementation, the IO hotplug
> > event is handled in the user space (drmgr tool). For the DLPAR
> > IO ADD, the corresponding device tree nodes and properties will
> > be added to the device tree after the device enable. The user
> > space (drmgr tool) uses configure_connector RTAS call with the
> > DRC index to retrieve the device nodes and updates the device
> > tree by writing to /proc/ppc64/ofdt. Under system lockdown,
> > /dev/mem access to allocate buffers for configure_connector RTAS
> > call is restricted which means the user space can not issue this
> > RTAS call and also can not access to /proc/ppc64/ofdt. The
> > pseries implementation need user interaction to power-on and add
> > device to the slot during the ADD event handling. So adds
> > complexity if the complete hotplug ADD event handling moved to
> > the kernel.
> > 
> > To overcome /dev/mem access restriction, this patch extends the
> > /sys/kernel/dlpar interface and provides ‘dt add index <drc_index>’
> > to the user space. The drmgr tool uses this interface to update
> > the device tree whenever the device is added. This interface
> > retrieves device tree nodes for the corresponding DRC index using
> > the configure_connector RTAS call and adds new device nodes /
> > properties to the device tree.
> > 
> > Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/platforms/pseries/dlpar.c | 130
> > +++++++++++++++++++++++++
> >  1 file changed, 130 insertions(+)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/dlpar.c
> > b/arch/powerpc/platforms/pseries/dlpar.c
> > index 1b49b47c4a4f..6f0bc3ddbf85 100644
> > --- a/arch/powerpc/platforms/pseries/dlpar.c
> > +++ b/arch/powerpc/platforms/pseries/dlpar.c
> ...
> > @@ -330,6 +345,118 @@ int dlpar_unisolate_drc(u32 drc_index)
> >  	return 0;
> >  }
> >  
> > +static struct device_node *
> > +get_device_node_with_drc_index(u32 index)
> > +{
> > +	struct device_node *np = NULL;
> > +	u32 node_index;
> > +	int rc;
> > +
> > +	for_each_node_with_property(np, "ibm,my-drc-index") {
> > +		rc = of_property_read_u32(np, "ibm,my-drc-index",
> > +					     &node_index);
> > +		if (rc) {
> > +			pr_err("%s: %pOF: of_property_read_u32 %s:
> > %d\n",
> > +			       __func__, np, "ibm,my-drc-index", rc);
> > +			of_node_put(np);
> > +			return NULL;
> > +		}
> > +
> > +		if (index == node_index)
> > +			break;
> 
> Here we return with np's refcount elevated.
> 
> > +	}
> > +
> > +	return np;
> > +}
> ...
> > +
> > +static int dlpar_hp_dt_add(u32 index)
> > +{
> > +	struct device_node *np, *nodes;
> > +	struct of_changeset ocs;
> > +	int rc;
> > +
> > +	/*
> > +	 * Do not add device node(s) if already exists in the
> > +	 * device tree.
> > +	 */
> > +	np = get_device_node_with_drc_index(index);
> > +	if (np) {
> > +		pr_err("%s: Adding device node for index (%d), but "
> > +				"already exists in the device tree\n",
> > +				__func__, index);
> > +		rc = -EINVAL;
> > +		goto out;
>  
> In the error case you drop the reference on np (at out).
> 
> > +	}
> > +	np = get_device_node_with_drc_info(index);
> > 
> But in the success case np is reassigned, so the refcount is leaked.
> I think that's unintentional, but I'm not 100% sure.

Michael, 

get_device_node_with_drc_index() holds the refcount only if the node is
already exists. In this case this refcount is dropped. 

if (np) {
                pr_err("%s: Adding device node for index (%d), but "
                                "already exists in the device tree\n",
                                __func__, index);
                rc = -EINVAL;
                goto out; --> drop refcount 
        }

Whereas failure from the get_device_node_with_drc_index() - can not
find the match node. means we do not hold the refcount and need to add
the node from get_device_node_with_drc_info()

I should add a comment regarding refcount to make it clear. will post
V4 patch with this comment.


Thanks
Haren

> cheers


