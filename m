Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CFD307FEA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 21:52:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRXjS18rzzDrgJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 07:52:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=s/l0pmVJ; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRXgk4TChzDrfR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 07:51:13 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10SKVcpg023361; Thu, 28 Jan 2021 15:51:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type; s=pp1; bh=pPg1XBrZNOKt8PfRp2cpKYCHVhYVgYATSuz8a5k9sWs=;
 b=s/l0pmVJBeGfhLJGM9iTfiQoVbA/zJnyD9eZBqmBkrJsTkZ5ibP8rglrttvRBSJ2rWqC
 VegDJ4kmPIvKZ7zh+i42gtnv6ereyfJEOfXjA1EJJjouLOAxeL8Wu7sdFp2kaaV/oC5L
 0bRfDr0n3n6Ce2PtVwfT7K8X7ahWKVjb6rU9xh3OCwKu/sY1jcDdwAJ+9fN+/0tzmwHg
 Z/6Q+Y7JCWhJH/daaz4NJ9GkJKNHemPLI+uWgo7PHEcyV1c/FWoPCS9UyXuO9L6ncyb+
 xKhbBiZEJMePet4Al5qjHZoPW8BVl9ivby8bodas04NDxBMjvtRoM60rMYHWOP8Gezwq iw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36c3b6sxe8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 15:51:05 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10SKW4IC027685;
 Thu, 28 Jan 2021 15:51:05 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36c3b6sxdx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 15:51:05 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10SKgio5020310;
 Thu, 28 Jan 2021 20:51:04 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02dal.us.ibm.com with ESMTP id 36a4mccqkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 20:51:04 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10SKp3ln28901864
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jan 2021 20:51:03 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FFFFAE05F;
 Thu, 28 Jan 2021 20:51:03 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF93EAE060;
 Thu, 28 Jan 2021 20:50:58 +0000 (GMT)
Received: from manicouagan.localdomain (unknown [9.85.160.249])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 28 Jan 2021 20:50:58 +0000 (GMT)
References: <20210128181421.2279-1-hch@lst.de>
 <20210128181421.2279-5-hch@lst.de>
User-agent: mu4e 1.4.10; emacs 27.1
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/13] module: use RCU to synchronize find_module
In-reply-to: <20210128181421.2279-5-hch@lst.de>
Date: Thu, 28 Jan 2021 17:50:56 -0300
Message-ID: <874kj023bj.fsf@manicouagan.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-28_12:2021-01-28,
 2021-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999 clxscore=1011
 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101280097
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
Cc: Petr Mladek <pmladek@suse.com>, Jiri Kosina <jikos@kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 live-patching@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
 Joe Lawrence <joe.lawrence@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Jessica Yu <jeyu@kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miroslav Benes <mbenes@suse.cz>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hi Christoph,

Christoph Hellwig <hch@lst.de> writes:

> diff --git a/kernel/module.c b/kernel/module.c
> index 981302f616b411..6772fb2680eb3e 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -668,7 +668,6 @@ static struct module *find_module_all(const char *name, size_t len,
>  
>  struct module *find_module(const char *name)
>  {
> -	module_assert_mutex();

Does it make sense to replace the assert above with the warn below (untested)?

     RCU_LOCKDEP_WARN(rcu_read_lock_sched_held());

>  	return find_module_all(name, strlen(name), false);
>  }

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
