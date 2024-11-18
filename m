Return-Path: <linuxppc-dev+bounces-3398-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 973889D0AD1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2024 09:27:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsLML3jtvz2y64;
	Mon, 18 Nov 2024 19:26:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731918414;
	cv=none; b=mo9ggl3oAibBhuUNtSQ4XKi5+BF/LFGZzFDYIqrbNDbbCdHNHBAyFOhPtP/JeTqjhqsNTXA7VAm0eJ1EwCNqrav1nTD/OyAXnmDADZ38BhATyK3tVjbdRNBK4bHsbmryhsjlhMT1NavG5vgJcP5k4eDbBxIsgnU+Zd9gcOk4NQh4EmLOG28fzJWgQq9/J3VEtb+TGqKT/kT+NcR4K/GL1fYv25YsMi2A9LT6hfzzw0jIYpJcxfPuy+lA8hbVIImwzToYirB2Ga6ScXrJBTf5VavsNZSZjs/qgM8JsnVOSgeIHk1fzE8rBLACYTvTPe4Cx1Ebu1apd55ePdwrmtm12A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731918414; c=relaxed/relaxed;
	bh=pofVBIDpbmPXxKdXBZzlW6SKJ1mpQg5f+nyOC0P54ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QnH4OtokDD5C2pJZGH4+pgNTc1jbP+XVI31B99A5qprT7Rs+70Xkb8rx0x+1olFrK33UZOailEq+LCkLMrVT1n5toNGOy2+EJtxtJKqk/1jj3uTmfqNn/QqPUkx5l3yf20hNNI3VsyOpLBro497lfonCF2vxO/glG8jwkkRv1HZJFz50h8BR7o2hcU5X5K7Kcr0Qqth2okTagccb28f4bZZ6Rhjkmqh2O4jsNShEwfZvwMhfoOZBfKHKYaYsaMF7xAPXWm+AapFWVQ8b3jd81uqHbEmV2/y8GDhcyzZ9aznsZr88R8sr4MRuQEspYQHJjuDINtLPirqpsm+USG2XTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pVJ5a4Sb; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pVJ5a4Sb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XsLMK1Dx2z2xy6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2024 19:26:52 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AHJiO3Y023687;
	Mon, 18 Nov 2024 08:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=pofVBIDpbmPXxKdXBZzlW6SKJ1mpQg
	5f+nyOC0P54ZU=; b=pVJ5a4SbiQLc7KmL6NMVUat1TeAb+E4P6v1BT086o1mEhk
	asPz+d9pnH3oUetVu+XCwbjmIJgCChQ2Yg76ElBtpMc3MPIe4GEIJkdBOh3EDOTs
	BshLlGoNMECAtRDAXjrNjk0/DJ4p9T1LW6K46OwdwtMNuLDXUx7tw7C0oS59z+J9
	QShMh32WGNHKvTgEgpik3EK5hVK4TsghRPVpOZt4uDmXgH2LYgfrkGGFgYTal2qH
	dz0ScnJgPbYohwDb0fe9yXNM0o6w8EzUNqyOgMmUN0w1gT6xXC0tgw+yBkjkz/Fh
	q242Ut9KG7OxmdBC6tktol2tQuFTw331MM4YUGlg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42xgtt0eh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 08:26:15 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI73j1E030931;
	Mon, 18 Nov 2024 08:26:14 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42y63y27mu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 08:26:14 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4AI8QAR549479982
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Nov 2024 08:26:10 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD6AD20043;
	Mon, 18 Nov 2024 08:26:10 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A867E20040;
	Mon, 18 Nov 2024 08:26:06 +0000 (GMT)
Received: from osiris (unknown [9.171.77.223])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 18 Nov 2024 08:26:06 +0000 (GMT)
Date: Mon, 18 Nov 2024 09:26:05 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
        Jozsef Kadlecsik <kadlec@netfilter.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>,
        Oded Gabbay <ogabbay@kernel.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jeroen de Borst <jeroendb@google.com>,
        Praveen Kaligineedi <pkaligineedi@google.com>,
        Shailend Chand <shailend@google.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        James Smart <james.smart@broadcom.com>,
        Dick Kennedy <dick.kennedy@broadcom.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jack Wang <jinpu.wang@cloud.ionos.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Louis Peens <louis.peens@corigine.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@inria.fr,
        linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
        dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-mm@kvack.org,
        linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
        live-patching@vger.kernel.org, linux-sound@vger.kernel.org,
        etnaviv@lists.freedesktop.org, oss-drivers@corigine.com,
        linuxppc-dev@lists.ozlabs.org,
        Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH v2 04/21] s390: kernel: Convert timeouts to use
 secs_to_jiffies()
Message-ID: <20241118082605.17002-A-hca@linux.ibm.com>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-4-911fb7595e79@linux.microsoft.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115-converge-secs-to-jiffies-v2-4-911fb7595e79@linux.microsoft.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QBYvLy3JNa8evFseixOVfcUMyMppMmNG
X-Proofpoint-ORIG-GUID: QBYvLy3JNa8evFseixOVfcUMyMppMmNG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=858 adultscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411180066
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Nov 15, 2024 at 09:26:21PM +0000, Easwar Hariharan wrote:
> Changes made with the following Coccinelle rules:
> 
> @@ constant C; @@
> 
> - msecs_to_jiffies(C * 1000)
> + secs_to_jiffies(C)
> 
> @@ constant C; @@
> 
> - msecs_to_jiffies(C * MSEC_PER_SEC)
> + secs_to_jiffies(C)
> 
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>  arch/s390/kernel/lgr.c      | 3 ++-
>  arch/s390/kernel/time.c     | 4 ++--
>  arch/s390/kernel/topology.c | 2 +-
>  3 files changed, 5 insertions(+), 4 deletions(-)

...

> diff --git a/arch/s390/kernel/lgr.c b/arch/s390/kernel/lgr.c
> index 6652e54cf3db9fbdd8cfb06f8a0dc1d4c05ae7d7..68021cb38574b122bbe3d9f70e9168305360017b 100644
> --- a/arch/s390/kernel/lgr.c
> +++ b/arch/s390/kernel/lgr.c
> @@ -166,7 +166,8 @@ static struct timer_list lgr_timer;
>   */
>  static void lgr_timer_set(void)
>  {
> -	mod_timer(&lgr_timer, jiffies + msecs_to_jiffies(LGR_TIMER_INTERVAL_SECS * MSEC_PER_SEC));
> +	mod_timer(&lgr_timer,
> +		  jiffies + secs_to_jiffies(LGR_TIMER_INTERVAL_SECS));
>  }

Please don't add a new line break, especially not if the new line
would be shorter than the old one.

