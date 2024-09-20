Return-Path: <linuxppc-dev+bounces-1481-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA2797CFDE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2024 04:21:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8x334rdMz2xmk;
	Fri, 20 Sep 2024 12:21:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726798895;
	cv=none; b=cE4qeoXFHdHJNWcMxH407BB0leCvEHs+x3+4JCKUmgGL7RB747JIAFxZ8Sy+9q7/iGzGgFn804E+Vmj9kG97Ua3T5B5exGlIbmRBgq18WNIMt/Ij4XY8RVXuM0fRRHiye10BXyRxPkJmTyswXUVQ+6mxbpyr0zNUTUFvFBjIF/MS08Eu0WMDlv+IIfQlZsb299NtfUKR3KIS3El4jHbLAjFLbLDUeYMW8TpKJtbZatIBIoIPGUw8l7X7B202s3VxqL/ZzkdV6KV6dVi/nYHWG9KdZBwj9FodrasT42qJowP0W8i7sS5Kn378GFW9X2/ydMMl3hFz565UmZjdtD8Zxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726798895; c=relaxed/relaxed;
	bh=77Gj7np+ZKHtU14T/xiajXIjnpe8O//Izjbw4Cr9qXs=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G/Ze56i+Soe3LM1ExY5K+eEc9J2yocK5oYgQIImhvyyVWwMJb6kvhSkOlE//98yQBc3WNcYmIl8VmkJMBQ16g1A741/+GlNRKwuRFlzxV2Vk43fHmYj96D8edoNL6p7xc38U6oce2pEa4Wo2dtDcpLJwdeIcbytHYTLKmZzqi01cgcPJS1ZdHgYYAfnvf93tNmWDMugmFyUPNLHio+FTOLabHs4nupr2JfP+YYzq68P/hyhVFYNk9i4vfhML+j4Zr2b5fEld+wbxaXo8r9J9J27cDMB1bD/D6LJg/3U6G6+1UFhWOeWhBtRNRnOqE18NhUg3d9GxRSqT2fvgz68ocg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=efault@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Zhh25imj; dkim-atps=neutral; spf=pass (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=efault@gmx.de; receiver=lists.ozlabs.org) smtp.mailfrom=gmx.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=efault@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Zhh25imj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=efault@gmx.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 333 seconds by postgrey-1.37 at boromir; Fri, 20 Sep 2024 12:21:34 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8x322vDBz2xmZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 12:21:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1726798890; x=1727403690; i=efault@gmx.de;
	bh=77Gj7np+ZKHtU14T/xiajXIjnpe8O//Izjbw4Cr9qXs=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Zhh25imj3X7IruBss1+Hb2fGZ3AdiB10qTZ1qOoLKmN0GLuFnQmVcQt6AIhFqC5b
	 pALUL+q/06jLZy1zf6WMcRoL9hbPuC4R2m803mP1QynCxYrO6YwBpVqYOl1dDXap0
	 z60xP1ctIVDrpBL7DxGK/RNKpFmQ7KpJNYvHc31WQhuNA+xrI0ClI+JzdI74goVK5
	 mo4+COmt+52CPQBHwlX9ae4YwIb5GdrVPeER6aehjvfMU+1LMjyD/VVGzLV/0aY4S
	 J1VssSiKSWcuvLKbOILNjknVVEVchKCTyyfzxLwcOLu4cVR4RLN7dXfXowI2LxCrA
	 hz2BYZK9IiLBg7ooow==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from homer.fritz.box ([91.212.106.56]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MaJ3n-1sUbFm41Mz-00PLir; Fri, 20
 Sep 2024 04:15:32 +0200
Message-ID: <177646b0c427786c90a8ccb67f5b956a12759d3a.camel@gmx.de>
Subject: Re: [patch] Re: [PowerPC][Linux-next][6.11.0-rc4-next-20240820]
 OOPs while running LTP FS Stress
From: Mike Galbraith <efault@gmx.de>
To: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 peterz@infradead.org, vschneid@redhat.com, mingo@kernel.org,
 sfr@canb.auug.org.au
Date: Fri, 20 Sep 2024 04:15:30 +0200
In-Reply-To: <c8c28050-8c6e-45b1-8b70-06cf5e0921e6@linux.vnet.ibm.com>
References: <82b9c434-a0fd-4488-95be-a45b8cd4b6e6@linux.vnet.ibm.com>
	 <2fb24ab402d9de45e3cf16e6ba0ad23a7843e5c1.camel@gmx.de>
	 <c8c28050-8c6e-45b1-8b70-06cf5e0921e6@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dsBviHucoPVCIAkRArCXYTRRur6moHQ5PlWxYDaBZ/fY83nVrrz
 PpGRUkO2aYEq04jy2P6KV61taffA/FL1dP3Ddl/QYoQQygpZWYXqEjX19bZIlBl9H0vI8Fr
 Bb3X1azisbO0yzKFabdrMc6m9Na0+qdgsngTYcd45yZLLUg+dJMYhdnHSlEvgHTBKam33VV
 0z5mri6YzM0GfjmCJppBQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Z7LK3j1vvi8=;vhpgIoYqbeOwMza2brpmCQ8gfnf
 dqJeSnSP04ZTvJo5mvCLOso3qVQiLsq5vIH4/NLv2hNejkPhSSJRcktTvDCuuyGIqoxVA5NZE
 w5I4p3o7Djq/sa1sL6BmxDPTXF2UC1aqQHBUv/3ax5xVRHT7UZmhxsFHmm01geycAzVTrsQE7
 ccMCRTMkbkApeIL+gzypmI5vDtZdQDqR4xnbZ3mmd5frOgFHIWA/owP9vvvbsasI2Zg0krTS7
 OZOXqk7pr6nAFbx23/RCfSTXsaF18McgOMvr9cNXC+Gv3Hr9nLSg2mYikRr+T1hfxmtrSZM7S
 TMystNrk0XOll71WcGmquY8ClFWcPZgrkteBrI0ljUaFZ8cn0xLbdU49+efWRF3JRRALgYOoO
 vBWtqmExAK7SHyXJAbhtOJfvAN9FncG6IHeJjI0BriA6zLvq9DvLV2U7J0snVj/wN/M5vmNPQ
 UnL1nILRXtlkA/3fJx9JWOs0c0O3MS9rBs/AHINVG8inI+WPM4JpMhtVIUMxbPai0YdwnWfpM
 bHUYvM7go1jPC1Y/UQjQKxKN0Jfg3CvaaKjPUvlBRRrTzyVZLVzeoK5yD0MfBhegHDQWxcaPk
 mmV4bOh4tDryktKaYeGY9iWdOOt56Z0LWdyY1k5Dp15ANcZ5jYFwyeEdn56zIUin15qTW+ceu
 Z3V9XZkbrH4CxYV03/8gXtUsw6uKDYydB3+ABnRMLwv714A7nV0KZJkUcrfU0Kep/i5SyVsYx
 jrS1VzB0foJAqr8vvsE7n1T/skQvtqnnSUHxXc/aK9Mu7ImirFMGjlcHvApXWiOQzADosAQ1V
 DJEykGUMtD0tljTHZRgjfELg==

On Thu, 2024-09-19 at 20:09 +0530, Venkat Rao Bagalkote wrote:
>
> Please add the below tags.
>
>
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
>
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>

Sure, and while at it I can brush patchlet's rather scruffy fur.

1. on_rq being implied by sched_delayed, redundant check can go.
2. no tasks anywhere in sight, DEQUEUE_SPECIAL can go.
3. use of unlikely in an unlikely path can also go.
No functional change.  Too bad everything around there fits in 80
characters, or a couple useless diffstat plus signs could go too.

sched: Fix sched_delayed vs cfs_bandwidth

Meeting an unfinished DELAY_DEQUEUE treated entity in unthrottle_cfs_rq()
leads to a couple terminal scenarios.  Finish it first, so ENQUEUE_WAKEUP
can proceed as it would have sans DELAY_DEQUEUE treatment.

Fixes: 152e11f6df29 ("sched/fair: Implement delayed dequeue")
Reported-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
Tested-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
Signed-off-by: Mike Galbraith <efault@gmx.de>
=2D--
 kernel/sched/fair.c |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

=2D-- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6049,10 +6049,13 @@ void unthrottle_cfs_rq(struct cfs_rq *cf
 	for_each_sched_entity(se) {
 		struct cfs_rq *qcfs_rq =3D cfs_rq_of(se);

-		if (se->on_rq) {
-			SCHED_WARN_ON(se->sched_delayed);
+		/* Handle any unfinished DELAY_DEQUEUE business first. */
+		if (se->sched_delayed) {
+			int flags =3D DEQUEUE_SLEEP | DEQUEUE_DELAYED;
+
+			dequeue_entity(qcfs_rq, se, flags);
+		} else if (se->on_rq)
 			break;
-		}
 		enqueue_entity(qcfs_rq, se, ENQUEUE_WAKEUP);

 		if (cfs_rq_is_idle(group_cfs_rq(se)))


